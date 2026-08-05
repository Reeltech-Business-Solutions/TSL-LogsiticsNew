pageextension 50059 CustomerListExt extends "Customer List"
{
    layout
    {
        addbefore("Balance (LCY)")
        {
            field("Net Change"; Rec."Net Change")
            {
                ApplicationArea = All;
            }
            field("Net Change (LCY)"; Rec."Net Change (LCY)")
            {
                ApplicationArea = All;
            }
        }
    }
}
