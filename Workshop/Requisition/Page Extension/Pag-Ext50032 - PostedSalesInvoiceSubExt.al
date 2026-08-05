pageextension 50032 "Posted Sales InvoiceSub Ext" extends "Posted Sales Invoice Subform"
{
    layout
    {
        // Add changes to page layout here
        addbefore("No.")
        {
            field("Job No.1"; Rec."Job No.")
            {
                ApplicationArea = All;
            }
            field("Truck No."; Rec."Truck No.")
            {
                //visible = Showdetails;
                Caption = 'Truck No.';
                Visible = false;
                ApplicationArea = All;
            }

            field("Transaction Date"; Rec."Transaction Date")
            {
                //visible = Showdetails;
                Caption = 'Transaction Date';
                Visible = false;
                ApplicationArea = All;
            }

            field("Varible Amount"; Rec."Varible Amount")
            {
                //visible = Showdetails;
                Caption = 'Varible Amount';
                Visible = false;
                ApplicationArea = All;

            }

            field("Fixed Amount"; Rec."Fixed Amount")
            {
                ApplicationArea = All;
                Visible = false;

            }
            field("Total Days Available"; Rec."Total Days Available")
            {
                ApplicationArea = All;
                Visible = false;

            }
            field("Truck Type"; Rec."Truck Type")
            {
                ApplicationArea = All;
                Visible = false;

            }
            field("Half Month  Amt"; Rec."Half Month  Amt")
            {
                ApplicationArea = All;
                Visible = false;

            }
            field("Full Month Amt"; Rec."Full Month Amt")
            {
                ApplicationArea = All;
                Visible = false;

            }

            // field("Job No."; Rec."Job No.")
            // {
            //     ApplicationArea = All;

            // }
            field("Quantity Loaded"; Rec."Quantity Loaded")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Start Date"; rec."Start Date")
            {
                ApplicationArea = All;
                Visible = false;

            }
            field("End Date"; rec."End Date")
            {
                ApplicationArea = All;
                Visible = false;

            }
            field("Shortage Tolerance"; Rec."Shortage Tolerance")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Shortage Rate"; Rec."Shortage Rate")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Total Distance Cover"; Rec."Total Distance Cover")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Total Shortage Amount"; Rec."Total Shortage Amount")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Quantity Shortage"; Rec."Quantity Shortage")
            {
                ApplicationArea = All;
                Visible = false;
            }

        }

        addafter("Location Code")
        {
            field("Gen. Prod. Posting Group31460"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
            }
        }
    }

}
