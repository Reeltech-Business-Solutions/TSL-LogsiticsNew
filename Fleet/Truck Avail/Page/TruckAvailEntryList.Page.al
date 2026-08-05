page 50053 "Truck Avail. Entry List"
{
    CardPageID = "Truck Non-Avail Entry";
    PageType = List;
    SourceTable = "Truck Availability Entry";

    layout
    {
        area(content)
        {
            repeater(New)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("User Date"; Rec."User Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnModifyRecord(): Boolean
    begin
        Rec."User ID" := USERID;
        Rec."User Date" := TODAY;
    end;
}

