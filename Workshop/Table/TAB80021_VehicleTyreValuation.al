table 80021 "Vehicle Tyre Valuation "
{
    Caption = 'Vehicle Tyre Valuation ';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(2; "Vehicle Type"; Code[20])
        {
            Caption = 'Vehicle Type';
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Make";
        }
        field(3; "Vehicle Number"; Code[20])
        {
            Caption = 'Vehicle Number';
            DataClassification = ToBeClassified;
        }
        field(4; VIR; Code[20])
        {
            Caption = 'VIR';
            DataClassification = ToBeClassified;
        }
        field(5; Odometer; Code[20])
        {
            Caption = 'Odometer';
            DataClassification = ToBeClassified;
        }
        field(6; "Unit Of Measure"; Option)
        {
            OptionMembers = ,Miles,Hours,Kilmeter;
            OptionCaption = ',Miles,Hours,Kilmeter';
            Caption = 'Unit Offf Measure';
            DataClassification = ToBeClassified;
        }
        field(7; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(8; "Inspection By"; Code[20])
        {
            Caption = 'Inspection By (Code)';
            DataClassification = ToBeClassified;
            TableRelation = Employee;
            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                Emp.get("Inspection By");
                Emp.SetRange("No.", "Inspection By");
                "Inspection By(Name)" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
            end;

        }
        field(15; "Inspection By(Name)"; Text[50])
        {
            Caption = 'Inspection By (Name)';
            DataClassification = ToBeClassified;
            //Editable = false;

        }
        field(9; "Fleet Name"; Text[30])
        {
            Caption = 'Fleet Name';
            DataClassification = ToBeClassified;
        }
        field(10; "Steer Size"; Code[20])
        {
            Caption = 'Steer Size';
            DataClassification = ToBeClassified;
        }
        field(11; "Drive Size"; Code[20])
        {
            Caption = 'Drive Size';
            DataClassification = ToBeClassified;
        }
        field(12; "Free Rolling Size"; Code[20])
        {
            Caption = 'Free Rolling Size';
            DataClassification = ToBeClassified;
        }
        field(13; "Spare Size"; Code[20])
        {
            Caption = 'Spare Size';
            DataClassification = ToBeClassified;
        }
        field(14; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
        }
        field(16; Miles; Boolean)
        {
        }
        field(17; Hours; Boolean)
        {

        }
        field(18; Kilometers; Boolean)
        {

        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            GenLedgerSetup.Get;
            TestNoSeries;
            "No. Series" := GenLedgerSetup."Vehicle Tyre Nos";
            if NoSeriesMgt.AreRelated(GenLedgerSetup."Vehicle Tyre Nos", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeriesMgt.GetNextNo("No. Series", Date);
            //  NoSeriesMgt.InitSeries(GenLedgerSetup."Vehicle Tyre Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        //   NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeriesMgt: Codeunit "No. Series";
        GenLedSetup: Record "General Ledger Setup";
        GenLedgerSetup: Record "Cash Office Setup";

    local procedure GetNoSeriesCode(): Code[20]
    var
        NoSrsRel: Record "No. Series Relationship";
        NoSeriesCode: Code[20];
    begin
        NoSeriesCode := GenLedgerSetup."Vehicle Tyre Nos";

        // exit(GetNoSeriesRelCode(NoSeriesCode));
    end;

    local procedure TestNoSeries(): Boolean
    begin
        GenLedgerSetup.TestField(GenLedgerSetup."Vehicle Tyre Nos");
    end;

}
