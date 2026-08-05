table 80015 Battery
{
    Caption = 'Battery';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Battery; Option)
        {
            OptionMembers = ,"Battery 1","Battery 2","Battery 3","Battery 4";
            Caption = 'Battery';
            DataClassification = ToBeClassified;
        }
        field(2; "Battery  Document"; Code[20])
        {
            Caption = 'Battery  Document';
            DataClassification = ToBeClassified;
        }
        field(3; CELL; Code[20])
        {
            Caption = 'CELL';
            DataClassification = ToBeClassified;
        }
        field(4; "ACID LEVEL"; Decimal)
        {
            Caption = 'ACID LEVEL';
            DataClassification = ToBeClassified;
        }
        field(5; COLOUR; Code[20])
        {
            Caption = 'COLOUR';
            DataClassification = ToBeClassified;
        }
        field(6; "VOLTAGE V"; Code[20])
        {
            Caption = 'VOLTAGE V';
            DataClassification = ToBeClassified;
        }
        field(7; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(8; "Truck No"; Code[20])
        {
            Caption = 'Truck No';
            DataClassification = ToBeClassified;
            TableRelation = "Service Item"."No.";
        }
        field(9; "Cell Temp"; Decimal)
        {
            Caption = 'Cell Temp';
            DataClassification = ToBeClassified;
        }
        field(10; "Battery Status"; Option)
        {
            OptionMembers = ,"Test Before","Test After",Neutral;
            OptionCaption = ' ,Test Before,Test After,Neutral';
            Caption = 'Battery Status';
            DataClassification = ToBeClassified;
        }
        field(11; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; Battery, "Battery  Document", "Entry No")
        {
            Clustered = true;
        }
    }

}
