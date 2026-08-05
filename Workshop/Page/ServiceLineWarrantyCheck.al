page 80181 "Service Line Warranty"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Service Line";
    DeleteAllowed = false;
    SourceTableView = sorting("No.") where("Has Warranty" = const(true));

    layout
    {
        area(Content)
        {
            repeater("Warranty")
            {

                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Service Item No."; Rec."Service Item No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Has Warranty"; Rec."Has Warranty")
                {
                    ApplicationArea = All;
                    Editable = false;
                }


                field("Warranty Confirmed"; Rec."Warranty Confirmed")
                {
                    ApplicationArea = All;
                }


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