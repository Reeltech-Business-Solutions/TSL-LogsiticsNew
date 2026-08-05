table 50026 "Truck Availability Entry"
{

    fields
    {
        field(1; "No."; Code[20])
        {

            trigger OnValidate()
            var
                //   NoSeriesMgt: Codeunit NoSeriesManagement;
                NoSeriesMgt: Codeunit "No. Series";
            begin
                IF "No." = '' THEN BEGIN
                    GLSetup.GET;
                    GLSetup.TESTFIELD(GLSetup."Truck Avail No.");
                    //   NoSeriesMgt.InitSeries(GLSetup."Truck Avail No.", xRec."No. Series", 0D, "No.", "No. Series");
                END;

            end;
        }
        field(2; "Customer No."; Code[20])
        {
            TableRelation = Customer;
        }
        field(3; "Customer Operation"; Code[30])
        {
            //TableRelation = "FS Setup Table";
        }
        field(4; "Contract No."; Code[20])
        {
            TableRelation = "Contract Agreement"."No."; //"FS Setup Table"."LOT NOs." WHERE("CUSTOMER OPERATION"=FIELD("Customer Operation"));
        }
        field(5; Date; Date)
        {

            trigger OnValidate()
            begin


                UpdateLines(FIELDNO(Date));
            end;
        }
        field(6; Quantity; Integer)
        {
        }
        field(7; "No. Series"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(8; "User ID"; Code[50])
        {
        }
        field(9; "User Date"; Date)
        {
        }
        field(10; "Created By"; Text[50])
        {

        }
        field(11; "Created Date"; Date)
        {

        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        //  NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeriesMgt: Codeunit "No. Series";
    begin
        IF "No." = '' THEN BEGIN
            GLSetup.GET;
            GLSetup.TESTFIELD(GLSetup."Truck Avail No.");
            "No. Series" := GLSetup."Truck Avail No.";
            if NoSeriesMgt.AreRelated(GLSetup."Truck Avail No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeriesMgt.GetNextNo("No. Series", Date)
            //  NoSeriesMgt.InitSeries(GLSetup."Truck Avail No.", xRec."No. Series", 0D, "No.", "No. Series");
        END;
        "Created By" := "User ID";
        "Created Date" := Today;

    end;

    var
        GLSetup: Record "Service Mgt. Setup";


    [Scope('Cloud')]
    procedure AssistEdit(var OldTruckAvailRec: Record "Truck Availability Entry"): Boolean
    var
        TruckAvailRec: Record "Truck Availability Entry";
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeriesMgt: Codeunit "No. Series";
    begin
        //WITH TruckAvailRec DO BEGIN
        TruckAvailRec := Rec;
        GLSetup.GET;
        GLSetup.TESTFIELD("Truck Avail No.");
        IF NoSeriesMgt.LookupRelatedNoSeries(GLSetup."Truck Avail No.", OldTruckAvailRec."No. Series", "No. Series") THEN BEGIN
            NoSeriesMgt.GetNextNo("No.");
            Rec := TruckAvailRec;
            EXIT(TRUE);
        END;
    END;


    [Scope('Cloud')]
    procedure UpdateLines(FieldRef: Integer)
    var
        TruckNonAvailLines: Record "Truck Avail. Entry Lines";
    begin
        TruckNonAvailLines.LOCKTABLE;
        TruckNonAvailLines.SETRANGE("Document No.", "No.");
        IF TruckNonAvailLines.FIND('-') THEN BEGIN
            REPEAT
                CASE FieldRef OF
                    FIELDNO(Date):
                        TruckNonAvailLines.VALIDATE(Date, Date);
                END;
                TruckNonAvailLines.MODIFY(TRUE);
            UNTIL TruckNonAvailLines.NEXT = 0;
        END;
    end;
}

