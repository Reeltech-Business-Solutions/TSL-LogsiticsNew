page 90002 "Tyre Swap Lines"
{
    PageType = ListPart;
    SourceTable = "Tyre Swap line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Donor Vehicle Code"; Rec."Donor Vehicle Code")
                {
                    ApplicationArea = All;
                }
                field("Donor Vehicle Tyre Pos. Left"; Rec."Donor Vehicle Tyre Pos. Left")
                {
                    ApplicationArea = All;
                }
                field("Donor Vehicle Tyre Pos. Right"; Rec."Donor Vehicle Tyre Pos. Right")
                {
                    ApplicationArea = All;
                }

                field("Receiver Vehicle Code"; Rec."Receiver Vehicle Code")
                {
                    ApplicationArea = All;
                }
                field("RecieverTyrePos.n Old-New Left"; Rec."RecieverTyrePos.n Old-New Left")
                {
                    Caption = 'Reciever Tyre Pos.n Old-New Lef';
                    ApplicationArea = All;
                }
                field("RecieverTyrePos. Old-New Right"; Rec."RecieverTyrePos. Old-New Right")
                {
                    Caption = 'Reciever Tyre Pos. Old-New Right';
                    ApplicationArea = All;
                }

                field("Tyre KM Covered"; Rec."Tyre KM Covered")
                {
                    ApplicationArea = All;
                }
                field("Thread Depth"; Rec."Thread Depth")
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
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

