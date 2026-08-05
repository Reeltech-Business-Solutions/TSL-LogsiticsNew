table 50022 "Faulty Material setup Line"
{
    DrillDownPageID = "Service Code Line";
    LookupPageID = "Service Code Line";

    fields
    {
        field(1; "Operation code"; Code[20])
        {
            //TableRelation = "Faulty Material setup Header"."Operation Code";
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Type; Option)
        {
            OptionCaption = ' ,Item,Resource,Cost';
            OptionMembers = " ",Item,Resource,Cost;

            trigger OnValidate()
            begin
                IF (Type <> xRec.Type) THEN
                    "No." := '';
            end;
        }
        field(4; "No."; Code[20])
        {
            TableRelation = IF (Type = CONST(" ")) "Standard Text"
            ELSE
            IF (Type = CONST(Item)) Item
            ELSE
            IF (Type = CONST(Resource)) Resource
            ELSE
            IF (Type = CONST(Cost)) "Service Cost";

            trigger OnValidate()
            begin
                CASE Type OF
                    /*0 :
                      BEGIN
                        StdTxt.GET("No.");
                        Description := StdTxt.Description;
                      END;*/
                    Type::Item:
                        BEGIN
                            item.GET("No.");
                            Description := item.Description;
                            "Unit Price" := item."Unit Price";
                            "VAT Amount" := "VAT%" * "Total Price";
                            "Price Incl VAT" := "Total Price" + "VAT Amount";
                            "Unit of Measure Code" := item."Base Unit of Measure";
                            "Posting Group" := item."Inventory Posting Group";
                        END;
                    Type::Resource:
                        BEGIN
                            Res.GET("No.");
                            Description := Res.Name;
                            "Unit Price" := Res."Unit Price";
                            "VAT Amount" := "VAT%" * "Total Price";
                            "Price Incl VAT" := "Total Price" + "VAT Amount";
                            "Unit of Measure Code" := Res."Base Unit of Measure";
                        END;
                    Type::Cost:
                        BEGIN
                            ServCost.GET("No.");
                            Description := ServCost.Description;
                            "Unit Price" := ServCost."Default Unit Price";
                            "VAT Amount" := "VAT%" * "Total Price";
                            "Price Incl VAT" := "Total Price" + "VAT Amount";
                            "Unit of Measure Code" := ServCost."Unit of Measure Code";
                        END;
                END;

            end;
        }
        field(5; Description; Text[50])
        {
        }
        field(6; Variance; Code[20])
        {
            TableRelation = IF (Type = CONST(Item)) "Item Variant".Code WHERE("Item No." = FIELD("No."));
        }
        field(7; Location; Code[20])
        {
            TableRelation = Location;
        }
        field(8; Quantity; Decimal)
        {

            trigger OnValidate()
            begin
                "Total Price" := Quantity * "Unit Price";
                "VAT Amount" := "VAT%" * "Total Price";
                "Price Incl VAT" := "Total Price" + "VAT Amount";
            end;
        }
        field(9; "Unit Price"; Decimal)
        {

            trigger OnValidate()
            begin
                "Total Price" := Quantity * "Unit Price";
                "VAT Amount" := "VAT%" * "Total Price";
                "Price Incl VAT" := "Total Price" + "VAT Amount";
            end;
        }
        field(10; "Total Price"; Decimal)
        {
            Editable = false;
        }
        field(11; "Unit of Measure Code"; Code[20])
        {
            TableRelation = "Item Unit of Measure" WHERE("Item No." = FIELD("No."));
        }
        field(12; "Posting Group"; Code[20])
        {
            TableRelation = "Inventory Posting Group";
        }
        field(13; "Duration in Days"; DateFormula)
        {
        }
        field(14; "Service Item Model"; Code[20])
        {
            TableRelation = "Vehicle Model";
        }
        field(15; "VAT%"; Decimal)
        {
            //InitValue = 0.075;

            trigger OnValidate()
            begin
                "VAT Amount" := "VAT%" * "Total Price";
                "Price Incl VAT" := "Total Price" + "VAT Amount";
            end;
        }
        field(16; "VAT Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                "VAT Amount" := "VAT%" * "Total Price";
                "Price Incl VAT" := "Total Price" + "VAT Amount";
            end;
        }
        field(17; "Price Incl VAT"; Decimal)
        {

            trigger OnValidate()
            begin
                "VAT Amount" := "VAT%" * "Total Price";
                "Price Incl VAT" := "Total Price" + "VAT Amount";
            end;
        }
        field(18; Make; Code[20])
        {
        }
        field(19; "Model Description"; Text[30])
        {
        }
        field(20; "Duration In Hours"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Operation code", Make, "Service Item Model", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; Type, "Operation code", "Service Item Model")
        {
            // SumIndexFields = "Total Price", Quantity, "Price Incl VAT", "VAT Amount";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "VAT%" := 0.05;
    end;


    var
        StdTxt: Record "Standard Text";
        ServCost: Record "Service Cost";
        Res: Record "Resource";
        item: Record Item;
        faultheader: Record "Faulty Material setup Header";
        faultLine: Record "Faulty Material setup Line";

    [Scope('Cloud')]
    procedure Newline()
    begin
        faultLine.SETRANGE(faultLine."Operation code", "Operation code");
        IF faultLine.FIND('+') THEN
            "Line No." := faultLine."Line No." + 10000
        ELSE
            "Line No." := 10000;
    end;
}

