table 50028 "History Billing Transaction"
{
    Caption = 'History Billing Transaction';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Transaction Date"; Date)
        {
            Caption = 'Transaction Date';
            DataClassification = ToBeClassified;
        }
        field(4; "Monthly Status"; Option)
        {
            Caption = 'Monthly Status ';
            OptionMembers = " ","Half Month","Full Month";
            OptionCaption = ' ,Half Month,Full Month';
            DataClassification = ToBeClassified;

        }
        field(5; "Transaction Amount"; Decimal)
        {
            Caption = 'Transaction Amount';
            DataClassification = ToBeClassified;
        }
        field(6; "Truck Type"; Code[20])
        {
            Caption = 'Truck Type';
            DataClassification = ToBeClassified;
        }
        field(7; "Truck No."; Code[20])
        {
            Caption = 'Truck No.';
            DataClassification = ToBeClassified;
        }
        field(8; "Posted Transaction"; Boolean)
        {
            Caption = 'Posted Transaction';
            DataClassification = ToBeClassified;
        }
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(Pk1; "Document No.","Transaction Date","Monthly Status")
        {

        }
        key(Pk2; "Transaction Date","Monthly Status","Truck No.","Truck Type")
        {

           
        }

       



    }
}
