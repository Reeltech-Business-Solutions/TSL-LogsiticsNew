table 50042 "Inv. Voucher Line"
{
    Caption = 'Inventory Voucher Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Voucher Type"; Enum "Inv.Voucher Type")
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document No."; Code[20])
        {

        }
        field(3; "Line No."; Integer)
        {

        }
        field(4; "Item No."; Code[20])
        {
            TableRelation = Item;

            trigger OnValidate()
            var
                ITem: Record Item;
                IteMRec: Record "Inv. Voucher Line";

                InvVoucherHdr: Record "Inv.Voucher Header";

                Text000: Label 'Unit Cost must not be 0 in Item No %1';


            begin
                IF "Item No." = '' THEN
                    EXIT;
                Item.GET(Rec."Item No.");
                Item.TESTFIELD(Blocked, FALSE);
                IF Item."Unit Cost" = 0 THEN
                    ERROR(Text000, Item."No.")
                ELSE BEGIN
                    Description := Item.Description;
                    "Description 2" := Item."Description 2";
                    "Unit of Measure Code" := Item."Base Unit of Measure";
                    "Inventory Posting Group" := Item."Inventory Posting Group";
                    "Item Category Code" := Item."Item Category Code";
                    //"Product Group Code" := Item."Product Group Code";
                    "Unit Cost" := Item."Unit Cost";
                    Grade := Item."Supplier Name";
                    Size := Item.Size;
                    "Gen. Prod. Posting Group" := ITem."Gen. Prod. Posting Group";

                    IF InvVoucherHdr.GET("Voucher Type", "Document No.") THEN BEGIN
                        //     IF InvVoucherHdr."Voucher Type" = InvVoucherHdr."Voucher Type"::Issue THEN
                        //         "Gen. Prod. Posting Group" := 'BREAKAGES'
                        //     ELSE
                        //         IF InvVoucherHdr."Voucher Type" = InvVoucherHdr."Voucher Type"::Shortages THEN
                        //             "Gen. Prod. Posting Group" := 'SHORTAGES'
                        //         ELSE
                        //             IF InvVoucherHdr."Voucher Type" = InvVoucherHdr."Voucher Type"::Expired THEN
                        //                 "Gen. Prod. Posting Group" := 'Service';
                    END;
                    "Location Code" := InvVoucherHdr."Location Code";
                    "Posting Date" := InvVoucherHdr."Posting Date";
                    "Document Type." := "Document Type."::"Negative Adjmt";
                    Narration := InvVoucherHdr.Narration;
                    "Cost centre code" := InvVoucherHdr."Cost Centre Code";
                    "Revenue centre code" := InvVoucherHdr."Revenue Centre Code";

                    // IteMRec.SetFilter("Item No.","Item No.");
                    // AddDocumentLine(IteMRec);
                END;

            end;


        }
        field(5; "Document Type."; Enum "Inv.Voucher Doc Type")
        {

        }
        field(6; "Description"; Text[50])
        {

        }
        field(7; "Description 2"; Text[50])
        {

        }
        field(8; "Location Code"; Code[10])
        {
            TableRelation = Location;

            trigger OnValidate()

            var
                LineRec: Record "Inv. Voucher Line";
            begin
                LineRec.SetFilter("Document No.", "Document No.");
                AddDocumentLine(LineRec)
            end;
        }
        field(9; "Quantity"; Decimal)
        {
            trigger OnValidate()

            begin
                CheckItemAvailable(FIELDNO(Quantity));
                Amount := Quantity * "Unit Cost";
                Rec.Amount := Amount;
                rec."Qty Requested" := Quantity;
                CalcFields("Quantity in Location");

                If Quantity > "Quantity in Location" then
                    Error('Please ensure that the requested quantity does not exceed the available quantity in the specified location.');
            end;

        }
        field(10; "Unit Cost"; Decimal)
        {
            trigger OnValidate()
            begin

                Amount := Quantity * "Unit Cost";
                Rec.Amount := Amount;
            end;

        }
        field(11; "Unit of Measure Code"; Code[10])
        {
        }
        field(12; "Posting Date"; Date)
        {

        }
        field(13; "Inventory posting group"; Code[20])
        {

        }
        field(14; "Gen. Prod. Posting Group"; Code[10])
        {

        }
        field(15; "Gen. Business Posting Group"; Code[10])
        {

        }
        field(16; "External Document No."; Code[20])
        {

        }
        field(17; "Posting No. Series"; Code[10])
        {

        }
        field(18; "Item Category Code"; Code[10])
        {

        }
        field(19; "Product Group Code"; Code[20])
        {

        }
        field(20; "Responsibility Center"; Code[10])
        {

        }
        field(21; "Status"; Enum "Inv. Voucher Status")
        {

        }
        field(22; "Size"; Code[20])
        {

        }
        field(23; "Grade"; Code[20])
        {

        }
        field(24; "Expiry Date"; Date)
        {

        }
        field(25; "Amount"; Decimal)
        {

        }
        field(26; "Narration"; Text[100])
        {

        }
        field(27; "Quantity in Location"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Item No."), "Location Code" = FIELD("Location Code")));

        }
        field(28; "Qty on Sales Location"; Decimal)
        {

        }
        field(29; "Qty on Transfer Order"; Decimal)
        {

        }
        field(30; "Shelf No."; Code[20])
        {

        }
        field(31; "T.No./TK No."; Code[20])
        {

        }
        field(32; "Bad Part Provided"; Enum "Bad Part Status")
        {

        }
        field(33; "Reason for Non Prov."; Text[100])
        {

        }
        field(34; "Cost centre code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));


        }
        field(35; "Revenue centre code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));


        }
        field(36; "Trucks code"; Code[20])
        {
            // TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
            //                                               Blocked = CONST(false)); Fola09292023

            TableRelation = "Fixed Asset"."No." where(Truck = const(true));

        }
        field(37; "Job ID"; Text[30])
        {

        }
        field(38; "Contract No."; Code[20])
        {

        }
        field(39; "Dimension set ID"; Integer)
        {
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;
        }
        field(40; "Comments"; Text[50])
        {

        }
        field(41; "Qty Requested"; Decimal)
        {

        }
        field(42; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                TESTFIELD(Status, Status::Open);
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(43; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                TESTFIELD(Status, Status::Open);
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(44; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                TESTFIELD(Status, Status::Open);
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(45; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                TESTFIELD(Status, Status::Open);
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(46; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                TESTFIELD(Status, Status::Open);
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(47; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

            trigger OnValidate()
            begin
                TESTFIELD(Status, Status::Open);
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(48; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));

            trigger OnValidate()
            begin
                TESTFIELD(Status, Status::Open);
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
        field(49; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8));

            trigger OnValidate()
            begin
                TESTFIELD(Status, Status::Open);
                ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
            end;
        }
    }

    keys
    {
        key(PK; "Voucher Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
    var
        InvVoucherHdr: Record "Inv.Voucher Header";

        InvVoucherLine: Record "Inv. Voucher Line";

        ItemcheckAval: Codeunit "Item-Check Avail.";

        NotificationLifecycleMgt: Codeunit "Notification Lifecycle Mgt.";

        ItemChecK: Codeunit "ItemCheckAvailability Ext";

        Amount: Decimal;
        DimMgt: Codeunit DimensionManagement;





    [Scope('Cloud')]
    procedure ShowDimensions()
    var
        DocDim: Record "IC Document Dimension";
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension set ID", STRSUBSTNO('%1 %2 %3', "Voucher Type", "Document No.", "Line No."));
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
    end;

    [Scope('Cloud')]
    procedure ShowShortcutDimCode(var ShortcutDimCode: array[15] of Code[20])
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
    end;

    [Scope('Cloud')]
    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;

    [Scope('Cloud')]
    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.LookupDimValueCode(FieldNumber, ShortcutDimCode);
        ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
    end;

    procedure TestStatusOpen()
    var

    begin
        TESTFIELD("Document No.");
        IF (InvVoucherHdr."Voucher Type" <> "Voucher Type") OR (InvVoucherHdr."Document No." <> "Document No.") THEN begin
            InvVoucherHdr.GET("Voucher Type", "Document No.");
            InvVoucherHdr.TESTFIELD(Status, InvVoucherHdr.Status::Open);
        end;
    end;

    LOCAL Procedure CheckItemAvailable(CalledByFieldNo: Integer)
    var
        ItemCheckAvail: Codeunit "Item-Check Avail.";

        RollBack: Boolean;

    begin
        IF (CurrFieldNo = 0) OR (CurrFieldNo <> CalledByFieldNo) THEN // Prevent two checks on quantity
            EXIT;

        IF (CurrFieldNo <> 0) AND ("Item No." <> '') AND (Quantity <> 0)
      THEN begin
            IF InventoryVoucherLineCheck(Rec) THEN
                ItemCheckAvail.RaiseUpdateInterruptedError;
        end;


        IF InventoryVoucherLineCheck(Rec) THEN begin
            ItemCheckAvail.RaiseUpdateInterruptedError;
        end;


    end;

    procedure InventoryVoucherLineCheck(InvVoucherLine: Record "Inv. Voucher Line") RollBack: Boolean
    begin
        NotificationLifecycleMgt.RecallNotificationsForRecordWithAdditionalContext(
  InvVoucherLine.RECORDID, ItemcheckAval.GetItemAvailabilityNotificationId, TRUE);
        IF ItemChecK."Inv.VoucherLineShowWarning"(InvVoucherLine) THEN
            RollBack := ItemcheckAval.ShowAndHandleAvailabilityPage(InvVoucherLine.RECORDID);
    end;

    procedure AddDocumentLine(var LineRec: Record "Inv. Voucher Line"): Boolean
    begin
        // ... populate other fields ...

        if PickValidation.IsItemAlreadyPicked(LineRec) then begin
            ERROR('This item has already been picked on the line with the same location.');
            exit(false); // Line not added due to validation failure
        end

    end;



    var

        PickValidation: Codeunit PickValidation;

}

