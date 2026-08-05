/// <summary>
/// PageExtension Service Header Ext (ID 50037) extends Record Service Header.
/// </summary>
pageextension 50036 "Service Header Ext" extends "Service Invoice"
{

    layout
    {
        addafter(General)
        {

            field("Customer Job Type"; Rec."Customer Job Type") { ApplicationArea = All; }
            field("Job Type Code"; Rec."Job Type Code") { ApplicationArea = All; }
            field("Job Posting Group"; Rec."Job Posting Group") { ApplicationArea = All; }
            //  field("Amount"; Rec."Amount") { ApplicationArea = All; }
            //  field("Amount Including VAT"; Rec."Amount Including VAT") { ApplicationArea = All; }
            field("Job Type"; Rec."Job Type") { ApplicationArea = All; }
            //field("Buisness Type" ; "Buisness Type"){ApplicationArea = All;}
            field("NOVATRACK ID"; Rec."NOVATRACK ID") { ApplicationArea = All; }
            field("Quote Registered Date"; Rec."Quote Registered Date") { ApplicationArea = All; }
            field("Quote Registered By"; Rec."Quote Registered By") { ApplicationArea = All; }
            field("Truck BreakDown No."; Rec."Truck BreakDown No.") { ApplicationArea = All; }
            field("KM Odometer Reading"; Rec."KM Odometer Reading") { ApplicationArea = All; }
            field("Curr. KM Service/PM Service"; Rec."Curr. KM Service/PM Service") { ApplicationArea = All; }
            field("User ID. Updated"; Rec."User ID. Updated") { ApplicationArea = All; }
            field("User Date Updated"; Rec."User Date Updated") { ApplicationArea = All; }
            field("User time Updated"; Rec."User time Updated") { ApplicationArea = All; }
            field("Phone No 1."; Rec."Phone No 1.") { ApplicationArea = All; }
            field("Phone No. 2."; Rec."Phone No. 2.") { ApplicationArea = All; }
            field("Phone No. 3 (GSM)."; Rec."Phone No. 3 (GSM).") { ApplicationArea = All; }
            field("FLeet No."; Rec."FLeet No.") { ApplicationArea = All; }
            field("Acquistion Date"; Rec."Acquistion Date") { ApplicationArea = All; }
            field("Fleet Manager Name"; Rec."Fleet Manager Name") { ApplicationArea = All; }
            field("Fleet Manager Phone No."; Rec."Fleet Manager Phone No.") { ApplicationArea = All; }
            field("Fleet Manger  Location"; Rec."Fleet Manger  Location") { ApplicationArea = All; }
            field("Fleet  Manager E-Mail"; Rec."Fleet  Manager E-Mail") { ApplicationArea = All; }
            field("Fleet Manager"; Rec."Fleet Manager") { ApplicationArea = All; }
            field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code") { ApplicationArea = All; }
            field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code") { ApplicationArea = All; }
            field("Invoice Exist"; Rec."Invoice Exist") { ApplicationArea = All; }
            field("Order No."; Rec."Order No.") { ApplicationArea = All; }
            field("Invoice Created"; Rec."Invoice Created") { ApplicationArea = All; }
            field("Registration No."; Rec."Registration No.") { ApplicationArea = All; }
            field("Chassis No."; Rec."Chassis No.") { ApplicationArea = All; }
            field("Engine No."; Rec."Engine No.") { ApplicationArea = All; }
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
            field("User ID"; Rec."User ID") { ApplicationArea = All; }
            field("Qty Shipped"; Rec."Qty Shipped") { ApplicationArea = All; }
            field("Qty Invoice"; Rec."Qty Invoice") { ApplicationArea = All; }
            field("Status2"; Rec."Status2") { ApplicationArea = All; }
            field("Cancelled"; Rec."Cancelled") { ApplicationArea = All; }
            field("Cancelled By"; Rec."Cancelled By") { ApplicationArea = All; }
            field("Cancelled Date"; Rec."Cancelled Date") { ApplicationArea = All; }
            field("DocApprovalType"; Rec."DocApprovalType") { ApplicationArea = All; }
            field("Procurement Type Code"; Rec."Procurement Type Code") { ApplicationArea = All; }
            field("Qty Issued from Store"; Rec."Qty Issued from Store") { ApplicationArea = All; }
            field("Store  Location"; Rec."Store  Location") { ApplicationArea = All; }
            field("Store Requistion No"; Rec."Store Requistion No") { ApplicationArea = All; }
            field("Store Req Shipped"; Rec."Store Req Shipped") { ApplicationArea = All; }
            field("Return to Store"; Rec."Return to Store") { ApplicationArea = All; }
            field("Ready For Invoice"; Rec."Ready For Invoice") { ApplicationArea = All; }
            field("Total WIP QTY"; Rec."Total WIP QTY") { ApplicationArea = All; }
            field("Total WIP Cost"; Rec."Total WIP Cost") { ApplicationArea = All; }
            field("Qty to Ship"; Rec."Qty to Ship") { ApplicationArea = All; }
            field("Qty to  Invoice"; Rec."Qty to  Invoice") { ApplicationArea = All; }
            field("Quotation page"; Rec."Quotation page") { ApplicationArea = All; }
            field("Job No."; Rec."Job No.") { ApplicationArea = All; }


        }


    }






}