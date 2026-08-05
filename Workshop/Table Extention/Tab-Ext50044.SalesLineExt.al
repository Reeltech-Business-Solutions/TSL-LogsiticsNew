tableextension 50044 "Sales LineExt" extends "Sales Line"
{
    fields
    {
        field(50000; "Transaction Date"; Date)
        {
            Caption = 'Transaction Date';
            DataClassification = ToBeClassified;
        }
        field(50001; "Half Month  Amt"; Decimal)
        {
            Caption = 'Half Month  Amt';
            DataClassification = ToBeClassified;
        }
        field(50002; "Full Month Amt"; Decimal)
        {
            Caption = 'Full Month Amt';
            DataClassification = ToBeClassified;
        }
        field(50003; "Truck No."; Code[20])
        {
            Caption = 'Truck No.';
            DataClassification = ToBeClassified;
        }
        field(50004; "Truck Type"; Code[20])
        {
            Caption = 'Truck Type';
            DataClassification = ToBeClassified;
        }

        field(50005; "Varible Amount"; Decimal)
        {
            Caption = 'Varible Amount';
            DataClassification = ToBeClassified;
        }
        field(50006; "Fixed Amount"; Decimal)
        {
            Caption = 'Fixed Amount';
            DataClassification = ToBeClassified;
        }
        field(50007; "Total Days Available"; Decimal)
        {
            Caption = 'Total Days Available';
            DataClassification = ToBeClassified;
        }
        field(50008; "Quantity Loaded"; Decimal)
        {
            Caption = 'Quantity Loaded';
            DataClassification = ToBeClassified;
        }
        field(50009; "Quantity Shortage"; Decimal)
        {
            Caption = 'Shortage Quantity';
            DataClassification = ToBeClassified;
        }
        field(50010; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = ToBeClassified;
        }
        field(50011; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = ToBeClassified;
        }
        field(50012; "Shortage Tolerance"; Decimal)
        {
            Caption = 'Shortage Tolerance';
            DataClassification = ToBeClassified;
        }

        field(50013; "Shortage Rate"; Decimal)
        {
             Caption = 'Shortage Rate';
            DataClassification = ToBeClassified;
        }

        field(50014; "Total Distance Cover"; Decimal)
        {
             Caption = 'Total Distance Cover';
            DataClassification = ToBeClassified;
        }
        field(50015; "Total Shortage Amount"; Decimal)
        {
             Caption = 'Total Shortage Amount';
            DataClassification = ToBeClassified;
        }


    }
}
