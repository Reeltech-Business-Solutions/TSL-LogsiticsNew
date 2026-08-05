page 80019 "Vehicle Inspection list RBS"
{
    CardPageID = "Vehicle Inspection Card RBS";
    PageType = List;
    AdditionalSearchTerms = 'Vehicle Inspection list RBS';
    SourceTable = "Vehicle Inspection RBS1";
    SourceTableView = WHERE(Approved = FILTER(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Registration ID"; Rec."Vehicle Registration ID")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Make"; Rec."Vehicle Make")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Make Description"; Rec."Vehicle Make Description")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Model"; Rec."Vehicle Model")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Chasis No."; Rec."Vehicle Chasis No.")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Engine No."; Rec."Vehicle Engine No.")
                {
                    ApplicationArea = All;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
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