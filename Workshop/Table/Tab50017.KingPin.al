table 50017 "King Pin"
{
    Caption = 'King Pin';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Description; Text[150])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(2; Measurement; Decimal)
        {
            Caption = 'Measurement';
            DataClassification = ToBeClassified;
        }
        field(3; Remark; Text[200])
        {
            Caption = 'Remark';
            DataClassification = ToBeClassified;
        }
        field(4; "No."; Code[20])
        {

        }
        field(5; "Line No"; Integer)
        {
            Caption = 'Line No.';
        }
    }
    keys
    {
        key(PK; "No.", "Line No")
        {
            Clustered = true;
        }
    }

}
