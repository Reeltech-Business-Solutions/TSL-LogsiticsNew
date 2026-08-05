codeunit 50011 "Workflow Event Handling ExtCal"
{

    trigger OnRun()
    begin
    end;

    var
        WorkflowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";

        VoucherHeaderSendForApprovalEventDescTxt: Label 'Approval of a Voucher document is requested';
        VoucherHeaderApprovalRequestCancelEventDescTxt: Label 'Approval of a Voucher document is canceled';
        PaymentHeaderSendForApprovalEventDescTxt: Label 'Approval of a Payment Voucher document is requested';
        paymentHeaderApprovalRequestCancelEventDescTxt: Label 'Approval of a Payment Voucher document is canceled';

        StaffAdvanceSendForApprovalEventDescTxt: Label 'Approval of a Staff Advance document is requested';
        StaffAdvanceApprovalRequestCancelEventDescTxt: Label 'Approval of a Staff Advance document is canceled';
        AdvanceSurrenderSendForApprovalEventDescTxt: Label 'Approval of a Advance Surrender document is requested';
        AdvanceSurrenderApprovalRequestCancelEventDescTxt: Label 'Approval of a Advance Surrender document is canceled';
        GLAccountSendForApprovalEventDescTxt: Label 'Approval of a GLAccount document is requested';
        GLAccountApprovalRequestCancelEventDescTxt: Label 'Approval of a GLAccount document is canceled';
        StaffClaimSendForApprovalEventDescTxt: Label 'Approval of a StaffClaim document is requested';
        StaffClaimApprovalRequestCancelEventDescTxt: Label 'Approval of a StaffClaim document is canceled';
        VoucherHeaderDocReleasedEventDescTxt: Label 'Approval of a Voucher document is released';
        PaymenyHeaderDocReleasedEventDescTxt: Label 'Approval of a Payment Voucher document is released';

        //storeissue tolu begin

        StoreIssueSendForApprovalEventDescTxt: Label 'An Approval for Store Issued is requested.';
        AppReqforStoreIssueTxt: Label 'An approval request for Store Issued is approved.';
        RejectReqforStoreIssueTxt: Label 'An approval request for Store Issued is rejected.';
        DelegateReqforStoreIssueTxt: Label 'An approval request for Store Issued is delegated.';
        CancelReqforStoreIssueTxt: Label 'An approval request for Store Issued is Canceled.';

        //storeissue end


        //storeissueVoucher tolu begin

        StoreIssueVoucherSendForApprovalEventDescTxt: Label 'An Approval for Issue Voucher is requested.';
        AppReqforStoreIssueVoucherTxt: Label 'An approval request for Issue Voucher is approved.';
        RejectReqforStoreIssueVoucherTxt: Label 'An approval request for Issue Voucher is rejected.';
        DelegateReqforStoreIssueVoucherTxt: Label 'An approval request for Issue Voucher is delegated.';
        CancelReqforStoreIssueVoucherTxt: Label 'An approval request for Issue Voucher is Canceled.';

        //storeissueVoucher end

        //Job Material Request tolu begin

        JobMaterialRequestSendForApprovalEventDescTxt: Label 'An Approval for Job Material is requested.';
        AppReqforJobMaterialRequestTxt: Label 'An approval request for Job Material is approved.';
        RejectReqforJobMaterialRequestTxt: Label 'An approval request for Job Material is rejected.';
        DelegateReqforJobMaterialRequestTxt: Label 'An approval request for Job Material is delegated.';
        CancelReqforJobMaterialRequestTxt: Label 'An approval request for Job Material is Canceled.';

        //Job Material Request end

        //Service Quote tolu begin

        ServiceQuoteSendForApprovalEventDescTxt: Label 'An Approval for Service Quote is requested.';
        AppReqforServiceQuoteTxt: Label 'An approval request for Service Quote is approved.';
        RejectReqforServiceQuoteTxt: Label 'An approval request for Service Quote is rejected.';
        DelegateReqforServiceQuoteTxt: Label 'An approval request for Service Quote is delegated.';
        CancelReqforServiceQuoteTxt: Label 'An approval request for Service Quote is Canceled.';

    //Service Quote end

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        //paymentHeader
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPHeaderForApprovalCode, DATABASE::"Payments Header", PaymentHeaderSendForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCanceledPHeaderForApprovalCode, DATABASE::"Payments Header", PaymentHeaderApprovalRequestCancelEventDescTxt, 0, false);

        //Voucher
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPaymentHeaderForApprovalCode, DATABASE::"Voucher Header", VoucherHeaderSendForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCanceledPaymentHeaderForApprovalCode, DATABASE::"Voucher Header", VoucherHeaderApprovalRequestCancelEventDescTxt, 0, false);
        //staffadvance
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendStaffAdvanceForApprovalCode, DATABASE::"Staff Advance Header", StaffAdvanceSendForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCanceledStaffAdvanceForApprovalCode, DATABASE::"Staff Advance Header", StaffAdvanceApprovalRequestCancelEventDescTxt, 0, false);

        //staff advance surrender
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendAdvanceSurrenderForApprovalCode, DATABASE::"Staff Advanc Surrender Header", AdvanceSurrenderSendForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCanceledAdvanceSurrenderForApprovalCode, DATABASE::"Staff Advanc Surrender Header", AdvanceSurrenderApprovalRequestCancelEventDescTxt, 0, false);
        //GL Account 
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendGLAccountForApprovalCode, DATABASE::"G/L Account", GLAccountSendForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCanceledGLAccountForApprovalCode, DATABASE::"G/L Account", GLAccountApprovalRequestCancelEventDescTxt, 0, false);
        //StaffClaim
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendStaffClaimForApprovalCode, DATABASE::"Staff Claims Header", StaffClaimSendForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCanceledStaffClaimForApprovalCode, DATABASE::"Staff Claims Header", StaffClaimApprovalRequestCancelEventDescTxt, 0, false);

        // StoreIssue
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendStoreIssuedForApprovalCode, DATABASE::"Store Issue Header", StoreIssueSendForApprovalEventDescTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveApprovalRequestForStoreIssueCode, DATABASE::"Approval Entry", AppReqforStoreIssueTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectApprovalRequestForStoreIssueCode, DATABASE::"Approval Entry", RejectReqforStoreIssueTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateApprovalRequestForStoreIssueCode, DATABASE::"Approval Entry", DelegateReqforStoreIssueTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCanceledStoreIssuedForApprovalCode, DATABASE::"Store Issue Header", CancelReqforStoreIssueTxt, 0, FALSE);


        // StoreIssueVoucher
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendIssueVoucherForApprovalCode, DATABASE::"Inv.Voucher Header", StoreIssueVoucherSendForApprovalEventDescTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveApprovalRequestForStoreIssueVoucherCode, DATABASE::"Approval Entry", AppReqforStoreIssueVoucherTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectApprovalRequestForStoreIssueVoucherCode, DATABASE::"Approval Entry", RejectReqforStoreIssueVoucherTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateApprovalRequestForStoreIssueVoucherCode, DATABASE::"Approval Entry", DelegateReqforStoreIssueVoucherTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCanceledIssueVoucherForApprovalCode, DATABASE::"Inv.Voucher Header", CancelReqforStoreIssueVoucherTxt, 0, FALSE);


        // JobMaterialRequest
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendJobMaterialForApprovalCode, DATABASE::"Material Request Header", JobMaterialRequestSendForApprovalEventDescTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveApprovalRequestForJobMaterialRequestCode, DATABASE::"Approval Entry", AppReqforJobMaterialRequestTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectApprovalRequestForJobMaterialRequestCode, DATABASE::"Approval Entry", RejectReqforJobMaterialRequestTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateApprovalRequestForJobMaterialRequestCode, DATABASE::"Approval Entry", DelegateReqforJobMaterialRequestTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCanceledJobMaterialForApprovalCode, DATABASE::"Material Request Header", CancelReqforJobMaterialRequestTxt, 0, FALSE);

        // Service Quote
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendServicedQuoteForApprovalCode, DATABASE::"Service Header", ServicequoteSendForApprovalEventDescTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveApprovalRequestForServiceQuoteCode, DATABASE::"Approval Entry", AppReqforServiceQuoteTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectApprovalRequestForServiceQuoteCode, DATABASE::"Approval Entry", RejectReqforServiceQuoteTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateApprovalRequestForServiceQuoteCode, DATABASE::"Approval Entry", DelegateReqforServiceQuoteTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCanceledServicedQuoteForApprovalCode, DATABASE::"Service Header", CancelReqforServiceQuoteTxt, 0, FALSE);




    end;

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            //Voucher Header
            RunWorkflowOnCanceledPaymentHeaderForApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCanceledPaymentHeaderForApprovalCode, RunWorkflowOnSendPaymentHeaderForApprovalCode);

            //Payment
            RunWorkflowOnCanceledPHeaderForApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCanceledPHeaderForApprovalCode, RunWorkflowOnSendPHeaderForApprovalCode);

            //staff advance
            RunWorkflowOnCanceledStaffAdvanceForApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCanceledStaffAdvanceForApprovalCode, RunWorkflowOnSendStaffAdvanceForApprovalCode);

            //staff advance surrender
            RunWorkflowOnCanceledAdvanceSurrenderForApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCanceledAdvanceSurrenderForApprovalCode, RunWorkflowOnSendAdvanceSurrenderForApprovalCode);

            //staff GLAccount
            RunWorkflowOnCanceledGLAccountForApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCanceledGLAccountForApprovalCode, RunWorkflowOnSendGLAccountForApprovalCode);

            //StaffClaim
            RunWorkflowOnCanceledStaffClaimForApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCanceledStaffClaimForApprovalCode, RunWorkflowOnSendStaffClaimForApprovalCode);

            //StoreIssue
            RunWorkflowOnCanceledStoreIssuedForApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCanceledStoreIssuedForApprovalCode, RunWorkflowOnSendStoreIssuedForApprovalCode);

            //StoreIssue Voucher
            RunWorkflowOnCanceledIssueVoucherForApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCanceledIssueVoucherForApprovalCode, RunWorkflowOnSendIssueVoucherForApprovalCode);

            //Job Material Workflow
            RunWorkflowOnCanceledJobMaterialForApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCanceledJobMaterialForApprovalCode, RunWorkflowOnSendJobMaterialForApprovalCode);

            //Service Quote Workflow
            RunWorkflowOnCanceledServicedQuoteForApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCanceledServicedQuoteForApprovalCode, RunWorkflowOnSendServicedQuoteForApprovalCode);

            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode:
                begin
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendPaymentHeaderForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendPHeaderForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendStaffAdvanceForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendAdvanceSurrenderForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendGLAccountForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendStaffClaimForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendStoreIssuedForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendIssueVoucherForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendJobMaterialForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendServicedQuoteForApprovalCode);
                end;
        end
    end;
    //work for  StaffClaim
    [Scope('Cloud')]
    procedure RunWorkflowOnSendStaffClaimForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendStaffClaimForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnSendStaffClaimForApproval', '', false, false)]
    procedure RunWorkflowOnSendStaffClaimForApproval(var StaffClaim: Record "Staff Claims Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendStaffClaimForApprovalCode, StaffClaim);
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnCanceledStaffClaimForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCanceledStaffClaimForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnCancelStaffClaimForApproval', '', false, false)]
    procedure RunWorkflowOnCanceledStaffClaimForApproval(var StaffClaim: Record "Staff Claims Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCanceledStaffClaimForApprovalCode, StaffClaim);
    end;

    //work for  G/L Account
    [Scope('Cloud')]
    procedure RunWorkflowOnSendGLAccountForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendGLAccountForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnSendGLAccountForApproval', '', false, false)]
    procedure RunWorkflowOnSendGLAccountForApproval(var GLAccount: Record "G/L Account")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendGLAccountForApprovalCode, GLAccount);
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnCanceledGLAccountForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCanceledGLAccountForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnCancelGLAccountForApproval', '', false, false)]
    procedure RunWorkflowOnCanceledGLAccountForApproval(var GLAccount: Record "G/L Account")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCanceledGLAccountForApprovalCode, GLAccount);
    end;

    // Voucher work flow begin
    [Scope('Cloud')]
    procedure RunWorkflowOnSendPaymentHeaderForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendPaymentHeaderForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnSendPaymentHeaderForApproval', '', false, false)]
    procedure RunWorkflowOnSendPaymentHeaderForApproval(var PaymentHeader: Record "Voucher Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendPaymentHeaderForApprovalCode, PaymentHeader);
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnCanceledPaymentHeaderForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCanceledPaymentHeaderForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnCancelPaymentHeaderForApproval', '', false, false)]
    procedure RunWorkflowOnCanceledPaymentHeaderForApproval(var PaymentHeader: Record "Voucher Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCanceledPaymentHeaderForApprovalCode, PaymentHeader);
    end;

    //Payment Header
    [Scope('Cloud')]
    procedure RunWorkflowOnSendPHeaderForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendPHeaderForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnSendPHeaderForApproval', '', false, false)]
    procedure RunWorkflowOnSendPHeaderForApproval(var PHeader: Record "Payments Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendPHeaderForApprovalCode, PHeader);
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnCanceledPHeaderForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCanceledPHeaderForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnCancelPHeaderForApproval', '', false, false)]
    procedure RunWorkflowOnCanceledPHeaderForApproval(var PHeader: Record "Payments Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCanceledPHeaderForApprovalCode, PHeader);
    end;

    //

    //Staff Advance
    [Scope('Cloud')]
    procedure RunWorkflowOnSendStaffAdvanceForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendStaffAdvanceForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnSendStaffAdvanceForApproval', '', false, false)]
    procedure RunWorkflowOnSendStaffAdvanceForApproval(var StaffAdvance: Record "Staff Advance Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendStaffAdvanceForApprovalCode, StaffAdvance);
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnCanceledStaffAdvanceForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCanceledStaffAdvanceForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnCancelStaffAdvanceForApproval', '', false, false)]
    procedure RunWorkflowOnCanceledStaffAdvanceForApproval(var StaffAdvance: Record "Staff Advance Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCanceledStaffAdvanceForApprovalCode, StaffAdvance);
    end;

    //Staff Surrender
    [Scope('Cloud')]
    procedure RunWorkflowOnSendAdvanceSurrenderForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendAdvanceSurrenderForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnSendAdvanceSurrenderForApproval', '', false, false)]
    procedure RunWorkflowOnSendAdvanceSurrenderForApproval(var StaffAdvanceSurrender: Record "Staff Advanc Surrender Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendAdvanceSurrenderForApprovalCode, StaffAdvanceSurrender);
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnCanceledAdvanceSurrenderForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCanceledAdvanceSurrenderForApproval'))
    end;
    //Vocuher Header

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnCancelAdvanceSurrenderForApproval', '', false, false)]
    procedure RunWorkflowOnCanceledAdvanceSurrenderForApproval(var AdvanceSurrender: Record "Staff Advanc Surrender Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCanceledAdvanceSurrenderForApprovalCode, AdvanceSurrender);
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnAfterReleasePaymentHeaderCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnAfterReleasePaymentHeaderCodeDoc'))
    end;

    /// <summary>
    /// RunWorkflowOnAfterReleasePaymentHeaderCodeDoc.
    /// </summary>
    /// <param name="PaymentHeader">VAR Record "Voucher Header".</param>
    /// <param name="PreviewMode">Boolean.</param>
//[EventSubscriber(ObjectType::Codeunit, 415, 'OnAfterReleasePurchaseDoc', '', false, false)]
    procedure RunWorkflowOnAfterReleasePaymentHeaderCodeDoc(var PaymentHeader: Record "Voucher Header"; PreviewMode: Boolean; Var LinesWereModify: Boolean)
    begin
        if not PreviewMode then
            WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleasePaymentHeaderCode, PaymentHeader);
    end;
    //Payment Header
    [Scope('Cloud')]
    procedure RunWorkflowOnAfterReleasePHeaderCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnAfterReleasePHeaderCodeDoc'))
    end;

    procedure RunWorkflowOnAfterReleasePHeaderCodeDoc(var PHeader: Record "Payments Header"; PreviewMode: Boolean; Var LinesWereModify: Boolean)
    begin
        if not PreviewMode then
            WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleasePHeaderCode, PHeader);
    end;

    //work for  StoreIssue
    [Scope('Cloud')]
    procedure RunWorkflowOnSendStoreIssuedForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendStoreIssuedForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnSendStoreIssuedForApproval', '', false, false)]
    procedure RunWorkflowOnSendStoreIssuedForApproval(var StoreIssue: Record "Store Issue Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendStoreIssuedForApprovalCode, StoreIssue);
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnApproveApprovalRequestForStoreIssueCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnApproveApprovalRequestForStoreIssue'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnApproveApprovalRequest', '', false, false)]

    procedure RunWorkflowOnApproveApprovalRequestForStoreIssue(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveApprovalRequestForStoreIssueCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnRejectApprovalRequestForStoreIssueCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnRejectApprovalRequestForStoreIssue'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnRejectApprovalRequest', '', false, false)]

    procedure RunWorkflowOnRejectApprovalRequestForStoreIssue(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectApprovalRequestForStoreIssueCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnDelegateApprovalRequestForStoreIssueCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnDelegateApprovalRequestForStoreIssue'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnDelegateApprovalRequest', '', false, false)]

    procedure RunWorkflowOnDelegateApprovalRequestForStoreIssue(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateApprovalRequestForStoreIssueCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnCanceledStoreIssuedForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCanceledStoreIssuedForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnCancelStoreIssuedForApproval', '', false, false)]
    procedure RunWorkflowOnCanceledStoreIssuedForApproval(var StoreIssue: Record "Store Issue Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCanceledStoreIssuedForApprovalCode, StoreIssue);
    end;

    //work for  StoreIssueVoucher
    [Scope('Cloud')]
    procedure RunWorkflowOnSendIssueVoucherForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendIssueVoucherForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnSendIssueVoucherForApproval', '', false, false)]
    procedure RunWorkflowOnSendIssueVoucherForApproval(var IssueVoucher: Record "Inv.Voucher Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendIssueVoucherForApprovalCode, IssueVoucher);
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnApproveApprovalRequestForStoreIssueVoucherCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnApproveApprovalRequestForStoreIssueVoucher'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnApproveApprovalRequest', '', false, false)]

    procedure RunWorkflowOnApproveApprovalRequestForStoreIssueVoucher(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveApprovalRequestForStoreIssueVoucherCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnRejectApprovalRequestForStoreIssueVoucherCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnRejectApprovalRequestForStoreIssueVoucher'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnRejectApprovalRequest', '', false, false)]

    procedure RunWorkflowOnRejectApprovalRequestForStoreIssueVoucher(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectApprovalRequestForStoreIssueVoucherCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnDelegateApprovalRequestForStoreIssueVoucherCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnDelegateApprovalRequestForStoreIssueVoucher'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnDelegateApprovalRequest', '', false, false)]

    procedure RunWorkflowOnDelegateApprovalRequestForStoreIssueVoucher(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateApprovalRequestForStoreIssueVoucherCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnCanceledIssueVoucherForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCanceledIssueVoucherForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnCancelIssueVoucherForApproval', '', false, false)]
    procedure RunWorkflowOnCanceledIssueVoucherForApproval(var IssueVoucher: Record "Inv.Voucher Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCanceledIssueVoucherForApprovalCode, IssueVoucher);
    end;


    //workflow for Job Material Request
    [Scope('Cloud')]
    procedure RunWorkflowOnSendJobMaterialForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendJobMaterialForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnSendJobMaterialForApproval', '', false, false)]
    procedure RunWorkflowOnSendJobMaterialForApproval(var JobMatReq: Record "Material Request Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendJobMaterialForApprovalCode, JobMatReq);
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnApproveApprovalRequestForJobMaterialRequestCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnApproveApprovalRequestForJobMaterialRequest'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnApproveApprovalRequest', '', false, false)]

    procedure RunWorkflowOnApproveApprovalRequestForJobMaterialRequest(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveApprovalRequestForJobMaterialRequestCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnRejectApprovalRequestForJobMaterialRequestCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnRejectApprovalRequestForJobMaterialRequest'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnRejectApprovalRequest', '', false, false)]

    procedure RunWorkflowOnRejectApprovalRequestForJobMaterialRequest(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectApprovalRequestForJobMaterialRequestCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnDelegateApprovalRequestForJobMaterialRequestCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnDelegateApprovalRequestJobMaterialRequest'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnDelegateApprovalRequest', '', false, false)]

    procedure RunWorkflowOnDelegateApprovalRequestForJobMaterialRequest(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateApprovalRequestForJobMaterialRequestCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnCanceledJobMaterialForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCanceledJobMaterialForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnCancelJobMaterialForApproval', '', false, false)]
    procedure RunWorkflowOnCanceledJobMaterialForApproval(var JobMatReq: Record "Material Request Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCanceledJobMaterialForApprovalCode, JobMatReq);
    end;


    //workflow for  Service Quote
    [Scope('Cloud')]
    procedure RunWorkflowOnSendServicedQuoteForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendServicedQuoteForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnSendServicedQuoteForApproval', '', false, false)]
    procedure RunWorkflowOnSendServicedQuoteForApproval(var ServiceQte: Record "Service Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendServicedQuoteForApprovalCode, ServiceQte);
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnApproveApprovalRequestForServiceQuoteCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnApproveApprovalRequestForServiceQuote'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnApproveApprovalRequest', '', false, false)]

    procedure RunWorkflowOnApproveApprovalRequestForServiceQuote(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveApprovalRequestForServiceQuoteCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnRejectApprovalRequestForServiceQuoteCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnRejectApprovalRequestForServiceQuote'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnRejectApprovalRequest', '', false, false)]

    procedure RunWorkflowOnRejectApprovalRequestForServiceQuote(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectApprovalRequestForServiceQuoteCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnDelegateApprovalRequestForServiceQuoteCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnDelegateApprovalRequestForServiceQuote'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnDelegateApprovalRequest', '', false, false)]

    procedure RunWorkflowOnDelegateApprovalRequestForServiceQuote(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateApprovalRequestForServiceQuoteCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnCanceledServicedQuoteForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCanceledServicedQuoteForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50010, 'OnCancelServicedQuoteForApproval', '', false, false)]
    procedure RunWorkflowOnCanceledServicedQuoteForApproval(var ServiceQte: Record "Service Header")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCanceledServicedQuoteForApprovalCode, ServiceQte);
    end;


}

