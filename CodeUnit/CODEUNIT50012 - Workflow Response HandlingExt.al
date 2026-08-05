codeunit 50012 "Workflow Response HandlingExt"
{

    trigger OnRun()
    begin
    end;

    var
        UnsupportedRecordTypeErr: Label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';
        WorkflowEventHandling: Codeunit "Workflow Event Handling";

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnOpenDocument', '', false, false)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        PaymentsHeader: Record "Voucher Header";
        PHeader: Record "Payments Header";
        StaffAdvance: Record "Staff Advance Header";
        AdvanceSurrender: Record "Staff Advanc Surrender Header";
        GLAccount: Record "G/L Account";
        StaffClaim: Record "Staff Claims Header";
        StoreIssue: Record "Store Issue Header";
        IssueVoucher: Record "Inv.Voucher Header";
        JobMatReq: Record "Material Request Header";
        ServiceQte: Record "Service Header";
    begin
        case RecRef.Number of
            DATABASE::"Voucher Header":
                begin
                    RecRef.SetTable(PaymentsHeader);
                    PaymentsHeader.Status := PaymentsHeader.Status::Open;
                    PaymentsHeader.Modify;
                    Handled := true;
                end;
            DATABASE::"Payments Header":
                begin
                    RecRef.SetTable(PHeader);
                    PHeader.Status := PHeader.Status::Open;
                    PHeader.Modify;
                    Handled := true;
                end;

            DATABASE::"Staff Advance Header":
                begin
                    RecRef.SetTable(StaffAdvance);
                    StaffAdvance.Status := StaffAdvance.Status::Open;
                    StaffAdvance.Modify;
                    Handled := true;
                end;

            DATABASE::"Staff Claims Header":
                begin
                    RecRef.SetTable(StaffClaim);
                    StaffClaim.Status := StaffClaim.Status::Open;
                    StaffClaim.Modify;
                    Handled := true;
                end;

            DATABASE::"Staff Advanc Surrender Header":
                begin
                    RecRef.SetTable(AdvanceSurrender);
                    AdvanceSurrender.Status := AdvanceSurrender.Status::Open;
                    AdvanceSurrender.Modify;
                    Handled := true;
                end;

            DATABASE::"G/L Account":
                begin
                    RecRef.SetTable(GLAccount);
                    GLAccount.Status := GLAccount.Status::Open;
                    GLAccount.Modify;
                    Handled := true;
                end;

            DATABASE::"Store Issue Header":
                begin
                    RecRef.SetTable(StoreIssue);
                    StoreIssue.Status := StoreIssue.Status::Open;
                    StoreIssue.Modify;
                    Handled := true;
                end;

            DATABASE::"Inv.Voucher Header":
                begin
                    RecRef.SetTable(IssueVoucher);
                    IssueVoucher.Status := IssueVoucher.Status::Open;
                    IssueVoucher.Modify;
                    Handled := true;
                end;

            DATABASE::"Material Request Header":
                begin
                    RecRef.SetTable(JobMatReq);
                    JobMatReq.Status := JobMatReq.Status::Open;
                    JobMatReq.Modify;
                    Handled := true;
                end;

            DATABASE::"Service Header":
                begin
                    RecRef.SetTable(ServiceQte);
                    ServiceQte."Approval Status" := ServiceQte."Approval Status"::Open;
                    ServiceQte.Modify;
                    Handled := true;
                end;
        end;
    end;

    local procedure CancelAllApprovalRequestsCode(): Code[128]
    begin
        exit(UpperCase('CancelAllApprovalRequests'))
    end;

    local procedure CancelAllApprovalRequests(Variant: Variant; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        RecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    RecRef.Get(ApprovalEntry."Record ID to Approve");
                    CancelAllApprovalRequests(RecRef, WorkflowStepInstance);
                end;
            else
                ApprovalsMgmt.CancelApprovalRequestsForRecord(RecRef, WorkflowStepInstance);
        end
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnReleaseDocument', '', false, false)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        PaymentHeader: Record "Voucher Header";
        PHeader: Record "Payments Header";
        StaffAdvance: Record "Staff Advance Header";
        AdvanceSurrender: Record "Staff Advanc Surrender Header";
        ApprovalEntry: Record "Approval Entry";
        Variant: Variant;
        TargetRecRef: RecordRef;
        PaymentsHeader: Record "Voucher Header";
        GLAccount: Record "G/L Account";
        StaffClaim: Record "Staff Claims Header";
        StoreIssue: Record "Store Issue Header";
        IssueVoucher: Record "Inv.Voucher Header";
        JobMatReq: Record "Material Request Header";
        ServiceQte: Record "Service Header";
    begin
        // ReleaseDocument(Variant);
        //RecRef.GETTABLE(Variant);
        case RecRef.Number of

            DATABASE::"Voucher Header":
                begin
                    RecRef.SetTable(PaymentsHeader);
                    PaymentsHeader.Status := PaymentsHeader.Status::Released;
                    PaymentsHeader.Modify;
                    Handled := true;
                end;

            DATABASE::"Payments Header":
                begin
                    RecRef.SetTable(PHeader);
                    PHeader.Status := PHeader.Status::Approved;
                    PHeader.Modify;
                    Handled := true;
                end;

            DATABASE::"Staff Advance Header":
                begin
                    RecRef.SetTable(StaffAdvance);
                    StaffAdvance.Status := StaffAdvance.Status::Approved;
                    StaffAdvance.Modify;
                    Handled := true;
                end;

            DATABASE::"Staff Advanc Surrender Header":
                begin
                    RecRef.SetTable(AdvanceSurrender);
                    AdvanceSurrender.Status := AdvanceSurrender.Status::Approved;
                    AdvanceSurrender.Modify;
                    Handled := true;
                end;

            DATABASE::"G/L Account":
                begin
                    RecRef.SetTable(GLAccount);
                    GLAccount.Status := GLAccount.Status::Approved;
                    GLAccount.Modify;
                    Handled := true;
                end;

            DATABASE::"Staff Claims Header":
                begin
                    RecRef.SetTable(StaffClaim);
                    StaffClaim.Status := StaffClaim.Status::Approved;
                    StaffClaim.Modify;
                    Handled := true;
                end;

            DATABASE::"Store Issue Header":
                begin
                    RecRef.SetTable(StoreIssue);
                    StoreIssue.Status := StoreIssue.Status::Released;
                    StoreIssue.Modify;
                    Handled := true;
                end;

            DATABASE::"Inv.Voucher Header":
                begin
                    RecRef.SetTable(IssueVoucher);
                    IssueVoucher.Status := IssueVoucher.Status::Released;
                    IssueVoucher.Modify;
                    Handled := true;
                end;

            DATABASE::"Material Request Header":
                begin
                    RecRef.SetTable(JobMatReq);
                    JobMatReq.Status := JobMatReq.Status::Released;
                    JobMatReq.Modify;
                    Handled := true;
                end;

            DATABASE::"Service Header":
                begin
                    RecRef.SetTable(ServiceQte);
                    ServiceQte."Approval Status" := ServiceQte."Approval Status"::Released;
                    ServiceQte.Modify;
                    Handled := true;
                end;

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnSetStatusToPendingApproval', '', false, false)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        PaymentHeader: Record "Voucher Header";
        PHeader: Record "Payments Header";
        StaffAdvance: Record "Staff Advance Header";
        AdvanceSurrender: Record "Staff Advanc Surrender Header";
        GLAccount: Record "G/L Account";
        StaffClaim: Record "Staff Claims Header";
        StoreIssue: Record "Store Issue Header";
        IssueVoucher: Record "Inv.Voucher Header";
        JobMatReq: Record "Material Request Header";
        ServiceQte: Record "Service Header";
    begin
        case RecRef.Number of
            DATABASE::"Voucher Header":
                begin
                    RecRef.SetTable(PaymentHeader);
                    PaymentHeader.Status := PaymentHeader.Status::"Pending Approval";
                    PaymentHeader.Modify;
                    IsHandled := true;
                end;
            DATABASE::"Payments Header":
                begin
                    RecRef.SetTable(PHeader);
                    PHeader.Status := PHeader.Status::"Pending Approval";
                    PHeader.Modify;
                    IsHandled := true;
                end;

            DATABASE::"Staff Advance Header":
                begin
                    RecRef.SetTable(StaffAdvance);
                    StaffAdvance.Status := StaffAdvance.Status::"Pending Approval";
                    StaffAdvance.Modify;
                    IsHandled := true;
                end;

            DATABASE::"Staff Claims Header":
                begin
                    RecRef.SetTable(StaffClaim);
                    StaffClaim.Status := StaffClaim.Status::"Pending Approval";
                    StaffClaim.Modify;
                    IsHandled := true;
                end;

            DATABASE::"Staff Advanc Surrender Header":
                begin
                    RecRef.SetTable(AdvanceSurrender);
                    AdvanceSurrender.Status := AdvanceSurrender.Status::"Pending Approval";
                    AdvanceSurrender.Modify;
                    IsHandled := true;
                end;

            DATABASE::"G/L Account":
                begin
                    RecRef.SetTable(GLAccount);
                    GLAccount.Status := GLAccount.Status::"Pending Approval";
                    GLAccount.Modify;
                    IsHandled := true;
                end;

            DATABASE::"Store Issue Header":
                begin
                    RecRef.SetTable(StoreIssue);
                    StoreIssue.Status := StoreIssue.Status::"Pending Approval";
                    StoreIssue.Modify;
                    IsHandled := true;
                end;

            DATABASE::"Inv.Voucher Header":
                begin
                    RecRef.SetTable(IssueVoucher);
                    IssueVoucher.Status := IssueVoucher.Status::"Pending Approval";
                    IssueVoucher.Modify;
                    IsHandled := true;
                end;

            DATABASE::"Material Request Header":
                begin
                    RecRef.SetTable(JobMatReq);
                    JobMatReq.Status := JobMatReq.Status::"Pending Approval";
                    JobMatReq.Modify;
                    IsHandled := true;
                end;

            DATABASE::"Service Header":
                begin
                    RecRef.SetTable(ServiceQte);
                    ServiceQte."Approval Status" := ServiceQte."Approval Status"::"Pending Approval";
                    ServiceQte.Modify;
                    IsHandled := true;
                end;

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]
    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        WorkflowEventHandlingCust: Codeunit "Workflow Event Handling ExtCal";
    begin
        case ResponseFunctionName of
            WorkflowResponseHandling.SetStatusToPendingApprovalCode:
                begin
                    //Vouycher Header
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                             WorkflowEventHandlingCust.RunWorkflowOnSendPaymentHeaderForApprovalCode);
                    //Payments header
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                 WorkflowEventHandlingCust.RunWorkflowOnSendPHeaderForApprovalCode);
                    //staff advance
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                            WorkflowEventHandlingCust.RunWorkflowOnSendStaffAdvanceForApprovalCode);

                    //staff Claim
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                            WorkflowEventHandlingCust.RunWorkflowOnSendStaffClaimForApprovalCode);

                    //staff adv surrender
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                            WorkflowEventHandlingCust.RunWorkflowOnSendAdvanceSurrenderForApprovalCode);

                    //staff G/L Account  
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                            WorkflowEventHandlingCust.RunWorkflowOnSendGLAccountForApprovalCode);

                    //store Issue 
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                            WorkflowEventHandlingCust.RunWorkflowOnSendStoreIssuedForApprovalCode);

                    //store Issue Voucher
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                            WorkflowEventHandlingCust.RunWorkflowOnSendIssueVoucherForApprovalCode);

                    //Job Material Request
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                            WorkflowEventHandlingCust.RunWorkflowOnSendJobMaterialForApprovalCode);

                    //Service Quote
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                            WorkflowEventHandlingCust.RunWorkflowOnSendServicedQuoteForApprovalCode);

                end;

            WorkflowResponseHandling.SendApprovalRequestForApprovalCode:
                begin
                    //Voucher Header
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                             WorkflowEventHandlingCust.RunWorkflowOnSendPaymentHeaderForApprovalCode);
                    //Payments Header
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                                                WorkflowEventHandlingCust.RunWorkflowOnSendPHeaderForApprovalCode);

                    //staff advance
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                            WorkflowEventHandlingCust.RunWorkflowOnSendStaffAdvanceForApprovalCode);
                    //Staff Claim

                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                         WorkflowEventHandlingCust.RunWorkflowOnSendStaffClaimForApprovalCode);

                    //staff advance surrender
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                            WorkflowEventHandlingCust.RunWorkflowOnSendAdvanceSurrenderForApprovalCode);

                    //GL Account
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                            WorkflowEventHandlingCust.RunWorkflowOnSendGLAccountForApprovalCode);

                    // Store Issue
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                            WorkflowEventHandlingCust.RunWorkflowOnSendStoreIssuedForApprovalCode);

                    // Store Issue Voucher
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                            WorkflowEventHandlingCust.RunWorkflowOnSendIssueVoucherForApprovalCode);

                    // Job Material Request
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                            WorkflowEventHandlingCust.RunWorkflowOnSendJobMaterialForApprovalCode);

                    // Service Quote
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                            WorkflowEventHandlingCust.RunWorkflowOnSendServicedQuoteForApprovalCode);
                end;
            CancelAllApprovalRequestsCode:
                begin
                    // Voucher Header
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledPaymentHeaderForApprovalCode);
                    //Payment Header
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                   WorkflowEventHandlingCust.RunWorkflowOnCanceledPHeaderForApprovalCode);


                    // staff advance
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledStaffAdvanceForApprovalCode);

                    // staff Claim
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledStaffClaimForApprovalCode);

                    // staff advance surrender
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledAdvanceSurrenderForApprovalCode);

                    // G/ L Account
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledGLAccountForApprovalCode);

                    // Store Issue
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledStoreIssuedForApprovalCode);

                    // Store Issue voucher
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledIssueVoucherForApprovalCode);

                    // Job Material Request
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledJobMaterialForApprovalCode);

                    // Service Quote
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledServicedQuoteForApprovalCode);
                end;

            WorkflowResponseHandling.OpenDocumentCode:
                begin
                    // Voucher Header
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledPaymentHeaderForApprovalCode);
                    //Payments Header
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                   WorkflowEventHandlingCust.RunWorkflowOnCanceledPHeaderForApprovalCode);
                    //staff advance
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledStaffAdvanceForApprovalCode);
                    // staff advance surrender
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledAdvanceSurrenderForApprovalCode);
                    // staff Claim
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledStaffClaimForApprovalCode);

                    // GL Account
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledGLAccountForApprovalCode);

                    // Store Issue
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledStoreIssuedForApprovalCode);

                    // Store Issue Voucher
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledIssueVoucherForApprovalCode);

                    // Job MAterial Request
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledJobMaterialForApprovalCode);

                    // Service Quote
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledServicedQuoteForApprovalCode);

                end;

        //   ReleaseDocumentCode:
        // BEGIN
        //         WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.ReleaseDocumentCode,WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode);
        // AddResponsePredecessor(ReleaseDocumentCode,WorkflowEventHandling.RunWorkflowOnCustomerCreditLimitNotExceededCode);
        // END;


        //         WorkflowResponseHandling.ReleaseDocumentCode:
        //            BEGIN
        //              WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.ReleaseDocumentCode,WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode);
        //
        //            END;
        end;
    end;

    local procedure ReleaseDocument(var Variant: Variant)
    var
        ApprovalEntry: Record "Approval Entry";
        ReleasePurchaseDocument: Codeunit "Release Purchase Document";
        ReleaseSalesDocument: Codeunit "Release Sales Document";
        ReleaseIncomingDocument: Codeunit "Release Incoming Document";
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        PaymentsHeader: Record "Payments Header";
        VoucherHeader: Record "Voucher Header";
        StaffAdv: Record "Staff Advance Header";
        StaffAdvanceSurrenderHeader: Record "Staff Advanc Surrender Header";
        GLAccount: Record "G/L Account";
        StaffClaim: Record "Staff Claims Header";
        StoreIssue: Record "Store Issue Header";
        IssueVoucher: Record "Inv.Voucher Header";
        JobMatReq: Record "Material Request Header";
        ServiceQte: Record "Service Header";


    begin
        RecRef.GetTable(Variant);

        case RecRef.Number of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseDocument(Variant);
                end;
            // DATABASE::"Purchase Header":
            //     ReleasePurchaseDocument.PerformManualRelease(Variant);
            // DATABASE::"Sales Header":
            //     ReleaseSalesDocument.PerformManualRelease(Variant);
            //DATABASE::"Incoming Document":
            //  ReleaseIncomingDocument.PerformManualRelease(Variant);
            //Custom Approvals
            //JV Header

            //JV Header
            //Staff Advance
            DATABASE::"Staff Advance Header":
                begin
                    StaffAdv := Variant;
                    // with StaffAdv do begin
                    if StaffAdv.Status = StaffAdv.Status::Approved then
                        exit;
                    StaffAdv.Status := StaffAdv.Status::Approved;
                    StaffAdv.Modify(true);
                end;
            // end;

            //Staff Claims
            DATABASE::"Staff Claims Header":
                begin
                    StaffClaim := Variant;
                    //with StaffClaim do begin
                    if StaffClaim.Status = StaffClaim.Status::Approved then
                        exit;
                    StaffClaim.Status := StaffClaim.Status::Approved;
                    StaffClaim.Modify(true);
                end;

            //Voucher Document
            DATABASE::"Voucher Header":
                begin
                    VoucherHeader := Variant;
                    //with VoucherHeader do begin
                    if VoucherHeader.Status = VoucherHeader.Status::Released then
                        exit;
                    VoucherHeader.Status := VoucherHeader.Status::Released;
                    VoucherHeader.Modify(true);
                end;

            //Payments Document
            DATABASE::"Payments Header":
                begin
                    PaymentsHeader := Variant;
                    // with PaymentsHeader do begin
                    if PaymentsHeader.Status = PaymentsHeader.Status::Approved then
                        exit;
                    PaymentsHeader.Status := Status::Approved;
                    PaymentsHeader.Modify(true);
                end;


            // Requisition
            //Staff Advance Retirement
            DATABASE::"Staff Advanc Surrender Header":
                begin
                    StaffAdvanceSurrenderHeader := Variant;
                    //  with StaffAdvanceSurrenderHeader do begin
                    if StaffAdvanceSurrenderHeader.Status = StaffAdvanceSurrenderHeader.Status::Approved then
                        exit;
                    StaffAdvanceSurrenderHeader.Status := StaffAdvanceSurrenderHeader.Status::Approved;
                    StaffAdvanceSurrenderHeader.Modify(true);
                end;


            //G/L account workflow
            DATABASE::"G/L Account":
                begin
                    GLAccount := Variant;
                    // with GLAccount do begin
                    if GLAccount.Status = GLAccount.Status::Approved then
                        exit;
                    GLAccount.Status := GLAccount.Status::Approved;
                    GLAccount.Modify(true);
                end;


            //Store Issue workflow
            DATABASE::"Store Issue Header":
                BEGIN
                    RecRef.SetTable(StoreIssue);
                    StoreIssue.VALIDATE(Status, StoreIssue.Status::Released);
                    StoreIssue.modify(True);
                    Variant := StoreIssue;
                END;

            //Store Issue Voucher workflow
            DATABASE::"Inv.Voucher Header":
                BEGIN
                    RecRef.SetTable(IssueVoucher);
                    IssueVoucher.VALIDATE(Status, IssueVoucher.Status::Released);
                    IssueVoucher.modify(True);
                    Variant := IssueVoucher;
                END;

            //Job Material Request workflow
            DATABASE::"Material Request Header":
                BEGIN
                    RecRef.SetTable(JobMatReq);
                    JobMatReq.VALIDATE(Status, JobMatReq.Status::Released);
                    JobMatReq.modify(True);
                    Variant := JobMatReq;
                END;

            //Service Quote workflow
            DATABASE::"Service Header":
                BEGIN
                    RecRef.SetTable(ServiceQte);
                    ServiceQte.VALIDATE("Approval Status", ServiceQte."Approval Status"::Released);
                    ServiceQte.modify(True);
                    Variant := ServiceQte;
                END;


            //Custom Approvals
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;

    local procedure ReleaseDocumentCode(): Code[128]
    begin
        exit(UpperCase('OnReleaseDocument'))
    end;
}

