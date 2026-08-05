pageextension 50029 ServiceMgt extends "Service Mgt. Setup"
{
    layout
    {
        addafter("Prepaid Posting Document Nos.")
        {
            field("Fault Code No."; Rec."Fault Code No.")
            {
                ApplicationArea = All;
            }

            field("Truck Avail No."; Rec."Truck Avail No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
