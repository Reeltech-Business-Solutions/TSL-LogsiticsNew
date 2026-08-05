pageextension 50025 VendorExt extends "Vendor Card"
{
    Layout
    {
        addafter(Name)
        {
            field("Vendor Type"; Rec."Vendor Type")
            {
                ApplicationArea = All;

                Importance = Promoted;
            }

        }
    }
   // trigger OnQueryClosePage(CloseAction: Action): Boolean
    // begin
    //     if rec."Vendor Type" = rec."Vendor Type"::" " then
    //         Error('Please select Vendor Type');
    // end;

}