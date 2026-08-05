tableextension 50053 ValueEntry extends "Value Entry"
{
    fields
    {
        field(50000; "Truck No."; Code[20])
        {
            Caption = 'Truck No.';
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No." where(Truck = const(true));
        }
        field(50001; "Contract Code"; Code[20])
        {
            Caption = 'Contract Code';
            DataClassification = ToBeClassified;
            TableRelation = "Contract Agreement"."No.";
        }
        field(50002; "Driver No."; Code[20])
        {
            Caption = 'Driver No.';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where(Driver = const(true));
        }
        field(50003; "Driver Name"; text[100])
        {

        }
        field(50010; "RFQ No."; Code[20])
        {
            Caption = 'RFQ No.';
            DataClassification = ToBeClassified;

        }
        field(50011; "PRF No."; Code[20])
        {
            Caption = 'PRF No.';
            DataClassification = ToBeClassified;

        }
    }
}
