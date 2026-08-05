table 50019 "Transaction Buffer"
{
    Caption = 'Transaction Buffer';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Contract ID"; Code[20])
        {
            Caption = 'Contract ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Truck Type"; Code[20])
        {
            Caption = 'Truck Type';
            DataClassification = ToBeClassified;
        }
        field(3; "Distance Covered"; Decimal)
        {
            Caption = 'DistanceTotal';
            DataClassification = ToBeClassified;
        }
        field(4; TripTotal; Integer)
        {
            Caption = 'TripTotal';
            DataClassification = ToBeClassified;
        }
        field(5; BagsTotal; Decimal)
        {
            Caption = 'BagsTotal';
            DataClassification = ToBeClassified;
        }
        field(6; Availability; Integer)
        {
            Caption = 'Availability';
            DataClassification = ToBeClassified;
        }

        field(7; "Quantity Loaded"; Decimal)
        {
            Caption = 'Quantity Loaded';
            DataClassification = ToBeClassified;
        }

        field(8; "Variable Cost"; Decimal)
        {
            Caption = 'Variable Cost';
            DataClassification = ToBeClassified;
        }
        field(9; "Fixed Cost"; Decimal)
        {
            Caption = 'Fixed Cost';
            DataClassification = ToBeClassified;
        }
        field(10; "Delay Loading Cost"; Decimal)
        {
            Caption = 'Delay Loading Cost';
            DataClassification = ToBeClassified;
        }

        field(11; "Quantity Loaded NetWgt Kg"; Decimal)
        {
            Caption = 'Quantity Loaded NetWgt Kg';


            DataClassification = ToBeClassified;
        }

        field(12; "Quantity Offloaded Kg"; Decimal)
        {
            Caption = 'Quantity Loaded NetWgt Kg';


            DataClassification = ToBeClassified;
        }

        field(13; "Direct Dispatch"; Code[20])
        {
            Caption = 'Direct Dispatch';
            TableRelation = Location.Code;

            DataClassification = ToBeClassified;
        }
        field(14; "Offloading Depot"; Code[20])
        {
            Caption = 'Offloading Depot';
            TableRelation = Location.Code;

            DataClassification = ToBeClassified;
        }

        field(15; "Contract Sum"; Decimal)
        {
            Caption = 'Contract Sum';
            DataClassification = ToBeClassified;
        }

        field(16; "Truck No"; Code[20])
        {
            Caption = 'Truck No';
            DataClassification = ToBeClassified;
        }



    }
    keys
    {
        key(PK; "Contract ID", "Truck Type", "Direct Dispatch", "Offloading Depot", "Truck No")
        {
            Clustered = true;
        }

        key(newKey; "Contract ID", "Truck No")
        {
            SumIndexFields = "Contract Sum";
        }

        key(newKey2; "Contract ID")
        {
            SumIndexFields = "Contract Sum";
        }
    }

}
