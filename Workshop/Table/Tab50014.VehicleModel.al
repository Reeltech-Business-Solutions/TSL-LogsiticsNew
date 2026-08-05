table 50014 "Vehicle Model"
{
    Caption = 'Vehicle Model';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Vehicle Model";
    LookupPageId = "Vehicle Model";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(4; Manufacturer; Code[20])
        {
            Caption = 'Manufacturer';
            DataClassification = ToBeClassified;
            TableRelation = OEM.Code;
        }
        field(3; "Vehicle Make"; Code[20])
        {
            Caption = 'Vehicle Make';

            DataClassification = ToBeClassified;
            TableRelation = "Vehicle make".code;
        }
    }
    keys
    {
        key(PK; "Code", "Vehicle Make")
        {
            Clustered = true;
        }
    }

}
