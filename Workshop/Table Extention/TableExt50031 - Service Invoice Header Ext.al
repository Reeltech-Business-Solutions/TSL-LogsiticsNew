tableextension 50031 "Service Invoice Header Ext" extends "Service Invoice Header"
{
    fields
    {
        field(50000; "Lot No."; Code[30])
        {
            // TableRelation = Lookup("Item Ledger Entry"."Lot No." WHERE (Item No.=FIELD(Item No.),Serial No.=FIELD/////(Serial No.)))
        }
        field(50001; "Vehicle Registration No."; Code[50])
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
        field(50011; "Quotation Cost"; Code[20])
        {

        }
        field(50012; "Quotation Price"; Code[20])
        {
            // TableRelation = Lookup("Archived Service Line"."Amount Including VAT" WHERE (Document No.=FIELD(No.)))

        }
        field(50013; "Customer Type"; Code[30])
        {
            //TableRelation = Lookup(Customer."Customer Type" WHERE (No.=FIELD(Customer No.)))

        }
        /*  field(50014; Amount; Decimal)
         {

         } */
        /* field(50015; "Amount Including VAT"; Decimal)
        {

        } */
        field(50016; "Total Cost Amount"; Decimal)
        {

        }
        field(50017; Milleage; Code[20])
        {

        }
        field(50018; "Registered By"; Code[30])
        {

        }
        field(50019; "Date/Time Recieved"; Date)
        {

        }
        field(50131; "Fleet Manager Name"; Text[100])
        {

        }
        field(50132; "Fleet Manager Phone No."; Code[30])
        {

        }
        field(50133; "Fleet Manger  Location"; Code[20])
        {

        }
        field(50134; "Fleet  Manager E-Mail"; Code[150])
        {

        }
        field(50135; "Fleet Manager"; Code[20])
        {

        }
        field(50136; "Job No."; Code[20]) { }


    }
}
