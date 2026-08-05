table 50020 "No. Days Work"
{
    Caption = 'No. Days Work';
    DataClassification = ToBeClassified;
   // TableType = Temporary;

    fields
    {
        field(1; "Trans Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(2; Discription; text[200])
        {
            Caption = 'Discription';
            DataClassification = ToBeClassified;
        }

        field(3; "Truck No"; Code[20])
        {
            Caption = 'Discription';
            DataClassification = ToBeClassified;
        }

        field(4; "Truck Type"; Code[20])
        {
            Caption = 'Discription';
            DataClassification = ToBeClassified;
        }

        field(5; "OffLoading Depot"; Code[20])
        {
            Caption = 'Discription';
            DataClassification = ToBeClassified;
        }

        field(6; "Direct Dispatch"; Code[20])
        {
            Caption = 'Discription';
            DataClassification = ToBeClassified;
        }

        field(7; "Contract ID"; Code[20])
        {
            Caption = 'Discription';
            DataClassification = ToBeClassified;
        }


    }
    keys
    {
        key(PK; "Trans Date", "Truck No", "Truck Type", "Direct Dispatch", "OffLoading Depot", "Contract ID")
        {
            Clustered = true;
        }

        key(PK1; "Truck No", "Truck Type","Contract ID")
        {
            //SumIndexFields =  "Truck No", "Truck Type","Contract ID";
        }

       
    }

}
