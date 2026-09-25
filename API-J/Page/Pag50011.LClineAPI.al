page 50011 "LC line API"
{
    APIGroup = 'lcrequest';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'lcLineAPI';
    DelayedInsert = true;
    EntityName = 'line';
    EntitySetName = 'lines';
    PageType = API;
    SourceTable = "Payments Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(SystemId; Rec.SystemId)
                {

                }
                field(Type; Rec.Type)
                {

                }
                field("AccountNo"; Rec."Account No.")
                {

                }
                field(description; Rec."Account Name")
                {

                }
                field(costCenterCode; Rec."Global Dimension 1 Code")
                {

                }
                field(revenueCenterCode; Rec."Shortcut Dimension 2 Code")
                {

                }
                field(Amount; Rec.Amount)
                {

                }
            }
        }
    }
    var
        IsDeepInsert: Boolean;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        PayHeader: Record "Payments Header";
        PayLine: Record "Payments Line";

    begin
        if IsDeepInsert then begin
            PayHeader.GetBySystemId(Rec."Header Id");
            Rec."No." := PayHeader."No.";
            PayLine.SetRange("No.", Rec."No.");
            if PayLine.FindLast() then
                Rec."Line No." := PayLine."Line No." + 10000

            else
                Rec."Line No." := 10000
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        PayHeader: Record "Payments Header";
    begin
        IsDeepInsert := IsNullGuid(Rec."Header Id");
        if not IsDeepInsert then begin
            PayHeader.GetBySystemId(Rec."Header Id");
            Rec."No." := PayHeader."No.";
        end
    end;


}
