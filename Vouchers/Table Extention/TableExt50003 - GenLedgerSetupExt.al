tableextension 50003 GenLedgerSetup extends "General Ledger Setup"
{
    fields
    {
        field(50000; "Base No. Series"; Option)
        {
            Caption = 'Base No. Series';
            DataClassification = ToBeClassified;
            OptionMembers = ,"Responsibility Center","Shortcut Dimension 1","Shortcut Dimension 2","Shortcut Dimension 3 Code","Shortcut Dimension 4","Shortcut Dimension 5","Shortcut Dimension 6","Shortcut Dimension 7","Shortcut Dimension 8";
            OptionCaption = 'Default';
        }
        field(50001; "Default SA Code"; Code[20])
        {
            Caption = 'Default SA Code';
            DataClassification = ToBeClassified;
        }
        field(50002; "Posted Contra Voucher Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50003; "Journal Voucher Nos."; Code[20])
        { TableRelation = "No. Series"; }
        field(50004; "Cash Payment Voucher No"; Code[20])
        { TableRelation = "No. Series"; }
        field(50005; "Cash Receipt Voucher No"; Code[20])
        { TableRelation = "No. Series"; }
        field(50006; "Bank Payment Voucher No"; Code[20])
        { TableRelation = "No. Series"; }
        field(50007; "Bank Receipt Voucher No"; Code[20])
        { TableRelation = "No. Series"; }
        field(50008; "Posted Journal Voucher Nos."; Code[20])
        { TableRelation = "No. Series"; }
        field(50009; "Posted Cash Payment Voucher No"; Code[20])
        { TableRelation = "No. Series"; }
        field(50010; "Posted Cash Receipt Voucher No"; Code[20])
        { TableRelation = "No. Series"; }
        field(50011; "Posted Bank Payment Voucher No"; Code[20])
        { TableRelation = "No. Series"; }
        field(50012; "Posted Bank Receipt Voucher No"; Code[20])
        { TableRelation = "No. Series"; }
        field(50013; "Contra Voucher Nos."; Code[20])
        { TableRelation = "No. Series"; }
        field(50014; "Petty Cash Voucher No"; Code[20])
        { TableRelation = "No. Series"; }
        field(50015; "Posted Petty Cash No"; Code[20])
        { TableRelation = "No. Series"; }
        field(50016; "Expense Request Nos."; Code[20])
        { TableRelation = "No. Series"; }
        field(50017; "Default Posting Date"; Option)
        {
            OptionMembers = "Work Date","No Date";
        }
        field(50018; "Act. Emp Lia No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50019; "Staff Claim No."; Code[20])
        {
            Caption = 'Staff Claim No';
            TableRelation = "No. Series";
        }
        field(50020; "Staff Advance No."; Code[20])
        {
            Caption = 'Staff Advance No';
            TableRelation = "No. Series";
        }
        field(50021; "Staff Advance Surrender No."; Code[20])
        {
            Caption = 'Staff Adv. Surrender No';
            TableRelation = "No. Series";
        }
        field(50022; "ECP No."; Code[20])
        {
            Caption = 'ECP No';
            TableRelation = "No. Series";
        }
        field(50023; "Contract Agree No."; Code[20])
        {
            Caption = 'ECP No';
            TableRelation = "No. Series";
        }
        field(50024; "Truck Avail No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50025; StaffAdvanceBudget; Boolean)
        {

        }
        field(50026; StaffClaimBudget; Boolean)
        {

        }
        field(50027; VoucherBudget; Boolean)
        {

        }
        field(50028; PurchaseBudget; Boolean)
        {

        }
        field(50029; "Stores Requisition No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50030; "Trip Advance No."; Code[20])
        {
            Caption = 'Trip Advance No.';
            TableRelation = "No. Series";
        }

        field(50031; "Trip Advance Surrender No."; Code[20])
        {
            Caption = 'Trip Adv. Surrender No.';
            TableRelation = "No. Series";
        }
        field(50032; "Normal Payments No"; Code[20])
        {
            Caption = 'Receipts No.';
            TableRelation = "No. Series";
        }
        field(50033; "Petty Cash Payments No"; Code[20])
        {
            Caption = 'Petty Cash Payments No.';
            TableRelation = "No. Series";
        }
        field(50034; "LC Request Nos"; Code[20])
        {
            Caption = 'LC Request No.';
            TableRelation = "No. Series";
        }
        field(50035; "Payment Request Nos"; Code[20])
        {
            Caption = 'Payment Request No.';
            TableRelation = "No. Series";
        }
        field(50036; "LC Advance Request No."; Code[20])
        {
            Caption = 'LC Advance Request No.';
            TableRelation = "No. Series";
        }
        field(50037; "LC Advance Retirement No."; Code[20])
        {
            Caption = 'LC Advance Retirement No.';
            TableRelation = "No. Series";
        }
        field(50038; "Scrap Sales No."; Code[20])
        {
            TableRelation = "No. Series";
        }

    }
}

pageextension 50003 GenLedgerSetupExt extends "General Ledger Setup"
{
    layout
    {
        addafter(Application)
        {
            Group("Number Series")
            {
                field("Posted Contra Voucher Nos."; Rec."Posted Contra Voucher Nos.")
                {
                    TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Journal Voucher Nos."; Rec."Journal Voucher Nos.")
                {
                    TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Cash Payment Voucher No"; Rec."Cash Payment Voucher No")
                {
                    TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Cash Receipt Voucher No"; Rec."Cash Receipt Voucher No")
                {
                    // TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Bank Payment Voucher No"; Rec."Bank Payment Voucher No")
                {
                    //TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Bank Receipt Voucher No"; Rec."Bank Receipt Voucher No")
                {
                    // TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Trip Advance No."; Rec."Trip Advance No.")
                {
                    ApplicationArea = All;
                }
                field("Trip Advance Surrender No."; Rec."Trip Advance Surrender No.")
                {
                    ApplicationArea = All;
                }
                field("Staff Advance No."; Rec."Staff Advance No.")
                {
                    //TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Staff Advance Surrender No."; Rec."Staff Advance Surrender No.")
                {
                    // TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Staff Claim No."; Rec."Staff Claim No.")
                {
                    // TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Posted Journal Voucher Nos."; Rec."Posted Journal Voucher Nos.")
                {
                    TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Posted Cash Payment Voucher No"; Rec."Posted Cash Payment Voucher No")
                {
                    //TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Posted Cash Receipt Voucher No"; Rec."Posted Cash Receipt Voucher No")
                {
                    //TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Posted Bank Payment Voucher No"; Rec."Posted Bank Payment Voucher No")
                { //TableRelation = "No. Series"; 
                    ApplicationArea = All;
                }
                field("Posted Bank Receipt Voucher No"; Rec."Posted Bank Receipt Voucher No")
                {
                    //TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Contra Voucher Nos."; Rec."Contra Voucher Nos.")
                {
                    //TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Petty Cash Voucher No"; Rec."Petty Cash Voucher No")
                {
                    //TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Posted Petty Cash No"; Rec."Posted Petty Cash No")
                {
                    //TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Expense Request Nos."; Rec."Expense Request Nos.")
                {
                    TableRelation = "No. Series";
                    ApplicationArea = All;
                }
                field("Default Posting Date"; Rec."Default Posting Date")
                {
                    OptionCaption = 'Work Date","No Date';
                    ApplicationArea = All;
                }
                field("Act. Emp Lia No."; Rec."Act. Emp Lia No.")
                {
                    ApplicationArea = All;
                }
                field("ECP No."; Rec."ECP No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Contract Agree No."; Rec."Contract Agree No.")
                {
                    ApplicationArea = All;
                }
                field(StaffAdvanceBudget; Rec.StaffAdvanceBudget)
                {
                    ApplicationArea = All;
                }
                field(StaffClaimBudget; Rec.StaffClaimBudget)
                {
                    ApplicationArea = All;
                }
                field(VoucherBudget; Rec.VoucherBudget)
                {
                    ApplicationArea = All;
                }
                field(PurchaseBudget; Rec.PurchaseBudget)
                {
                    ApplicationArea = All;
                }
                field("Stores Requisition No"; Rec."Stores Requisition No")
                {
                    ApplicationArea = All;
                }
                field("LC Request No"; Rec."LC Request Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LC Request No field.';
                }
                field("LC Advance Request No."; Rec."LC Advance Request No.")
                {
                    Caption = 'LC Utility Advance';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LC Advance Request No. field.';
                }
                field("LC Advance Retirement No."; Rec."LC Advance Retirement No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LC Advance Retirement No. field.';
                }
                field("Scrap Sales No."; Rec."Scrap Sales No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Scrap Sales No. field.';
                }


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