pageextension 50066 ColumnLayoutExt extends "Column Layout"
{
    layout
    {
        addafter("Comparison Date Formula")
        {
            field("ComparisonPeriodFormula"; Rec."Comparison Period Formula")
            {
                ApplicationArea = All;
                caption = 'Comparison period formula';

            }
        }
    }
}
