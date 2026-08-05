table 50013 "Vehicle Make"
{
    Caption = 'Service Lookup';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Vehicle Make";
    LookupPageId = "Vehicle Make";

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
        field(3; Manufacturer; Code[20])
        {
            Caption = 'Manufacturer';
            DataClassification = ToBeClassified;
            TableRelation = OEM.Code;
        }

        field(4; "Calculate Type"; Enum "Calculation Type")
        {
                Caption = 'Calculation Type';
               DataClassification = ToBeClassified;       
        }

    }
    keys
    {
        key(PK; code, Manufacturer)
        {
            Clustered = true;
        }
    }

}
