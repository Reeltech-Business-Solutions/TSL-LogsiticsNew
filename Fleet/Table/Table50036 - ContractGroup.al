table 50036 "Haulage Contract Group"
{
    Caption = 'Contract Group';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Haulage Contract Groups";
    LookupPageId = "Haulage Contract Groups";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Business Unit"; Code[10])
        {
            Caption = 'Business Unit';
            DataClassification = ToBeClassified;
        }
        field(4; Blocked; Boolean)
        {
            Caption = 'Blocked';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
