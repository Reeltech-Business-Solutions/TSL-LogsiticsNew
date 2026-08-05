tableextension 50038 SalesInvoiceLine extends "Sales Invoice Line"
{

    fields
    {
         field(50000; "Transaction Date"; Date)
        {
            Caption = 'Transaction Date';
            DataClassification = ToBeClassified;
        }
        field(50001; "Half Month  Amt"; Decimal)
        {
            Caption = 'Half Month  Amt';
            DataClassification = ToBeClassified;
        }
        field(50002; "Full Month Amt"; Decimal)
        {
            Caption = 'Full Month Amt';
            DataClassification = ToBeClassified;
        }
        field(50003; "Truck No."; Code[20])
        {
            Caption = 'Truck No.';
            DataClassification = ToBeClassified;
        }
        field(50004; "Truck Type"; Code[20])
        {
            Caption = 'Truck Type';
            DataClassification = ToBeClassified;
        } 
        
        field(50005; "Varible Amount"; Decimal)
        {
            Caption = 'Varible Amount';
            DataClassification = ToBeClassified;
        }
        field(50006; "Fixed Amount"; Decimal)
        {
            Caption = 'Fixed Amount';
            DataClassification = ToBeClassified;
        }
        field(50007; "Total Days Available"; Decimal)
        {
            Caption = 'Total Days Available';
            DataClassification = ToBeClassified;
        } 
        field(50008; "Quantity Loaded"; Decimal)
        {
            Caption = 'Quantity Loaded';
            DataClassification = ToBeClassified;
        } 
        field(50009; "Quantity Shortage"; Decimal)
        {
            Caption = 'Shortage Quantity';
            DataClassification = ToBeClassified;
        } 
        field(50010; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = ToBeClassified;
        }
        field(50011; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = ToBeClassified;
        }
        field(50012; "Shortage Tolerance"; Decimal)
        {

        }

        field(50013; "Shortage Rate"; Decimal)
        {

        }
        field(50014; "Total Distance Cover"; Decimal)
        {
             Caption = 'Total Distance Cover';
            DataClassification = ToBeClassified;
        }
        field(50015; "Total Shortage Amount"; Decimal)
        {
             Caption = 'Total Shortage Amount';
            DataClassification = ToBeClassified;
        }
        // field(50310; Model; Text[50])
        // {
        // }
        // field(50311; "Engine No."; Text[30])
        // {
        // }
        // field(50312; "Chasis No."; Text[30])
        // {
        // }
        // field(50313; "Operation Code"; Code[30])
        // {
        // }
        // field(50314; Mileage; Decimal)
        // {
        // }
        // field(50021; "Shortcut Dimension 4 Code"; Code[20])
        // {
        //     CaptionClass = '1,2,4';
        //     Caption = 'Shortcut Dimension 2 Code';
        //     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        // }
        // field(50022; "Shortcut Dimension 3 Code"; Code[20])
        // {
        //     CaptionClass = '1,2,3';
        //     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        // }
        // field(50024; "Shortcut Dimension 5 Code"; Code[20])
        // {
        //     CaptionClass = '1,2,5';
        //     Caption = 'OP Leas Veh No.';
        //     Description = 'Project Code = Operation leasing Veh no.';
        //     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

        //     trigger OnValidate()
        //     begin
        //         //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
        //     end;
        // }
        // field(50033; "% Availability (Operational)"; Decimal)
        // {
        //     BlankZero = true;
        // }
        // field(50034; "% Availability (Breakdown)"; Decimal)
        // {
        //     BlankZero = true;
        // }
        // field(50035; "No. of Holiday Trips"; Decimal)
        // {
        // }
        // field(50036; "Loading OffLoading"; Decimal)
        // {
        // }
        // field(50037; "Productivity Incentive LT 750"; Decimal)
        // {
        // }
        // field(50038; "Productivity Incentive GT 750"; Decimal)
        // {
        // }
        // field(50080; "Customer Job Type"; Code[20])
        // {
        // }
        // field(50081; "Job Type Code"; Code[20])
        // {
        // }
        // field(50082; "Cost Amount"; Decimal)
        // {
        // }
        // field(50090; "Shortcut Dimension 6 Code"; Code[20])
        // {
        //     CaptionClass = '1,2,6';
        //     Caption = 'Shortcut Dimension 2 Code';
        //     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
        //                                                   "Dimension Value Type" = CONST(Standard),
        //                                                   Blocked = CONST(false));

        //     trigger OnValidate()
        //     begin
        //         //ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
        //     end;
        // }
        // field(50100; "Vehicle Reg No."; Code[30])
        // {
        // }
        // field(50101; Financier; Text[50])
        // {
        // }
        // field(50102; "Date In Service"; Date)
        // {
        // }
        // field(50103; "Age of Vehicle"; Decimal)
        // {
        // }
        // field(50104; "No. of Trips"; Decimal)
        // {
        // }
        // field(50105; "Available Days"; Decimal)
        // {
        // }
        // field(50106; "Standard Trip Dist. (KM)"; Decimal)
        // {
        // }
        // field(50107; "Fixed Charges Per Avail."; Decimal)
        // {
        // }
        // field(50108; "Rate Per KM"; Decimal)
        // {
        // }
        // field(50109; "Trip Charges"; Decimal)
        // {
        // }
        // field(50173; "Actual KM Run"; Decimal)
        // {
        // }
        // field(50300; "Sales Price (Value entry)"; Decimal)
        // {

        // }
        // field(50301; "Cost Amount (Value entry)"; Decimal)
        // {

        // }
        // field(50302; "Item Type"; Option)
        // {
        //     // CalcFormula = Lookup("Gen. Product Posting Group"."Item Type" WHERE(Code = FIELD("Gen. Prod. Posting Group")));
        //     // FieldClass = FlowField;
        //     OptionCaption = ' ,Spares,Lubricant,Tyres,Battery,Fuel,Others,Labour';
        //     OptionMembers = " ",Spares,Lubricant,Tyres,Battery,Fuel,Others,Labour;
        // }
        // field(50303; "General Prouct P Acc"; Code[20])
        // {
        //     //CalcFormula = Lookup("General Posting Setup"."Sales Account" WHERE("Gen. Bus. Posting Group"=FIELD(Gen. Bus. Posting Group),
        //     // Gen. Prod. Posting Group=FIELD(Gen. Prod. Posting Group)));
        //     // FieldClass = FlowField;
        // }
       
    }
}

