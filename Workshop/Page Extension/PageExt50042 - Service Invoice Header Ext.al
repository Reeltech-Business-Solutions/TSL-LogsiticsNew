pageextension 50042 "Service invoice Header Ext" extends "Posted Service Invoice"  //OriginalId
{
    layout
    {
        addafter(General)
        {
            field("Lot No."; Rec."Lot No.") { ApplicationArea = All; }
            field("Vehicle Registration No."; Rec."Vehicle Registration No.") { ApplicationArea = All; }
            field("Depot"; Rec."Depot") { ApplicationArea = All; }
            field("Make"; Rec."Make") { ApplicationArea = All; }
            field("Model"; Rec."Model") { ApplicationArea = All; }
            field("Chasis No."; Rec."Chasis No.") { ApplicationArea = All; }
            field("Engine No."; Rec."Engine No.") { ApplicationArea = All; }
            field("Vehicle Type"; Rec."Vehicle Type") { ApplicationArea = All; }
            field("Vehicle Reg. No."; Rec."Vehicle Reg. No.") { ApplicationArea = All; }
            field("Fleet No."; Rec."Fleet No.") { ApplicationArea = All; }
            field("Customer Name"; Rec."Customer Name") { ApplicationArea = All; }
            field("Quotation Cost"; Rec."Quotation Cost") { ApplicationArea = All; }
            field("Quotation Price"; Rec."Quotation Price") { ApplicationArea = All; }
            field("Customer Type"; Rec."Customer Type") { ApplicationArea = All; }
            field("Amount"; Rec."Amount") { ApplicationArea = All; }
            field("Amount Including VAT"; Rec."Amount Including VAT") { ApplicationArea = All; }
            field("Total Cost Amount"; Rec."Total Cost Amount") { ApplicationArea = All; }
            field("Milleage"; Rec."Milleage") { ApplicationArea = All; }
            field("Registered By"; Rec."Registered By") { ApplicationArea = All; }
            field("Date/Time Recieved"; Rec."Date/Time Recieved") { ApplicationArea = All; }
            field("Fleet Manager Name"; Rec."Fleet Manager Name") { ApplicationArea = All; }
            field("Fleet Manager Phone No."; Rec."Fleet Manager Phone No.") { ApplicationArea = All; }
            field("Fleet Manger  Location"; Rec."Fleet Manger  Location") { ApplicationArea = All; }
            field("Fleet  Manager E-Mail"; Rec."Fleet  Manager E-Mail") { ApplicationArea = All; }
            field("Fleet Manager"; Rec."Fleet Manager") { ApplicationArea = All; }

        }

    }

    actions
    {
    }
}