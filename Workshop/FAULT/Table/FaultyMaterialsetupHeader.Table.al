table 50021 "Faulty Material setup Header"
{
    DrillDownPageID = "Service Code List";
    LookupPageID = "Service Code List";

    fields
    {
        field(1; "Operation Code"; Code[20])
        {

            trigger OnValidate()
            begin
                /*
                IF "Operation Code" <> xRec."Operation Code" THEN BEGIN
                    SerSetup.GET;
                    NoSeriesMgt.TestManual(SerSetup."Fault Code No.");
                    "No. Series" := '';
                END;
                */
            end;
        }
        field(2; Description; Text[50])
        {
        }
        field(3; Symptoms; Code[20])
        {
            TableRelation = "Symptom Code".Code;
        }
        field(4; "Faulty Area"; Code[20])
        {
            TableRelation = "Fault Area".Code;
        }

        field(5; "Service Item Make"; Code[50])
        {
            TableRelation = "Vehicle Make".Code;
            trigger OnValidate()
            begin
                Clear("Service Item Model");
                UpdateFaultLines(FIELDNO("Service Item Make"));
            end;
        }
        field(6; "Service Item Model"; Code[20])
        {
            TableRelation = "Vehicle Model" where("Vehicle Make" = field("Service Item Make"));
            trigger OnValidate();
            var
                VehModel: Record "Vehicle Model";
            begin
                if VehModel.get("Service Item Model", "Service Item Make") then
                    Description := VehModel.Description;

                UpdateFaultLines(FIELDNO("Service Item Model"));
            end;
        }
        field(7; "Material cost"; Decimal)
        {
        }
        field(8; "Labour Cost"; Decimal)
        {
        }
        field(9; "Materia Price"; Decimal)
        {
        }
        field(10; Labour; Decimal)
        {
        }
        field(11; "Other Services Cost"; Decimal)
        {
        }
        field(12; "Other Services Price"; Decimal)
        {
        }
        field(13; "Duration In Days"; DateFormula)
        {
        }
        field(14; "Duration In Hours"; Decimal)
        {
        }
        field(15; "No. Series"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(16; "Service KM."; Integer)
        {
        }
        field(17; Estimate; Decimal)
        {
            CalcFormula = Sum("Faulty Material setup Line"."Total Price" WHERE("Operation code" = FIELD("Operation Code")));
            FieldClass = FlowField;
        }
        field(18; VAT; Decimal)
        {
            CalcFormula = Sum("Faulty Material setup Line"."VAT Amount" WHERE("Operation code" = FIELD("Operation Code")));
            FieldClass = FlowField;
        }
        field(19; "Estimate Incl. VAT"; Decimal)
        {
            CalcFormula = Sum("Faulty Material setup Line"."Price Incl VAT" WHERE("Operation code" = FIELD("Operation Code")));
            FieldClass = FlowField;
        }
        field(20; "Preventive Maintenace Cycle"; Integer)
        {

        }
    }

    keys
    {
        key(Key1; "Operation Code", "Service Item Model", "Service Item Make")
        {
            Clustered = true;
        }
        key(Key2; Symptoms, "Faulty Area")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        faultmaterial.SETRANGE(faultmaterial."Operation code", "Operation Code");
        IF faultmaterial.FIND('-') THEN
            faultmaterial.DELETEALL;
    end;

    trigger OnInsert()
    begin
        /*
        IF "Operation Code" = '' THEN BEGIN
            SerSetup.GET;
            SerSetup.TESTFIELD(SerSetup."Fault Code No.");
            NoSeriesMgt.InitSeries(SerSetup."Fault Code No.", xRec."No. Series", 0D, "Operation Code", "No. Series");
        END;
        */
    end;

    var
        faultmaterial: Record "Faulty Material setup Line";
        SerSetup: Record "Service Mgt. Setup";
        //   NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeriesMgt: Codeunit "No. Series";
        Faultrec: Record "Faulty Material setup Header";

    [Scope('Cloud')]
    procedure AssistEdit(Oldfault: Record "Faulty Material setup Header"): Boolean
    begin
        // WITH Faultrec DO BEGIN
        Faultrec := Rec;
        SerSetup.GET;
        SerSetup.TESTFIELD("Fault Code No.");
        IF NoSeriesMgt.LookupRelatedNoSeries(SerSetup."Fault Code No.", Oldfault."No. Series", "No. Series") THEN BEGIN
            SerSetup.GET;
            SerSetup.TESTFIELD("Fault Code No.");
            NoSeriesMgt.GetNextNo("Operation Code");
            Rec := Faultrec;
            EXIT(TRUE);

        END;
    end;

    procedure UpdateFaultLines(FieldRef: Integer)
    var
        FaultLines: Record "Faulty Material setup Line";
    begin
        FaultLines.LOCKTABLE;
        FaultLines.SETRANGE("Operation Code", "Operation Code");
        IF FaultLines.FIND('-') THEN BEGIN
            REPEAT
                CASE FieldRef OF
                    FIELDNO("Service Item Model"):
                        FaultLines.VALIDATE("Service Item Model", "Service Item Model");
                    FIELDNO("Service Item Make"):
                        FaultLines.VALIDATE(Make, "Service Item Make");
                END;
                FaultLines.MODIFY(TRUE);
            UNTIL FaultLines.NEXT = 0;
        END;
    end;
}

