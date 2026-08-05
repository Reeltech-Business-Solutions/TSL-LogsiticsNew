page 80074 "Daily Tyre Groov"
{

    Caption = 'Daily Tyre Groov';
    PageType = Document;
    SourceTable = "Daily Tyre Header";
    SourceTableView = WHERE("Daily Tyre Type" = FILTER(Regroove));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Daily Tyre Type"; Rec."Daily Tyre Type")
                {
                    ToolTip = 'Specifies the value of the Tyre Technician field.';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                    ApplicationArea = All;
                }
                field("Tyre Inspector Confirmation"; Rec."Tyre Inspector Confirmation")
                {
                    ToolTip = 'Specifies the value of the Tyre Inspector Confirmation field.';
                    ApplicationArea = All;
                }
                field("Tyre Technician"; Rec."Tyre Technician")
                {
                    ToolTip = 'Specifies the value of the Tyre Technician field.';
                    ApplicationArea = All;
                }
                field(Workshop; Rec.Workshop)
                {
                    ToolTip = 'Specifies the value of the Workshop field.';
                    ApplicationArea = All;
                    TableRelation = Location;
                }
            }
            part("Daily Tyre Groove"; "Daily Tyre Groov Subform")
            {
                ApplicationArea = All;
                Caption = 'Daily Tyre Groove';
                SubPageLink = "Daily Tyre Type" = FIELD("Daily Tyre Type"), "Document No." = FIELD("No.");
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)

    begin
        Rec."Daily Tyre Type" := Rec."Daily Tyre Type"::Regroove;
    end;
}
