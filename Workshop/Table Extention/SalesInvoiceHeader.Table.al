tableextension 50037 SalesInvoiceHeader extends "Sales Invoice Header"
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
        // field(50000; "SDN No. Printed"; Integer)
        // {
        // }
        // field(50001; Packaging; Text[30])
        // {
        // }
        // field(50002; Trays; Text[30])
        // {
        // }
        // field(50003; "Wooden Pallet"; Text[30])
        // {
        // }
        // field(50004; "Driver's Name"; Text[30])
        // {
        // }
        // field(50005; "Vehicle No."; Text[30])
        // {
        // }
        // field(50006; "Trans-Rental Of Trucks"; Decimal)
        // {
        //     Description = 'Formerly Crates   Text     Operational Leasing 448002';
        // }
        // field(50007; "Trans-Fixed Charges"; Decimal)
        // {
        //     Description = 'Reversed    Boolean   Operational Leasing 448004';
        // }
        // field(50008; "Trans-INS & LSCN"; Decimal)
        // {
        //     Description = 'Reversed Order Number    Code     Operational Leasing 448006';
        // }
        // field(50009; "Estimate Reference"; Code[20])
        // {
        //     TableRelation = "Responsibility Center";
        // }
        // field(50010; "Expense Job"; Boolean)
        // {
        // }
        // field(50011; Goodwill; Boolean)
        // {
        // }
        // field(50012; "Posting Type"; Option)
        // {
        //     OptionMembers = Normal,Warranty,Goodwill,Own,Return;
        // }
        // field(50013; Milage; Decimal)
        // {
        //     DecimalPlaces = 0 : 0;
        // }
        // field(50014; "Received By"; Text[30])
        // {
        // }
        // field(50015; "Date Received"; Date)
        // {
        // }
        // field(50016; "Last Service Date"; Date)
        // {
        // }
        // field(50017; Deadline; Date)
        // {
        // }
        // field(50037; "Sales Type"; Option)
        // {
        //     OptionCaption = ' ,Cash,Credit';
        //     OptionMembers = " ",Cash,Credit;
        // }
        // field(50038; "Sales Order Type"; Option)
        // {
        //     OptionCaption = ' ,JCB,VW,Others';
        //     OptionMembers = " ",JCB,VW,Others;
        // }
        field(50043; "Job No."; Code[20])
        {
        }
        field(50044; "Shortcut Dimension 3 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(50077; "Shortcut Dimension 4 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50079; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50080; "Customer Job Type"; Code[20])
        {
            Editable = false;
        }
        field(50081; "Job Type Code"; Code[20])
        {
            Editable = false;
        }
        field(50082; "Vehicle From Job"; Code[20])
        {
            CalcFormula = Lookup(Job."Vehicle Registr. Plate No" WHERE("No." = FIELD("Pre-Assigned No.")));
            FieldClass = FlowField;
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
        field(50101; "FLeet Invoice"; Boolean)
        {
        }
        field(50301; "Cost Amount (Value entry)"; Decimal)
        {
            CalcFormula = Sum("Value Entry"."Cost Amount (Actual)" WHERE("Document No." = FIELD("No.")));
            Description = 'Value entry';
            FieldClass = FlowField;
        }
        field(50302; "Cost Amount (Job entry)"; Decimal)
        {
            CalcFormula = Sum("Job Ledger Entry"."Total Cost (LCY)" WHERE("Document No." = FIELD("No."),
                                                                           "Entry Type" = FILTER(Sale),
                                                                           "Customer Job Type" = FILTER('INTERNAL')));
            Description = 'Job Ledger';
            FieldClass = FlowField;
        }
        field(50304; "Amount EXcluding VAT"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Invoice Line".Amount WHERE("Document No." = FIELD("No.")));
            Caption = 'Amount EXcluding VAT';
            Editable = false;
            FieldClass = FlowField;
        }

        field(79011; "Invoice Type"; Option)
        {
            OptionMembers = " ",Cash,Normal;
        }

        field(50308; "OEM Code"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(50309; "LPO"; Text[50])
        {

        }
        field(50310; "Created By"; Text[50])
        {

        }
        field(50311; "Created Date"; Date)
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
        field(50316; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Caption = 'Shortcut Dimension 8 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8),
                                                          "Dimension Value Type" = CONST(Standard),
                                                          Blocked = CONST(false));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(8,"Shortcut Dimension 8 Code");
            end;
        }
    }
}