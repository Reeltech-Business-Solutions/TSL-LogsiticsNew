page 50269 ItemCategoryAPI
{
    APIGroup = 'itemCat';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'itemCategoryAPI';
    DelayedInsert = true;
    EntityName = 'itemCat';
    EntitySetName = 'itemCats';
    PageType = API;
    SourceTable = "Item Category";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId;Rec.SystemId)
                {

                }
                field(code;Rec.Code)
                {
                    
                }
                field(description;Rec.Description)
                {
                    
                }
                
            }
        }
    }
}
