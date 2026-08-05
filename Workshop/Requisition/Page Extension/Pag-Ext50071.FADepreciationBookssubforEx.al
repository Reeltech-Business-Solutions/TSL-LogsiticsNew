pageextension 50071 "FA Depreciation Bookssubfor,Ex" extends "FA Depreciation Books Subform"
{
    layout
    {
        addafter(BookValue)
        {
            field("Ending BookValue"; Rec."Ending Book Value")
            {
                Visible = true;
                ApplicationArea = All;

            }
        }
    }
}
