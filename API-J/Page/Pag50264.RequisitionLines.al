// page 50264 RequisitionLines
// {
//     APIGroup = 'requisition';
//     APIPublisher = 'TSL';
//     APIVersion = 'v1.0';
//     ApplicationArea = All;
//     Caption = 'requisitionLines';
//     DelayedInsert = true;
//     EntityName = 'line';
//     EntitySetName = 'lines';
//     PageType = API;
//     SourceTable = "Purchase Line";
//     SourceTableView = where("Document Type" = filter(Quote));
//     ODataKeyFields = SystemId;
//     InsertAllowed = true;

//     layout
//     {
//         area(Content)
//         {
//             repeater(General)
//             {
//                 field(systemId; Rec.SystemId)
//                 {

//                 }
//                 field(expense_no; Rec."Expense No.")
//                 {

//                 }

//                 field(type; Rec.Type)
//                 {

//                 }

//                 field(no; Rec."No.")
//                 {

//                 }

//                 field(description; Rec.Description)
//                 {

//                 }
//                 field(quantity; Rec.Quantity)
//                 {

//                 }
//                 field(unit_of_measure; Rec."Unit of Measure")
//                 {

//                 }

//                 field(department_code; Rec."Shortcut Dimension 1 Code")
//                 {

//                 }
//                 field(trucks_code; Rec."Shortcut Dimension 3 Code")
//                 {

//                 }
//                 field(trip_type_code; Rec."Shortcut Dimension 4 Code")
//                 {

//                 }
//                 field(location_code; Rec."Location Code")
//                 {

//                 }
//                 field("header_id"; Rec."Header Id")
//                 {
//                     Caption = 'HeaderId';
//                     ApplicationArea = All;
//                 }

//             }
//         }
//     }
//     var
//         IsDeepInsert: Boolean;

//     trigger OnInsertRecord(BelowxRec: Boolean): Boolean
//     var
//         PurchaseHeader: Record "Purchase Header";
//         PurchaseLine: Record "Purchase Line";
//     begin
//         // IsDeepInsert := IsNullGuid(Rec."Header Id");



//         if IsDeepInsert then begin
//             PurchaseHeader.GetBySystemId(Rec."Header Id");

//             if IsNullGuid(Rec."Header Id") then
//                 Error('header_id is required to create a requisition line.');

//             Rec."Document Type" := PurchaseHeader."Document Type";
//             Rec."Document No." := PurchaseHeader."No.";

//             PurchaseLine.Reset();
//             PurchaseLine.SetRange("Document Type", Rec."Document Type");
//             PurchaseLine.SetRange("Document No.", Rec."Document No.");
//             if PurchaseLine.FindLast() then
//                 Rec."Line No." := PurchaseLine."Line No." + 10000

//             else
//                 Rec."Line No." := 10000;

//         end;
//     end;

//     trigger OnNewRecord(BelowxRec: Boolean)
//     var
//         PurchaseHeader: Record "Purchase Header";
//         Item: Record Item;
//     begin
//         IsDeepInsert := IsNullGuid(Rec."Header Id");
//         if not IsDeepInsert then begin
//             PurchaseHeader.GetBySystemId(Rec."Header Id");
//             Rec."Document Type" := PurchaseHeader."Document Type";
//             Rec."Document No." := PurchaseHeader."No.";

//         end;
//     end;

// }

page 50264 RequisitionLines
{
    APIGroup = 'requisition';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'requisitionLines';
    DelayedInsert = true;
    EntityName = 'line';
    EntitySetName = 'lines';
    PageType = API;
    SourceTable = "Purchase Line";
    SourceTableView = where("Document Type" = const(Quote));
    ODataKeyFields = SystemId;
    InsertAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                }
                field(header_id; Rec."Header Id")
                {
                }
                field(document_no; Rec."Document No.")
                {
                }
                field(expense_no; Rec."Expense No.")
                {
                }
                field(type; Rec.Type)
                {
                }
                field(no; Rec."No.")
                {
                }
                field(description; Rec.Description)
                {
                }
                field(quantity; Rec.Quantity)
                {
                }
                field(unit_of_measure; Rec."Unit of Measure")
                {
                }
                field(department_code; Rec."Shortcut Dimension 1 Code")
                {
                }
                field(trucks_code; Rec."Shortcut Dimension 3 Code")
                {
                }
                field(trip_type_code; Rec."Shortcut Dimension 4 Code")
                {
                }
                field(location_code; Rec."Location Code")
                {
                }
            }
        }
    }

    var
        HeaderIdMissingErr: Label 'header_id is required to create a requisition line.';
        HeaderNotFoundErr: Label 'No requisition (purchase quote) was found for header_id %1.', Comment = '%1 = the GUID sent by the caller';

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // Runs BEFORE the payload fields are validated. If we can already work out
        // which header the line belongs to (deep insert, or POST .../requisitions({id})/lines)
        // we stamp Document Type / Document No. / Line No. here, otherwise validating
        // "No.", Quantity, etc. fails with "Document No. must have a value".
        AssignHeader(GetHeaderId(), false);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        // Second chance: a flat POST to .../lines carries header_id in the body,
        // so it is only available once the payload has been applied.
        if Rec."Document No." = '' then
            AssignHeader(GetHeaderId(), true);
    end;

    local procedure AssignHeader(HeaderId: Guid; ThrowIfMissing: Boolean)
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
    begin
        if IsNullGuid(HeaderId) then begin
            if ThrowIfMissing then
                Error(HeaderIdMissingErr);
            exit;
        end;

        if not PurchaseHeader.GetBySystemId(HeaderId) then begin
            if ThrowIfMissing then
                Error(HeaderNotFoundErr, HeaderId);
            exit;
        end;

        Rec."Header Id" := PurchaseHeader.SystemId;
        Rec."Document Type" := PurchaseHeader."Document Type";
        Rec."Document No." := PurchaseHeader."No.";

        if Rec."Line No." = 0 then begin
            PurchaseLine.Reset();
            PurchaseLine.SetRange("Document Type", Rec."Document Type");
            PurchaseLine.SetRange("Document No.", Rec."Document No.");
            if PurchaseLine.FindLast() then
                Rec."Line No." := PurchaseLine."Line No." + 10000
            else
                Rec."Line No." := 10000;
        end;
    end;

    local procedure GetHeaderId(): Guid
    var
        PurchaseHeader: Record "Purchase Header";
        EmptyGuid: Guid;
        HeaderId: Guid;
    begin
        // 1. Sent in the body of a flat POST, or already stamped by the sub page link.
        if not IsNullGuid(Rec."Header Id") then
            exit(Rec."Header Id");

        // 2. Supplied as a filter by the sub page link / navigation property
        //    (deep insert and POST .../requisitions({id})/lines land here).
        if TryGetHeaderIdFromFilter(HeaderId) then
            exit(HeaderId);

        // 3. Caller sent document_no instead of header_id.
        if Rec."Document No." <> '' then
            if PurchaseHeader.Get(Rec."Document Type", Rec."Document No.") then
                exit(PurchaseHeader.SystemId);

        exit(EmptyGuid);
    end;

    local procedure TryGetHeaderIdFromFilter(var HeaderId: Guid): Boolean
    var
        FilterText: Text;
        CurrentFilterGroup: Integer;
    begin
        FilterText := Rec.GetFilter("Header Id");

        if FilterText = '' then begin
            CurrentFilterGroup := Rec.FilterGroup();
            Rec.FilterGroup(4); // sub page link filters live here
            FilterText := Rec.GetFilter("Header Id");
            Rec.FilterGroup(CurrentFilterGroup);
        end;

        FilterText := DelChr(FilterText, '=', '''"');
        if FilterText = '' then
            exit(false);

        exit(Evaluate(HeaderId, FilterText));
    end;
}