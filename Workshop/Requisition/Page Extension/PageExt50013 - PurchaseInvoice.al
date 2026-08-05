
pageextension 50013 PurchaseInVoice extends "Purchase Invoice"
{
    layout
    {
        addafter("No.")
        {
            field("Vendor Type"; Rec."Vendor Type")
            {
                Caption = 'Vendor Type';
                ApplicationArea = All;
            }

            field("PWN_Vendor No"; Rec."PWN_Vendor No")
            {
                Caption = 'Vendor No';
                ApplicationArea = All;
            }

            field("Approval Code"; Rec."Approval Code")
            {
                ApplicationArea = All;
                Visible = false;
            }
        }
        addafter("Vendor Invoice No.")
        {
            field("RFQ No."; Rec."RFQ No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Requisition No."; Rec."Requisition No.")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Requisition No. field.';
            }

        }

    }

    actions
    {
    }

}
