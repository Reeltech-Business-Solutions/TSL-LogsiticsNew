table 50045 "Repair Location"
{
    DrillDownPageId = "Repair Location";
    LookupPageId = "Repair Location";
    Caption = 'Repair Location';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[30])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
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
