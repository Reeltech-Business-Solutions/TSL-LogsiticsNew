table 50004 "Fixed Charge Setup"
{
    //DataClassification = ToBeClassified;

    fields
    {
        field(1; "Fixed Per Truck Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Make";
        }
        field(2; "Fixed Charge"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Contract No."; Code[20])
        {
            TableRelation = "Contract Agreement"."No.";
            DataClassification = ToBeClassified;
        }
        field(4; "Rate Per Trip"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }


    keys
    {
        key(Key1; "Fixed Per Truck Type", "Contract No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}