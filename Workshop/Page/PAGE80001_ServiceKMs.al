page 80001 "Service KMs"
{
    /* CardPageID = "Service KM";
    Editable = false;
    PageType = List;
    SourceTable = "Service KM";

    layout
    {
        area(content)
        {
            repeater(Control1000000003)
            {
                ShowCaption = false;
                field("Service KM";"Service KM")
                {
                    ShowCaption = false;
                }
                field(Description;Description)
                {
                    ShowCaption = false;
                }
                field("Duration in Hours";"Duration in Hours")
                {
                    ShowCaption = false;
                }
                field("Service Item Mode";"Service Item Mode")
                {
                    ShowCaption = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Voucher")
            {
                Caption = '&Voucher';
            }
        }
    }

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        GenJnlManagement: Codeunit GenJnlManagement;
        ReportPrint: Codeunit "Test Report-Print";
        CurrentJnlBatchName: Code[20];
        ShortcutDimCode: array [8] of Code[20];
        OpenedFromBatch: Boolean;
        GenJournalLine: Record "Gen. Journal Line";
        GLReconcile: Page Reconciliation;
        VoucherHeader: Record Cashflowbuffer;
        ApprovalMgt: Codeunit Codeunit439;
        ApprovalEntry: Record "Approval Entry";
        ReleaseVoucher: Codeunit GLaccoBuffer;
        Balance: Decimal;
        GLSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GnJnlBatch: Record "Gen. Journal Batch";
        GenJnlLine: Record "Gen. Journal Line";
        Text000: Label 'The %2 record of the %1 has been created.';
        UserSetup: Record "User Setup";
        ApproverID: Code[20];
        UserSetup2: Record "User Setup";
        ApproverMail: Code[30];
        MailSender: Codeunit Mail;
        ToName: Text[80];
        CCName: Text[80];
        Subject: Text[50];
        attachement: Text[260];
        MailSent: Boolean;
        Text002: Label 'Document Approval!';
        Text003: Label 'A %1 worth of =N=%2 with Document No: %3 needs your approval.';
        Body: Text[100];
        Currency: Record Currency;
        CurrencyDescription: Text[250]; */
}

