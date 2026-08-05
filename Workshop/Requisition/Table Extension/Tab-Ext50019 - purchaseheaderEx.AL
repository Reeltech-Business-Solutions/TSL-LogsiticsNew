tableextension 50019 PurchHeaderExt extends "Purchase Header"
{
    fields
    {
        // Add changes to table fields here
        field(50002; "Vendor Type"; Option)
        {
            Caption = 'Vendor Type';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Foreign","Local","Cash","Import";
            OptionCaption = ' ,Foreign Vendor,Local Vendor,Cash Vendor,Import Vendor';
        }

        field(50003; "PWN_Vendor No"; Code[20])
        {
            Caption = 'Vendor No';
            TableRelation =
            IF ("Vendor Type" = FILTER("Import")) Vendor."No." WHERE("Vendor Type" = CONST("Import File")) ELSE
            IF ("Vendor Type" = FILTER(Foreign)) Vendor."No." WHERE("Vendor Type" = CONST("Foreign"))
            else
            IF ("Vendor Type" = FILTER("Foreign")) Vendor."No." WHERE("Vendor Type" = CONST(Foreign))
            ELSE
            IF ("Vendor Type" = FILTER("Local")) Vendor."No." WHERE("Vendor Type" = CONST("Local"))
            else
            IF ("Vendor Type" = filter("Local")) Vendor."No." WHERE("Vendor Type" = const("Local"));

            // IF ("Purchase Type" = FILTER("Import Charge")) Vendor."No." WHERE("Vendor Type" = CONST("Import File")) ELSE
            // IF ("Purchase Type" = FILTER(Foreign)) Vendor."No." WHERE("Vendor Type" = CONST("Foreign"))
            // else
            // IF ("Purchase Type" = FILTER("Foreign Requisition")) Vendor."No." WHERE("Vendor Type" = CONST(Foreign))
            // ELSE
            // IF ("Purchase Type" = FILTER("Local Requisition")) Vendor."No." WHERE("Vendor Type" = CONST("Local"))
            // else
            // IF ("Purchase Type" = const("Local")) Vendor."No." WHERE("Vendor Type" = const("Local"));

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
            trigger OnValidate()
            begin
                //UpdatePurchaseLines(FIELDNO("Requisition No."));
            end;
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
            OptionCaption = ',Requisition';
        }
        field(50011; "Purchase Type"; Enum "Purchase Type")
        {
            trigger OnValidate()
            begin
                //UpdatePurchaseLines(FIELDNO("Purchase Type"));
            end;
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
        field(50019; "Material Req. No."; Code[20])
        {
            Caption = 'Material Req. No.';
            Editable = false;

        }


        field(50016; "RFQ No."; Code[20])
        {
            TableRelation = "Quotation Request Vendors"."Document No." where("Vendor No." = field("Buy-from Vendor No."));
            Caption = 'RFQ No.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                RFQLines: Record "Purchase Quote Line";
                PurchaseLines: Record "Purchase Line";
                Vends: Record "Quotation Request Vendors";
                PurchaseLines2: Record "Purchase Line";
                PurchHeader: Record "Purchase Header";
            begin
                PurchHeader.SetRange("No.", Rec."No.");
                if PurchHeader.find('-') then
                    PurchaseLines2.SetRange("Document No.", PurchHeader."No.");
                if PurchaseLines2.find('-') then
                    PurchaseLines2.DeleteAll();
                RFQLines.INIT;
                RFQLines.SetRange("Document No.", "RFQ No.");
                IF RFQLines.FIND('-') then begin
                    REPEAT
                        PurchaseLines.INIT;
                        PurchaseLines.TRANSFERFIELDS(RFQLines);
                        PurchaseLines."Document Type" := PurchaseLines."Document Type"::Quote;
                        PurchaseLines."Document No." := "No.";
                        //PurchaseLines."RFQ No." := "RFQ No.";
                        PurchaseLines.Validate("Shortcut Dimension 1 Code", RFQLines."Shortcut Dimension 1 Code");
                        PurchaseLines.Validate("Shortcut Dimension 2 Code", RFQLines."Shortcut Dimension 2 Code");
                        PurchaseLines.Validate("Shortcut Dimension 3 Code", RFQLines."Shortcut Dimension 3 Code");
                        PurchaseLines.Validate("Shortcut Dimension 4 Code", RFQLines."Shortcut Dimension 4 Code");
                        PurchaseLines.Validate("Shortcut Dimension 5 Code", RFQLines."Shortcut Dimension 5 Code");
                        PurchaseLines.Validate("Shortcut Dimension 6 Code", RFQLines."Shortcut Dimension 6 Code");
                        PurchaseLines.Validate("Shortcut Dimension 7 Code", RFQLines."Shortcut Dimension 7 Code");
                        PurchaseLines.Validate("Shortcut Dimension 8 Code", RFQLines."Shortcut Dimension 8 Code");
                        PurchaseLines."Expense No." := RFQLines."Expense No.";
                        PurchaseLines."PRF No." := RFQLines."PRF No";
                        PurchaseLines."RFQ No." := RFQLines."Document No.";
                        PurchaseLines."Purchase Type" := "Purchase Type"::Local;
                        PurchaseLines.INSERT;
                    UNTIL RFQLines.NEXT = 0;
                end;
            end;

        }

        field(60002; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3), Blocked = CONST(false));


            trigger OnValidate()
            var
                purchase_line: Record "Purchase Line";
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
                //UpdatePurchaseLines(FIELDNO("Shortcut Dimension 3 Code"));
                purchase_line.SetRange("Document Type", Rec."Document Type");
                purchase_line.SetRange("Document No.", Rec."No.");
                if purchase_line.FindSet() then begin
                    repeat
                        purchase_line.Validate("Shortcut Dimension 3 Code", Rec."Shortcut Dimension 3 Code");
                        purchase_line.Modify();
                    until purchase_line.Next() = 0;
                end


            end;
        }
        field(60003; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4), Blocked = CONST(false));
            trigger OnValidate()
            var
                purchase_line: Record "Purchase Line";
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
                purchase_line.SetRange("Document Type", Rec."Document Type");
                purchase_line.SetRange("Document No.", Rec."No.");
                if purchase_line.FindSet() then begin
                    repeat
                        purchase_line."Shortcut Dimension 4 Code" := Rec."Shortcut Dimension 4 Code";
                        purchase_line.Modify();
                    until purchase_line.Next() = 0;
                end
            end;
        }
        field(60004; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5), Blocked = CONST(false));


            trigger OnValidate()
            var
                purchase_line: Record "Purchase Line";
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
                purchase_line.SetRange("Document Type", Rec."Document Type");
                purchase_line.SetRange("Document No.", Rec."No.");
                if purchase_line.FindSet() then begin
                    repeat
                        purchase_line."Shortcut Dimension 5 Code" := Rec."Shortcut Dimension 5 Code";
                        purchase_line.Modify();
                    until purchase_line.Next() = 0;
                end
            end;
        }
        field(60005; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6), Blocked = CONST(false));


            trigger OnValidate()
            var
                purchase_line: Record "Purchase Line";
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
                purchase_line.SetRange("Document Type", Rec."Document Type");
                purchase_line.SetRange("Document No.", Rec."No.");
                if purchase_line.FindSet() then begin
                    repeat
                        purchase_line."Shortcut Dimension 6 Code" := Rec."Shortcut Dimension 6 Code";
                        purchase_line.Modify();
                    until purchase_line.Next() = 0;
                end
            end;
        }
        field(60006; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7), Blocked = CONST(false));


            trigger OnValidate()
            var
                purchase_line: Record "Purchase Line";
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
                purchase_line.SetRange("Document Type", Rec."Document Type");
                purchase_line.SetRange("Document No.", Rec."No.");
                if purchase_line.FindSet() then begin
                    repeat
                        purchase_line."Shortcut Dimension 7 Code" := Rec."Shortcut Dimension 7 Code";
                        purchase_line.Modify();
                    until purchase_line.Next() = 0;
                end
            end;
        }
        field(60007; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Editable = true;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8), Blocked = CONST(false));


            trigger OnValidate()
            var
                purchase_line: Record "Purchase Line";
            begin
                ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
                purchase_line.SetRange("Document Type", Rec."Document Type");
                purchase_line.SetRange("Document No.", Rec."No.");
                if purchase_line.FindSet() then begin
                    repeat
                        purchase_line."Shortcut Dimension 8 Code" := Rec."Shortcut Dimension 8 Code";
                        purchase_line.Modify();
                    until purchase_line.Next() = 0;
                end
            end;
        }
        modify(Status)
        {
            trigger OnAfterValidate()
            begin
                //UpdatePurchaseLines(FIELDNO(Status));
            end;
        }


        field(60008; "Created By"; Text[50])
        {

        }
        field(60009; "created Date"; Date)
        {

        }
        
    }

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "created Date" := Today;
    end;

    // trigger OnAfterInsert()
    // var
    // purchase_line: Record "Purchase Line";
    // purchase_header: Record "Purchase Header";

    // begin

    // end;

    procedure UpdatePurchaseLines(FieldRef: Integer)
    var
        PurchaseLine: Record "Purchase Line";
    begin
        PurchaseLine.LOCKTABLE;
        PurchaseLine.SETRANGE("Document No.", "No.");
        IF PurchaseLine.FIND('-') THEN BEGIN
            REPEAT
                CASE FieldRef OF
                    FIELDNO("Purchase Type"):
                        PurchaseLine.VALIDATE("Purchase Type", "Purchase Type");
                    FIELDNO(Status):
                        PurchaseLine.VALIDATE(Status, Status);
                end;
                PurchaseLine.Modify();
            UNTIL PurchaseLine.NEXT = 0;
        END;
    end;
}
