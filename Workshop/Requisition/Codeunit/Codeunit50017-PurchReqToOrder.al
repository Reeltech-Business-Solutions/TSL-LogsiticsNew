/// <summary>
/// Codeunit Purch.-Req to Order (Yes/No) (ID 70010).
/// </summary>
codeunit 50017 "Purch.-Req to Order (Yes/No)"
{
    TableNo = "Purchase Header";

    trigger OnRun()
    var
        ConfirmManagement: Codeunit "Confirm Management";
        IsHandled: Boolean;
    begin
        Rec.TestField("Document Type", Rec."Document Type"::Quote);
        if not ConfirmManagement.GetResponseOrDefault(ConvertQuoteToOrderQst, true) then
            exit;

        IsHandled := false;
        OnBeforePurchQuoteToOrder(Rec, IsHandled);
        if IsHandled then
            exit;

        PurchaseReqToQuote.Run(Rec);
        PurchaseReqToQuote.GetPurchOrderHeader(PurchOrderHeader);

        IsHandled := false;
        OnAfterCreatePurchOrder(PurchOrderHeader, IsHandled);
        if not IsHandled then
            if ConfirmManagement.GetResponseOrDefault(StrSubstNo(OpenNewOrderQst, PurchOrderHeader."No."), true) then
                if PurchOrderHeader."Purchase Type" = PurchOrderHeader."Purchase Type"::Local then
                    PAGE.Run(PAGE::"Local Purch. Quote", PurchOrderHeader)
                else
                    PAGE.Run(PAGE::"Foreign Purchase Quote", PurchOrderHeader)
    end;

    var
        ConvertQuoteToOrderQst: Label 'Do you want to convert the Purchase Requisition to an order?';
        PurchOrderHeader: Record "Purchase Header";
        PurchQuoteToOrder: Codeunit "Purch.-Quote to Order";
        PurchaseReqToQuote: Codeunit "Purch.-Requisition to-Quote";
        OpenNewOrderQst: Label 'The Purchase Requisition has been converted to order number %1. Do you want to open the new order?', Comment = '%1 - No. of new purchase order.';

    [IntegrationEvent(false, false)]
    local procedure OnAfterCreatePurchOrder(var PurchaseHeader: Record "Purchase Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePurchQuoteToOrder(var PurchaseHeader: Record "Purchase Header"; var IsHandled: Boolean)
    begin
    end;
}

