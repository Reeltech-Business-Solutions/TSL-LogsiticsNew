pageextension 50045 "Service Shipment Lines Ext" extends "Service Shipment Lines Subform" //OriginalId
{
    layout
    {
        addafter("Shortcut Dimension 2 Code")
        {
            field("Unblock Usage"; Rec."Unblock Usage") { ApplicationArea = All; }
            field("User ID- BLocked Item Removed"; Rec."User ID- BLocked Item Removed") { ApplicationArea = All; }
            field("Unblock Usage Notification"; Rec."Unblock Usage Notification") { ApplicationArea = All; }
            field("Unblock- Last Inv Doc"; Rec."Unblock- Last Inv Doc") { ApplicationArea = All; }
            field("Unblock-Last Inv Date"; Rec."Unblock-Last Inv Date") { ApplicationArea = All; }
            field("Item Type"; Rec."Item Type") { ApplicationArea = All; }

        }
    }

    actions
    {
    }
}