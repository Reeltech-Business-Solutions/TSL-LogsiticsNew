page 50268 ItemAPI
{
    APIGroup = 'item';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'itemAPI';
    DelayedInsert = true;
    EntityName = 'item';
    EntitySetName = 'items';
    PageType = API;
    SourceTable = Item;
    ODataKeyFields = SystemId;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId;Rec.SystemId)
                {

                }
                field("no"; Rec."No.")
                {

                }
                field(description;Rec.Description)
                {
                    
                }
                field("UOM";Rec."Base Unit of Measure")
                {
                    
                }
                field(type;Rec.Type)
                {
                    
                }
                field("item_category_code";Rec."Item Category Code")
                {
                    
                }
            }
        }
    }
}
