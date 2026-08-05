tableextension 50015 EmployeeExt extends Employee
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionMembers = "Staff Advance","Staff Debtors",Drivers;
            OptionCaption = 'Staff Advance,Staff Debtors,Drivers';
            DataClassification = ToBeClassified;
        }

        field(50001; "Advance Limit"; Integer)
        {
            Caption = 'Advance Limit';
            DataClassification = ToBeClassified;
        }

        field(50002; "Claim Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(50003; "Sub GL Code"; Code[20])
        {
            Caption = 'Sub GL Code';
            DataClassification = ToBeClassified;
        }

        field(50004; "Main GL"; code[20])
        {
            Caption = 'Main GL';
            DataClassification = ToBeClassified;
        }

        field(50005; "RC Number"; Code[20])
        {
            Caption = 'RC Number';
            DataClassification = ToBeClassified;
        }

        field(50006; "Incorporation Date"; Date)
        {
            Caption = 'Incorporation Date';
            DataClassification = ToBeClassified;
        }
        field(50007; Driver; Boolean)
        {

        }
        field(50008; "Responsibility Center"; Code[20])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        field(50009; "Employee No."; Code[20])
        {
            
        }
        field(50010; "Marital Status"; Code[20])
        {

        }
        field(50011; "Employment Type"; Code[20])
        {

        }
        field(50012; "Employment Status"; Code[20])
        {

        }
        field(50013; "Date of Joining"; Date)
        {

        }


    }

    var
        myInt: Integer;
}

pageextension 50144 EmployeeExt extends "Employee Card" //MyTargetPageId
{
    layout
    {
        addafter("Last Name")
        {
            field("Account Type"; Rec."Account Type")
            {
                ApplicationArea = All;
            }
            field(Driver; Rec.Driver)
            {
                ApplicationArea = All;
            }
            field("Employee No.";Rec."Employee No.")
            {

            }
            field("Marital Status";Rec."Marital Status")
            {

            }
            field("Employment Type";Rec."Employment Type")
            {

            }
            field("Employment Status";Rec."Employment Status")
            {

            }
            field("Date of Joining";Rec."Date of Joining")
            {

            }

        }
        addafter("Last Date Modified")
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
            }
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = All;
            }

        }
    }

    actions
    {
        addfirst(processing)
        {


            action("Salary Journal")
            {
                ApplicationArea = All;
                Caption = 'Salary Journal';
                Image = Payroll;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = page 50110;
            }
        }

    }
}