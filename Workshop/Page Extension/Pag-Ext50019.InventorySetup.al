pageextension 50030 InventorySetup1 extends "Inventory Setup"
{
    layout
    {
        addafter("Posted Phys. Invt. Order Nos.")
        {
            field("Estimate No."; Rec."Estimate No.")
            {
                ApplicationArea = All;
            }
            field("Material Request Nos."; Rec."Material Request Nos.")
            {
                ApplicationArea = All;
            }
            field("Material Return Nos."; Rec."Material Return Nos.")
            {
                ApplicationArea = All;
            }
            field("Posted Material Issue"; Rec."Posted Material Issue")
            {
                ApplicationArea = All;
            }

            field("Posted Material Return"; Rec."Posted Material Return")
            {
                ApplicationArea = All;
            }

            field("Swap Card Nos"; Rec."Swap Card Nos")
            {
                ApplicationArea = All;
            }
            field("Internal Requsition No."; Rec."Internal Requsition No.")
            {
                ToolTip = 'Specifies the value of the Internal Requsition No. field.';
                ApplicationArea = All;
            }
            field("Material Requisition Nos"; Rec."Material Requisition Nos")
            {
                ToolTip = 'Specifies the value of the Material Requisition Nos field.';
                ApplicationArea = All;
            }
            field("Packages Nos."; Rec."Package Nos.")
            {
                ToolTip = 'Specifies the value of the Package Nos. field.';
                ApplicationArea = All;
            }
            field("Store Issue Nos"; Rec."Store Issue Nos")
            {
                ToolTip = 'Specifies the value of the Store Issue Nos field.';
                ApplicationArea = All;
            }
            field("Store Return Nos"; Rec."Store Return Nos")
            {
                ToolTip = 'Specifies the value of the Store Return Nos field.';
                ApplicationArea = All;
            }
            field("Issues Nos"; Rec."Issues Nos")
            {
                ToolTip = 'Specifies the value of the Issues Nos field.';
                ApplicationArea = All;
            }
            field("Inventory Voucher Nos."; Rec."Inventory Voucher Nos.")
            {
                ToolTip = 'Specifies the value of the Inventory Nos field.';
                ApplicationArea = All;
            }
            field("Posted Inventory Nos"; Rec."Posted Inventory Nos.")
            {
                ToolTip = 'Specifies the value of the Shortage Voucher Nos. field';
                ApplicationArea = All;
            }
            field("Shortage Voucher Nos."; Rec."Shortage Voucher Nos.")
            {
                ToolTip = 'Specifies the value of the Shortage Voucher Nos. field';
                ApplicationArea = All;
            }
            field("Expired Voucher Nos."; Rec."Expired Voucher Nos.")
            {
                ToolTip = 'Specifies the value of the shortage Voucher Nos. field';
                ApplicationArea = All;
            }
            field("Battery Maintenance No."; Rec."Battery Maintenance No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Battery Maintenence No. field';
            }

        }
        addafter(Dimensions)
        {
            group(Template)
            {
                field("Item Jnl Template"; Rec."Item Jnl Template")
                {
                    ApplicationArea = All;
                }
                field("Item Jnl Batch"; Rec."Item Jnl Batch")
                {
                    ApplicationArea = All;
                }
                field("Item Journal Nos"; Rec."Item Journal Nos")
                {
                    ApplicationArea = All;
                }
                field("Item Batch Nos"; Rec."Item Batch Nos")
                {
                    ApplicationArea = All;
                }
            }
        }
        addafter("Posted Invt. Shipment Nos.")
        {

        }
    }
}
