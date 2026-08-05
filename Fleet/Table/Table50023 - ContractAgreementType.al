table 50023 "Contract Agreement Type"
{
    Caption = 'Contract Agreement Type';
    DrillDownPageId = 50123;
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Agreement Type"; Code[20])
        {
            Caption = 'Agreement Type';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Agreement Type")
        {
            Clustered = true;
        }
    }

}
