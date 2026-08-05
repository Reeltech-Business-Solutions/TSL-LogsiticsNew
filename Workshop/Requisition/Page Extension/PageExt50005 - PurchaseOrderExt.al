pageextension 50005 PurchaseOrder extends "Purchase Order"
{
    layout
    {
        addafter("No.")
        {
            /* field("Vendor Type"; "Vendor Type")
             {
                 Caption = 'Vendor Type';
             }
 */
            field("PWN_Vendor No"; Rec."PWN_Vendor No")
            {
                Caption = 'Vendor No';
                ApplicationArea = All;
                Visible = false;
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
}
