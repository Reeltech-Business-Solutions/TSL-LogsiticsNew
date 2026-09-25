tableextension 50005 UsersetupExt extends "User Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50001; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            DataClassification = ToBeClassified;
        }
        field(50002; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            DataClassification = ToBeClassified;
        }
        field(50003; "Shortcut Dimension 3 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
            DataClassification = ToBeClassified;
        }
        field(50004; "Shortcut Dimension 4 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
            DataClassification = ToBeClassified;
        }
        field(50005; "Staff Travel Account"; Code[20])
        {
            Caption = 'Staff Travel Account';
            DataClassification = ToBeClassified;
            TableRelation = Employee Where(Status = filter(Active));
        }
        field(50006; "Cash Advance Staff Account"; Code[20])
        {
            Caption = 'Staff Advance Staff Account';
            DataClassification = ToBeClassified;
            TableRelation = Employee Where(Status = filter(Active));
        }
        field(50007; "Maximum Amount"; Decimal)
        {
            Caption = 'Maximum Amount';
            DataClassification = ToBeClassified;
        }
        field(50008; "Is In HR"; Boolean)
        {
            Caption = 'Is In HR';
            DataClassification = ToBeClassified;
        }
        field(50009; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
            DataClassification = ToBeClassified;
            TableRelation = Employee Where(Status = filter(Active));
        }
        field(50010; "Released Status"; Boolean)
        {
            Caption = 'Released Status';
            DataClassification = ToBeClassified;
        }
        field(50011; "ReOpen Job Card"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "Confirm warranty"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "ReOpen Service Quote"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Close Job"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "Edit AMT"; Boolean)
        {

        }
    }

    var
        myInt: Integer;
}
pageextension 50012 UserSetupExt extends "User Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Sales Resp. Ctr. Filter")
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                Caption = 'Global Dimension 1 Code';
                ApplicationArea = All;
            }

            field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
            {
                Caption = 'Shortcut Dimension 2 Code';
                ApplicationArea = All;
            }

            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                Caption = 'Shortcut Dimension 3 Code';
                ApplicationArea = All;
            }

            field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
            {
                Caption = 'Shortcut Dimension 4 Code';
                ApplicationArea = All;
            }

            field("Staff Travel Account"; Rec."Staff Travel Account")
            {
                Caption = 'Staff Travel Account';
                ApplicationArea = All;
            }

            field("Cash Advance Staff Account"; Rec."Cash Advance Staff Account")
            {
                Caption = 'Staff Advance Account';
                ApplicationArea = All;
            }

            field("Employee No"; Rec."Employee No")
            {
                Caption = 'Employee No';
                ApplicationArea = All;
            }

            field("Maximum Amount"; Rec."Maximum Amount")
            {
                Caption = 'Maximum Amount';
                ApplicationArea = All;
            }

            field("Is In HR"; Rec."Is In HR")
            {
                Caption = 'Is In HR';
                ApplicationArea = All;
            }
            field("ReOpen Job Card"; Rec."ReOpen Job Card")
            {
                ApplicationArea = All;
            }
            field("Close Job"; Rec."Close Job")
            {
                ApplicationArea = All;
            }
            field("Confirm warranty"; Rec."Confirm warranty")
            {
                ApplicationArea = All;
            }
            field("ReOpen Service Quote"; Rec."ReOpen Service Quote")
            {
                ApplicationArea = All;
            }
            field("Edit AMT"; Rec."Edit AMT")
            {
                ApplicationArea = All;
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}