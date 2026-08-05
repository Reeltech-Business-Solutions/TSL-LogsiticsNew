page 50301 "Quality Check Factbox"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Quality Check";

    layout
    {
        area(Content)
        {

            field("No."; Rec."No.")
            {
                visible = false;
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}