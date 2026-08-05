report 50082 UpdateItem
{
    Caption = 'UpdateItem';
    ProcessingOnly = TRUE;
    dataset
    {
        dataitem(Item; Item)
        {
            trigger OnAfterGetRecord()
            begin

                //  Item."Costing Method" := Item."Costing Method"::Average;
                Item."Base Unit of Measure" := 'UNIT';
                Item."Purch. Unit of Measure" := 'UNIT';
                item."Sales Unit of Measure" := 'UNIT';
                Modify()
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
