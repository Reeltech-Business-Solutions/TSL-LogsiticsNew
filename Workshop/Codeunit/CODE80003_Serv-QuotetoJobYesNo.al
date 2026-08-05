codeunit 80003 "Serv-Quote to Job (Yes/No)"
{
    TableNo = "Service Header";

    trigger OnRun()
    begin
        Rec.TESTFIELD("Document Type", Rec."Document Type"::Quote);
        Rec.TESTFIELD("Customer No.");
        Rec.TESTFIELD("Bill-to Customer No.");
        IF NOT CONFIRM(Text000, TRUE) THEN
            EXIT;

        ServQuoteToJob.RUN(Rec);
    end;

    var
        Text000: Label 'Do you want to convert the quote to an order?';
        Text001: Label 'Service quote %1 has been archived and converted to service order no. %2.';
        ServQuoteToJob: Codeunit "Service-Quote to Job";
}

