page 50257 StaffClaimLine
{
    APIGroup = 'staffClaim';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'staffClaimLine';
    DelayedInsert = true;
    EntityName = 'line';
    EntitySetName = 'lines';
    PageType = API;
    SourceTable = "Staff Claim Lines";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(system_id; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(advance_type; Rec."Advance Type")

                {


                }
                field(revenue_center; Rec."Shortcut Dimension 2 Code")
                {

                }
                field(no; Rec."no")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }

                field("description"; Rec."Account Name")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }
                field(amount; Rec."Amount")
                {
                    trigger OnValidate()
                    begin
                        Rec."Requested Amount" := Rec."Amount";
                    end;

                }

                field("Requested_Amount"; Rec."Requested Amount")
                {

                }

                field(narration; Rec.Purpose)
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
        StaffClaimHeader: Record "Staff Claims Header";
        StaffClaimLine: Record "Staff Claim Lines";
        // StaffAdvanceLines: Record "Staff Claim Lines";
        RecPay: Record "Receipts and Payment Types";
    begin
        if IsDeepInsert then begin
            StaffClaimHeader.GetBySystemId(Rec."Header Id");
            Rec."No" := StaffClaimHeader."No.";
            StaffClaimLine.SetRange("No", Rec."No");
            if StaffClaimLine.FindLast() then
                Rec."Line No." := StaffClaimLine."Line No." + 10000
            //  Rec."Requested Amount" := Rec.Amount;
            else
                Rec."Line No." := 10000;
            // Rec."Requested Amount" := Rec.Amount;



        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        StaffClaimHeader: Record "Staff Claims Header";
    begin
        IsDeepInsert := IsNullGuid(Rec."Header Id");
        if not IsDeepInsert then begin
            StaffClaimHeader.GetBySystemId(Rec."Header Id");
            Rec."No" := StaffClaimHeader."No.";
            Rec."Requested Amount" := Rec.Amount;

        end;
    end;



}
