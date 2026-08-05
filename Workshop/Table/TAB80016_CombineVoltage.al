table 80016 "Combine Voltage"
{
    Caption = 'Combine Voltage';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No"; Text[50])
        {
            Caption = 'Document No';
            DataClassification = ToBeClassified;
        }
        field(2; "VC  Measurement"; Code[20])
        {
            Caption = 'VC  Measurement';
            DataClassification = ToBeClassified;
        }

        field(3; "Entry No"; Integer)
        {
            Caption = 'VC  Measurement';
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Document No", "Entry No")
        {
            Clustered = true;
        }
    }

}
