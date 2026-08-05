table 50044 "Things to Check"
{
    Caption = 'Sub Visual Check';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
        }
        field(2; "Description"; Text[150])
        {

        }
        field(3; "1Visual Check"; Code[50])
        {
            Caption = 'Visual Check';

            TableRelation = VisualCheck.Code;


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
