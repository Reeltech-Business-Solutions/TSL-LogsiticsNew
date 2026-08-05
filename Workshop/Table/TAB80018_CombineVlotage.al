table 80018 "Combine Vlotage Test"
{
    Caption = 'Combine Vlotage';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            DataClassification = ToBeClassified;
        }
        field(2; "Document No"; Code[20])
        {
            Caption = 'Document No';
            DataClassification = ToBeClassified;
        }
        field(3; "Combine Voltage Test"; Code[20])
        {
            Caption = 'Combine Voltage Test';
            DataClassification = ToBeClassified;
        }
        field(4; "Combine Voltage at Ignition"; Code[20])
        {
            Caption = 'Combine Voltage at Ignition';
            DataClassification = ToBeClassified;
        }
        field(5; "Voltage  Test"; Option)
        {
            OptionMembers = ,"Test Before","Test After",Neutral;
            OptionCaption = ' ,Test Before,Test After,Neutral';
            Caption = 'Voltage  Test';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No")
        {
            Clustered = true;
        }
    }

}
