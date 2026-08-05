tableextension 50036 "SalesCr.MemoLine" extends "Sales Cr.Memo Line"

{
    fields
    {
        field(50024; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50035; "No. of Holiday Trips"; Decimal)
        {
        }
        field(50036; "Loading OffLoading"; Decimal)
        {
        }
        field(50037; "Productivity Incentive LT 750"; Decimal)
        {
        }
        field(50038; "Productivity Incentive GT 750"; Decimal)
        {
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
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
                                                          "Dimension Value Type" = CONST(Standard),
                                                          Blocked = CONST(false));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(50100; "Vehicle Reg No."; Code[30])
        {
        }
        field(50101; Financier; Text[50])
        {
        }
        field(50102; "Date In Service"; Date)
        {
        }
        field(50103; "Age of Vehicle"; Decimal)
        {
        }
        field(50104; "No. of Trips"; Decimal)
        {
        }
        field(50105; "Available Days"; Decimal)
        {
        }
        field(50106; "Standard Trip Dist. (KM)"; Decimal)
        {
        }
        field(50107; "Fixed Charges Per Avail."; Decimal)
        {
        }
        field(50108; "Rate Per KM"; Decimal)
        {
        }
        field(50109; "Trip Charges"; Decimal)
        {
        }
        field(50173; "Actual KM Run"; Decimal)
        {
        }
        field(50301; "Cost Amount (Value entry)"; Decimal)
        {
            CalcFormula = Sum("Value Entry"."Cost Amount (Actual)" WHERE("Document No." = FIELD("Document No."),
                                                                          "Item No." = FIELD("No.")));
            Description = 'Value entry';
            FieldClass = FlowField;
        }
        field(50302; "Item Type"; Option)
        {
            // CalcFormula = Lookup("Gen. Product Posting Group"."Item Type" WHERE (Code=FIELD("Gen. Prod. Posting Group")));
            //FieldClass = FlowField;
            OptionCaption = ' ,Spares,Lubricant,Tyres,Battery,Fuel,Others,Labour';
            OptionMembers = " ",Spares,Lubricant,Tyres,Battery,Fuel,Others,Labour;

        }
        field(50303; "General Prouct P Acc"; Code[20])
        {
            CalcFormula = Lookup("General Posting Setup"."Sales Account" WHERE("Gen. Bus. Posting Group" = FIELD("Gen. Bus. Posting Group"), "Gen. Prod. Posting Group" = FIELD("Gen. Prod. Posting Group")));
            FieldClass = FlowField;
        }
    }

}
