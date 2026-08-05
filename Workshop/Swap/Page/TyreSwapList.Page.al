page 90000 "Tyre Swap List"
{
    CardPageID = "Tyre Swap";
    PageType = List;
    SourceTable = "Tyre Swap Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field("Tyre Card Updated?"; Rec."Tyre Card Updated?")
                {
                    ApplicationArea = All;
                }
                field("Driver's Name"; Rec."Driver's Name")
                {
                    ApplicationArea = All;
                }
                field("Workshop Manager"; Rec."Workshop Manager")
                {
                    ApplicationArea = All;
                }
                field("DataClerk/ Service Advisor"; Rec."DataClerk/ Service Advisor")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

