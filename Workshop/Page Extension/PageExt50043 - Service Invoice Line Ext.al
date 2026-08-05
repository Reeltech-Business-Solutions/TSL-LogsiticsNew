pageextension 50043 "Service Invice Line Ext" extends "Posted Service Invoice Subform" //OriginalId
{
    layout
    {
        addafter("Service Item Serial No.")
        {
            field("Service Order No"; Rec."Service Order No") { ApplicationArea = All; }
            field("Total Cost Amount"; Rec."Total Cost Amount") { ApplicationArea = All; }
            field("Unblock Usage"; Rec."Unblock Usage") { ApplicationArea = All; }
            field("User ID- BLocked Item Removed"; Rec."User ID- BLocked Item Removed") { ApplicationArea = All; }
            field("Unblock Usage Notification"; Rec."Unblock Usage Notification") { ApplicationArea = All; }
            field("Unblock- Last Inv Doc"; Rec."Unblock- Last Inv Doc") { ApplicationArea = All; }
            field("Unblock-Last Inv Date"; Rec."Unblock-Last Inv Date") { ApplicationArea = All; }
            field("OrderNoExist"; Rec."OrderNoExist") { ApplicationArea = All; }
            field("Item Type"; Rec."Item Type") { ApplicationArea = All; }
            field("Item Type2"; Rec."Item Type2") { ApplicationArea = All; }

        }

    }

    actions
    {
    }
}