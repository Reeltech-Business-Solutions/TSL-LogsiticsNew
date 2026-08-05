tableextension 50041 ServiceMgtSetup extends "Service Mgt. Setup"
{
    fields
    {
        field(50000; "Fault Code No."; Code[20])
        {
            Caption = 'Fault Code No.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50001; "Truck Avail No."; Code[20])
        {
            Caption = 'Truck Avail No.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}