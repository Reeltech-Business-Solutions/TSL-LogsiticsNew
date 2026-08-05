pageextension 50009 PurchaseQuote extends "Purchase Quote"
{
    layout
    {
        addafter("Buy-from Vendor No.")
        {
            field("Vendor Type"; Rec."Vendor Type")
            {
                Caption = 'Vendor Type';
                Visible = false;
                ApplicationArea = All;
            }
            field("PWN_Vendor No"; Rec."PWN_Vendor No")
            {
                Caption = 'Vendor No';
                ApplicationArea = All;
                Visible = false;
            }
            field("Requisition No."; Rec."Requisition No.")
            {
                Caption = 'Requisition No.';
                ApplicationArea = All;
            }
            field("RFQ No."; Rec."RFQ No.")
            {
                ToolTip = 'Specifies the value of the Request for Quotation Document No. field.';
                ApplicationArea = All;

                // trigger OnValidate()
                // var
                //     RFQLines: Record "Purchase Quote Line";
                //     PurchaseLines: Record "Purchase Line";
                //     Vends: Record "Quotation Request Vendors";
                // begin
                //     RFQLines.SETRANGE("Document No.", "RFQ No.");
                //     PurchaseLines.Deleteall();
                //     IF RFQLines.FINDSET then begin
                //         REPEAT
                //             PurchaseLines.INIT;
                //             PurchaseLines.TRANSFERFIELDS(RFQLines);
                //             PurchaseLines."Document Type" := PurchaseLines."Document Type"::Quote;
                //             PurchaseLines."Document No." := "No.";
                //             //PurchaseLines."RFQ No." := "RFQ No.";
                //             PurchaseLines."Expense No." := RFQLines."Expense No.";
                //             PurchaseLines."PRF No." := RFQLines."PRF No";
                //             PurchaseLines."RFQ No." := RFQLines."Document No.";
                //             PurchaseLines.INSERT;

                //         /*
                //           ReqLines.VALIDATE(ReqLines."No.");
                //           ReqLines.VALIDATE(ReqLines.Quantity);
                //           ReqLines.VALIDATE(ReqLines."Direct Unit Cost");
                //           ReqLines.MODIFY;
                //         */
                //         UNTIL RFQLines.NEXT = 0;
                //     end;
                //     Message('%1', RFQLines."Document No.");
                // end;
            }
            field("Approval Code"; Rec."Approval Code")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
    trigger OnOpenPage()

    begin
#pragma warning disable AL0132
        //   Setrange("Purchase Type", 0);
        //Message('The value is: %1', "Purchase Type");
    end;
}

