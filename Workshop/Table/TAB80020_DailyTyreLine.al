table 80020 "Daily Tyre Line"
{
    Caption = 'DailyTyreRegroove Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No"; Integer)
        {
            Caption = 'Line No';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(4; "Truck No"; Code[20])
        {
            Caption = 'Truck No';
            DataClassification = ToBeClassified;
            TableRelation = "Service Item"."No." where("MACHINE TYPE" = filter(Truck));
            trigger OnValidate()
            var
                ServiceItem: Record "Service Item";
            begin
                ServiceItem.GET("Truck No");
                ServiceItem.SetRange("No.", "Truck No");
                Contract := ServiceItem."Contract Code";
                //"Asset Type" := FA."Asset Type";

            end;

        }
        field(5; Contract; Code[20])
        {
            Caption = 'Contract';
            DataClassification = ToBeClassified;
            TableRelation = "Contract Agreement"."No.";
        }
        field(6; "Asset Type"; Code[20])
        {
            Caption = 'Asset Type';
            DataClassification = ToBeClassified;
        }
        field(7; "Odmeter Brands f Tyre"; Code[20])
        {
            Caption = 'Odmeter Brands f Tyre';
            DataClassification = ToBeClassified;
        }
        field(8; Size; Code[20])
        {
            Caption = 'Size';
            DataClassification = ToBeClassified;
        }
        field(9; Pattern; Code[20])
        {
            Caption = 'Pattern';
            DataClassification = ToBeClassified;
        }
        field(10; "Tyre Serial No"; Code[20])
        {
            Caption = 'Tyre Serial No';
            DataClassification = ToBeClassified;
        }
        field(11; "Previously Regrooved"; Boolean)
        {
            Caption = 'Previously Regrooved';
            DataClassification = ToBeClassified;
        }
        field(12; "Old Tyre Position"; Code[20])
        {
            Caption = 'Old Tyre Position';
            DataClassification = ToBeClassified;
        }
        field(13; "Old Depth"; Code[20])
        {
            Caption = 'Old Depth';
            DataClassification = ToBeClassified;
        }
        field(14; "New Depth"; Code[20])
        {
            Caption = 'New Depth';
            DataClassification = ToBeClassified;
        }
        field(15; "New Tyre Position"; Code[20])
        {
            Caption = 'New Tyre Position';
            DataClassification = ToBeClassified;
        }
        field(16; "Driver Name"; Text[30])
        {
            Caption = 'Driver Name';
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(17; "Depth"; Code[20])
        {
            Caption = 'Depth';
            DataClassification = ToBeClassified;
        }
        field(18; "Radia Patches"; Code[20])
        {
            Caption = 'Radia Patches';
            DataClassification = ToBeClassified;
        }
        field(19; "New  PSI"; Code[20])
        {
            Caption = 'New  PSI';
            DataClassification = ToBeClassified;
        }
        field(20; "Daily Tyre Type"; Option)
        {
            OptionMembers = ,Repair,Regroove;
            OptionCaption = ',Repair,Regroove';
            Caption = 'Tyre Technician';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Daily Tyre Type", "Document No.", "Line No")
        {
            Clustered = true;
        }
    }

}
