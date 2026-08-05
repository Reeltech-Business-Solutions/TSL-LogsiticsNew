page 50122 "Service Code List"
{
    CardPageID = "Service Code";
    Editable = false;
    PageType = List;
    SourceTable = "Faulty Material setup Header";

    layout
    {
        area(content)
        {
            repeater(New)
            {
                field("Operation Code"; Rec."Operation Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Service Item Model"; Rec."Service Item Model")
                {
                    ApplicationArea = All;
                }
                field(Symptoms; Rec.Symptoms)
                {
                    ApplicationArea = All;
                }
                field("Faulty Area"; Rec."Faulty Area")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("Fault Card")
                {
                    Caption = 'Fault Card';
                    RunObject = Page "Service Code";
                    RunPageOnRec = true;
                    ShortCutKey = 'Shift+F7';
                    ApplicationArea = All;
                }
                action("Where Used")
                {
                    Caption = 'Where Used';
                    ApplicationArea = All;
                    // RunObject = Page 50041;
                    // RunPageLink = Field2 = FIELD ("Operation Code");
                    // ShortCutKey = 'Ctrl+F7';
                }
            }
        }
    }

    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;
}

