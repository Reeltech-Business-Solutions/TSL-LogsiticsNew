page 50252 StaffAdvanceLines
{

    PageType = API;
    SourceTable = "Staff Advance Lines";
    DelayedInsert = true;
    APIPublisher = 'TSL';
    APIGroup = 'StaffAdv';
    APIVersion = 'v1.0';
    EntityName = 'line';
    EntitySetName = 'lines';
    ODataKeyFields = SystemId;






    layout
    {
        area(content)
        {
            repeater(General)
            {
                //field(id; Format(Rec.SystemId, 0, 4).ToLower()) { }
                field(system_id; Rec.SystemId) { }
                field("no"; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                // field("line_no"; Rec."Line No.")
                // {
                //     ToolTip = 'Specifies the value of the Line No. field.';
                //     ApplicationArea = All;
                // }

                field("date_issued"; Rec."Date Issued")
                {
                    ToolTip = 'Specifies the value of the Date Issued field.';
                    ApplicationArea = All;
                }
                field("advance_type"; Rec."Advance Type")
                {
                    ToolTip = 'Specifies the value of the Advance Type field.';
                    ApplicationArea = All;
                }
                field(purpose; Rec.Purpose)
                {
                    ToolTip = 'Specifies the value of the Purpose field.';
                    ApplicationArea = All;
                }
                field(amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                    ApplicationArea = All;
                }
                field("area_code"; Rec."Shortcut Dimension 3 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                    ApplicationArea = All;
                }
                field("department_code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    ApplicationArea = All;
                }
                field(header_id; Rec."Header Id") { }
            }
        }
    }
    var
        IsDeepInsert: Boolean;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        StaffAdvHeader: Record "Staff Advance Header";
        StaffAdvLine: Record "Staff Advance Lines";
    begin
        if IsDeepInsert then begin
            StaffAdvHeader.GetBySystemId(Rec."Header Id");
            Rec."No." := StaffAdvHeader."No.";
            StaffAdvLine.SetRange("No.", Rec."No.");
            if StaffAdvLine.FindLast() then
                Rec."Line No." := StaffAdvLine."Line No." + 10000
            else
                Rec."Line No." := 10000;
            Rec."Account Type" := Rec."Account Type"::"Employee";

        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        StaffAdvHeader: Record "Staff Advance Header";
    begin
        IsDeepInsert := IsNullGuid(Rec."Header Id");
        if not IsDeepInsert then begin
            StaffAdvHeader.GetBySystemId(Rec."Header Id");
            Rec."No." := StaffAdvHeader."No.";
            Rec."Account Type" := Rec."Account Type"::"Employee";
            Rec."Account No." := 'MH';
        end;
    end;
}