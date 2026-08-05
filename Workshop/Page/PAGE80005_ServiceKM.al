page 80005 "Service KM"
{/*
    DataCaptionFields = "Service KM", Description;
    PageType = Card;
    SourceTable = "Staff Claim Lines";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Service KM"; "Service KM")
                {
                    ShowCaption = false;
                }
                field("Service Type"; "Service Type")
                {
                    ShowCaption = false;
                }
                field(Description; Description)
                {
                    ShowCaption = false;
                }
                field("Duration in Hours"; "Duration in Hours")
                {
                    ShowCaption = false;
                }
                field("Service Item Mode"; "Service Item Mode")
                {
                    ShowCaption = false;
                }
            }
            part(Control1000000010; "Fault Material Lines")
            {
                SubPageLink = "Operation code"=FIELD("Service KM");
            }
        }
    }

    actions
    {
    }
*/
}

