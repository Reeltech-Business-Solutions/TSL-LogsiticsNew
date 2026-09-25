table 50041 "Inv.Voucher Header"
{
    Caption = 'Inventory Voucher Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Document Type."; Enum "Inv.Voucher Doc Type")
        {

        }
        field(3; "Voucher Type"; enum "Inv.Voucher Type")
        {

        }
        field(4; "Posting Date"; Date)
        {
            trigger OnValidate()
            var
                Confirmed: Boolean;

            begin
                TESTFIELD(Status, Status::Open);


                IF (xRec."Posting Date" <> "Posting Date") THEN BEGIN
                    IF HideValidationDialog OR
                      (xRec."Posting Date" = 0D)
                    THEN
                        Confirmed := TRUE
                    ELSE
                        Confirmed := CONFIRM(Text001, FALSE, FIELDCAPTION("Posting Date"));
                    IF Confirmed THEN
                        UpdateInvVoucherLines(FIELDNO("Posting Date"))
                    ELSE BEGIN
                        "Posting Date" := xRec."Posting Date";
                        EXIT;
                    END;
                END;
            end;
        }
        field(5; "Status"; Enum "Inv. Voucher Status")
        {
            trigger OnValidate()

            begin
                UpdateInvVoucherLines(FIELDNO(Status))
            end;

        }
        field(6; "Location Code"; Code[10])
        {
            TableRelation = Location;

            trigger OnValidate()
            var
                Confirmed: Boolean;

            begin
                // TESTFIELD(Status, Status::Open);

                IF (xRec."Location Code" <> "Location Code") THEN BEGIN
                    IF HideValidationDialog OR
                      (xRec."Location Code" = '')
                    THEN
                        Confirmed := TRUE
                    ELSE
                        Confirmed := CONFIRM(Text001, FALSE, FIELDCAPTION("Location Code"));
                    IF Confirmed THEN
                        UpdateInvVoucherLines(FIELDNO("Location Code"))
                    ELSE BEGIN
                        "Location Code" := xRec."Location Code";
                        EXIT;
                    END;
                END;

            end;
        }
        field(7; "No. Series"; Code[10])
        {

        }
        field(8; "Created By"; Code[10])
        {

        }
        field(9; "Created By Name"; Text[50])
        {

        }
        field(10; "Created By Date"; Date)
        {
            Editable = False;

        }
        field(11; "Created Time"; Time)
        {
            Editable = false;

        }
        field(12; "Modified By"; Code[50])
        {

        }
        field(13; "Modified By Name"; Text[50])
        {

        }
        field(14; "Modified Date"; Date)
        {

        }
        field(15; "Modified Time"; Time)
        {

        }
        field(16; "Posted By"; Code[50])
        {

        }
        field(17; "Posted By Name"; text[50])
        {

        }
        field(18; "Posted Date"; Date)
        {

        }
        field(19; "Posted Time"; Time)
        {

        }
        field(20; "Document Status"; Enum "Inv. Voucher Doc Status")
        {

        }
        field(21; "Pre Assigned No."; Code[20])
        {

        }
        field(22; "Shortcut Dimension code 1"; Code[20])
        {

        }
        field(23; "Shortcut Dimension code 2"; Code[20])
        {

        }
        field(24; "Released Date"; Date)
        {

        }
        field(25; "Released By"; Code[50])
        {

        }
        field(26; "Narration"; Text[100])
        {

        }
        field(27; "Amount"; Decimal)
        {

        }
        field(28; "Customer No."; Code[20])
        {
            trigger OnValidate()
            var
                Cust: Record Customer;
            begin
                IF Cust.GET("Customer No.") THEN
                    "Customer Name" := Cust.Name
                ELSE
                    "Customer Name" := '';
            end;
        }
        field(29; "Customer Name"; Text[50])
        {

        }
        field(30; "Requester ID"; Text[50])
        {
            Editable = false;

        }
        field(31; "Description"; Text[100])
        {

        }
        field(32; "Cost Centre Code"; Code[20])
        {

        }
        field(33; "2Description"; Text[100])
        {

        }
        field(34; "Revenue Centre Code"; Code[20])
        {

        }
        field(35; "Request Description"; Text[100])
        {

        }
        field(36; "Required Date"; Date)
        {

        }
        field(37; "Responsibility Center"; Text[50])
        {

        }
        field(38; "Issued To"; Text[50])
        {

        }



    }


    keys
    {
        key(PK; "Voucher Type", "Document No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var

    begin
        InvtSetup.GET;

        IF "Document No." = '' THEN BEGIN
            TestNoSeries;
            "No. Series" := GetNoSeriesCode();
            if NoSeriesMgt.AreRelated(GetNoSeriesCode(), xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Document No." := NoSeriesMgt.GetNextNo("No. Series", "Posting Date");
            //  NoSeriesMgt.InitSeries(GetNoSeriesCode, xRec."No. Series", "Posting Date", "Document No.", "No. Series");
        END;

        IF "Posting Date" = 0D THEN
            "Posting Date" := WORKDATE;

        "Requester ID" := USERID;
        "Created By Date" := TODAY;
        "Created Time" := TIME;
        "Required Date" := Today;

    end;

    trigger OnModify()
    begin
        "Modified By" := USERID;
        "Modified Date" := TODAY;
        "Modified Time" := TIME;
    end;

    trigger OnDelete()
    begin
        TESTFIELD(Status, Status::Open);

        InvVoucherLine.SETRANGE("Document No.", "Document No.");
        InvVoucherLine.DELETEALL(TRUE);

    end;



    var
        HideValidationDialog: Boolean;
        InvVoucherLin: Record "Inv. Voucher Line";

        InvtSetup: Record "Inventory Setup";

        DocNo: Code[20];

        //  NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeriesMgt: Codeunit "No. Series";

        InvVoucherLine: Record "Inv. Voucher Line";

        InvVoucherLine2: Record "Inv. Voucher Line";

        InvVoucherHdr: Record "Inv.Voucher Header";

        ItemJnLline: Record "Item Journal Line";

        ItemJnLline2: Record "Item Journal Line";

        ItemJnlBatch: Record "Item Journal Batch";

        ItemJnlPostBatch: Codeunit "Item Jnl.-Post Batch";

        text001: Label 'Do you want to change %1?';



    LOCAL procedure UpdateInvVoucherLines(FieldRef: Integer);
    var
        InvVoucherLine: Record "Inv. Voucher Line";
    begin
        InvVoucherLine.LOCKTABLE;
        InvVoucherLine.SETRANGE("Document No.", "Document No.");
        IF InvVoucherLine.FIND('-') THEN BEGIN
            REPEAT
                CASE FieldRef OF
                    FIELDNO("Location Code"):
                        BEGIN
                            InvVoucherLine.VALIDATE("Location Code", "Location Code");
                        END;
                    FIELDNO(Status):
                        InvVoucherLine.VALIDATE(Status, Status);
                    FIELDNO("Posting Date"):
                        InvVoucherLine.VALIDATE("Posting Date", "Posting Date");
                END;
                InvVoucherLine.MODIFY(TRUE);
            UNTIL InvVoucherLine.NEXT = 0;
        END;
    end;


    procedure PostShortages();
    var


    begin
        InvtSetup.GET;
        InvVoucherLin.RESET;
        InvVoucherLin.SETRANGE(InvVoucherLin."Voucher Type", "Voucher Type");
        InvVoucherLin.SETRANGE(InvVoucherLin."Document No.", "Document No.");
        IF NOT InvVoucherLin.FIND('-') THEN
            ERROR('Line Item cannot be Blank');

        IF "Document No." <> '' THEN BEGIN
            InvtSetup.TESTFIELD(InvtSetup."Posted Shortage Voucher Nos.");

            DocNo := NoSeriesMgt.GetNextNo(InvtSetup."Posted Shortage Voucher Nos.", "Posting Date", TRUE);
        END;

        InvVoucherLine.SETRANGE(InvVoucherLine."Document No.", "Document No.");
        InvVoucherLine.SETRANGE(InvVoucherLine."Voucher Type", "Voucher Type");
        IF InvVoucherLine.FIND('-') THEN BEGIN
            REPEAT
                InvVoucherLine2.INIT;
                InvVoucherLine2.TRANSFERFIELDS(InvVoucherLine);
                InvVoucherLine2."Document Type." := InvVoucherLine2."Document Type."::"Negative Adjmt";
                InvVoucherLine2."Voucher Type" := InvVoucherLine2."Voucher Type"::"Posted Shortages";
                InvVoucherLine2."Document No." := DocNo;
                InvVoucherLine2."Posting Date" := "Posting Date";
                InvVoucherLine2.Narration := Narration;
                InvVoucherLine2.INSERT;
            UNTIL InvVoucherLine.NEXT = 0;
        END;

        InvVoucherHdr := Rec;
        InvVoucherHdr.SETRANGE(InvVoucherHdr."Document No.", "Document No.");
        InvVoucherHdr.SETRANGE(InvVoucherHdr."Voucher Type", "Voucher Type");
        IF InvVoucherHdr.FINDFIRST THEN BEGIN
            InvVoucherHdr."Pre Assigned No." := "Document No.";
            InvVoucherHdr."Document No." := DocNo;
            InvVoucherHdr."Voucher Type" := InvVoucherHdr."Voucher Type"::"Posted Shortages";
            InvVoucherHdr."Posting Date" := "Posting Date";
            InvVoucherHdr.Narration := Narration;
            InvVoucherHdr.INSERT;
        END;

        IF InvVoucherLine.FINDSET THEN BEGIN
            REPEAT
                ItemJnlBatch.GET('SHORTAGES', 'SHORTAGES');
                ItemJnLline.VALIDATE("Journal Template Name", 'SHORTAGES');
                ItemJnLline.VALIDATE("Journal Batch Name", 'SHORTAGES');
                ItemJnLline2.SETRANGE("Journal Template Name", ItemJnLline."Journal Template Name");
                ItemJnLline2.SETRANGE("Journal Batch Name", ItemJnLline."Journal Batch Name");
                IF ItemJnLline2.FIND('+') THEN
                    ItemJnLline."Line No." := ItemJnLline2."Line No." + 1000
                ELSE
                    ItemJnLline."Line No." := 1000;

                ItemJnLline.INIT;
                ItemJnLline.VALIDATE("Entry Type", ItemJnLline."Entry Type"::"Negative Adjmt.");
                ItemJnLline."Document No." := DocNo;
                ItemJnLline.VALIDATE("Posting Date", "Posting Date");
                IF InvVoucherLine."Item No." <> '' THEN BEGIN
                    ItemJnLline.VALIDATE("Item No.", InvVoucherLine."Item No.");
                    IF InvVoucherLine."Location Code" <> '' THEN
                        ItemJnLline.VALIDATE("Location Code", "Location Code");
                    ItemJnLline.VALIDATE("Gen. Prod. Posting Group", InvVoucherLine."Gen. Prod. Posting Group");
                    ItemJnLline.VALIDATE(Quantity, InvVoucherLine.Quantity);
                    //ItemJnLline.VALIDATE("Unit Amount",InvVoucherLine."Unit Cost");
                    //ItemJnLline.VALIDATE("Unit Cost",InvVoucherLine."Unit Cost");
                    ItemJnLline."Source Code" := 'ITEMJNL';
                END;
                ItemJnLline.INSERT;

            UNTIL InvVoucherLine.NEXT = 0;
        END;
        ItemJnlPostBatch.RUN(ItemJnLline);
    end;


    procedure PostExpired()
    var

    begin
        InvtSetup.GET;
        InvVoucherLine.RESET;
        InvVoucherLine.SETRANGE(InvVoucherLine."Voucher Type", "Voucher Type");
        InvVoucherLine.SETRANGE(InvVoucherLine."Document No.", "Document No.");
        IF NOT InvVoucherLine.FIND('-') THEN
            ERROR('Line Item cannot be Blank');

        IF "Document No." <> '' THEN BEGIN
            InvtSetup.TESTFIELD(InvtSetup."Posted Expired Voucher Nos.");
            DocNo := NoSeriesMgt.GetNextNo(InvtSetup."Posted Expired Voucher Nos.", "Posting Date", TRUE);
        END;

        InvVoucherLine.SETRANGE(InvVoucherLine."Document No.", "Document No.");
        InvVoucherLine.SETRANGE(InvVoucherLine."Voucher Type", "Voucher Type");
        IF InvVoucherLine.FIND('-') THEN BEGIN
            REPEAT
                InvVoucherLine2.INIT;
                InvVoucherLine2.TRANSFERFIELDS(InvVoucherLine);
                InvVoucherLine2."Document Type." := InvVoucherLine2."Document Type."::"Negative Adjmt";
                InvVoucherLine2."Voucher Type" := InvVoucherLine2."Voucher Type"::"Posted Expired";
                InvVoucherLine2."Document No." := DocNo;
                InvVoucherLine2."Posting Date" := "Posting Date";
                InvVoucherLine2.Narration := Narration;
                InvVoucherLine2.INSERT;
            UNTIL InvVoucherLine.NEXT = 0;
        END;

        InvVoucherHdr := Rec;
        InvVoucherHdr.SETRANGE(InvVoucherHdr."Document No.", "Document No.");
        InvVoucherHdr.SETRANGE(InvVoucherHdr."Voucher Type", "Voucher Type");
        IF InvVoucherHdr.FINDFIRST THEN BEGIN
            InvVoucherHdr."Pre Assigned No." := "Document No.";
            InvVoucherHdr."Document No." := DocNo;
            InvVoucherHdr."Voucher Type" := InvVoucherHdr."Voucher Type"::"Posted Expired";
            InvVoucherHdr."Posting Date" := "Posting Date";
            InvVoucherHdr.Narration := Narration;
            InvVoucherHdr.INSERT;
        END;

        IF InvVoucherLine.FINDSET THEN BEGIN
            REPEAT
                ItemJnlBatch.GET('SERVICE', 'SERVICE');
                ItemJnLline.VALIDATE("Journal Template Name", 'SERVICE');
                ItemJnLline.VALIDATE("Journal Batch Name", 'SERVICE');
                ItemJnLline2.SETRANGE("Journal Template Name", ItemJnLline."Journal Template Name");
                ItemJnLline2.SETRANGE("Journal Batch Name", ItemJnLline."Journal Batch Name");
                IF ItemJnLline2.FIND('+') THEN
                    ItemJnLline."Line No." := ItemJnLline2."Line No." + 1000
                ELSE
                    ItemJnLline."Line No." := 1000;

                ItemJnLline.INIT;
                ItemJnLline.VALIDATE("Entry Type", ItemJnLline."Entry Type"::"Negative Adjmt.");
                ItemJnLline."Document No." := DocNo;
                ItemJnLline.VALIDATE("Posting Date", "Posting Date");
                IF InvVoucherLine."Item No." <> '' THEN BEGIN
                    ItemJnLline.VALIDATE("Item No.", InvVoucherLine."Item No.");
                    IF InvVoucherLine."Location Code" <> '' THEN
                        ItemJnLline.VALIDATE("Location Code", "Location Code");
                    ItemJnLline.VALIDATE("Gen. Prod. Posting Group", InvVoucherLine."Gen. Prod. Posting Group");
                    ItemJnLline.VALIDATE(Quantity, InvVoucherLine.Quantity);
                    ItemJnLline."Source Code" := 'ITEMJNL';
                END;
                ItemJnLline.INSERT;

            UNTIL InvVoucherLine.NEXT = 0;
        END;
        ItemJnlPostBatch.RUN(ItemJnLline);
    end;

    procedure Navigate()
    var
        NavigatePage: Page Navigate;

    begin
        NavigatePage.SetDoc("Posting Date", "Document No.");
        NavigatePage.RUN;
    end;

    procedure AssistEdit(OldVoucherHeader: Record "Inv.Voucher Header"): Boolean
    var

    begin
        InvtSetup.GET;
        TestNoSeries;
        IF NoSeriesMgt.LookupRelatedNoSeries(GetNoSeriesCode, OldVoucherHeader."No. Series", "No. Series") THEN BEGIN
            InvtSetup.GET;
            ;
            TestNoSeries;
            NoSeriesMgt.GetNextNo("Document No.");
            EXIT(TRUE);
        END;
    end;

    procedure PostIssue(InvVouchr: Record "Inv.Voucher Header")
    var
        lineNo: Decimal;
    begin
        InvtSetup.GET;
        InvVoucherLine.RESET;
        InvVoucherLine.SETRANGE(InvVoucherLine."Voucher Type", InvVouchr."Voucher Type");
        InvVoucherLine.SETRANGE(InvVoucherLine."Document No.", InvVouchr."Document No.");
        IF NOT InvVoucherLine.FIND('-') THEN
            ERROR('Line Item cannot be Blank');

        IF "Document No." <> '' THEN BEGIN
            InvtSetup.TESTFIELD(InvtSetup."Posted Inventory Nos.");

            DocNo := NoSeriesMgt.GetNextNo(InvtSetup."Posted Inventory Nos.", "Posting Date", TRUE);
        END;

        InvVoucherLine.SETRANGE(InvVoucherLine."Document No.", "Document No.");
        InvVoucherLine.SETRANGE(InvVoucherLine."Voucher Type", "Voucher Type");
        IF InvVoucherLine.FIND('-') THEN BEGIN
            REPEAT
                InvVoucherLine.TestField(InvVoucherLine."Gen. Business Posting Group");
                InvVoucherLine2.INIT;
                InvVoucherLine2.TRANSFERFIELDS(InvVoucherLine);
                InvVoucherLine2."Document Type." := InvVoucherLine2."Document Type."::"Negative Adjmt";
                InvVoucherLine2."Voucher Type" := InvVoucherLine2."Voucher Type"::"Posted Issue";
                InvVoucherLine2."Document No." := DocNo;
                InvVoucherLine2."Posting Date" := "Posting Date";
                InvVoucherLine2.Narration := Narration;
                InvVoucherLine2.INSERT;
            UNTIL InvVoucherLine.NEXT = 0;
        END;

        InvVoucherHdr := Rec;
        InvVoucherHdr.SETRANGE(InvVoucherHdr."Document No.", "Document No.");
        InvVoucherHdr.SETRANGE(InvVoucherHdr."Voucher Type", "Voucher Type");
        IF InvVoucherHdr.FINDFIRST THEN BEGIN
            InvVoucherHdr."Pre Assigned No." := "Document No.";
            InvVoucherHdr."Document No." := DocNo;
            InvVoucherHdr."Voucher Type" := InvVoucherHdr."Voucher Type"::"Posted Issue";
            InvVoucherHdr."Posting Date" := "Posting Date";
            InvVoucherHdr.Narration := Narration;
            InvVoucherHdr.INSERT;
        END;

        //Clear Item Journal Lines before processing
        ItemJnLline.Reset();

        ItemJnLline.SetFilter(ItemJnLline."Journal Template Name", '%1', 'ISSUEOUT');
        ItemJnLline.SetFilter(ItemJnLline."Journal Batch Name", '%1', 'ISSUEOUT');
        if ItemJnLline.find('-') then
            ItemJnLline.DeleteAll();



        IF InvVoucherLine.FINDSET THEN BEGIN
            REPEAT
                lineNo += 1000;
                ItemJnLline.INIT;
                ItemJnlBatch.GET('ISSUEOUT', 'ISSUEOUT');
                ItemJnLline.VALIDATE(ItemJnLline."Journal Template Name", 'ISSUEOUT');
                ItemJnLline.VALIDATE(ItemJnLline."Journal Batch Name", 'ISSUEOUT');
                ItemJnLline."Line No." := lineNo;
                ItemJnLline.VALIDATE("Entry Type", ItemJnLline."Entry Type"::"Negative Adjmt.");
                ItemJnLline."Document No." := DocNo;
                // MESSAGE('%1', ItemJnLline."Document No.");
                ItemJnLline.VALIDATE("Posting Date", InvVoucherLine."Posting Date");
                IF InvVoucherLine."Item No." <> '' THEN BEGIN
                    ItemJnLline.VALIDATE("Item No.", InvVoucherLine."Item No.");
                    IF InvVoucherLine."Location Code" <> '' THEN
                        ItemJnLline.VALIDATE("Location Code", InvVoucherLine."Location Code");
                    //ItemJnLline.VALIDATE("Gen. Prod. Posting Group", InvVoucherLine."Gen. Prod. Posting Group");
                    ItemJnLline.Validate("Gen. Bus. Posting Group", InvVoucherLine."Gen. Business Posting Group");
                    ItemJnLline.VALIDATE(Quantity, InvVoucherLine.Quantity);
                    if InvVoucherLine."Trucks code" <> '' then
                        ItemJnLline.Validate("Truck No.", InvVoucherLine."Trucks code"); //Fola29092023
                    //ItemJnLline.VALIDATE("Unit Amount",InvVoucherLine."Unit Cost");
                    //ItemJnLline.VALIDATE("Unit Cost",InvVoucherLine."Unit Cost");
                    ItemJnLline."Source Code" := 'ITEMJNL';
                END;
                ItemJnLline.INSERT;
            UNTIL InvVoucherLine.NEXT = 0;
        END;

        ItemJnLline.Reset();
        ItemJnLline.SetFilter(ItemJnLline."Journal Template Name", '%1', 'ISSUEOUT');
        ItemJnLline.SetFilter(ItemJnLline."Journal Batch Name", '%1', 'ISSUEOUT');
        ItemJnlPostBatch.RUN(ItemJnLline);
        Message('Posting Completed');
    end;



    LOCAL procedure TestNoSeries(): Boolean
    var

    begin
        InvtSetup.GET;
        CASE "Voucher Type" OF
            "Voucher Type"::Issue:
                InvtSetup.TESTFIELD(InvtSetup."Inventory Voucher Nos.");

            "Voucher Type"::Shortages:
                InvtSetup.TESTFIELD(InvtSetup."Shortage Voucher Nos.");

            "Voucher Type"::Expired:
                InvtSetup.TESTFIELD(InvtSetup."Expired Voucher Nos.");
        end;
    END;


    LOCAL procedure GetNoSeriesCode(): Code[10]
    var

    begin
        InvtSetup.GET;
        CASE "Voucher Type" OF
            "Voucher Type"::Issue:
                EXIT(InvtSetup."Inventory Voucher Nos.");
            "Voucher Type"::Shortages:
                EXIT(InvtSetup."Shortage Voucher Nos.");
            "Voucher Type"::Expired:
                EXIT(InvtSetup."Expired Voucher Nos.");
        end;
    END;


}
