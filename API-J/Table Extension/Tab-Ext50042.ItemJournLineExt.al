tableextension 50042 "ItemJourn.LineExt" extends "Item Journal Line"
{
    fields
    {
        field(50000; "Truck No."; Code[20])
        {
            Caption = 'Truck No.';
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No." where(Truck = const(true));
        }
        field(50001; "Contract Code"; Code[20])
        {
            Caption = 'Contract Code';
            DataClassification = ToBeClassified;
            TableRelation = "Contract Agreement"."No.";
        }
        field(50002; "Driver No."; Code[20])
        {
            Caption = 'Driver No.';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where(Driver = const(true));
            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                Emp.get("Driver No.");
                Emp.SetRange("No.", "Driver No.");
                "Driver Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
            end;
        }
        field(50003; "Driver Name"; text[100])
        {

        }
        field(50004; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50005; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50006; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50007; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50008; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
        field(50009; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Caption = 'Shortcut Dimension 8 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
            end;
        }
        field(50010; "RFQ No."; Code[20])
        {
            Caption = 'RFQ No.';
            DataClassification = ToBeClassified;

        }
        field(50011; "PRF No."; Code[20])
        {
            Caption = 'PRF No.';
            DataClassification = ToBeClassified;

        }

    }
}
