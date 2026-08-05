page 80006 "Fault Material Lines"
{
    PageType = ListPart;
    SourceTable = "Faulty Material setup Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Operation code"; Rec."Operation code")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Variance; Rec.Variance)
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Location; Rec.Location)
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Total Price"; Rec."Total Price")
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field("Duration In Hours"; Rec."Duration In Hours")
                {
                    ApplicationArea = All;
                }
                field("Duration in Days"; Rec."Duration in Days")
                {
                    ApplicationArea = All;
                }
                field("VAT%"; Rec."VAT%")
                {
                    ApplicationArea = All;
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = All;
                }
                field("Price Incl VAT"; Rec."Price Incl VAT")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

