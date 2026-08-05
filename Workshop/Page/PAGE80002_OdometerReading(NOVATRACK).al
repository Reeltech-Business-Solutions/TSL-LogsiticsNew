page 80002 "Odometer Reading(NOVATRACK)"
{

    // DelayedInsert = true;
    // PageType = List;
    // SourceTable = "Receipts and Payment Types";

    // layout
    // {
    //     area(content)
    //     {
    //         repeater(Control1000000000)
    //         {
    //             ShowCaption = false;
    //             field("Entry No.";"Entry No.")
    //             {
    //                 ShowCaption = false;
    //             }
    //             field("NOVATRACK ID";"NOVATRACK ID")
    //             {
    //                 ShowCaption = false;
    //             }
    //             field("Registration No.";"Registration No.")
    //             {
    //                 ShowCaption = false;
    //             }
    //             field("Odometer Reading";"Odometer Reading")
    //             {
    //                 ShowCaption = false;
    //             }
    //             field("Created By";"Created By")
    //             {
    //                 ShowCaption = false;
    //             }
    //             field("Creation Date";"Creation Date")
    //             {
    //                 ShowCaption = false;
    //             }
    //             field("Last Date Modified";"Last Date Modified")
    //             {
    //                 ShowCaption = false;
    //             }
    //             field("Modified By";"Modified By")
    //             {
    //                 ShowCaption = false;
    //             }
    //             field(Date;Date)
    //             {
    //                 ShowCaption = false;
    //             }
    //             field(Year;Year)
    //             {
    //                 ShowCaption = false;
    //             }
    //             field("Customer No.";"Customer No.")
    //             {
    //                 ShowCaption = false;
    //             }
    //             field("Customer Name";"Customer Name")
    //             {
    //                 ShowCaption = false;
    //             }
    //             field("Model Name";"Model Name")
    //             {
    //                 ShowCaption = false;
    //             }
    //             field("Chasis No.";"Chasis No.")
    //             {
    //                 ShowCaption = false;
    //             }
    //             field("Engine No.";"Engine No.")
    //             {
    //                 ShowCaption = false;
    //             }
    //             field("Distant Travelled";"Distant Travelled")
    //             {
    //                 ShowCaption = false;
    //             }
    //         }
    //     }
    // }

    // actions
    // {
    //     area(processing)
    //     {
    //         group("P&osting")
    //         {
    //             Caption = 'P&osting';
    //             action("Test Report")
    //             {
    //                 Caption = 'Test Report';
    //                 Ellipsis = true;
    //                 Image = TestReport;

    //                 trigger OnAction()
    //                 begin
    //                     //ReportPrint.PrintGenJnlLine(Rec);
    //                     //This functionality was copied from page #50087. Unsupported part was commented. Please check it.
    //                     /*CurrPage.VoucherLines.PAGE.*/
    //                     ShowTestReport;

    //                 end;
    //             }
    //         }
    //         group("<Action1900000000>")
    //         {
    //             Caption = '&Line';
    //             action("<Action1900000001>")
    //             {
    //                 Caption = 'Dimensions';
    //                 Image = Dimensions;
    //                 ShortCutKey = 'Shift+Ctrl+D';

    //                 trigger OnAction()
    //                 begin
    //                     //This functionality was copied from page #50006. Unsupported part was commented. Please check it.
    //                     /*CurrPage.VoucherLines.PAGE.*/
    //                     ShowLineDimensions;

    //                 end;
    //             }
    //         }
    //     }
    // }

    // trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    // begin
    //     /*IF JVHeader.GET(JVHeader."Voucher Type" :: IOURV,"Document No.") THEN BEGIN
    //       VALIDATE("Journal Template Name",'IOURV');
    //       VALIDATE("Journal Batch Name",'IOURV');
    //       VALIDATE("Account Type",JVHeader."Account Type");
    //       VALIDATE("Account No.",JVHeader."Credit Account No.");
    //       VALIDATE("Posting Date",JVHeader."Posting Date");
    //       VALIDATE("Voucher Type",JVHeader."Voucher Type");
    //       VALIDATE("Shortcut Dimension 1 Code",JVHeader."Shortcut Dimension 1 Code");
    //       VALIDATE("Shortcut Dimension 2 Code",JVHeader."Shortcut Dimension 2 Code");
    //       VALIDATE("Shortcut Dimension 3 Code",JVHeader."Shortcut Dimension 3 Code");
    //       VALIDATE("Shortcut Dimension 4 Code",JVHeader."Shortcut Dimension 4 Code");
    //       VALIDATE("Shortcut Dimension 5 Code",JVHeader."Shortcut Dimension 5 Code");
    //       VALIDATE("Shortcut Dimension 6 Code",JVHeader."Shortcut Dimension 6 Code");
    //       VALIDATE("Shortcut Dimension 7 Code",JVHeader."Shortcut Dimension 7 Code");
    //       VALIDATE("Shortcut Dimension 8 Code",JVHeader."Shortcut Dimension 8 Code");
    //       VALIDATE("Narration 1",JVHeader."Narration 1");
    //       VALIDATE("Narration 2",JVHeader."Narration 2");
    //       VALIDATE("Narration 3",JVHeader."Narration 3");
    //       VALIDATE("Created By Name",JVHeader."Created By Name");
    //       VALIDATE("Created Date",JVHeader."Created Date");
    //       VALIDATE("Created Time",JVHeader."Created Time");
    //       VALIDATE("Modified By",JVHeader."Modified By");
    //       VALIDATE("Modified By Name",JVHeader."Modified By Name");
    //       VALIDATE("Modified Date",JVHeader."Modified Date");
    //       VALIDATE("Modified Time",JVHeader."Modified Time");
    //       VALIDATE("Paid To / Received By",JVHeader."Received By");
    //       VALIDATE("Payment Mode",JVHeader."Payment Mode");
    //     END;
    //      */

    // end;

    // var
    //     JVHeader: Record Cashflowbuffer;
    //     ReportPrint: Codeunit "Test Report-Print";
    //     CurrentJnlBatchName: Code[20];

    // procedure ShowTestReport()
    // begin
    //     //ReportPrint.PrintGenJnlLine(Rec);
    // end;

    // procedure PostLines()
    // var
    //     GenJrnlLine: Record "Gen. Journal Line";
    // begin
    //     /*GenJrnlLine.SETRANGE("Journal Template Name","Journal Template Name");
    //     GenJrnlLine.SETRANGE("Journal Batch Name","Journal Batch Name");
    //     GenJrnlLine.SETRANGE("Document No.","Document No.");
    //     IF GenJrnlLine.FINDFIRST THEN BEGIN
    //       CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJrnlLine);
    //       CurrPage.UPDATE(FALSE);
    //     END;
    //      */

    // end;

    // procedure PostPrintLines()
    // begin
    //     /*CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post+Print",Rec);
    //     CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
    //     CurrPage.UPDATE(FALSE);
    //      */

    // end;

    // procedure ShowLineDimensions()
    // begin
    //     /*
    //     JrnlLineDimension.SETRANGE("Table ID",DATABASE::"Gen. Journal Line");
    //     JrnlLineDimension.SETRANGE("Journal Template Name","Journal Template Name");
    //     JrnlLineDimension.SETRANGE("Journal Batch Name","Journal Batch Name");
    //     JrnlLineDimension.SETRANGE("Document No.","Document No.");
    //     JrnlLineDimension.SETRANGE("Journal Line No.","Line No.");
    //     JournalLineDimensions.SETTABLEVIEW(JrnlLineDimension);
    //     JournalLineDimensions.RUN;
    //     */

    // end; 

}

