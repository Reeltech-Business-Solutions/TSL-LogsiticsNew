table 80017 "Battery Maintainance"
{
    Caption = 'Battery Maintainance';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Truck No"; Code[20])
        {
            Caption = 'Truck No';
            DataClassification = ToBeClassified;
            TableRelation = "Service Item"."No.";
        }
        field(2; "Driver Code"; Text[50])
        {
            Caption = 'Driver Code';
            //DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                Emp.get("Driver Code");
                Emp.SetRange("No.", "Driver Code");
                "Driver Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
            end;
        }
        field(23; "Driver Name"; Text[100])
        {
            Caption = 'Driver Name';
            DataClassification = ToBeClassified;
        }
        field(3; "Battery Brand"; Text[50])
        {
            Caption = 'Battery Brand';
            DataClassification = ToBeClassified;
        }
        field(4; "T Nos"; Code[20])
        {
            Caption = 'T Nos';
            DataClassification = ToBeClassified;
        }
        field(5; "Last Date of Battery Issue"; Date)
        {
            Caption = 'Last Date of Battery Issue';
            DataClassification = ToBeClassified;
        }
        field(6; Contract; Code[20])
        {
            Caption = 'Contract';
            DataClassification = ToBeClassified;
        }
        field(7; "Truck Type"; Code[20])
        {
            Caption = 'Truck Type';
            DataClassification = ToBeClassified;
        }
        field(8; "Date of last Maintainance"; Date)
        {
            Caption = 'Date of last Maintainance';
            DataClassification = ToBeClassified;
        }
        field(9; "Remarks Description"; Text[100])
        {
            Caption = 'Remarks Description';
            DataClassification = ToBeClassified;
        }
        field(10; "Battery Terminal Condition"; Boolean)
        {
            Caption = 'Battery Terminal Condition';
            DataClassification = ToBeClassified;
        }
        field(11; "Test Color"; Option)
        {
            OptionMembers = ,"Green=ok","White=Fair","Red=Bad";
            OptionCaption = ',GREEN = OK,WHITE =  FAIR  (REPLACE & RECHARGE),RED = BAD (REPLACE & RECHARGE)';
            Caption = 'Acid Water';
            DataClassification = ToBeClassified;
        }
        field(12; "Acid Density Test"; Option)
        {
            OptionMembers = ,"High=Full","Medium=Refill","Low=Exposed Refill";
            OptionCaption = ',HIGH = FULL (OK),MEDIUM = CELL NOT EXPOSED (REFILL),LOW = CELL EXPOSED (REFILL)';
            Caption = 'Acid Density Test';
            DataClassification = ToBeClassified;
        }
        field(13; "Battery Condition"; Option)
        {
            OptionMembers = ,Good,Weak,Bad;
            Caption = 'Battery Condition';
            DataClassification = ToBeClassified;
        }
        field(14; "Battery Status Remark"; Text[100])
        {
            Caption = 'Battery Status Remark';
            DataClassification = ToBeClassified;
        }
        field(15; "General Status"; Option)
        {
            OptionMembers = ,Realease,"Repair/Maintainance","Advice Action";
            Caption = 'General Status';
            DataClassification = ToBeClassified;
        }
        field(16; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                INVSetup: Record "Inventory Setup";
            begin
                if "No." <> xRec."No." then begin
                    INVSetup.Get();
                    NoSeriesMangt.TestManual(INVSetup."Battery Maintenance No.");
                    "No Series" := '';

                end;
            end;
        }
        field(17; "Technician Name"; Text[50])
        {
            Caption = 'Technician Name';
            DataClassification = ToBeClassified;
        }
        field(18; "Awm Name"; Text[50])
        {
            Caption = 'Awm Name';
            DataClassification = ToBeClassified;
        }
        field(19; "Battery  Type 1"; Option)
        {
            OptionMembers = ,"Battery 1","Battery 2","Battery 3","Battery 4";
            Caption = 'Battery';
            DataClassification = ToBeClassified;
        }

        field(20; "Battery  Type 2"; Option)
        {
            OptionMembers = ,"Battery 1","Battery 2","Battery 3","Battery 4";
            Caption = 'Battery';
            DataClassification = ToBeClassified;
        }

        field(21; "Voltage  Test 1"; Option)
        {
            OptionMembers = ,"Test Before","Test After",Neutral;
            OptionCaption = ' ,Test Before,Test After,Neutral';
            Caption = 'Voltage  Test';
            DataClassification = ToBeClassified;
        }
        field(22; "Voltage  Test 2"; Option)
        {
            OptionMembers = ,"Test Before","Test After",Neutral;
            OptionCaption = ' ,Test Before,Test After,Neutral';
            Caption = 'Voltage  Test';
            DataClassification = ToBeClassified;
        }
        field(24; "No Series"; Code[20])
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
    var
    begin
        if "No." = '' then begin
            InvSetup.Get();
            InvSetup.TestField("Battery Maintenance No.");
            "No Series" := InvSetup."Battery Maintenance No.";
            if NoSeriesMangt.AreRelated(InvSetup."Battery Maintenance No.", xRec."No Series") then
                "No Series" := xRec."No Series";
            "No." := NoSeriesMangt.GetNextNo("No Series", "Date of last Maintainance");
            //  NoSeriesMangt.InitSeries(InvSetup."Battery Maintenance No.", xRec."No Series", 0D, "No.", "No Series");
        end;
    end;

    var
        //   NoSeriesMangt: Codeunit NoSeriesManagement;
        NoSeriesMangt: Codeunit "No. Series";
        InvSetup: Record "Inventory Setup";

}
