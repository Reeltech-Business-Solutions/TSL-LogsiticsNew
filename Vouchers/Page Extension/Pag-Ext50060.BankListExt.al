pageextension 50060 BankListExt extends "Bank Account List"
{
    layout
    {
        addbefore(BalanceLCY)
        {
            field("Net Change"; Rec."Net Change")
            {
                ApplicationArea = all;
            }
            field("Net Change (LCY)"; Rec."Net Change (LCY)")
            {
                ApplicationArea = All;
            }
        }
    }
}
