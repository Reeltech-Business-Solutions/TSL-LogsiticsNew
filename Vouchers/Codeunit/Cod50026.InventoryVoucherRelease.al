codeunit 50026 "Inventory Voucher Release"
{
    TableNo = "Inv.Voucher Header";

    trigger OnRun()
    VAR
        INVVouchRec: Record "Inv.Voucher Header";
        INVVouchLineRec: Record "Inv. Voucher Line";


    begin
        IF Rec.Status = Rec.Status::Released THEN
            EXIT;

        Rec.TESTFIELD("Location Code");
        Rec.TESTFIELD(Status, Rec.Status::Open);

        INVVouchRec.SETRANGE("Document No.", Rec."Document No.");
        INVVouchLineRec.SETFILTER(Quantity, '<>%1', 0);
        IF NOT INVVouchRec.FIND('-') THEN
            ERROR(Text001, Rec."Document No.");
        IF NOT CONFIRM(Text002, FALSE, Rec."Document No.") THEN
            EXIT;
        INVVouchRec.RESET;
        Rec.VALIDATE(Status, Rec.Status::Released);
        Rec.VALIDATE("Released Date", WORKDATE);
        Rec.VALIDATE("Released By", USERID);
        Rec.MODIFY;

    end;

    var

        Text001: Label 'There is nothing to release for %1 .';
        Text002: Label 'Do you want to release the inventory voucher for %1 .';
        Text003: Label 'Do you want to reopen the inventory voucher for %1 .';



    [Scope('Cloud')]
    procedure Reopen(var InvVoucherHeader: Record "Inv.Voucher Header")
    begin
        // WITH InvVoucherHeader DO BEGIN
        IF InvVoucherHeader.Status = InvVoucherHeader.Status::Open THEN
            EXIT;
        // IF NOT CONFIRM(Text003, FALSE, InvVoucherHeader."Document No.") THEN
        //     EXIT;
        InvVoucherHeader.VALIDATE(Status, InvVoucherHeader.Status::Open);
        InvVoucherHeader.MODIFY;

    end;

}
