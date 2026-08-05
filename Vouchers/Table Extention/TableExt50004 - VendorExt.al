/// <summary>
/// TableExtension VendorExt (ID 50008) extends Record Vendor.
/// </summary>
tableextension 50004 VendorExt extends Vendor
{
    fields
    {

        // Add changes to table fields here
        field(50000; "Vendor Category"; Option)
        {
            Caption = 'Vendor Category';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Foreign",Local,Cash,Import,"Local Staff";
            OptionCaption = ' ,Foreign Vendor,Local Vendor,Cash Vendor,Import Vendor,Local Staff';
            trigger OnValidate()
            begin
                "Vendor Type" := "Vendor Category";
            end;

        }
        field(50001; "Vendor Type"; Option)
        {
            Caption = 'Vendor Type';
            DataClassification = ToBeClassified;
            OptionMembers = " ",Import,Local,"Import File",Cash,IOU,"Local Staff","Expat Staff",Foreign;
            OptionCaption = ' ,Import,Local,Import File,Cash,IOU,Local Staff,Expat Staff,Foreign';
        }
        field(50004; "Bank No."; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(50005; "Bank Name"; Text[30])
        {

        }
        field(50006; "Bank Approval Date"; Date)
        {

        }
        field(50007; "G/L Account No."; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Vendor Posting Group"."Payables Account" WHERE(Code = FIELD("Vendor Posting Group")));
        }
        field(50008; "Proforma Order No."; Code[20])
        { }


    }



    trigger OnBeforeInsert()
    var
        PurchSetup: Record "Purchases & Payables Setup";
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeriesMgt: Codeunit "No. Series";

    begin
        Sleep(5000);
        IF ("No." = '') AND ("Vendor Type" = "Vendor Type"::" ") THEN BEGIN
            //  TESTFIELD("Vendor Type");
            //          Sleep(5000);
            //     //  PurchSetup.GET;
            //     // PurchSetup.TESTFIELD("Vendor Nos.");
            //     // NoSeriesMgt.InitSeries(PurchSetup."Local Vendor", xRec."No. Series", 0D, "No.", "No. Series");
        END
        ELSE
            IF ("No." = '') AND ("Vendor Type" = "Vendor Type"::Local) THEN BEGIN
                PurchSetup.GET;
                PurchSetup.TESTFIELD("Local Vendor");
                "No. Series" := PurchSetup."Local Vendor";
                if NoSeriesMgt.AreRelated(PurchSetup."Local Vendor", xRec."No. Series") then
                    "No. Series" := xRec."No. Series";
                "No." := NoSeriesMgt.GetNextNo("No. Series", 0D);
                // NoSeriesMgt.InitSeries(PurchSetup."Local Vendor", xRec."No. Series", 0D, "No.", "No. Series");
            END
            ELSE
                IF ("No." = '') AND ("Vendor Type" = "Vendor Type"::Foreign) THEN BEGIN
                    PurchSetup.GET;
                    PurchSetup.TESTFIELD("Foreign Vendor");
                    "No. Series" := PurchSetup."Foreign Vendor";
                    if NoSeriesMgt.AreRelated(PurchSetup."Foreign Vendor", xRec."No. Series") then
                        "No. Series" := xRec."No. Series";
                    "No." := NoSeriesMgt.GetNextNo("No. Series", 0D);
                    // NoSeriesMgt.InitSeries(PurchSetup."Foreign Vendor", xRec."No. Series", 0D, "No.", "No. Series");
                END
                ELSE
                    IF ("No." = '') AND ("Vendor Type" = "Vendor Type"::Cash) THEN BEGIN
                        PurchSetup.GET;
                        PurchSetup.TESTFIELD("Cash Vendor");
                        "No. Series" := PurchSetup."Cash Vendor";
                        if NoSeriesMgt.AreRelated(PurchSetup."Cash Vendor", xRec."No. Series") then
                            "No. Series" := xRec."No. Series";
                        "No." := NoSeriesMgt.GetNextNo("No. Series", 0D);
                        //  NoSeriesMgt.InitSeries(PurchSetup."Cash Vendor", xRec."No. Series", 0D, "No.", "No. Series");
                    END
                    ELSE
                        IF ("No." = '') AND ("Vendor Type" = "Vendor Type"::Import) THEN BEGIN
                            PurchSetup.GET;
                            PurchSetup.TESTFIELD("Import Vendor");
                            "No. Series" := PurchSetup."Import Vendor";
                            if NoSeriesMgt.AreRelated(PurchSetup."Import Vendor", xRec."No. Series") then
                                "No. Series" := xRec."No. Series";
                            "No." := NoSeriesMgt.GetNextNo("No. Series", 0D);
                            //  NoSeriesMgt.InitSeries(PurchSetup."Import Vendor", xRec."No. Series", 0D, "No.", "No. Series");
                        END;
    end;



}

