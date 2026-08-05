codeunit 80002 "Job Material Request Release"
{
    TableNo = "Material Request Header";

    trigger OnRun()
    begin
        if Rec.Status = Rec.Status::Released then
            exit;

        Rec.TestField("Request Date");
        Rec.TestField(Status, Status::Open);
        Rec.TestField("Job No.");

        MaterialReqLine.SetRange("Document No.", Rec."No.");
        MaterialReqLine.SetFilter(Quantity, '<>0');
        if not MaterialReqLine.Find('-') then
            Error(Text001, Rec."No.");
        if not Confirm(Text002, false, Rec."No.") then
            exit;
        MaterialReqLine.Reset;
        Rec.Validate(Status, Rec.Status::Released);
        Rec.Validate("Released Date", WorkDate);
        Rec.Validate("Released By", UserId);
        Rec.Modify;
    end;

    var
        MaterialReqLine: Record "Material Request Line";
        Text001: Label 'There is nothing to release for Material Requisition %1.';
        Text002: Label 'Do you want to Release the Material Requisition %1?';
        Text003: Label 'Do you want to Reopen the Material Requisition %1?';

    procedure Reopen(var MaterialReqHeader: Record "Material Request Header")
    begin
        //  with MaterialReqHeader do begin
        if MaterialReqHeader.Status = MaterialReqHeader.Status::Open then
            exit;
        if not Confirm(Text003, false, MaterialReqHeader."No.") then
            exit;
        MaterialReqHeader.Validate(Status, Status::Open);
        MaterialReqHeader.Modify;
    end;

}

