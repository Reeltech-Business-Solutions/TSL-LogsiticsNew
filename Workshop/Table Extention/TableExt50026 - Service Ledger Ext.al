tableextension 50026 "Service Legder Ext" extends "Service Ledger Entry"
{
    fields
    {
        field(50001; "Item Cost value"; Decimal)
        {

        }
        field(50002; "Customer Posting Group"; Code[20])
        {

        }
        field(50003; "Bill-to Name"; Code[60])
        {

        }
        field(50004; "Expense Job"; Boolean)
        {

        }
        field(90005; "Item Type"; Option)
        {
            OptionMembers = ,Spares,Lubricant,Tyres,Battery,Fuel,Others;
        }
        field(80002; "KM Run"; Code[20])
        {

        }

    }
}