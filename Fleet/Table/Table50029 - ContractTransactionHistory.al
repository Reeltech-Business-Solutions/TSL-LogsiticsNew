table 50029 "Contract Transaction History"
{
    Caption = 'Contract Transaction History';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Truck No."; Code[20])
        {
            Caption = 'Truck No.';
            DataClassification = ToBeClassified;
        }
        field(4; "Transaction Date"; Date)
        {
            Caption = 'Transaction Date';
            DataClassification = ToBeClassified;
        }
        field(5; "Monthly Status"; Code[20])
        {
            Caption = 'Monthly Status';
            DataClassification = ToBeClassified;
        }
        field(6; "Truck Type"; Code[20])
        {
            Caption = 'Truck Type';
            DataClassification = ToBeClassified;
        }
        field(7; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
        field(8; "Invoice No."; Code[20])
        {
            Caption = 'Invoice No.';
            DataClassification = ToBeClassified;
        }
         field(9; "Half Month  Amt"; Decimal)
        {
            Caption = 'Half Month  Amt';
            DataClassification = ToBeClassified;
        }
        field(10; "Full Month Amt"; Decimal)
        {
            Caption = 'Full Month Amt';
            DataClassification = ToBeClassified;
        }
             
        field(11; "Varible Amount"; Decimal)
        {
            Caption = 'Varible Amount';
            DataClassification = ToBeClassified;
        }
        field(12; "Fixed Amount"; Decimal)
        {
            Caption = 'Fixed Amount';
            DataClassification = ToBeClassified;
        }
        field(13; "Total Days Available"; Decimal)
        {
            Caption = 'Total Days Available';
            DataClassification = ToBeClassified;
        } 
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(PK2; "Contract No.","Transaction Date","Monthly Status","Truck No.")
        {
           
        }

        key(Pk3; "Contract No.","Truck No.","Transaction Date","Monthly Status","Truck Type")
        {

           
        }

    }
}
