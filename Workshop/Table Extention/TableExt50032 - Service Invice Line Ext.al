tableextension 50032 "Service Invoice Line Ext" extends "Service Invoice Line"
{
    fields
    {
        field(50001; "Service Order No"; Code[20])
        {

        }
        field(50008; "Total Cost Amount"; Decimal)
        {

        }
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
        field(90000; "OrderNoExist"; Code[20])
        {

        }
        field(59201; "Item Type"; Option)
        {
            OptionMembers = ,Spares,Lubricant,Tyres,Battery,Fuel,Others;

        }
        field(59202; "Item Type2"; Code[20])
        {

        }

    }
}
