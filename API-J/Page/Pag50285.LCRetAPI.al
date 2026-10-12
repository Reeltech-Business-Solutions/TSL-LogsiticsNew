page 50285 "LC Ret API"
{
    APIGroup = 'lcrequest';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'lcRetAPI';
    DelayedInsert = true;
    EntityName = 'lcret';
    EntitySetName = 'lcrets';
    PageType = API;
    SourceTable = "Staff Advanc Surrender Header";
    SourceTableView = where("Account Type" = filter("Bank Account"));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(system_id; Rec.SystemId)
                {
                    Caption = 'SystemId';
                    ApplicationArea = All;
                }

                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }
                field("RetirementType"; Rec."Retirement Type")
                {

                }

                field("LCNo"; Rec."LC No.")
                {
                    ApplicationArea = all;
                }
                field("LCName"; Rec."LC Name")
                {

                }


                // field(employee_email; Rec."employee email")
                // {
                //     ApplicationArea = All;

                //     trigger OnValidate()
                //     var
                //         Employee: Record Employee;
                //     begin
                //         Employee.setRange("Company E-Mail", Rec."employee email");
                //         if Employee.FindFirst() then
                //             Rec.Validate("Account No.", Employee."No.")
                //         else
                //             Error(' email %1', Employee."No.");
                //     end;
                // }

                field(lcDocNo; Rec."LC Issue Doc No.")
                {




                }


                field(payee; Rec.Payee)
                {
                    Caption = 'Payee';
                    ApplicationArea = All;
                }
                field(area_code; Rec."Shortcut Dimension 3 Code")
                {

                    ApplicationArea = All;
                }

                field(Amount; Rec.Amount)
                {

                    ApplicationArea = All;
                }

                field(allow_overexpenditure; Rec."Allow Overexpenditure")
                {

                    ApplicationArea = All;


                }
                field("responsibility_center"; Rec."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                    ApplicationArea = All;
                }
                field("bank_code"; Rec."Bank Code")
                {
                    Caption = 'Bank Code';
                    ApplicationArea = All;
                }


                field(status; Rec.Status)
                {
                    Caption = 'Status';
                    ApplicationArea = All;
                }

                part(lines; "LC line API")
                {
                    EntityName = 'line';
                    EntitySetName = 'lines';
                    SubPageLink = "Header Id" = field(SystemId);
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Account Type" := "Account Type"::"Bank Account";
        Rec."Retirement Type" := "Retirement Type"::LC;
        Rec.Status := Rec.Status::Approved;
        // Rec.Posted := false;
        // Rec."Imprest Issue Doc. No" := Rec."Imprest Issue Doc. No";

        //  Rec.validate("Imprest Issue Doc. No", 'STVADV-0013');
    end;



    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        SurrenderHeader: Record "Staff Advanc Surrender Header";
        Employee: Record Employee;
        AdvDocNo: Code[20];
    begin
        //  Validate employee email


        Rec."Account Type" := "Account Type"::"Bank Account";
        Rec."Retirement Type" := "Retirement Type"::LC;
        // Rec.Validate("Account No.", Employee."No.");
        //Rec."Account No." := Employee."No.";


        // Save the advance doc no then clear it for clean insert
        AdvDocNo := Rec."LC Issue Doc No.";

        // Employee.SetRange("Company E-Mail", Rec."employee email");
        // if not Employee.FindFirst() then
        //     Error('No employee found with email %1', Rec."employee email");
        // Rec."Imprest Issue Doc. No" := '';

        // Insert the header — BC assigns No. from number series
        Rec.Insert(true);

        // Reload fresh from DB — No. is now properly assigned
        SurrenderHeader.Get(Rec."No.");

        // Validate advance doc no — table OnValidate fires here
        // Header exists in DB so lines insert successfully
        if AdvDocNo <> '' then begin
            //    SurrenderHeader.Validate("Imprest Issue Doc. No", AdvDocNo);
            PopulateRetirementLines(AdvDocNo);
            SurrenderHeader.Modify(true);
        end;

        // Refresh Rec so API returns the complete populated record
        Rec := SurrenderHeader;
        Rec.Status := Rec.Status::Approved;

        // false = we already inserted, tell BC not to insert again
        exit(false);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        // Handle case where advance doc no is changed after creation
        if (Rec."LC Issue Doc No." <> xRec."LC Issue Doc No.")
            and (Rec."LC Issue Doc No." <> '') then
            Rec.Validate("LC Issue Doc No.");
        exit(true);
    end;




    local procedure PopulateRetirementLines(AdvDocNo: Code[20])
    var
        ImpSurrLine: Record "Staff Advan Surrender Details";
        PayHeader: Record "Payments Header";
        PayLine: Record "Payments Line";
        LineNo: Integer;
    begin


        // 2. Get the original advance header
        if not PayHeader.Get(AdvDocNo) then
            Error('Advance document %1 not found', AdvDocNo);

        // 3. Copy header fields from advance
        Rec."Paying Bank Account" := PayHeader."Paying Bank Account";
        Rec.Payee := PayHeader.Payee;
        Rec."Currency Code" := PayHeader."Currency Code";
        Rec."Currency Factor" := PayHeader."Currency Factor";
        Rec."Bank Code" := PayHeader."Paying Bank Account";
        // Rec.Narration := PayHeader.Purpose;
        Rec."Date Posted" := PayHeader."Date Posted";
        Rec."Global Dimension 1 Code" := PayHeader."Global Dimension 1 Code";
        Rec.Validate("Global Dimension 1 Code");
        Rec."Shortcut Dimension 2 Code" := PayHeader."Shortcut Dimension 2 Code";
        Rec.Validate("Shortcut Dimension 2 Code");
        Rec."Shortcut Dimension 3 Code" := PayHeader."Shortcut Dimension 3 Code";
        Rec.Validate("Shortcut Dimension 3 Code");
        Rec.Dim3 := PayHeader.Dim3;
        Rec."Shortcut Dimension 4 Code" := PayHeader."Shortcut Dimension 4 Code";
        Rec.Validate("Shortcut Dimension 4 Code");
        Rec.Dim4 := PayHeader.Dim4;
        Rec."Global Dimension 1 Code" := PayHeader."Global Dimension 1 Code";
        Rec.Validate("Global Dimension 1 Code");
        // Rec.Dim7 := PayHeader.Dim7;
        Rec."Imprest Issue Date" := PayHeader.Date;
        //   Rec."Advance Narration" := PayHeader.Purpose;
        Rec."Responsibility Center" := PayHeader."Responsibility Center";
        //  Rec."Group Head" := PayHeader."Group Head";
        PayHeader.CalcFields("Total Net Amount");
        Rec.Amount := PayHeader."Total Net Amount";
        //  Rec."Amount Surrendered LCY" := PayHeader."Total Net Amount LCY";


        // 4. Copy lines — Actual Spent starts at 0, Balance = full Amount
        LineNo := 10000;
        PayLine.Reset();
        PayLine.SetRange("No.", AdvDocNo);
        if PayLine.FindSet() then
            repeat
                ImpSurrLine.Init();
                ImpSurrLine."Surrender Doc No." := Rec."No.";
                ImpSurrLine."Header Id" := Rec.SystemId;
                ImpSurrLine."Line No." := LineNo;
                ImpSurrLine."Account Type" := ImpSurrLine."Account Type"::"Bank Account";
                //  ImpSurrLine.Validate("Imprest Type", PayLine."Advance Type");
                ImpSurrLine.Grouping := PayLine.Grouping;
                ImpSurrLine.Validate("Account No:");
                ImpSurrLine."Account Name" := PayLine."Account Name";
                //  ImpSurrLine.Amount := PayLine.Amount;
                ImpSurrLine."Actual Spent" := 0;
                ImpSurrLine.Amount := PayLine.Amount;
                ImpSurrLine."Due Date" := PayLine."Due Date";
                ImpSurrLine."Advance Holder" := Rec."Account No.";
                ImpSurrLine."Apply to" := PayLine."Apply to";
                ImpSurrLine."Apply to ID" := PayLine."Apply to ID";
                ImpSurrLine."Surrender Date" := PayLine."Surrender Date";
                ImpSurrLine.Surrendered := PayLine.Surrendered;
                //   ImpSurrLine."Cash Receipt No" := PayLine."M.R. No";
                //   ImpSurrLine."Date Issued" := PayLine."Date Issued";
                //   ImpSurrLine."Type of Surrender" := PayLine."Type of Surrender";
                //   ImpSurrLine."Dept. Vch. No." := PayLine."Dept. Vch. No.";
                ImpSurrLine."Currency Factor" := PayLine."Currency Factor";
                ImpSurrLine."Currency Code" := PayLine."Currency Code";
                //   ImpSurrLine."Imprest Req Amt LCY" := PayLine."Amount LCY";
                ImpSurrLine."Budgetary Control A/C" := PayLine."Budgetary Control A/C";
                ImpSurrLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                ImpSurrLine."Shortcut Dimension 2 Code" := PayLine."Shortcut Dimension 2 Code";
                ImpSurrLine."Shortcut Dimension 3 Code" := PayLine."Shortcut Dimension 3 Code";
                ImpSurrLine."Shortcut Dimension 4 Code" := PayLine."Shortcut Dimension 4 Code";
                //   ImpSurrLine."Shortcut Dimension 7 Code" := PayLine."Shortcut Dimension 7 Code";
                ImpSurrLine."Open for Overexpenditure by" := UserId;
                ImpSurrLine."Allow Overexpenditure" := true;
                ImpSurrLine."Date opened for OvExpenditure" := today;
                ImpSurrLine."Line on Original Document" := true;
                ImpSurrLine.Insert(true);
                LineNo += 10000;
            until PayLine.Next() = 0
        else
            Error('No lines found on advance document %1', Rec."Imprest Issue Doc. No");
    end;


}
