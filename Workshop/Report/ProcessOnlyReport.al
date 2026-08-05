report 50209 "Processing Only"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Service Item"; "Service Item")
        {
            // trigger OnPreDataItem()
            // var
            //     Sales: Record "Sales Header";
            // begin
            //     Sales.SetRange("Document Type", Sales."Document Type"::invoice);
            //     if Sales.IsEmpty() then
            //         Error('Sales header is empty');
            // end;

            trigger OnAfterGetRecord()
            begin
                "Service Item".DeleteAll();
            end;
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
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
            // area(processing)
            // {
            //     action(LayoutName)
            //     {

            //     }
            // }
        }
    }

    trigger OnPostReport()
    begin
        Message('The selected Sales Orders have been deleted successfully.');
    end;

    var
        myInt: Integer;
}