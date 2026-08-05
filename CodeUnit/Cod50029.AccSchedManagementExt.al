codeunit 50029 AccSchedManagementExt
{
    TableNo = 85;
    Permissions = tabledata "Cust. Ledger Entry" = rimd,
                   tabledata "Detailed Cust. Ledg. Entry" = rimd,
                   tabledata "Vendor Ledger Entry" = rimd,
                   tabledata "Detailed Vendor Ledg. Entry" = rimd,
                   tabledata "Item Ledger Entry" = rimd,
                   tabledata "Value Entry" = rimd,
                   tabledata "FA Ledger Entry" = rimd,
                   tabledata "Item Register" = rimd,
                   tabledata "G/L Register" = rimd,
                   tabledata "Detailed Employee Ledger Entry" = rimd,
                   tabledata "Job Ledger Entry" = rimd,
                   tabledata "Job WIP G/L Entry" = rimd,
                   tabledata "G/L Account" = rimd,
                   tabledata "Warehouse Entry" = rimd,
                   tabledata "G/L Entry" = rimd,
                   tabledata "Warehouse Register" = rimd,
                   tabledata "Bank Account Ledger Entry" = rimd,
                   tabledata Item = rimd,
                   tabledata "Item Unit of Measure" = rimd,
                   tabledata "Gen. Journal Line" = rimd;

    trigger OnRun()
    begin
        
    end;



    procedure TansactionData()
    var
        vendorLedger: Record "Vendor Ledger Entry";
        DetailVendor: Record "Detailed Vendor Ledg. Entry";
        CustomerLedger: Record "Cust. Ledger Entry";
        DetailCustomer: Record "Detailed Cust. Ledg. Entry";
        ItemLedger: Record "Item Ledger Entry";
        Value: Record "Value Entry";
        wareledger: Record "Warehouse Entry";
        Faledger: record "FA Ledger Entry";
        EmployLedger: Record "Detailed Employee Ledger Entry";
        GLEntry: Record "G/L Entry";
        JobLedger: Record "Job Ledger Entry";
        WPLedgerGL: Record "Job WIP G/L Entry";
        WPLedger: Record "Job WIP Entry";
        ChartoFAcc: Record "G/L Account";
        GLRegister: Record "G/L Register";
        ItemRegister: Record "Item Register";
        BankLedgerEntry: Record "Bank Account Ledger Entry";
        ItemRec: Record Item;
        ItemUnitOfMeasure: Record "Item Unit of Measure";
        GenJournalLine: Record "Gen. Journal Line";

    begin
        vendorLedger.DeleteAll();
        DetailVendor.DeleteAll();
        CustomerLedger.DeleteAll();
        DetailCustomer.DeleteAll();
        ItemLedger.DeleteAll();
        Value.DeleteAll();
        wareledger.DeleteAll();
        Faledger.DeleteAll();
        EmployLedger.DeleteAll();
        GLEntry.DeleteAll();
        JobLedger.DeleteAll();
        WPLedgerGL.DeleteAll();
        WPLedger.DeleteAll();
        // ChartoFAcc.DeleteAll();
        GLRegister.DeleteAll();
        ItemRegister.DeleteAll();
        BankLedgerEntry.DeleteAll();
        // ItemRec.DeleteAll();
        // ItemUnitOfMeasure.DeleteAll();
        GenJournalLine.DeleteAll();


    end;

}
