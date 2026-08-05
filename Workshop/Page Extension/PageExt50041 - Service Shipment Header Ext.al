pageextension 50041 "Service Shipment Header Ext" extends "Posted Service Shipment" //OriginalId
{
    layout
    {
        addafter(General)
        {
            field("Lot No."; Rec."Lot No.") { ApplicationArea = All; }
            field("Plant"; Rec."Plant") { ApplicationArea = All; }
            field("Depot"; Rec."Depot") { ApplicationArea = All; }
            field("Make"; Rec."Make") { ApplicationArea = All; }
            field("Model"; Rec."Model") { ApplicationArea = All; }
            field("Chasis No."; Rec."Chasis No.") { ApplicationArea = All; }
            field("Engine No."; Rec."Engine No.") { ApplicationArea = All; }
            field("Vehicle Type"; Rec."Vehicle Type") { ApplicationArea = All; }
            field("Vehicle Reg. No."; Rec."Vehicle Reg. No.") { ApplicationArea = All; }
            field("Fleet No."; Rec."Fleet No.") { ApplicationArea = All; }
            field("Customer Name"; Rec."Customer Name") { ApplicationArea = All; }
            field("Invoice Created"; Rec."Invoice Created") { ApplicationArea = All; }
            field("Registration No."; Rec."Registration No.") { ApplicationArea = All; }
            field("Chassis No."; Rec."Chassis No.") { ApplicationArea = All; }
            field("Vehicle Make"; Rec."Vehicle Make") { ApplicationArea = All; }
            field("Vehicle Model"; Rec."Vehicle Model") { ApplicationArea = All; }
            field("Expense Job"; Rec."Expense Job") { ApplicationArea = All; }
            field("Shortcut dimension 3"; Rec."Shortcut dimension 3") { ApplicationArea = All; }
            field("AppStatus"; Rec."AppStatus") { ApplicationArea = All; }
            field("KM Run"; Rec."KM Run") { ApplicationArea = All; }
            field("Customer Type"; Rec."Customer Type") { ApplicationArea = All; }
            field("Shortcut dimension 4"; Rec."Shortcut dimension 4") { ApplicationArea = All; }
            field("Total Cost"; Rec."Total Cost") { ApplicationArea = All; }
            field("Fuel Level"; Rec."Fuel Level") { ApplicationArea = All; }
            field("Qty Shipped"; Rec."Qty Shipped") { ApplicationArea = All; }
            field("Qty Invoice"; Rec."Qty Invoice") { ApplicationArea = All; }
            field("Status2"; Rec."Status2") { ApplicationArea = All; }
            field("Cancelled"; Rec."Cancelled") { ApplicationArea = All; }
            field("Cancelled By"; Rec."Cancelled By") { ApplicationArea = All; }
            field("Cancelled Date"; Rec."Cancelled Date") { ApplicationArea = All; }
            field("DocApprovalType"; Rec."DocApprovalType") { ApplicationArea = All; }
            field("Procurement Type Code"; Rec."Procurement Type Code") { ApplicationArea = All; }
            field("Qty Issued from Store"; Rec."Qty Issued from Store") { ApplicationArea = All; }

        }

    }

    actions
    {
    }
}