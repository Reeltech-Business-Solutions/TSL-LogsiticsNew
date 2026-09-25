page 50259 StaffAdvRetLines
{
    APIGroup = 'staffAdvRet';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'staffAdvRetLines';
    DelayedInsert = true;
    EntityName = 'line';
    EntitySetName = 'lines';
    PageType = API;
    SourceTable = "Staff Advan Surrender Details";
    ODataKeyFields = SystemId;
    AutoSplitKey = true;


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(system_id; Rec.SystemId)
                {
                    Caption = 'SystemId';
                    //  Editable = false;
                }
                field(advance_type; Rec."Imprest Type")
                {

                }
                field(account_No; Rec."Account No:")
                {

                }
                field(description; Rec."Account Name")
                {

                }
                field(amount; Rec.Amount)
                {

                }
                field(surrenderDocNo; Rec."Surrender Doc No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }
                field(AdvanceHolder; Rec."Advance Holder")
                {

                }
                field(actual_amount_spent; Rec."Actual Spent")
                {

                }
                field("header_id"; Rec."Header Id")
                {
                    Caption = 'HeaderId';
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        IsDeepInsert: Boolean;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        StaffAdvHeader: Record "Staff Advanc Surrender Header";
        StaffAdvLine: Record "Staff Advan Surrender Details";
        StaffAdvanceLines: Record "Staff Advance Lines";
        RecPay: Record "Receipts and Payment Types";
    begin
        if IsDeepInsert then begin
            StaffAdvHeader.GetBySystemId(Rec."Header Id");
            Rec."Surrender Doc No." := StaffAdvHeader."No.";
            StaffAdvLine.SetRange("Surrender Doc No.", Rec."Surrender Doc No.");
            if StaffAdvLine.FindLast() then
                Rec."Line No." := StaffAdvLine."Line No." + 10000
            else
                Rec."Line No." := 10000;
            Rec."Account Type" := Rec."Account Type"::"Employee";

            Rec."Open for Overexpenditure by" := UserId;
            Rec."Allow Overexpenditure" := true;
            Rec."Date opened for OvExpenditure" := today;


        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        StaffAdvHeader: Record "Staff Advanc Surrender Header";
    begin
        IsDeepInsert := IsNullGuid(Rec."Header Id");
        if not IsDeepInsert then begin
            StaffAdvHeader.GetBySystemId(Rec."Header Id");
            Rec."Surrender Doc No." := StaffAdvHeader."No.";
            Rec."Account Type" := Rec."Account Type"::"Employee";

            Rec."Open for Overexpenditure by" := UserId;
            Rec."Allow Overexpenditure" := true;
            Rec."Date opened for OvExpenditure" := today;

            // Rec.validate("Imprest Type");

        end;
    end;


}
