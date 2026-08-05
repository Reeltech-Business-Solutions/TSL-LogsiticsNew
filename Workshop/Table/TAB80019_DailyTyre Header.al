table 80019 "Daily Tyre Header"
{
    Caption = 'Daily Tyre Regrooving';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(3; "Tyre Technician"; Text[50])
        {
            Caption = 'Tyre Technician';
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(4; Workshop; Text[30])
        {
            Caption = 'Workshop';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(5; "Tyre Inspector Confirmation"; Boolean)
        {
            Caption = 'Tyre Inspector Confirmation';
            DataClassification = ToBeClassified;
        }

        field(6; "Daily Tyre Type"; Option)
        {
            OptionMembers = ,Repair,Regroove;
            OptionCaption = ',Repair,Regroove';
            Caption = 'Tyre Technician';
            DataClassification = ToBeClassified;
        }
        field(7; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
        }
    }
    keys
    {
        key(PK; "Daily Tyre Type", "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            GenLedgerSetup.Get;
            if "Daily Tyre Type" = "Daily Tyre Type"::Repair then begin
                TestNoSeries;
                "No. Series" := GenLedgerSetup."Daily Tyre Repair Nos";
                if NoSeriesMgt.AreRelated(GenLedgerSetup."Daily Tyre Repair Nos", xRec."No. Series") then
                    "No. Series" := xRec."No. Series";
                "No." := NoSeriesMgt.GetNextNo("No. Series", Date);
                //   NoSeriesMgt.InitSeries(GenLedgerSetup."Daily Tyre Repair Nos", xRec."No. Series", 0D, "No.", "No. Series");
                //NoSeriesMgt.InitSeries(GenLedgerSetup."Staff Claim No.",xRec."No. Series",0D,"No.","No. Series");
            end;
            if "Daily Tyre Type" = "Daily Tyre Type"::Regroove then begin
                TestNoSeries;
                "No. Series" := GenLedgerSetup."Daily Tyre Groove Nos";
                if NoSeriesMgt.AreRelated(GenLedgerSetup."Daily Tyre Groove Nos", xRec."No. Series") then
                    "No. Series" := xRec."No. Series";
                "No." := NoSeriesMgt.GetNextNo("No. Series", Date);
                //  NoSeriesMgt.InitSeries(GenLedgerSetup."Daily Tyre Groove Nos", xRec."No. Series", 0D, "No.", "No. Series");
                //NoSeriesMgt.InitSeries(GenLedgerSetup."Staff Claim No.",xRec."No. Series",0D,"No.","No. Series");
            end
        end;
    end;


    var
        //  NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeriesMgt: Codeunit "No. Series";
        GenLedSetup: Record "General Ledger Setup";
        GenLedgerSetup: Record "Cash Office Setup";

    local procedure GetNoSeriesCode(): Code[20]
    var
        NoSrsRel: Record "No. Series Relationship";
        NoSeriesCode: Code[20];
    begin
        NoSeriesCode := GenLedgerSetup."Staff Claim No.";
        // exit(GetNoSeriesRelCode(NoSeriesCode));
    end;

    local procedure TestNoSeries(): Boolean
    begin
        if "Daily Tyre Type" = "Daily Tyre Type"::Regroove then
            GenLedgerSetup.TestField(GenLedgerSetup."Daily Tyre Groove Nos");
        if "Daily Tyre Type" = "Daily Tyre Type"::Repair then
            GenLedgerSetup.TestField(GenLedgerSetup."Daily Tyre Repair Nos");
    end;
}