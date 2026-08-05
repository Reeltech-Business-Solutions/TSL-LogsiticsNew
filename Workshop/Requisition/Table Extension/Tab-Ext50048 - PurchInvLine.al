tableextension 50048 PurchInvLine extends "Purch. Inv. Line"
{
    fields
    {

        field(50001; "Expense No."; code[20])
        {
             TableRelation = "Receipts and Payment Types".Code where(type = Const(Requisition), Blocked = CONST(false));

        }
        field(50002; "Direct Unit Cost Buffer"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Property Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Property Name"; Code[90])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Requisition No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(50007; Committed; boolean)
        {
            Caption = 'Committed';
            //Editable = false;
        }
        field(50008; "RFQ No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50009; Status; Enum "Purchase Document Status")
        {
            Caption = 'Status';
            Editable = false;
        }
        field(50010; Purchase; Enum "Purchase Type")
        {

        }
        field(60002; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                //  ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
                //UpdatePurchaseLines(FIELDNO("Shortcut Dimension 3 Code"));
            end;
        }
        field(60003; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                //  ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(60004; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                //   ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(60005; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

            trigger OnValidate()
            begin
                // ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(60006; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));

            trigger OnValidate()
            begin
                // ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
        field(60007; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Caption = 'Shortcut Dimension 8 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8));

            trigger OnValidate()
            begin
                // ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");

            end;
        }

    }
}
