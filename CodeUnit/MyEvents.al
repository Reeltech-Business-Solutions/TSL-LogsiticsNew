codeunit 70002 Subscriber
{
    EventSubscriberInstance = StaticAutomatic;
    [EventSubscriber(ObjectType::Table, database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', true, true)]
    local procedure OnAfterCopyGenJnlLineFromSalesHeader(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")

    begin
        GenJournalLine.LPO := SalesHeader.LPO;
        GenJournalLine."OEM Code" := SalesHeader."OEM Code";

    end;

    [EventSubscriber(ObjectType::Table, database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure OnAfterCopyCustLedgerEntryFromGenJnlLine(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        CustLedgerEntry.LPO := GenJournalLine.LPO;
        CustLedgerEntry."OEM Code" := GenJournalLine."OEM Code";

    end;

    [EventSubscriber(ObjectType::Table, database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
    local procedure OnAfterCopyGLEntryFromGenJnlLine(var GLEntry: Record "G/L Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        GLEntry.LPO := GenJournalLine.LPO;
        GLEntry."OEM Code" := GenJournalLine."OEM Code";

    end;

    [EventSubscriber(ObjectType::Table, database::"Purchase Header", 'OnAfterGetNoSeriesCode', '', true, true)]
    local procedure OnAfterGetNoSeriesCode(var PurchHeader: Record "Purchase Header"; PurchSetup: Record "Purchases & Payables Setup"; var NoSeriesCode: Code[20])
    begin
        case PurchHeader."Document Type" of
            PurchHeader."Document Type"::Quote:
                begin
                    IF PurchHeader."Purchase Type" = PurchHeader."Purchase Type"::"Local Requisition" then
                        NoSeriesCode := PurchSetup."Local Purcahse Req";
                    IF PurchHeader."Purchase Type" = PurchHeader."Purchase Type"::"Foreign Requisition" then
                        NoSeriesCode := PurchSetup."Foreign Purchase Req";
                    IF PurchHeader."Purchase Type" = PurchHeader."Purchase Type"::Cash then
                        NoSeriesCode := PurchSetup."Cash Purchase Quote";
                    IF PurchHeader."Purchase Type" = PurchHeader."Purchase Type"::Foreign then
                        NoSeriesCode := PurchSetup."Foreign Purch. Quote";
                    IF PurchHeader."Purchase Type" = PurchHeader."Purchase Type"::Local then
                        NoSeriesCode := PurchSetup."Local Purch. Quote";
                end;

            PurchHeader."Document Type"::Order:
                begin
                    IF PurchHeader."Purchase Type" = PurchHeader."Purchase Type"::Foreign then
                        NoSeriesCode := PurchSetup."Foreign Purchase Order";
                    IF PurchHeader."Purchase Type" = PurchHeader."Purchase Type"::Local then
                        NoSeriesCode := PurchSetup."Local Purchase Order";
                    IF PurchHeader."Purchase Type" = PurchHeader."Purchase Type"::Cash then
                        NoSeriesCode := PurchSetup."Cash Purchase Order";
                    IF PurchHeader."Purchase Type" = PurchHeader."Purchase Type"::"Import Charge" then
                        NoSeriesCode := PurchSetup."Import Purchase Invoice";
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 22, 'OnAfterInitItemLedgEntry', '', true, true)]
    local procedure OnAfterInitItemLedgEntry(VAR NewItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line")
    begin
        NewItemLedgEntry."Driver No." := ItemJournalLine."Driver No.";
        NewItemLedgEntry."Driver Name" := ItemJournalLine."Driver Name";
        NewItemLedgEntry."Contract Code" := ItemJournalLine."Contract Code";
        NewItemLedgEntry."Truck No." := ItemJournalLine."Truck No.";
        NewItemLedgEntry."RFQ No." := ItemJournalLine."RFQ No.";
        NewItemLedgEntry."PRF No." := ItemJournalLine."PRF No.";

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnBeforeSelectPostOrderOption', '', false, false)]
    local procedure OnBeforeSelectPostOrderOption(var PurchaseHeader: Record "Purchase Header"; DefaultOption: Integer; var Result: Boolean; var IsHandled: Boolean)
    var
        Selection: Integer;
        Selection1: integer;
        // ReceiveInvoiceQst: Label '&Receive,&Invoice';
        UserSettgs: Record "User Personalization";
        ReceiveInvoiceQst1: Label '&Receive';
        ReceiveInvoiceQst2: Label '&Invoice';
    begin

        // Result := true;
        // //  if (PurchaseHeader."Purchase Type" = PurchaseHeader."Purchase Type"::Local) or (PurchaseHeader."Purchase Type" = PurchaseHeader."Purchase Type"::Foreign) then begin
        // UserSettgs.Reset();
        // UserSettgs.SetFilter(UserSettgs."User ID", '%1', UserId);
        // if UserSettgs.FindFirst() then
        //     UserSettgs.CalcFields(Role);
        // if (UserSettgs.Role = 'Purchasing Agent') or (UserSettgs.Role = 'Inventory Manager') then begin
        //     // if UserSettgs.Role = 'Inventory Manager' then begin
        //     Selection := StrMenu(ReceiveInvoiceQst1, 1);
        //     if Selection = 0 then
        //         Result := false;
        //     if Selection = 3 then
        //         Result := false;
        //     PurchaseHeader.Receive := Selection in [1, 1];
        //     // PurchaseHeader.Invoice := Selection in [2];
        //     IsHandled := true;
        // end;

        //     Result := true;
        //     UserSettgs.Reset();
        //     UserSettgs.SetFilter(UserSettgs."User ID", '%1', UserId);
        //     if UserSettgs.FindFirst() then
        //         UserSettgs.CalcFields(Role);
        //     if UserSettgs.Role = 'Accounting Manager' then begin
        //         Selection1 := StrMenu(ReceiveInvoiceQst2, 1);
        //         if Selection1 = 0 then
        //             Result := false;
        //         if Selection1 = 3 then
        //             Result := false;
        //         // PurchaseHeader.Receive := Selection in [1, 1];
        //         PurchaseHeader.Invoice := Selection1 in [1, 1];
        //         IsHandled := true;
        //     end;
        // end;
        // IsHandled := true;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post + Print", 'OnBeforeSelectPostOrderOption', '', false, false)]
    local procedure OnBeforeSelectPostOrderOption1(var PurchaseHeader: Record "Purchase Header"; DefaultOption: Integer; var Result: Boolean; var IsHandled: Boolean)
    var
        Selection: Integer;
        Selection1: integer;
        // ReceiveInvoiceQst: Label '&Receive,&Invoice';
        UserSettgs: Record "User Personalization";
        ReceiveInvoiceQst1: Label '&Receive';
        ReceiveInvoiceQst2: Label '&Invoice';
    begin

        Result := true;
        //  if (PurchaseHeader."Purchase Type" = PurchaseHeader."Purchase Type"::Local) or (PurchaseHeader."Purchase Type" = PurchaseHeader."Purchase Type"::Foreign) then begin
        UserSettgs.Reset();
        UserSettgs.SetFilter(UserSettgs."User ID", '%1', UserId);
        if UserSettgs.FindFirst() then
            UserSettgs.CalcFields(Role);
        if (UserSettgs.Role = 'Purchasing Agent') or (UserSettgs.Role = 'Inventory Manager') then begin
            // if UserSettgs.Role = 'Inventory Manager' then begin
            Selection := StrMenu(ReceiveInvoiceQst1, 1);
            if Selection = 0 then
                Result := false;
            if Selection = 3 then
                Result := false;
            PurchaseHeader.Receive := Selection in [1, 1];
            IsHandled := true;
        end;


        Result := true;
        UserSettgs.Reset();
        UserSettgs.SetFilter(UserSettgs."User ID", '%1', UserId);
        if UserSettgs.FindFirst() then
            UserSettgs.CalcFields(Role);
        if UserSettgs.Role = 'Accounting Manager' then begin
            Selection1 := StrMenu(ReceiveInvoiceQst2, 1);
            if Selection1 = 0 then
                Result := false;
            if Selection1 = 3 then
                Result := false;
            PurchaseHeader.Invoice := Selection1 in [1, 1];
            IsHandled := true;
        end;
    end;
    // IsHandled := true;
    // end;



    var
        //  NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeriesMgt: Codeunit "No. Series";
        NoSeriesCode: Code[20];

    /*
    
        [EventSubscriber(ObjectType::Table, database::"Detailed Cust. Ledg. Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', true, true)]
        local procedure OnAfterCopyDetailedCustLedgerEntryFromGenJnlLine(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
        begin
            CustLedgerEntry."Lease No" := GenJournalLine."Lease No";
            //CustLedgerEntry."Owner No." := GenJournalLine."Owner No.";
            //CustLedgerEntry."Change of Ownership" := GenJournalLine."Change of Ownership";
            CustLedgerEntry."Property Code" := GenJournalLine."Property Code";
            CustLedgerEntry."Draft No." := GenJournalLine."Draft No.";
            GenJournalLine."Sales Type" := GenJournalLine."Sales Type";
        end;
        */

    /*  [EventSubscriber(ObjectType::Table, database::"Bank Account Ledger Entry", 'OnAfterCopyFromGenJnlLine', '', true, true)]
     local procedure OnAfterCopyFromGenJnlLine(var BankAccountLedgerEntry: Record "Bank Account Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
     begin
         BankAccountLedgerEntry."Lease No." := GenJournalLine."Lease No";
         BankAccountLedgerEntry."Charge Code" := GenJournalLine."Charge Code";
         BankAccountLedgerEntry."Teller / Check No." := GenJournalLine."External Document No.";
     end; */

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitValueEntry', '', TRUE, TRUE)]
    local procedure OnAfterInitValueEntry(var ValueEntry: Record "Value Entry"; ItemJournalLine: Record "Item Journal Line"; var ValueEntryNo: Integer)
    begin
        ValueEntry."Driver No." := ItemJournalLine."Driver No.";
        ValueEntry."Driver Name" := ItemJournalLine."Driver Name";
        ValueEntry."Contract Code" := ItemJournalLine."Contract Code";
        ValueEntry."Truck No." := ItemJournalLine."Truck No.";
        ValueEntry."RFQ No." := ItemJournalLine."RFQ No.";
        ValueEntry."PRF No." := ItemJournalLine."PRF No.";

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Quote to Order", 'OnAfterInsertPurchOrderLine', '', TRUE, TRUE)]
    local procedure OnAfterInsertPurchOrderLine(var PurchaseQuoteLine: Record "Purchase Line"; var PurchaseOrderLine: Record "Purchase Line")
    begin
        PurchaseQuoteLine."RFQ No." := PurchaseOrderLine."RFQ No.";
        PurchaseQuoteLine."PRF No." := PurchaseOrderLine."PRF No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Quote to Order", 'OnAfterCreatePurchHeader', '', TRUE, TRUE)]
    local procedure OnAfterCreatePurchHeader(var PurchOrderHeader: Record "Purchase Header"; PurchHeader: Record "Purchase Header")
    begin
        PurchOrderHeader."RFQ No." := PurchHeader."RFQ No.";
        //PurchOrderHeader."PRF No." := PurchHeader."PRF No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Create-Invoice", 'OnBeforeUpdateSalesHeader', '', false, false)]
    local procedure OnBeforeUpdateSalesHeader(var SalesHeader: Record "Sales Header"; Job: Record Job; var IsHandled: Boolean)
    begin
        SalesHeader."Asset No." := Job."FLeet No.";
        SalesHeader."Service Vehicle" := job."Service Vehicle";
        SalesHeader.Trailer := job.Trailer;
        SalesHeader."Job No." := job."No.";
        SalesHeader."Trailer No." := Job."Trailer No.";
        SalesHeader.VALIDATE("Shortcut Dimension 1 Code", Job."Global Dimension 1 Code");
        SalesHeader.VALIDATE("Shortcut Dimension 2 Code", Job."Global Dimension 2 Code");
        SalesHeader.VALIDATE("Shortcut Dimension 3 Code", Job."Shortcut Dimension 3 Code");
        SalesHeader.VALIDATE("Shortcut Dimension 4 Code", Job."Shortcut Dimension 4 Code");
        SalesHeader.VALIDATE("Shortcut Dimension 5 Code", Job."Shortcut Dimension 5 Code");
        SalesHeader.VALIDATE("Shortcut Dimension 6 Code", Job."Shortcut Dimension 6 Code");
        SalesHeader.Validate("Shortcut Dimension 8 Code", Job."Shortcut Dimension 8 Code");


        IsHandled := false;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Transfer Line", 'OnAfterFromJnlLineToLedgEntry', '', false, false)]
    local procedure OnAfterFromJnlLineToLedgEntry(var JobLedgerEntry: Record "Job Ledger Entry"; JobJournalLine: Record "Job Journal Line")
    begin
        JobLedgerEntry."Customer Job Type" := JobJournalLine."Customer Job Type";
        JobLedgerEntry."Job Type Code" := JobJournalLine."Job Type Code";
        JobLedgerEntry."Shortcut Dimension 4 Code" := JobJournalLine."Shortcut Dimension 4 Code";
        JobLedgerEntry."Shortcut Dimension 3 Code" := JobJournalLine."Shortcut Dimension 3 Code";
        JobLedgerEntry."Responsibility Center" := JobJournalLine."Responsibility Center";
        JobLedgerEntry."Item Type" := JobJournalLine."Item Type";
        JobLedgerEntry."Service Item No." := JobJournalLine."Service Item No.";
        JobLedgerEntry."Warranty Start Date" := JobJournalLine."Posting Date";
    end;


    [EventSubscriber(ObjectType::Table, Database::Job, 'OnAfterModifyEvent', '', false, false)]

    local Procedure CreateSalesInvoiceAfterJobCompletion(var Rec: Record Job; var xRec: Record Job)
    var

        CustomerRec: Record Customer;
        SalesHeader: Record "Sales Header";
        SalesSetup: Record "Sales & Receivables Setup";
        //  NoSeries: Codeunit NoSeriesManagement;
        NoSeries: Codeunit "No. Series";
        DocNo: Code[30];
        SalesLine: Record "Sales Line";
        JobLedger: Record "Job Ledger Entry";
        item: Record Item;
        salesPage: Page "Sales Invoice Subform";
        NextLineNo: integer;
        location: Record Location;
        GenBus: Record "Gen. Business Posting Group";

    begin
        if (Rec.Status = Rec.Status::Completed) AND (XRec.Status <> Rec.Status::Completed) then begin

            SalesSetUp.Get();
            DocNo := NoSeries.GetNextNo(SalesSetup."Invoice Nos.", Today, true);

            if Not CustomerRec.Get(Rec."Bill-to Customer No.") then
                Error('Customer not found');

            SalesHeader.init();
            SalesHeader."No." := DocNo;
            SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
            SalesHeader."Sell-to Customer No." := Rec."Bill-to Customer No.";
            SalesHeader."Sell-to Customer Name" := CustomerRec.Name;
            SalesHeader."Bill-to Name" := CustomerRec.Name;
            SalesHeader."Bill-to Customer No." := Rec."Bill-to Customer No.";
            SalesHeader."Job No." := Rec."No.";
            SalesHeader."Due Date" := Today;
            SalesHeader."Gen. Bus. Posting Group" := CustomerRec."Gen. Bus. Posting Group";


            if Rec.Get(Rec."No.") then begin
                SalesHeader."Asset No." := Rec."FLeet No.";
                SalesHeader."Service Vehicle" := Rec."Service Vehicle";
                SalesHeader.Trailer := Rec.Trailer;
                SalesHeader."Trailer No." := Rec."Trailer No.";

            end;


            if SalesHeader.Insert(true) then begin
                SalesHeader.Validate("No.", DocNo);
                SalesHeader.Validate("Sell-to Customer No.", Rec."Bill-to Customer No.");
                SalesHeader.Validate("Bill-to Customer No.", Rec."Bill-to Customer No.");
                SalesHeader.Validate("Sell-to Customer Name", CustomerRec.Name);
                SalesHeader.Validate("Job No.", Rec."No.");
                SalesHeader.Validate("Gen. Bus. Posting Group", CustomerRec."Gen. Bus. Posting Group");

                SalesHeader.Validate("Bill-to Name", CustomerRec.Name);
            end;

            JobLedger.Reset();
            JobLedger.SetRange("Job No.", Rec."No.");
            JobLedger.SetRange("Entry Type", JobLedger."Entry Type"::Usage);
            JobLedger.SetRange(Type, JobLedger.Type::Item);

            NextLineNo := 10000;
            if JobLedger.FindSet() then begin
                repeat

                    SalesLine.Init();
                    SalesLine."Document No." := DocNo;
                    SalesLine."Document Type" := SalesLine."Document Type"::Invoice;



                    SalesLine."Line No." += 1000;

                    SalesLine."Location Code" := JobLedger."Location Code";
                    Message('yeahsst %1', SalesLine."Location Code");
                    SalesLine.Validate(Type, SalesLine.Type::Item);
                    SalesLine.Validate("No.", JobLedger."No.");
                    SalesLine.Validate("Shortcut Dimension 1 Code", Rec."Bill-to Customer No.");
                    SalesLine.Validate("Quantity", JobLedger.Quantity);
                    SalesLine."Truck No." := Rec."Vehicle Registr. Plate No";
                    SalesLine."Gen. Bus. Posting Group" := CustomerRec."Gen. Bus. Posting Group";

                    if Item.Get(JobLedger."No.") then begin
                        SalesLine.Validate(Description, Item.Description);
                        SalesLine.Validate("Unit of Measure Code", Item."Base Unit of Measure");
                        SalesLine.Validate("Unit Price", Item."Unit Price");
                    end else begin
                        Error('Item %1 does not exist.', JobLedger."No.");
                    end;

                    if SalesLine.Insert(true) then
                        SalesLine.Validate("Location Code", JobLedger."Location Code");
                    SalesLine.Modify(true);
                until JobLedger.Next() = 0;
                Message('Invoice created successfully');
            end else begin
                Message('No Job Ledger Entries found for Job No.');
            end;

        end
    end;

    [EventSubscriber(ObjectType::Table, database::"Service Line", 'OnAfterAssignItemValues', '', false, false)]
    local procedure OnAfterAssignItemValues(var ServiceLine: Record "Service Line"; Item: Record Item; xServiceLine: Record "Service Line"; CallingFieldNo: Integer; ServiceHeader: Record "Service Header")
    begin
        ServiceLine."Usage period (Warranty)" := Item."Usage period (Warranty)";
    end;

}