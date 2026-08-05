report 50038 ItmeEntryDates
{
    Caption = 'ItmeEntryDates';
    ProcessingOnly = true;
    dataset
    {
        dataitem(ILE; "Item Ledger Entry")
        {
            DataItemTableView = Where("Document No." = FILTER('ISSUEOUTBENING'));
            trigger OnAfterGetRecord()
            begin
                "Posting Date" := DMY2Date(17, 02, 2026);
                "Document Date" := DMY2Date(17, 02, 2026);
                "Last Invoice Date" := DMY2Date(17, 02, 2026);
                Modify;
            end;
        }
        dataitem(VLE; "Value Entry")
        {
            DataItemTableView = Where("Document No." = FILTER('ISSUEOUTBENING'));
            trigger OnAfterGetRecord()
            begin
                "Posting Date" := DMY2Date(17, 02, 2026);
                "Document Date" := DMY2Date(17, 02, 2026);
                "Valuation Date" := DMY2Date(17, 02, 2026);

                Modify;
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
