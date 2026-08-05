pageextension 50028 "Sales  LineExt" extends "Sales Invoice Subform"
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field("1VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
            {
                ApplicationArea = all;
            }
        }
        addafter(Quantity)
        {
            field("Job No.1"; Rec."Job No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Tax Area Code")
        {
            field("Transaction Date"; Rec."Transaction Date")
            {
                ApplicationArea = All;
            }
            field("Truck No."; Rec."Truck No.")
            {
                ApplicationArea = All;
            }
            field("Truck Type"; Rec."Truck Type")
            {
                ApplicationArea = All;
            }
            field("Full Month Amt"; Rec."Full Month Amt")
            {
                ApplicationArea = All;
            }
            field("Half Month  Amt"; Rec."Half Month  Amt")
            {
                Caption = 'Unit Cost';
                ApplicationArea = All;
            }
            field("Varible Amount"; Rec."Varible Amount")
            {
                ApplicationArea = All;

            }
            field("Fixed Amount"; Rec."Fixed Amount")
            {
                ApplicationArea = All;
            }
            field("Total Days Available"; Rec."Total Days Available")
            {
                ApplicationArea = All;
            }
            field("Quantity Loaded"; Rec."Quantity Loaded")
            {
                ApplicationArea = All;
            }
            field("Shortage Tolerance"; Rec."Shortage Tolerance")
            {
                ApplicationArea = All;
            }
            field("Shortage Rate"; Rec."Shortage Rate")
            {
                ApplicationArea = All;
            }
            field("Total Distance Cover"; Rec."Total Distance Cover")
            {
                ApplicationArea = All;
            }
            field("Total Shortage Amount"; Rec."Total Shortage Amount")
            {
                ApplicationArea = All;
            }
            field("Quantity Shortage"; Rec."Quantity Shortage")
            {
                ApplicationArea = All;
            }

        }
    }
}
