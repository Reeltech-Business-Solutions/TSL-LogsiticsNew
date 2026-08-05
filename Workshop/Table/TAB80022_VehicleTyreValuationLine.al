table 80022 "Vehicle Tyre Valuation Line"
{
    Caption = 'Vehicle Tyre Valuation Line';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Line No"; Integer)
        {
            Caption = 'Line No';
            DataClassification = ToBeClassified;
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Position Code"; Code[20])
        {
            Caption = 'Position Code';
            DataClassification = ToBeClassified;
        }
        field(4; "Tyre Id"; Code[20])
        {
            Caption = 'Tyre Id';
            DataClassification = ToBeClassified;
        }
        field(5; "Product Code"; Code[20])
        {
            Caption = 'Product Code';
            DataClassification = ToBeClassified;
        }
        field(6; "Retread Design"; Code[20])
        {
            Caption = 'Retread Design';
            DataClassification = ToBeClassified;
        }
        field(7; "Ply Rate"; Decimal)
        {
            Caption = 'Ply Rate';
            DataClassification = ToBeClassified;
        }
        field(8; "Rec Air"; Code[20])
        {
            Caption = 'Rec Air';
            DataClassification = ToBeClassified;
        }
        field(9; "Air Found"; Boolean)
        {
            Caption = 'Air Found';
            DataClassification = ToBeClassified;
        }
        field(10; "Tread Depth"; Code[20])
        {
            Caption = 'Tread Depth';
            DataClassification = ToBeClassified;
        }
        field(11; Tir; Code[20])
        {
            Caption = 'Tir';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Line No","Document No.")
        {
            Clustered = true;
        }
    }
    
}
