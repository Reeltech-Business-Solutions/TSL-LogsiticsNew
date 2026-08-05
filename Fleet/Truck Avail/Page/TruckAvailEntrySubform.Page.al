page 50063 "Truck Avail. Entry Subform"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Truck Avail. Entry Lines";

    layout
    {
        area(content)
        {
            repeater(New)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = all;
                }

                field("Contract No."; Rec."Contract No.")
                {
                    ApplicationArea = All;
                }
                field("Leasing Truck No"; Rec."Leasing Truck No")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        FA: Record "Fixed Asset";
                    begin
                        IF TruckNonAvailRec.GET(TruckNonAvailRec."Document No.") THEN BEGIN
                            TruckNonAvailRec.SETRANGE("Leasing Truck No", Rec."Leasing Truck No");
                            TruckNonAvailRec.SETRANGE(Date, Rec.Date);
                            IF TruckNonAvailRec.FINDFIRST THEN
                                ERROR('Truck No. %1 exist', Rec."Vehicle Reg. No.");
                        END;
                        FA.SetRange("No.", Rec."Leasing Truck No");
                        Rec."Vehicle Make" := FA."Vehicle Make";
                        Rec."Vehicle Model" := FA."Vehicle Model";
                        Rec."Vehicle Reg. No." := FA."Registration No.";
                    end;
                }
                field("Vehicle Make"; Rec."Vehicle Make")
                {
                    ApplicationArea = all;
                }
                field("Vehicle Model"; Rec."Vehicle Model")
                {
                    ApplicationArea = all;
                }
                field("Vehicle Reg. No."; Rec."Vehicle Reg. No.")
                {
                    ApplicationArea = All;
                }
                field("Fleet No."; Rec."Fleet No.")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Name"; Rec."Vehicle Name")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Unavailable; Rec.Unavailable)
                {

                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CASE Rec.Unavailable OF
                            TRUE:
                                Rec.Quantity := 1;
                            ELSE
                                Rec.Quantity := 0;
                        END
                    end;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Start Date"; rec."Start Date")
                {
                    ApplicationArea = All;

                }
                field("End Date"; rec."End Date")
                {
                    ApplicationArea = All;

                }


            }
        }
    }

    actions
    {
    }

    var
        //ServiceItemRec: Record "5901";
        TruckNonAvailRec: Record "Truck Avail. Entry Lines";
}

