tableextension 50049 PurchRcptHeader extends "Purch. Rcpt. Header"
{
    fields
    {
        field(50002; "Vendor Type"; Option)
        {
            Caption = 'Vendor Type';
            DataClassification = ToBeClassified;
            OptionMembers = " ",Foreign,Local,Cash,Import;
            OptionCaption = ' ,Foreign Vendor,Local Vendor,Cash Vendor,Import Vendor';
        }

        field(50003; "PWN_Vendor No"; Code[20])
        {
            Caption = 'Vendor No';
            TableRelation = IF ("Purchase Type" = FILTER("Import Charge")) Vendor."No." WHERE("Vendor Type" = CONST("Import File")) ELSE
            IF ("Purchase Type" = FILTER(Foreign)) Vendor."No." WHERE("Vendor Type" = CONST("Foreign"))
            else
            IF ("Purchase Type" = FILTER("Foreign Requisition")) Vendor."No." WHERE("Vendor Type" = CONST(Foreign))
            ELSE
            IF ("Purchase Type" = FILTER("Local Requisition")) Vendor."No." WHERE("Vendor Type" = CONST(Local))
            else
            IF ("Purchase Type" = FILTER(Local)) Vendor."No." WHERE("Vendor Type" = CONST(Local));

            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Buy-from Vendor No." := "PWN_Vendor No";
                Validate("Buy-from Vendor No.");
            end;

            // modify("Buy-from Vendor No.")
            // {
            //     TableRelation = if ("Vendor Type" = filter(Foreign | Local | "Cash Vendor" | Import)) Vendor where("Vendor Type" = field("Vendor Type"));
            // }
        }
        field(50007; "Requisition No."; Code[20])
        {
            Caption = 'Requisition No.';
            DataClassification = ToBeClassified;
        }
        field(50008; "PWN2_Vendor No"; Code[20])
        {
            Caption = 'Vendor No2';
            TableRelation = Vendor;
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //"Vendor Order No." :=
            end;
        }
        field(50009; RequisionEdit; Boolean)
        {
            Caption = 'RequisitionEditable';
        }
        field(50010; "Request Type"; Option)
        {
            Caption = 'Request Type';
            DataClassification = ToBeClassified;
            OptionMembers = "",Requisition;
            OptionCaption = ' ,Requisition';
        }
        field(50011; "Purchase Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,Local,Foreign,"Import Charge","Local Requisition","Foreign Requisition",Cash;
            OptionCaption = ' ,Local,Foreign,"Import Charge","Local Requisition","Foreign Requisition",Cash';
        }
        field(50012; Description; Text[150])
        {
            Caption = 'Description';
        }
        field(50013; VendorNoFilter; Code[20])
        {
            Caption = 'Vendor No';
            //TableRelation = Vendor."No.";

            TableRelation = IF ("Purchase Type" = FILTER("Import Charge")) Vendor."No." WHERE("Vendor Type" = CONST(Import)) else
            IF ("Purchase Type" = FILTER(Foreign | "Foreign Requisition")) Vendor."No." WHERE("Vendor Type" = CONST(Foreign)) else
            IF ("Purchase Type" = FILTER(Local | "Local Requisition")) Vendor."No." WHERE("Vendor Type" = CONST(Local)) else
            IF ("Purchase Type" = FILTER(Cash)) Vendor."No." WHERE("Vendor Type" = CONST(Cash));
            //Foreign,Local,"Cash Vendor",Import

            trigger OnValidate()
            begin
                //"Buy-from Vendor No." := VendorNoFilter;
                //Validate("Buy-from Vendor No.");
            end;
        }

        field(50014; "Approval Code"; Code[20])
        {
            Caption = 'Approval Code';
            TableRelation = "Approval Code";
            DataClassification = ToBeClassified;
        }
        field(50015; "Responsibility CenterRBS"; Code[20])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        field(50016; "RFQ No."; Code[20])
        {
            TableRelation = "Quotation Request Vendors"."Document No." where("Vendor No." = field("Buy-from Vendor No."));
            Caption = 'RFQ No.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin

            end;
        }

        field(60002; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
                //UpdateVoucherLines(FIELDNO("Shortcut Dimension 3 Code"));
            end;
        }
        field(60003; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(60004; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(60005; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(60006; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
        field(60007; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8));
        }
    }
}
