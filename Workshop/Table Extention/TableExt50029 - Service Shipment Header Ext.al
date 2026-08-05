tableextension 50029 "Service Shipment Header Ext" extends "Service Shipment Header"
{
    fields
    {
        field(50000; "Lot No."; Code[30])
        {

        }
        field(50001; Plant; Code[20])
        {

        }
        field(50002; Depot; Code[20])
        {

        }
        field(50003; Make; Code[20])
        {

        }
        field(50004; Model; Code[20])
        {

        }
        field(50005; "Chasis No."; Code[20])
        {

        }
        field(50006; "Engine No."; Code[20])
        {

        }
        field(50007; "Vehicle Type"; Code[20])
        {
            TableRelation = "Vehicle Make";
        }
        field(50008; "Vehicle Reg. No."; Code[20])
        {

        }
        field(50009; "Fleet No."; Code[20])
        {

        }
        field(50010; "Customer Name"; Text[50])
        {

        }
        field(50011; "Invoice Created"; Boolean)
        {

        }
        field(50012; "Registration No."; Code[50])
        {

        }
        field(50013; "Chassis No."; Code[50])
        {

        }
        field(50014; "Vehicle Make"; Code[50])
        {
            TableRelation = "Vehicle Make";
        }
        field(50015; "Vehicle Model"; Code[50])
        {
            TableRelation = "Vehicle Model" where("Vehicle Make" = field("Vehicle Make"));
        }
        field(50016; "Expense Job"; Boolean)
        {

        }
        field(50017; "Shortcut dimension 3"; Code[20])
        {

        }
        field(51018; AppStatus; Option)
        {
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";

        }
        field(51019; "KM Run"; Code[20])
        {

        }
        field(50019; "Customer Type"; Option)
        {
            OptionMembers = ,Internal,External,Warranty,Contract,"Lease Operation",Insurance;

        }
        field(50020; "Shortcut dimension 4"; Code[20])
        {

        }
        field(51021; "Total Cost"; Decimal)
        {

        }
        field(51022; "Fuel Level"; Code[20])
        {

        }
        field(51023; "Qty Shipped"; Decimal)
        {

        }
        field(51024; "Qty Invoice"; Decimal)
        {

        }
        field(51025; Status2; Option)
        {
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";

        }
        field(51026; Cancelled; Boolean)
        {

        }
        field(51027; "Cancelled By"; Code[20])
        {

        }
        field(51028; "Cancelled Date"; Date)
        {

        }
        field(51029; DocApprovalType; Option)
        {
            OptionMembers = Purchase,Requisition,Quote,Capex,Service;

        }
        field(51030; "Procurement Type Code"; Code[20])
        {

        }
        field(51031; "Qty Issued from Store"; Decimal)
        {

        }

    }
}