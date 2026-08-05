table 50018 "Fixed Price Per Location"
{
    Caption = 'Fixed Price Per Location';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Contract ID"; Code[20])
        {
            Caption = 'Contract ID';
            TableRelation = "Contract Agreement"."No.";
            DataClassification = ToBeClassified;
        }
        field(2; "Truck Type"; Code[20])
        {
            Caption = 'Truck Type';
            TableRelation = "Vehicle Make".Code;
            DataClassification = ToBeClassified;
        }
        field(3; "Fixed Price"; Decimal)
        {
            Caption = 'Fixed Price';
            DataClassification = ToBeClassified;
        }
        field(4; Location; Code[20])
        {
            Caption = 'Location';
            TableRelation = Location.Code;
            DataClassification = ToBeClassified;
        }
        field(5; "Source Location"; Code[20])
        {
            Caption = 'Source Location';
            TableRelation = Location.Code;
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Contract ID", "Truck Type", Location, "Source Location")
        {
            Clustered = true;
        }
    }

}
