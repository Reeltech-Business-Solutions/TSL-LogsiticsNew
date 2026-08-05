tableextension 50039 "Sales&ReceivableSetup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50000; "Vehicle Inspection No."; Code[20])
        {
            Caption = 'Vehicle Inspection No.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
