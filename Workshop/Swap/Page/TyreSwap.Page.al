page 90003 "Tyre Swap"
{
    //Table50096
    PageType = Card;
    SourceTable = "Tyre Swap Header";

    layout
    {
        area(content)
        {
            field(Code; Rec.Code)
            {
                ApplicationArea = All;
            }
            field(Date; Rec.Date)
            {
                ApplicationArea = All;
            }
            field("Tyre Card Updated?"; Rec."Tyre Card Updated?")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Driver's Name"; Rec."Driver's Name")
            {
                ApplicationArea = All;
            }
            field("Workshop Manager"; Rec."Workshop Manager")
            {
                ApplicationArea = All;
            }
            field("Send for Approval"; Rec."Send for Approval")
            {
                ApplicationArea = All;
            }
            part("Tyre Swap Lines"; "Tyre Swap Lines")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = Code = field(code);

            }
            group(new)
            {
                field("Approval Sequence"; Rec."Approval Sequence")
                {
                    ApplicationArea = All;
                }
                field("Manager Approved"; Rec."Manager Approved")
                {
                    ApplicationArea = All;
                }
                field("Date Manager Approved"; Rec."Date Manager Approved")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Time Manager Approved"; Rec."Time Manager Approved")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("DataClerk/ Service Advisor"; Rec."DataClerk/ Service Advisor")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("DataClerk/ Service Adv Date"; Rec."DataClerk/ Service Adv Date")
                {
                    Enabled = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

