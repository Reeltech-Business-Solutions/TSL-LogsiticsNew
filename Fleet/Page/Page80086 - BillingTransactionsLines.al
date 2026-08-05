page 80086 "Billing Transactions Lines"
{

    ApplicationArea = All;
    Caption = 'Billing Transactions Lines';
    PageType = List;
    SourceTable = "Billing Line";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                    ApplicationArea = All;
                }
                field("Contract Id"; Rec."Contract Id")
                {
                    ToolTip = 'Specifies the value of the Contract Id field.';
                    ApplicationArea = All;
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ToolTip = 'Specifies the value of the Transaction Date field.';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Truck No."; Rec."Truck No.")
                {
                    ToolTip = 'Specifies the value of the Truck No. field.';
                    ApplicationArea = All;
                }
                field("Truck Type"; Rec."Truck Type")
                {
                    ToolTip = 'Specifies the value of the Truck Type field.';
                    ApplicationArea = All;
                     Visible = false;
                }

                field("Batch Entry No"; Rec."Batch Entry No")
                {
                    ToolTip = 'Specifies the value of the No of Trips field.';
                    ApplicationArea = All;
                     Visible = false;
                }
                field("No of Days"; Rec."No of Days")
                {
                    ToolTip = 'Specifies the value of the " of Days field.';
                    ApplicationArea = All;
                     Visible = false;
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No.t field.';
                    ApplicationArea = All;
                     Visible = false;
                }

                field("Distance Covered Km"; Rec."Distance Covered Km")
                {
                    ToolTip = 'Specifies the value of the Distance Covered Km field.';
                    ApplicationArea = All;
                }
                field("Direct Dispatch"; Rec."Direct Dispatch")
                {
                    ToolTip = 'Specifies the value of the Direct Dispatch field.';
                    ApplicationArea = All;
                     Visible = false;
                }
                field("Fixed Cost"; Rec."Fixed Cost")
                {
                    ToolTip = 'Specifies the value of the Fixed Cost field.';
                     Visible = false;
                }
                field("Loading Delay Cost"; Rec."Loading Delay Cost")
                {
                    ToolTip = 'Specifies the value of the Loading Delay Cost field.';
                    Visible = false;

                }
                field("Qty Loaded"; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Qty Loaded field.';
                    ApplicationArea = All;
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    Caption = 'Unit Of Measure';
                    ApplicationArea = All;
                }
                field("Variable Cost"; Rec."Variable Cost")
                {
                    ToolTip = 'Specifies the value of the Variable Cost field.';
                    //  ApplicationArea = All;
                     Visible = false;
                }

                field(Shortages; Rec.Shortages)
                {
                    ToolTip = 'Specifies the value of the Shortages field.';
                    ApplicationArea = All;
                }
                field("Shortages Amount"; Rec."Shortages Amount")
                {
                    ToolTip = 'Specifies the value of the Shortages Amount field.';
                    ApplicationArea = All;
                }
                field("ArrivalTime at OffloadingPoint"; Rec."ArrivalTime at OffloadingPoint")
                {
                    Caption = 'Arrival Time at Offloading Point';
                    ToolTip = 'Specifies the value of the Arrival Time at Offloading Point  field.';
                    // Visible = false;
                    ApplicationArea = All;
                }
                field("Arrival time at loading point"; Rec."Arrival time at loading point")
                {
                    ToolTip = 'Specifies the value of the Arrival time at loading point field.';
                    //  Visible = false;
                    ApplicationArea = All;
                }
                field("Avaialability Per TruckNo.Days"; Rec."Avaialability Per TruckNo.Days")
                {
                    Caption = 'Avaialability Per Truck  No. Days';
                    ToolTip = 'Specifies the value of the Avaialability Per Truck  No. Days field.';
                    // ApplicationArea = All;
                }
                field("DepartureTimefrom LoadingPoint"; Rec."DepartureTimefrom LoadingPoint")
                {
                    Caption = 'Departure Time from Loading Point';
                    ToolTip = 'Specifies the value of the Departure Time from Loading Point field.';
                    //  Visible = false;
                    ApplicationArea = All;
                }
                field("Departure Time from OfloadinPoint"; Rec."DepartureTimefromOfloadinPoint")
                {
                    Caption = 'Departure Time from Offloading Point';
                    ToolTip = 'Specifies the value of the Departure Time from Offloading Point  field.';
                    //  Visible = false;
                    ApplicationArea = All;
                }
                field("Residency Time at loadingpoint"; Rec."Residency Time at loadingpoint")
                {
                    Caption = 'Residency Time at loading point';
                    ToolTip = 'Specifies the value of the Residency Time at loading point  field.';
                    Visible = false;
                    ApplicationArea = All;
                }
                field("ResidencyTime at ofloadinpoint"; Rec."ResidencyTime at ofloadinpoint")
                {
                    Caption = 'Residency Time at off-loading point';
                    ToolTip = 'Specifies the value of the Residency Time at off-loading point  field.';
                    //  Visible = false;
                    ApplicationArea = All;
                }
                field("Tolerance"; Rec."Tolerance KG")
                {
                    ToolTip = 'Specifies the value of the Tolerance KG field.';
                    ApplicationArea = All;
                }
                field("User Id"; Rec."User Id")
                {
                    ToolTip = 'Specifies the value of the User Id field.';
                    ApplicationArea = All;
                     Visible = false;
                }
                field("Quantity Loaded NetWgt Kg"; Rec."Quantity Loaded NetWgt Kg")
                {
                    Caption = 'Quantity Loaded';
                    ApplicationArea = All;
                }
                field("Quantity Off loaded"; Rec."Quantity Offloaded Kg")
                {
                    Caption = 'Quantity Delivered';
                    // Visible = false;
                    ApplicationArea = All;
                }
                field("Actual Journey Time"; Rec."Actual Journey Time")
                {
                    Caption = 'Actual Journey Time';
                    Visible = false;
                    ApplicationArea = All;
                }

                field("Expected Journey Time"; Rec."Expected Journey Time")
                {
                    Caption = 'Expected Journey Time';
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Sales Document No."; Rec."Sales Document No.")
                {
                    Caption = 'Sales Document No.';
                    ApplicationArea = All;
                     Visible = false;
                }
                field("Fixed Rate"; Rec."Fixed Rate")
                {
                    Caption = 'Fixed Rate';
                    ApplicationArea = All;
                }
                field("Variable Rate"; Rec."Variable Rate")
                {
                    Caption = 'Variable Rate';
                    ApplicationArea = All;
                }
                field(Treated; Rec.Treated)
                {
                    Caption = 'Treated';
                    ApplicationArea = All;
                     Visible = false;
                }
                field("Drivers Name"; Rec."Drivers Name")
                {
                    Caption = 'Drivers Name';
                    ApplicationArea = All;
                }
                field("Truck Id"; Rec."Truck Id")
                {
                    Caption = 'Truck Id';
                    ApplicationArea = All;
                }
                field("WayBill No."; Rec."WayBill No.")
                {
                    Caption = 'WayBill No.';
                    ApplicationArea = All;
                }
                field("Drivers Code"; Rec."Drivers Code")
                {
                    Caption = 'Drivers Code';
                    ApplicationArea = All;
                     Visible = false;
                }
                field("Location Destination"; Rec."Location Destination")
                {
                    Caption = 'Destination';
                    ApplicationArea = All;
                }
                field("Product Type"; Rec."Product Type")
                {
                    Caption = 'Product';
                    ApplicationArea = All;
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Description field.';
                     Visible = false;
                }
                field("Truck Capacity"; Rec."Truck Capacity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Truck Capacity field.';
                     Visible = false;
                }
                field("Trip No."; Rec."Trip No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trip No. field.';
                }
                field("SMR Number"; Rec."SMR Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SMR Number field.';
                     Visible = false;
                }
                field("Source Location Name"; Rec."Source Location Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Source Location Name field.';
                     Visible = false;
                }
                field("Destination Location Name"; Rec."Destination Location Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Destination Location Name field.';
                     Visible = false;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Truck Capacity field.';
                     Visible = false;
                }
                field("Available days"; Rec."Available days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("FMN Idle"; Rec."FMN Idle")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the FMN Idle field.';
                }
                field("CST Idle"; Rec."CST Idle")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CST Idle field.';
                }
                field("SO Number"; Rec."SO Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SO Number field.';
                     Visible = false;
                }
                field("Fixed Invoice No."; Rec."Fixed Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fixed Invoice No. field.';
                     Visible = false;
                }
                field("Loading Point";Rec."Loading Point")
                {
                    ApplicationArea = All;
                }
                field("Freight(rate) Naira";Rec."Freight(rate) Naira")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Diesel Quantity/Volume";Rec."Diesel Quantity/Volume")
                {
                    ApplicationArea = All;
                }
                field("Diesel Rate";Rec."Diesel Rate")
                {
                    ApplicationArea = All;
                }
                field("Freight(rate) USD";Rec."Freight(rate) USD")
                {
                    ApplicationArea = All;
                }
                field("Driver's No.";Rec."Driver's No.")
                {
                    ApplicationArea = All;
                }
                field("Loading Date";Rec."Loading Date")
                {
                    ApplicationArea = All;
                }
                field(Overage;Rec.Overage)
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
            group("Upload&Transaction")
            {
                Caption = 'Upload&Transaction';
                //tolu 5/23/23Image = "Upload Transaction";
                action("Upload Transaction")
                {
                    Caption = 'Upload Transaction';
                    Image = "Report";
                    RunObject = Report 50025;
                    ApplicationArea = All;

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
        }
    }

}
