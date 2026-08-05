pageextension 50031 VendorListExt extends "Vendor List"
{
    layout
    {
        addafter("Search Name")
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

    trigger OnOpenPage()
    begin
        Rec.Setrange("Vendor Type", 0);
    end;




}
