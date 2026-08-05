codeunit 80005 PurchReqRelease
{
    TableNo = "Store Issue Header";

    trigger OnRun()
    var
        PurchReqLine: Record "Store Issue Line";
    begin
        IF Rec.Status = Rec.Status::Released THEN
            EXIT;

        Rec.TESTFIELD("No.");
        Rec.TESTFIELD("Posting Date");
        IF NOT Rec.PurchReqtLineExist THEN
            ERROR(Text001, Rec."No.", Rec."Request Type");

        Rec.VALIDATE(Status, Rec.Status::Released);
        Rec.MODIFY(TRUE);
    end;

    var
        Text001: Label 'Line does not exist in %1,%2';
        Text002: Label 'This Request can only be released when the approval process is complete.';
        Text003: Label 'The Approval Process must be cancelled or completed to reopen this Request.';

    procedure Reopen(var PurchReqHeader: Record "Store Issue Header")
    begin
        // WITH PurchReqHeader DO BEGIN
        IF PurchReqHeader.Status = PurchReqHeader.Status::Open THEN
            EXIT;
        PurchReqHeader.VALIDATE(Status, Status::Open);
        PurchReqHeader.MODIFY(TRUE);

    end;

    procedure PerformManualRelease(var PurchReqHeader: Record "Store Issue Header")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalManagement: Codeunit "Approval mgt custom";
        ApprovedOnly: Boolean;
    begin
        // WITH PurchReqHeader DO BEGIN
        CODEUNIT.RUN(CODEUNIT::PurchReqRelease, PurchReqHeader);

    end;

    procedure PerformManualReopen(var PurchReqHeader: Record "Store Issue Header")
    var
        ApprovalManagement: Codeunit "Approval mgt custom";
    begin
        //  WITH PurchReqHeader DO BEGIN
        /*IF ApprovalManagement.CheckApprPurchRequest(PurchReqHeader) THEN BEGIN
          CASE Status OF
            Status::"Pending Approval":
              ERROR(Text003);
            Status::Open,Status::Released:
              Reopen(PurchReqHeader);
          END;
        END ELSE */
        Reopen(PurchReqHeader);


    end;
}

