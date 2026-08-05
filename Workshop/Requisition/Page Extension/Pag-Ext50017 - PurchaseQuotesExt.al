pageextension 50022 PurchQuotesExt extends "Purchase Quotes"
{
    trigger OnOpenPage()

    begin
#pragma warning disable AL0132
        Rec.Setrange("Purchase Type", 0);
        //Message('The value is: %1', "Purchase Type");
    end;
}

