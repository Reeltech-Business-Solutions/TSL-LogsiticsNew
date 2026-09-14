page 50277 StoreRequisitionAPI
{
    APIGroup = 'storereq';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'storeRequisitionAPI';
    DelayedInsert = true;
    EntityName = 'storereq';
    EntitySetName = 'storereqs';
    PageType = API;
    SourceTable = "Item Journal Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {

                }
                field("posting_date"; Rec."Posting Date")
                {

                }
                field("entry_type"; Rec."Entry Type")
                {

                }
                field("document_no"; Rec."Document No.")
                {

                }
                field("item_no"; Rec."Item No.")
                {

                }
                field("description"; Rec.Description)
                {

                }
                field("quantity"; Rec.Quantity)
                {

                }
                field("amount"; Rec.Amount)
                {

                }
            }
        }
    }
}
