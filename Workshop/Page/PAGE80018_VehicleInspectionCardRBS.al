page 80018 "Vehicle Inspection Card RBS"
{
    PageType = Card;
    SourceTable = "Vehicle Inspection RBS1";
    SourceTableView = WHERE(Approved = FILTER(false));
    Caption = 'Pre-Delivery Inspection';

    layout
    {
        area(content)
        {
            group("Customer Details")
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Customer's Contact Person"; Rec."Customer's Contact Person")
                {
                    ApplicationArea = All;
                }
                field(Approved; Rec.Approved)
                {
                    ApplicationArea = All;
                }
            }
            group("Vehicle Details")
            {
                field("Vehicle Registration ID"; Rec."Vehicle Registration ID")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Make"; Rec."Vehicle Make")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Make Description"; Rec."Vehicle Make Description")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Model"; Rec."Vehicle Model")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Chasis No."; Rec."Vehicle Chasis No.")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Engine No."; Rec."Vehicle Engine No.")
                {
                    ApplicationArea = All;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                }
            }
            group(Presentation)
            {
                field("Inspected By"; Rec."Inspected By")
                {
                    ApplicationArea = All;
                }
                field("Inspected By Name"; Rec."Inspected By Name")
                {
                    ApplicationArea = All;
                }
                field("Date Inspected"; Rec."Date Inspected")
                {
                    ApplicationArea = All;
                }
                field("Light and Wiper Operation"; Rec."Light and Wiper Operation")
                {
                    ApplicationArea = All;
                }
                field("Inform Cust On Maintainance"; Rec."Inform Cust On Maintainance")
                {
                    ApplicationArea = All;
                }
                field("Operations and Accessories"; Rec."Operations and Accessories")
                {
                    ApplicationArea = All;
                }
                field("Check data of Truck VS Licence"; Rec."Check data of Truck VS Licence")
                {
                    ApplicationArea = All;
                }
                field("Tires and Spare Tyre"; Rec."Tires and Spare Tyre")
                {
                    ApplicationArea = All;
                }
                field("Engine Oil Level"; Rec."Engine Oil Level")
                {
                    ApplicationArea = All;
                }
                field("Engine(Start it)"; Rec."Engine(Start it)")
                {
                    ApplicationArea = All;
                }
                field("Tool Box"; Rec."Tool Box")
                {
                    ApplicationArea = All;
                }
                field("Delivery of User Manual"; Rec."Delivery of User Manual")
                {
                    ApplicationArea = All;
                }
                field("Inform Customer on Warranty Te"; Rec."Inform Customer on Warranty Te")
                {
                    ApplicationArea = All;
                }
                field("Manintainance and Warranty"; Rec."Manintainance and Warranty")
                {
                    ApplicationArea = All;
                }
                field("The Truck is Clean"; Rec."The Truck is Clean")
                {
                    ApplicationArea = All;
                }
                field("Check Data of truck/License"; Rec."Check Data of truck/License")
                {
                    ApplicationArea = All;
                }
                field("Present Assesories of truck"; Rec."Present Assesories of truck")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
                field("Physical Condition"; Rec."Physical Condition")
                {
                    ApplicationArea = All;
                }
                field("Owner's Manual"; Rec."Owner's Manual")
                {
                    ApplicationArea = All;
                }
                field(Jack; Rec.Jack)
                {
                    ApplicationArea = All;
                }
                field("Spanner Set"; Rec."Spanner Set")
                {
                    ApplicationArea = All;
                }
                field("Wheel Spanner"; Rec."Wheel Spanner")
                {
                    ApplicationArea = All;
                }
                field("keys"; Rec.keys)
                {
                    ApplicationArea = All;
                }
                field("Fire Extinguisher"; Rec."Fire Extinguisher")
                {
                    ApplicationArea = All;
                }
                field("C-Caution"; Rec."C-Caution")
                {
                    ApplicationArea = All;
                }
                field("Side Mirror"; Rec."Side Mirror")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action("Vehicle Inspection")
                {
                    Caption = 'Vehicle Inspection';
                    ApplicationArea =All;
                    Image = "Report";
                    //RunObject = Report Report50554;

                    trigger OnAction()
                    begin
                        //ShowDocDim;
                        /*RESET;
                        SETFILTER("No.","No.");
                        REPORT.RUN(50554,TRUE,TRUE,Rec);
                        */
                    end;
                }
            }
            action("Vehicle Inspection (Customer)")
            {
                Image = "Report";
                ApplicationArea =All;
                // RunObject = Report Report50539;
            }
        }
    }
}
