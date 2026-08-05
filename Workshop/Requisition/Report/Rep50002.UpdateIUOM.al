report 50002 "Update IUOM"
{
    ApplicationArea = All;
    Caption = 'Update IUOM';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = TRUE;
    dataset
    {
        dataitem(ItemRec; Item)
        {
            trigger OnAfterGetRecord()
            VAR
                IUOM: Record "Item Unit of Measure";
            begin
                IF NOT IUOM.GET(ItemRec."No.", ItemRec."Base Unit of Measure") THEN BEGIN
                    IUOM."Item No." := ItemRec."No.";
                    IUOM.Code := ItemRec."Base Unit of Measure";
                    IUOM."Qty. per Unit of Measure" := 1;
                    IUOM.INSERT;
                END;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
