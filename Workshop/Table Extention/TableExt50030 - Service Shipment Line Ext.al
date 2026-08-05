tableextension 50030 "Service Shipment Line Ext" extends "Service Shipment Line"
{
    fields
    {
        field(50017; "Unblock Usage"; Boolean)
        {

        }
        field(50018; "User ID- BLocked Item Removed"; Code[50])
        {

        }
        field(50019; "Unblock Usage Notification"; Boolean)
        {

        }
        field(50020; "Unblock- Last Inv Doc"; Code[30])
        {

        }
        field(50021; "Unblock-Last Inv Date"; Date)
        {

        }
        field(58042; "Item Type"; Option)
        {
            OptionMembers = ,Spares,Lubricant,Tyres,Battery,Fuel,Others;

        }

    }
}