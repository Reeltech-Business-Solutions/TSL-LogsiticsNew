table 50016 "ECP Line"
{
    Caption = 'ECP Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Description; Text[500])
        {
            Caption = 'Check Items (Visual Inspection)';
            DataClassification = ToBeClassified;
        }
        field(2; "Replaceable  Parts"; Code[20])
        {
            Caption = 'Replaceable  Parts';
            DataClassification = ToBeClassified;
        }
        field(3; Measurement; Code[20])
        {
            Caption = 'Measurement';
            DataClassification = ToBeClassified;
        }
        field(4; Good; Boolean)
        {
            Caption = 'Good';
            DataClassification = ToBeClassified;
        }
        field(5; Fair; Boolean)
        {
            Caption = 'Fair';
            DataClassification = ToBeClassified;
        }
        field(6; Poor; Boolean)
        {
            Caption = 'Poor';
            DataClassification = ToBeClassified;
        }
        field(7; Remarks; Text[150])
        {
            Caption = 'Remarks';
            DataClassification = ToBeClassified;
        }
        field(8; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(9; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(10; "Comments"; Text[250])
        {

        }
        field(11; "Visual Check"; code[50])
        {
            Caption = 'Visual Check';
            DataClassification = ToBeClassified;
            TableRelation = VisualCheck;
        }
        field(12; "Sub Visual CheckList"; Code[50])
        {
            Caption = 'Sub Visual Check List';
            DataClassification = ToBeClassified;
            TableRelation = "Things to Check" where("1Visual Check" = field("Visual Check"));

        }
        field(13; "SA/Tech Sign"; Text[30])
        {
            Caption = 'SA/Tech Signature';
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

}
