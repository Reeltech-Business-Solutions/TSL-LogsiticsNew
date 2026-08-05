codeunit 50027 "ItemCheckAvailability Ext"
{
    var
        ItemCheckAval: Codeunit "Item-Check Avail.";
        InvVoucherLine: Record "Inv. Voucher Line";

        ItemNetChange: Decimal;

    trigger OnRun()
    var

    begin

    end;


    procedure "Inv.VoucherLineShowWarning"(InvVoucherLine: Record "Inv. Voucher Line"): Boolean
    var

    begin
        IF NOT ItemCheckAval.ShowWarningForThisItem(InvVoucherLine."Item No.") THEN
            EXIT(FALSE);
        CASE InvVoucherLine."Document Type." OF
            InvVoucherLine."Document Type."::"Positive Adjmt":
                ItemNetChange := InvVoucherLine.Quantity;
            InvVoucherLine."Document Type."::"Negative Adjmt":
                ItemNetChange := -InvVoucherLine.Quantity;
        END;

        EXIT(
          ItemCheckAval.ShowWarning(
            InvVoucherLine."Item No.",
            '',
            InvVoucherLine."Location Code",
            InvVoucherLine."Unit of Measure Code",
            0,
            ItemNetChange,
            0,
            0D,
            0D));
    end;


}
