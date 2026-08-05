table 50008 "Contract Line"
{
    Caption = 'Contract Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {

        }
        field(2; "Line No."; Integer)
        {
            //AutoIncrement = true;
        }
        field(3; "Truck Code"; Code[20])
        {
            Caption = 'Truck Code';
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No.";

            trigger OnValidate()
            var
                FixedAsset: record "Fixed Asset";
            begin
                if FixedAsset.Get("Truck Code") then begin
                    "Truck Name" := FixedAsset.Description;
                    "Asset Tin No." := FixedAsset."Asset Type No.";
                    "Asset Registration No." := FixedAsset."Registration No.";
                end;
            end;
        }
        field(4; "Truck Name"; Text[50])
        {
            Caption = 'Truck Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Truck Type"; Code[20])
        {
            Caption = 'Vehicle Make';
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Make";

            trigger OnValidate()
            var
                VehicleMake: Record "Vehicle Make";
                ContractLine: Record "Contract Line";

            begin
                InitNewLine(ContractLine);
                ContractLine.SetRange("Document No.", Rec."Document No.");
                if ContractLine.FindLast() then
                    REPEAT
                        ContractLine.INIT;
                        ContractLine."Line No." += 10000;
                        ContractLine.INSERT(TRUE);
                    UNTIL ContractLine.NEXT = 0;
            end;
        }

        field(6; "Formular Type"; Option)
        {
            OptionMembers = ,"FP/Truck + Vrate/km","Qty PEF","Qty PEF Dis","(NoDays*FR)+(DistanceKm*VR)","(NoBags*DD)+(NoBags*OD)","Higher of FP 'Qty FEP'","Delay Cost+FC+VC","No Trip FFT","No Trip DCL","FP-Shortages Amt","Higher of FP 'Qty FEP Disc'";

            OptionCaption = ' ,FP/Truck + Vrate/km, Qty PEF,Qty PEF Dis,(NoDays*FR)+(DistanceKm*VR), (NoBags*DD)+(NoBags*OD),Higher of FP Qty FEP, Delay Cost+FC+VC, No Trip FFT,No Trip DCL,FP-Shortages Amt,Higher of FP Qty FEP Disc';


            Caption = 'Formular Type';
            DataClassification = ToBeClassified;

        }
        field(8; "Customer Code"; Code[20])
        {

        }
        field(10; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(11; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(12; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(13; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }

        field(14; "Contract Date"; Date)
        {
            Caption = 'Contract Date';
            DataClassification = ToBeClassified;
        }
        field(15; "Contract Type"; Text[20])
        {
            Caption = 'Contract Type';
            DataClassification = ToBeClassified;
        }
        field(16; Status; Option)
        {
            OptionMembers = Open,Released,"Pending Approval";
            DataClassification = ToBeClassified;
        }
        field(17; "Product Type"; Code[20])
        {
            Caption = 'Product Type';
            TableRelation = "Item Category";
            DataClassification = ToBeClassified;
        }
        field(18; "Asset Tin No."; Code[20])
        {
            Caption = 'Asset Tin No.';
            DataClassification = ToBeClassified;
        }
        field(19; "Asset Registration No."; Code[20])
        {
            Caption = 'Asset Registration No.';
            DataClassification = ToBeClassified;
        }
        field(20; "Date Filter"; date)
        {
            FieldClass = FlowFilter;

        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }

        key(PK3; "Truck Type", "Document No.")
        {

        }

    }

    local procedure InitNewLine(VAR NewContractLine: Record "Contract Line")
    var
        ContractLine: Record "Contract Line";
    begin
        NewContractLine.COPY(Rec);
        ContractLine.SETRANGE("Truck Type", NewContractLine."Truck Type");
        ContractLine.SETRANGE("Document No.", NewContractLine."Document No.");
        IF ContractLine.FINDLAST THEN
            NewContractLine."Line No." := ContractLine."Line No."
        ELSE
            NewContractLine."Line No." := 0;
    end;
}