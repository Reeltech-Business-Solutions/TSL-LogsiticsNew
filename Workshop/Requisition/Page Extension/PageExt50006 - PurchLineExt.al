
pageextension 50006 PurchLine extends "Purchase Lines"
{
    layout
    {
        // Add changes to page layout here
        addbefore("No.")
        {
            field("Expense No."; Rec."Expense No.")
            {
                //visible = Showdetails;
                Caption = 'Expense No.';
                visible = false;
                ApplicationArea = All;


            }
        }

    }


}