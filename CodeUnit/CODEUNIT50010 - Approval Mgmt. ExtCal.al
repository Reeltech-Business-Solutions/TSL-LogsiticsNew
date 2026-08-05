Codeunit 50010 "Approval Mgmt. ExtCal"
{

    trigger OnRun()
    begin
    end;

    var
        WorkflowManagement: Codeunit "Workflow Management";
        WorkflowEventHandlingCust: Codeunit "Workflow Event Handling ExtCal";
        NoworkflowEnabledErr: Label 'No approval workflow for this record type is Enabled';
    //cust: page "Customer Card";

    // StaffClaim workflow begin
    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnSendStaffClaimForApproval(var StaffClaim: Record "Staff Claims Header")
    begin
    end;

    [Scope('Cloud')]
    procedure CheckStaffClaimApprovalsWorkflowEnable(StaffClaim: Record "Staff Claims Header"): Boolean
    begin
        if not IsStaffClaimDocApprovalsWorkflowEnable(StaffClaim) then
            Error(NoworkflowEnabledErr);
        exit(true);
    end;

    [Scope('Cloud')]
    procedure IsStaffClaimDocApprovalsWorkflowEnable(var StaffClaim: Record "Staff Claims Header"): Boolean
    begin
        if StaffClaim.Status <> StaffClaim.Status::Open then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(StaffClaim, WorkflowEventHandlingCust.RunWorkflowOnSendStaffClaimForApprovalCode))
    end;

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnCancelStaffClaimForApproval(var StaffClaim: Record "Staff Claims Header")
    begin
    end;
    // StaffClaim workflow end  

    // Store Issue Header workflow begin tolu5/18/23

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnSendStoreIssuedForApproval(var StoreIssue: Record "Store Issue Header")
    begin
    end;

    [Scope('Cloud')]
    procedure CheckStoreIssueApprovalsWorkflowEnable(StoreIssue: Record "Store Issue Header"): Boolean
    begin
        if not IsStoreIssueDocApprovalsWorkflowEnable(StoreIssue) then
            Error(NoworkflowEnabledErr);
        exit(true);
    end;

    [Scope('Cloud')]
    procedure IsStoreIssueDocApprovalsWorkflowEnable(var StoreIssue: Record "Store Issue Header"): Boolean
    begin
        if StoreIssue.Status <> StoreIssue.Status::Open then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(StoreIssue, WorkflowEventHandlingCust.RunWorkflowOnSendStoreIssuedForApprovalCode))
    end;

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnCancelStoreIssuedForApproval(var StoreIssue: Record "Store Issue Header")
    begin
    end;
    // StoreIssue workflow end  

    // Store Issue Voucher workflow begin tolu

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnSendIssueVoucherForApproval(var IssueVoucher: Record "Inv.Voucher Header")
    begin
    end;

    [Scope('Cloud')]
    procedure CheckStoreIssueVoucherApprovalsWorkflowEnable(IssueVoucher: Record "Inv.Voucher Header"): Boolean
    begin
        if not IsStoreIssueVoucherDocApprovalsWorkflowEnable(IssueVoucher) then
            Error(NoworkflowEnabledErr);
        exit(true);
    end;

    [Scope('Cloud')]
    procedure IsStoreIssueVoucherDocApprovalsWorkflowEnable(var IssueVoucher: Record "Inv.Voucher Header"): Boolean
    begin
        if IssueVoucher.Status <> IssueVoucher.Status::Open then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(IssueVoucher, WorkflowEventHandlingCust.RunWorkflowOnSendIssueVoucherForApprovalCode))
    end;

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnCancelIssueVoucherForApproval(var IssueVoucher: Record "Inv.Voucher Header")
    begin
    end;
    // StoreIssue Voucher workflow end  

    // Job Material request Workflow start Tolu 9/28/2023

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnSendJobMaterialForApproval(var JobMatreq: Record "Material Request Header")
    begin
    end;

    [Scope('Cloud')]
    procedure CheckJobMaterialRequestApprovalsWorkflowEnable(JobMatreq: Record "Material Request Header"): Boolean
    begin
        if not IsJobMaterialRequestDocApprovalsWorkflowEnable(JobMatreq) then
            Error(NoworkflowEnabledErr);
        exit(true);
    end;

    [Scope('Cloud')]
    procedure IsJobMaterialRequestDocApprovalsWorkflowEnable(var JobMatreq: Record "Material Request Header"): Boolean
    begin
        if JobMatreq.Status <> JobMatreq.Status::Open then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(JobMatreq, WorkflowEventHandlingCust.RunWorkflowOnSendJobMaterialForApprovalCode))
    end;

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnCancelJobMaterialForApproval(var JobMatreq: Record "Material Request Header")
    begin
    end;

    // Job Material Request Workflow End Tolu 9/28/2023

    // Service Quote workflow begin tolu 9/28/2023

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnSendServicedQuoteForApproval(var ServiceQte: Record "Service Header")
    begin
    end;

    [Scope('Cloud')]
    procedure CheckServiceQuoteApprovalsWorkflowEnable(ServiceQte: Record "Service Header"): Boolean
    begin
        if not IsServiceQuoteDocApprovalsWorkflowEnable(ServiceQte) then
            Error(NoworkflowEnabledErr);
        exit(true);
    end;

    [Scope('Cloud')]
    procedure IsServiceQuoteDocApprovalsWorkflowEnable(var ServiceQte: Record "Service Header"): Boolean
    begin
        if ServiceQte."Approval Status" <> ServiceQte."Approval Status"::Open then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(ServiceQte, WorkflowEventHandlingCust.RunWorkflowOnSendServicedQuoteForApprovalCode))
    end;

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnCancelServicedQuoteForApproval(var ServiceQte: Record "Service Header")
    begin
    end;
    // Service Quote workflow end  9/29/2023


    //G/L Account Work flow
    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnSendGLAccountForApproval(var GLAccount: Record "G/L Account")
    begin
    end;

    [Scope('Cloud')]
    procedure CheckGLAccountApprovalsWorkflowEnable(GLAccount: Record "G/L Account"): Boolean
    begin
        if not IsGLAccountDocApprovalsWorkflowEnable(GLAccount) then
            Error(NoworkflowEnabledErr);
        exit(true);
    end;

    [Scope('Cloud')]
    procedure IsGLAccountDocApprovalsWorkflowEnable(var GLAccount: Record "G/L Account"): Boolean
    begin
        if GLAccount.Status <> GLAccount.Status::Open then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(GLAccount, WorkflowEventHandlingCust.RunWorkflowOnSendGLAccountForApprovalCode))
    end;

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnCancelGLAccountForApproval(var GLAccount: Record "G/L Account")
    begin
    end;
    //Voucher Workflow
    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnSendPaymentHeaderForApproval(var PaymentHeader: Record "Voucher Header")
    begin
    end;
    //PaymentHeader Workflow
    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnSendPHeaderForApproval(var PHeader: Record "Payments Header")
    begin
    end;
    //Staff Advance
    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnSendStaffAdvanceForApproval(var StaffAdvance: Record "Staff Advance Header")
    begin
    end;

    //Advance Surrender
    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnSendAdvanceSurrenderForApproval(var StaffAdvanceSurrender: Record "Staff Advanc Surrender Header")
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnPopulateApprovalEntryArgument', '', false, false)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        PaymentHeader: Record "Voucher Header";
        PHeader: Record "Payments Header";
        //DocType: Option "Vouchers","Staff Claim","Staff Advance","Advance Surrender","Express Pv",Requisition,JV," ",GLAccount,BPV,BRV,CPV,CRV,Receipt,PettyCash,"Trip Advance";
        DocType: Enum "Approval Document Type";
        StaffAdvance: Record "Staff Advance Header";
        AdvanceSurrender: Record "Staff Advanc Surrender Header";
        GLAccount: Record "G/L Account";
        StaffClaim: Record "Staff Claims Header";
        StoreIssuerec: Record "Store Issue Header";
        IssueVoucher: Record "Inv.Voucher Header";
        JobMatreq: Record "Material Request Header";
        ServiceQte: Record "Service Header";


    begin
        case RecRef.Number of
            DATABASE::"Voucher Header":
                begin
                    RecRef.SetTable(PaymentHeader);
                    ApprovalEntryArgument."Document No." := PaymentHeader."No.";
                    begin
                        case PaymentHeader."Voucher Type" of
                            PaymentHeader."Voucher Type"::BPV:
                                begin
                                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::BPV;
                                end;
                            PaymentHeader."Voucher Type"::BRV:
                                begin
                                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::BRV;
                                end;
                            PaymentHeader."Voucher Type"::CPV:
                                begin
                                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::CPV;
                                end;
                            PaymentHeader."Voucher Type"::CRV:
                                begin
                                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::CRV;
                                end;
                            PaymentHeader."Voucher Type"::JV:
                                begin
                                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::JV;
                                end;
                            PaymentHeader."Voucher Type"::PettyCash:
                                begin
                                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::PettyCash;
                                end;
                        end;
                    end;
                end;

            DATABASE::"Payments Header":
                begin
                    RecRef.SetTable(PHeader);
                    ApprovalEntryArgument."Document No." := PHeader."No.";
                    begin
                        case PHeader."Payment Type" of
                            PHeader."Payment Type"::Normal:
                                ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Payment Voucher";
                            PHeader."Payment Type"::Express:
                                ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Requisition;
                            PHeader."Payment Type"::"Petty Cash":
                                ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::PettyCash;
                            PHeader."Payment Type"::LC:
                                ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::LC;
                        end;
                    end;
                    //Deji
                    PHeader.CALCFIELDS("Total Net Amount", "Total Payment Amount", "Total Payment Amount LCY");
                    ApprovalEntryArgument.Amount := PHeader."Total Net Amount";
                    ApprovalEntryArgument."Amount (LCY)" := PHeader."Total Payment Amount LCY";
                    ApprovalEntryArgument."Currency Code" := PHeader."Currency Code";
                    //
                end;

            DATABASE::"Staff Advance Header":
                begin
                    RecRef.SetTable(StaffAdvance);
                    ApprovalEntryArgument."Document No." := StaffAdvance."No.";
                    begin
                        case StaffAdvance."Type of Advance" of
                            StaffAdvance."Type of Advance"::"Staff Advance":
                                begin
                                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Staff Advance";
                                end;
                            StaffAdvance."Type of Advance"::"Trip Advance":
                                begin
                                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Trip Advance";
                                end;
                            StaffAdvance."Type of Advance"::LC:
                                begin
                                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::LC;
                                end;
                        end;
                    end;
                end;
            DATABASE::"Staff Advanc Surrender Header":
                begin
                    RecRef.SetTable(AdvanceSurrender);
                    ApprovalEntryArgument."Document No." := AdvanceSurrender."No.";
                    begin
                        case AdvanceSurrender."Retirement Type" of
                            AdvanceSurrender."Retirement Type"::"Advance Retirement":
                                begin
                                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Advance Retirement";
                                end;
                            AdvanceSurrender."Retirement Type"::"Trip Retirement":
                                begin
                                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Trip Retirement";
                                end;
                            AdvanceSurrender."Retirement Type"::LC:
                                begin
                                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::LC;
                                end;
                        end;
                    end;

                end;

            DATABASE::"G/L Account":
                begin
                    RecRef.SetTable(GLAccount);
                    ApprovalEntryArgument."Document No." := GLAccount."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::GLAccount;
                end;

            DATABASE::"Staff Claims Header":
                begin
                    RecRef.SetTable(StaffClaim);
                    ApprovalEntryArgument."Document No." := StaffClaim."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Staff Claim";
                end;
            DATABASE::"Store Issue Header":
                begin
                    RecRef.SetTable(StoreIssuerec);
                    ApprovalEntryArgument."Document No." := StoreIssuerec."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Store Issued";
                end;

            DATABASE::"Inv.Voucher Header":
                begin
                    RecRef.SetTable(IssueVoucher);
                    ApprovalEntryArgument."Document No." := IssueVoucher."Document No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Issue Voucher";
                end;

            DATABASE::"Material Request Header":
                begin
                    RecRef.SetTable(JobMatreq);
                    ApprovalEntryArgument."Document No." := IssueVoucher."Document No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Job Material";
                end;

            DATABASE::"Service Header":
                begin
                    RecRef.SetTable(ServiceQte);
                    ApprovalEntryArgument."Document No." := ServiceQte."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Serviced Quote";
                end;
        end;
    end;

    [Scope('Cloud')]
    procedure CheckPaymentHeaderApprovalsWorkflowEnable(PaymentHeader: Record "Voucher Header"): Boolean
    begin
        if not IsPaymentHeaderDocApprovalsWorkflowEnable(PaymentHeader) then
            Error(NoworkflowEnabledErr);
        exit(true);
    end;

    [Scope('Cloud')]
    procedure IsPaymentHeaderDocApprovalsWorkflowEnable(var PaymentHeader: Record "Voucher Header"): Boolean
    begin
        if PaymentHeader.Status <> PaymentHeader.Status::Open then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(PaymentHeader, WorkflowEventHandlingCust.RunWorkflowOnSendPaymentHeaderForApprovalCode))
    end;

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnCancelPaymentHeaderForApproval(var PaymentHeader: Record "Voucher Header")
    begin
    end;

    //Payment Header
    [Scope('Cloud')]
    procedure CheckPHeaderApprovalsWorkflowEnable(PHeader: Record "Payments Header"): Boolean
    begin
        if not IsPHeaderDocApprovalsWorkflowEnable(PHeader) then
            Error(NoworkflowEnabledErr);
        exit(true);
    end;

    [Scope('Cloud')]
    procedure IsPHeaderDocApprovalsWorkflowEnable(var PHeader: Record "Payments Header"): Boolean
    begin
        if PHeader.Status <> PHeader.Status::Open then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(PHeader, WorkflowEventHandlingCust.RunWorkflowOnSendPHeaderForApprovalCode))
    end;

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnCancelPHeaderForApproval(var PHeader: Record "Payments Header")
    begin
    end;
    //

    [Scope('Cloud')]
    procedure CheckStaffAdvanceApprovalsWorkflowEnable(StaffAdvance: Record "Staff Advance Header"): Boolean
    begin
        if not IsStaffAdvanceDocApprovalsWorkflowEnable(StaffAdvance) then
            Error(NoworkflowEnabledErr);
        exit(true);
    end;

    [Scope('Cloud')]
    procedure IsStaffAdvanceDocApprovalsWorkflowEnable(var StaffAdvance: Record "Staff Advance Header"): Boolean
    begin
        if StaffAdvance.Status <> StaffAdvance.Status::Open then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(StaffAdvance, WorkflowEventHandlingCust.RunWorkflowOnSendStaffAdvanceForApprovalCode))
    end;

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnCancelStaffAdvanceForApproval(var StaffAdvance: Record "Staff Advance Header")
    begin
    end;

    [Scope('Cloud')]
    procedure CheckAdvanceSurrenderApprovalsWorkflowEnable(AdvanceSurrender: Record "Staff Advanc Surrender Header"): Boolean
    begin
        if not IsAdvanceSurrenderDocApprovalsWorkflowEnable(AdvanceSurrender) then
            Error(NoworkflowEnabledErr);
        exit(true);
    end;

    [Scope('Cloud')]
    procedure IsAdvanceSurrenderDocApprovalsWorkflowEnable(var AdvanceSurrender: Record "Staff Advanc Surrender Header"): Boolean
    begin
        if AdvanceSurrender.Status <> AdvanceSurrender.Status::Open then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(AdvanceSurrender, WorkflowEventHandlingCust.RunWorkflowOnSendAdvanceSurrenderForApprovalCode))
    end;

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnCancelAdvanceSurrenderForApproval(var AdvanceSurrender: Record "Staff Advanc Surrender Header")
    begin
    end;
}