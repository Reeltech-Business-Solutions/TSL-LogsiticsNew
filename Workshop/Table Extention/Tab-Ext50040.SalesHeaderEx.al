tableextension 50040 SalesHeaderEx extends "Sales Header"
{
    fields
    {
        field(50001; "Contract Id"; Code[20])
        {
            TableRelation = "Contract Agreement"."No.";
        }
        field(50002; "Start Date"; Date)
        {
        }
        field(50003; "End Date"; Date)
        {
        }
        field(50004; "Monthly Status"; Option)
        {
            Caption = 'Monthly Status';
            OptionMembers = " ","Half Month","Full Month";
            OptionCaption = ' ,Half Month,Full Month';
            DataClassification = ToBeClassified;
        }
        field(50005; "Planned Receipt Date"; Date)
        {
            Caption = 'Planned Receipt Date at Port';

        }
        field(50006; "Planned Clearing Date"; Date)
        {
            Caption = 'Planned Clearing Date at Port';

        }
        field(50007; "Assembly Duration"; DateFormula)
        {
            Caption = 'Assembly Duration';

        }

        field(50043; "Job No."; Code[20])
        {

            trigger OnValidate()
            var
                JobRec: Record Job;
            begin
                if JobRec.Get(Rec."Job No.") then begin
                    "Asset No." := JobRec."FLeet No.";
                    "Service Vehicle" := JobRec."Service Vehicle";
                    Trailer := JobRec.Trailer;
                    "Trailer No." := JobRec."Trailer No.";
                    "Shortcut Dimension 8 Code" := JobRec."Shortcut Dimension 8 Code";
                end;
            end;
        }
        field(50044; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }

        field(50077; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }

        field(50079; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50080; "Customer Job Type"; Code[20])
        {
        }
        field(50081; "Job Type Code"; Code[20])
        {
        }
        field(50090; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
                                                          "Dimension Value Type" = CONST(Standard),
                                                          Blocked = CONST(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50301; "Cost Amount (Value entry)"; Decimal)
        {
            CalcFormula = Sum("Value Entry"."Cost Amount (Actual)" WHERE("Document No." = FIELD("No.")));
            Description = 'Value entry';
            FieldClass = FlowField;
        }
        field(50302; "Planned Shipment Date"; Date)
        {
            Caption = 'Planned Shipment Date';
        }
        field(50303; "Planned Assembly EndDate"; Date)
        {
            Caption = 'Planned Assembly End Date';
        }
        field(50304; "PDI Date"; Date)
        {
            Caption = 'PDI Date';
        }
        field(50305; "Release Note Attached"; Boolean)
        {
            Caption = 'Released Note Attached?';
        }
        field(50306; "PDI Form Attached"; Boolean)
        {
            Caption = 'PDI Form Attached?';
        }

        field(50308; "OEM Code"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(50309; "LPO"; Code[20])
        {

        }
        field(50312; "Service Vehicle"; Code[20])
        {
            Editable = false;
        }
        field(50313; "Trailer"; Text[50])
        {
            Editable = false;
        }
        field(50314; "Asset No."; Code[20])
        {
            Editable = false;
        }
        field(50315; "Trailer No."; Code[20])
        {
            Caption = 'Trailer Asset No.';
            Editable = false;
        }
        // field(50316; "Shortcut Dimension 3 Code"; Code[20])
        // {
        //     CaptionClass = '1,2,3';
        //     Caption = 'Shortcut Dimension 3 Code';
        //     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

        //     trigger OnValidate()
        //     begin
        //         ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
        //     end;

        // }
        field(50317; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code")
            end;
        }
        field(50316; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Caption = 'Shortcut Dimension 8 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
            end;
        }
    }
    procedure ShowDimensions()
    var
        DimMgt: Codeunit DimensionManagement;

    begin

    end;

    procedure ValidateShortcutDimCodes(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;

    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimMgt.LookupDimValueCode(FieldNumber, ShortcutDimCode);
        ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
    end;

    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
    end;

}



