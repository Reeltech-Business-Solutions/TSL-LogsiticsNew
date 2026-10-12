// codeunit 50035 "Requisition Release Sub"
// {
//     // [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterInsertEvent', '', false, false)]
//     // local procedure ReleaseHeaderAfterLineInsert(var Rec: Record "Purchase Line"; RunTrigger: Boolean)
//     // var
//     //     PurchHeader: Record "Purchase Header";
//     // begin
//     //     if Rec.IsTemporary() then
//     //         exit;
//     //     if not PurchHeader.Get(Rec."Document Type", Rec."Document No.") then
//     //         exit;
//     //     if PurchHeader."Purchase Type" <> PurchHeader."Purchase Type"::"Local Requisition" then
//     //         exit;
//     //     if PurchHeader.Status = PurchHeader.Status::Released then
//     //         exit;

//     //     PurchHeader.Status := PurchHeader.Status::Released;
//     //     PurchHeader.Modify();
//     // end;

//     [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeValidateEvent', 'Type', false, false)]
//     local procedure ReopenBeforeType(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line"; CurrFieldNo: Integer)
//     begin
//         SetStatus(Rec, Enum::"Purchase Document Status"::Open);
//     end;

//     [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterInsertEvent', '', false, false)]
//     local procedure ReleaseAfterInsert(var Rec: Record "Purchase Line"; RunTrigger: Boolean)
//     begin
//         SetStatus(Rec, Enum::"Purchase Document Status"::Released);
//     end;

//     local procedure SetStatus(PurchLine: Record "Purchase Line"; NewStatus: Enum "Purchase Document Status")
//     var
//         PurchHeader: Record "Purchase Header";
//     begin
//         if PurchLine.IsTemporary() then
//             exit;
//         if not PurchHeader.Get(PurchLine."Document Type", PurchLine."Document No.") then
//             exit;
//         if PurchHeader."Purchase Type" <> PurchHeader."Purchase Type"::"Local Requisition" then
//             exit;
//         if PurchHeader.Status = NewStatus then
//             exit;

//         PurchHeader.Status := NewStatus;
//         PurchHeader.Modify(false);
//     end;
// }
