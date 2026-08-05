page 50208 "LC-Utility Advances"
{
    ApplicationArea = All;
    Caption = 'LC-Utility Advances';
    PageType = List;
    SourceTable = "Staff Advance Header";
    UsageCategory = Lists;
    CardPageID = "LC-Utility Advance Card";
    DeleteAllowed = false;
    Editable = false;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTableView = WHERE(Status = FILTER(<> Cancelled), Posted = CONST(false), "Type of Advance" = filter(LC));

    layout
    {
        area(content)
        {

            repeater(Control1)
            {

                ShowCaption = false;
                field("No."; rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Date; rec.Date)
                {
                    ApplicationArea = All;
                    Editable = DateEditable;
                }
                field("Account Type"; rec."Account Type")
                {
                    ApplicationArea = All;
                    // Editable = false;
                }
                field("Account No."; rec."Account No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Payee; rec.Payee)
                {
                    ApplicationArea = All;
                    Caption = 'Account Name';
                    Editable = false;
                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = All;
                    Editable = "Currency CodeEditable";
                }
                field("Paying Bank Account"; rec."Paying Bank Account")
                {
                    ApplicationArea = All;
                    Editable = "Paying Bank AccountEditable";
                }
                field("Bank Name"; rec."Bank Name")
                {
                    ApplicationArea = All;
                    Caption = 'Paying Bank Name';
                    Editable = false;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Total Net Amount"; rec."Total Net Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Total  Amount';
                }
                field("Total Net Amount LCY"; rec."Total Net Amount LCY")
                {
                    ApplicationArea = All;
                    Caption = 'Total  Amount';
                }
                field("Responsibility Center"; rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    Caption = 'ECU to Approve';
                    visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("Post Payment and Print")
                {
                    ApplicationArea = All;
                    Caption = 'Post Payment and Print';
                    Enabled = true;
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        CheckImprestRequiredItems;
                        PostImprest;

                        Rec.Reset;
                        Rec.SetFilter("No.", Rec."No.");
                        REPORT.Run(50020, true, true, Rec);
                        Rec.Reset;
                    end;
                }
                separator(Separator1102755021)
                {
                }
                action("Post Payment")
                {
                    Caption = 'Post Payment';
                    Image = Post;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        CheckImprestRequiredItems;
                        PostImprest;
                    end;
                }
                separator(Separator1102755026)
                {
                }
                action(Approvals)
                {
                    ApplicationArea = All;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        Approvalentries: Page "Approval Entries";
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                        DocumentType: Enum "Approval Document Type";
                    begin
                        DocumentType := DocumentType::LC;
                        //  WorkflowsEntriesBuffer.RunWorkflowEntriesPage(Rec.RecordId, DATABASE::"Staff Advance Header", DocumentType.AsInteger(), Rec."No.");
                        Approvalentries.SetRecordFilters(50063, DocumentType, rec."No.");
                        Approvalentries.Run();

                    end;
                }
                action(SendApproval)
                {
                    ApplicationArea = All;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        rec.TestField(Status, Rec.Status::Open);

                        if not LinesExists then
                            Error('There are no Lines created for this Document');

                        if not AllFieldsEntered then
                            Error('Some of the Key Fields on the Lines:[ACCOUNT NO.,AMOUNT] Have not been Entered please RECHECK your entries');

                        //Ensure No Items That should be committed that are not
                        if LinesCommitmentStatus then
                            Error('There are some lines that have not been committed');
                    end;
                }
                action(CancelApproval)
                {
                    ApplicationArea = All;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                    end;
                }
                separator(Separator1102755009)
                {
                }
                separator(Separator1102755033)
                {
                }
                action("Print/Preview")
                {
                    Caption = 'Print/Preview';
                    Image = Print;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if Rec.Status <> Rec.Status::Approved then
                            Error('You can only print after the document is Approved');
                        Rec.Reset;
                        Rec.SetFilter("No.", Rec."No.");
                        REPORT.Run(50020, true, true, Rec);
                        Rec.Reset;
                    end;
                }
                separator(Separator1102756006)
                {
                }
            }
        }
    }

    trigger OnInit()
    begin
        "Currency CodeEditable" := true;
        DateEditable := true;
        ShortcutDimension2CodeEditable := true;
        GlobalDimension1CodeEditable := true;
        "Cheque No.Editable" := true;
        "Pay ModeEditable" := true;
        "Paying Bank AccountEditable" := true;
        "Payment Release DateEditable" := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        //check if the documenent has been added while another one is still pending
        //TravReqHeader.Reset;
        //TravAccHeader.SETRANGE(SaleHeader."Document Type",SaleHeader."Document Type"::"Cash Sale");
        //TravReqHeader.SetRange(TravReqHeader.Cashier, UserId);
        //TravReqHeader.SetRange(TravReqHeader.Status, Status::Open);

        // if TravReqHeader.Count > 0 then begin
        //     Error('There are still some pending document(s) on your account. Please list & select the pending document to use.  ');
        // end;
        //*********************************END ****************************************//


        Rec."Payment Type" := Rec."Payment Type"::Imprest;
        Rec."Account Type" := Rec."Account Type"::"Bank Account";
        Rec."Type of Advance" := Rec."Type of Advance"::LC;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Account Type" := Rec."Account Type"::"Bank Account";
        Rec."Type of Advance" := Rec."Type of Advance"::LC;

        // "Responsibility Center" := UserMgt.GetPurchasesFilter();
        // //Add dimensions if set by default here
        // "Global Dimension 1 Code" := UserMgt.GetSetDimensions(UserId, 1);
        // Validate("Global Dimension 1 Code");
        // "Shortcut Dimension 2 Code" := UserMgt.GetSetDimensions(UserId, 2);
        // Validate("Shortcut Dimension 2 Code");
        // "Shortcut Dimension 3 Code" := UserMgt.GetSetDimensions(UserId, 3);
        // Validate("Shortcut Dimension 3 Code");
        // "Shortcut Dimension 4 Code" := UserMgt.GetSetDimensions(UserId, 4);
        // Validate("Shortcut Dimension 4 Code");
        // OnAfterGetCurrRecord;
    end;

    trigger OnOpenPage()
    var
        StaffAdvH: Record "Staff Advance Header";
    begin
        //SetRange(Cashier, UserId);
        // if StaffAdvH.get("No.") then
        //     StaffAdvH.SetFilter(Status, '<>%1', 10);
        Rec.SetFilter(Status, '<>%1', Rec.Status::Approved);

        if UserMgt.GetPurchasesFilter() <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Responsibility Center", UserMgt.GetPurchasesFilter());
            Rec.FilterGroup(0);

        end;
        /*
        IF UserMgt.GetSetDimensions(USERID,2) <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Shortcut Dimension 2 Code",UserMgt.GetSetDimensions(USERID,2));
          FILTERGROUP(0);
        END;
        */



    end;

    var
        PayLine: Record "Staff Advance Header";
        strFilter: Text[250];
        IntC: Integer;
        IntCount: Integer;
        Payments: Record "Cash Office Setup";
        RecPayTypes: Record "Receipts and Payment Types";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        CashierLinks: Record "Cash Office User Template";
        LineNo: Integer;
        Temp: Record "Cash Office User Template";
        JTemplate: Code[20];
        JBatch: Code[20];
        Post: Boolean;
        strText: Text[100];
        PVHead: Record "Cash Office Setup";
        BankAcc: Record "Bank Account";
        Commitments: Record Committment1;
        UserMgt: Codeunit "User Setup Management BR1";
        JournlPosted: Codeunit "Journal Post Successful1";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Payment Voucher","Petty Cash",Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Express Pv",Requisition,JV," ";
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash;
        TravReqHeader: Record "Staff Advance Header";
        // [InDataSet]
        "Payment Release DateEditable": Boolean;
        // [InDataSet]
        "Paying Bank AccountEditable": Boolean;
        // [InDataSet]
        "Pay ModeEditable": Boolean;
        // [InDataSet]
        "Cheque No.Editable": Boolean;
        // [InDataSet]
        GlobalDimension1CodeEditable: Boolean;
        // [InDataSet]
        ShortcutDimension2CodeEditable: Boolean;
        // [InDataSet]
        ShortcutDimension3CodeEditable: Boolean;
        // [InDataSet]
        ShortcutDimension4CodeEditable: Boolean;
        // [InDataSet]
        DateEditable: Boolean;
        // [InDataSet]
        "Currency CodeEditable": Boolean;

    procedure LinesCommitmentStatus() Exists: Boolean
    begin
    end;

    procedure PostImprest()
    begin

        if Temp.Get(UserId) then begin
            GenJnlLine.Reset;
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            GenJnlLine.DeleteAll;
        end;

        LineNo := LineNo + 1000;
        GenJnlLine.Init;
        GenJnlLine."Journal Template Name" := JTemplate;
        GenJnlLine."Journal Batch Name" := JBatch;
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Source Code" := 'PAYMENTJNL';
        GenJnlLine."Posting Date" := Rec."Payment Release Date";
        GenJnlLine."Document Type" := GenJnlLine."Document Type"::Invoice;
        GenJnlLine."Document No." := Rec."No.";
        GenJnlLine."External Document No." := Rec."Cheque No.";
        GenJnlLine."Account Type" := GenJnlLine."Account Type"::Employee;
        GenJnlLine."Account No." := Rec."Account No.";
        GenJnlLine.Validate(GenJnlLine."Account No.");
        GenJnlLine.Description := 'Advance: ' + Rec."Account No." + ':' + Rec.Payee;
        Rec.CalcFields("Total Net Amount");
        GenJnlLine.Amount := Rec."Total Net Amount";
        GenJnlLine.Validate(GenJnlLine.Amount);
        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"Bank Account";
        GenJnlLine."Bal. Account No." := Rec."Paying Bank Account";
        GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
        //Added for Currency Codes
        GenJnlLine."Currency Code" := Rec."Currency Code";
        GenJnlLine.Validate("Currency Code");
        GenJnlLine."Currency Factor" := Rec."Currency Factor";
        GenJnlLine.Validate("Currency Factor");
        /*
        GenJnlLine."Currency Factor":=Payments."Currency Factor";
        GenJnlLine.VALIDATE("Currency Factor");
        */
        GenJnlLine."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
        GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
        GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");

        if GenJnlLine.Amount <> 0 then
            GenJnlLine.Insert;


        GenJnlLine.Reset;
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post", GenJnlLine);

        Post := false;
        Post := JournlPosted.PostedSuccessfully();
        if Post then begin
            Rec.Posted := true;
            Rec."Date Posted" := Today;
            Rec."Time Posted" := Time;
            Rec."Posted By" := UserId;
            Rec.Status := Rec.Status::Posted;
            Rec.Modify;
        end;

    end;

    procedure CheckImprestRequiredItems()
    begin

        rec.TestField("Payment Release Date");
        rec.TestField("Paying Bank Account");
        rec.TestField("Account No.");
        rec.TestField("Account Type", Rec."Account Type"::"Bank Account");

        if Rec.Posted then begin
            Error('The Document has already been posted');
        end;

        rec.TestField(Status, Rec.Status::Approved);

        /*Check if the user has selected all the relevant fields*/

        Temp.Get(UserId);
        JTemplate := Temp."Advance Template";
        JBatch := Temp."Advance  Batch";

        if JTemplate = '' then begin
            Error('Ensure the Staff Advance Template is set up in Cash Office Setup');
        end;

        if JBatch = '' then begin
            Error('Ensure the Staff Advance Batch is set up in the Cash Office Setup')
        end;

        if not LinesExists then
            Error('There are no Lines created for this Document');

    end;

    procedure UpdateControls()
    begin
    end;

    procedure LinesExists(): Boolean
    var
        PayLines: Record "Staff Advance Lines";
    begin
        HasLines := false;
        PayLines.Reset;
        PayLines.SetRange(PayLines."No.", Rec."No.");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;

    procedure AllFieldsEntered(): Boolean
    var
        PayLines: Record "Staff Advance Lines";
    begin
        AllKeyFieldsEntered := true;
        PayLines.Reset;
        PayLines.SetRange(PayLines."No.", Rec."No.");
        if PayLines.Find('-') then begin
            repeat
                if (PayLines."Account No." = '') or (PayLines.Amount <= 0) then
                    AllKeyFieldsEntered := false;
            until PayLines.Next = 0;
            exit(AllKeyFieldsEntered);
        end;
    end;

    local procedure OnAfterGetCurrrRecord()
    begin
        xRec := Rec;
        UpdateControls();
    end;
}



