
pageextension 50008 PayableExt extends "Purchases & Payables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field("Local Vendor"; Rec."Local Vendor")
            {
                Caption = 'Local Vendor';
                ApplicationArea = All;
            }

            field("Import Vendor"; Rec."Import Vendor")
            {
                Caption = 'Import Vendor';
                ApplicationArea = All;
            }

            field("Foreign Vendor"; Rec."Foreign Vendor")
            {
                Caption = 'Foreign Vendor';
                ApplicationArea = All;
            }

            field("Cash Vendor"; Rec."Cash Vendor")
            {
                Caption = 'Cash Vendor';
                ApplicationArea = All;
            }
            field("Quotation Request No"; Rec."Quotation Request No")
            {
                ToolTip = 'Specifies the value of the Quotation Request No field.';
                ApplicationArea = All;
            }

            //added to capture re to Quote No
            /* field("Purcahse Req"; "Purcahse Req")
             {
                 Caption = 'Purcahse Req';
                 ApplicationArea = All;
             }
             */

            field("Vendor Requisition No"; Rec."Vendor Requisition No")
            {
                Caption = 'Vendor Requisition No';
                ApplicationArea = All;
            }
            field("Local Purcahse Req"; Rec."Local Purcahse Req")
            {
                Caption = 'Local Purchase Requisition';
                ApplicationArea = All;
            }
            field("Foreign Purchase Req"; Rec."Foreign Purchase Req")
            {
                Caption = 'Foreign Purchase Requisition';
                ApplicationArea = All;
            }
            field("Import Purchase Invoice"; Rec."Import Purchase Invoice")
            {
                Caption = 'Import Purchase Invoice';
                ApplicationArea = All;
            }
            field("Cash Purchase Order"; Rec."Cash Purchase Order")
            {
                Caption = 'Cash Purchase Order';
                ApplicationArea = All;
            }
            field("Cash Purchase Quote"; Rec."Cash Purchase Quote")
            {
                Caption = 'Cash Purchase Quote';
                ApplicationArea = All;
            }
            field("Import Purchase Order"; Rec."Import Purchase Order")
            {
                Caption = 'Import Purchase Order';
                ApplicationArea = All;
            }
            field("Foreign Purchase Order"; Rec."Foreign Purchase Order")
            {
                Caption = 'Foreign Purchase Order';
                ApplicationArea = All;
            }
            field("Local Purchase Order"; Rec."Local Purchase Order")
            {
                Caption = 'Local Purchase Order';
                ApplicationArea = All;
            }
            field("Foreign Purch. Quote"; rec."Foreign Purch. Quote")
            {
                Caption = 'Foreign Puchase Quote';
                ApplicationArea = all;

            }
            field("Local Purch. Quote"; Rec."Local Purch. Quote")
            {
                Caption = 'Local Purchase Quote';
                ApplicationArea = All;
            }



        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}