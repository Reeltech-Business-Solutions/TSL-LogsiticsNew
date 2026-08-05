table 50007 "Contract Agreement"
{
    Caption = 'Contract Agreement';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Contract Agreement List";
    LookupPageId = "Contract Agreement List";


    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Contract No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Customer Code"; Code[20])
        {
            Caption = 'Customer Code';
            DataClassification = ToBeClassified;
            TableRelation = customer;
            trigger OnValidate()
            var
                Cust: Record Customer;

            begin
                if Cust.get("Customer Code") then begin
                    "Customer Name" := cust.Name;
                    "Customer Address" := Cust.Address;
                    Phone := Cust."Phone No.";
                end;

            end;
        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
        }
        field(4; "Customer Address"; Text[150])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(7; Phone; Code[20])
        {
            Caption = 'Phone';
            DataClassification = ToBeClassified;
        }
        field(8; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(9; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(10; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(11; "Revenue Calc. Code"; Code[30])
        {
            Caption = 'Revenue Calc. Code';
            DataClassification = ToBeClassified;
        }

        field(5; "Contract Date"; Date)
        {
            Caption = 'Contract Date';
            DataClassification = ToBeClassified;
        }
        field(14; "Vehicle Count"; Integer)
        {
            Caption = 'Vehicle Count';
            DataClassification = ToBeClassified;
        }
        field(15; "Contract Type"; Text[20])
        {
            Caption = 'Contract Type';
            DataClassification = ToBeClassified;
        }
        field(16; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(17; Status; option)
        {
            OptionMembers = Open,Released,"Pending Approval";
        }

        field(18; "Formular Type"; Code[20])
        {
            /*   OptionMembers = ,"FP/Truck + Vrate/km","Qty PEF","Qty PEF Dis","(NoDays*FR)+(DistanceKm*VR)","(NoBags*DD)+(NoBags*OD)","Higher of FP 'Qty FEP'","Delay Cost+FC+VC","No Trip FFT","No Trip DCL","FP-Shortages Amt","Higher of FP 'Qty FEP Disc'";

              OptionCaption = ' ,FP/Truck + Vrate/km, Qty PEF,Qty PEF Dis,(NoDays*FR)+(DistanceKm*VR), (NoBags*DD)+(NoBags*OD),Higher of FP Qty FEP, Delay Cost+FC+VC, No Trip FFT,No Trip DCL,FP-Shortages Amt,Higher of FP Qty FEP Disc'; 


              Caption = 'Formular Type';
              DataClassification = ToBeClassified;*/


            TableRelation = "Contract Agreement Type"."Agreement Type";
            DataClassification = ToBeClassified;

        }
        field(19; "Target Availability"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Unit Of Measure"; Code[10])
        {
            TableRelation = "Unit of Measure";
            DataClassification = ToBeClassified;
        }
        field(21; "Use Non-Avail. Entry"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Contract Group"; Code[20])
        {
            TableRelation = "Haulage Contract Group";
        }
        field(23; "Date Filter"; date)
        {
            FieldClass = FlowFilter;

        }
        field(24; "Created By"; Text[50])
        {

        }
        field(25; "Created Date"; Date)
        {

        }
        field(6; "Kilometer Per Trip"; Decimal)
        {

        }
        field(12; "Freqency Per trip"; Decimal)
        {

        }
        field(26; "Contract Name"; Text[50])
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




    fieldgroups
    {
        fieldgroup(DropDown; "No.", "Contract Type", "Customer Name", "Formular Type")
        { }

    }

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created Date" := Today;
    end;

    procedure AssistEdit(OldContAgree: Record "Contract Agreement"): Boolean
    begin
        // With ContAgree do begin
        ContAgree := Rec;
        GLSetup.Get();
        GLSetup.TestField("Contract Agree No.");
        if Noseries.LookupRelatedNoSeries(GLSetup."Contract Agree No.", OldContAgree."No. Series", "No. Series") then begin
            Noseries.GetNextNo("No.");
            Rec := ContAgree;
            exit(true);
        end;
    end;


    local procedure UpdateContractLines(FieldRef: Integer)
    var
        ContractLine: Record "Contract Line";
    begin
        ContractLine.LOCKTABLE;
        ContractLine.SETRANGE("Document No.", "No.");
        IF ContractLine.FIND('-') THEN BEGIN
            REPEAT
                CASE FieldRef OF
                    FIELDNO("Contract Date"):
                        ContractLine.VALIDATE("Contract Date", "Contract Date");
                    FIELDNO(Status):
                        ContractLine.VALIDATE(Status, Status);
                    FIELDNO("Customer Code"):
                        ContractLine.VALIDATE("Customer Code", "Customer Code");
                    FIELDNO("Contract Type"):
                        ContractLine.VALIDATE("Contract Type", "Contract Type");
                    FIELDNO("Shortcut Dimension 1 Code"):
                        ContractLine.VALIDATE("Shortcut Dimension 1 Code", "Shortcut Dimension 1 Code");
                    FIELDNO("Shortcut Dimension 2 Code"):
                        ContractLine.VALIDATE("Shortcut Dimension 2 Code", "Shortcut Dimension 2 Code");
                    FIELDNO("Shortcut Dimension 3 Code"):
                        ContractLine.VALIDATE("Shortcut Dimension 3 Code", "Shortcut Dimension 3 Code");

                END;
                ContractLine.MODIFY(TRUE);
            UNTIL ContractLine.NEXT = 0;
        END;
    end;


    var
        GLSetup: Record "General Ledger Setup";
        // NoSeriesMgt: codeunit NoSeriesManagement;
        ContAgree: Record "Contract Agreement";

        Noseries: Codeunit "No. Series";


}
