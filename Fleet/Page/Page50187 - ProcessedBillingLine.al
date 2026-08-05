page 50187 "Processed Billing Line"
{
    ApplicationArea = All;
    Caption = 'Processed Billing Line';
    PageType = List;
    SourceTable = "Processed Billing Line";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Actual Journey Time"; Rec."Actual Journey Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Actual Journey Time field.';
                   // Visible = false;
                }
                field("Arrival Time at Offloading Point "; Rec."ArrivalTime at OffloadingPoint")
                {
                    Caption = 'Arrival Time at Offloading Point';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Arrival Time at Offloading Point  field.';
                   // Visible = false;
                }
                field("Arrival time at loading point"; Rec."Arrival time at loading point")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Arrival time at loading point field.';
                  //  Visible = false;
                }
                field("AvaialabilityPer Truck No.Days"; Rec."AvaialabilityPer Truck No.Days")
                {
                    Caption = 'Avaialability Per Truck  No. Days';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Avaialability Per Truck  No. Days field.';
                }
                field("Batch Entry No"; Rec."Batch Entry No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Batch Entry No field.';
                    Visible = false;
                }
                field("Batch Entry No."; Rec."Batch Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Batch Entry No. field.';
                    Visible = false;
                }
                field("Contract Id"; Rec."Contract Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contract Id field.';
                }
                field("DepartureTimefrom LoadingPoint"; Rec."DepartureTimefrom LoadingPoint")
                {
                    caption = 'Departure Time from Loading Point';
                   // Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Departure Time from Loading Point field.';
                }
                field("Departure Time from OfloadinPoint"; Rec."DepartureTimefromOfloadinPoint")
                {
                    Caption = 'Departure Time from Offloading Point';
                    //Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Departure Time from Offloading Point  field.';
                }
                field("Direct Dispatch"; Rec."Direct Dispatch")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Direct Dispatch field.';
                }
                field("Distance Covered Km"; Rec."Distance Covered Km")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Distance Covered Km field.';
                    Visible = false;
                }
                field("Drivers Code"; Rec."Drivers Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the WayBill No. field.';
                }
                field("Drivers Name"; Rec."Drivers Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Drivers Name field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Expected Journey Time"; Rec."Expected Journey Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expected Journey Time field.';
                    //Visible = false;
                }
                field("Fixed Cost"; Rec."Fixed Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fixed Cost field.';
                }
                field("Fixed Rate"; Rec."Fixed Rate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fixed Rate field.';
                }
                field("Loading Delay Cost"; Rec."Loading Delay Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Loading Delay Cost field.';
                   // Visible = false;
                }
                field("No of Days"; Rec."No of Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Days field.';
                }
                field("Off Load Depot"; Rec."Off Load Depot")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Off Load Depot field.';
                  //  Visible = false;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Product Type"; Rec."Product Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Product Type field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Qty Loaded field.';
                }
                field("Quantity Loaded NetWgt Kg"; Rec."Quantity Loaded NetWgt Kg")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity Loaded NetWgt Kg field.';
                     Visible = false;
                }
                field("Quantity Offloaded"; Rec."Quantity Offloaded Kg")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity Loaded NetWgt Kg field.';
                  //  Visible = false;
                }
                field("ResidencTime at loading point"; Rec."ResidencyTime at loading point")
                {
                    Caption = 'Residency Time at loading point';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Residency Time at loading point  field.';
                   // Visible = false;

                }
                field("ResidencyTimeatoffloadingpoint"; Rec."ResidencyTimeatoffloadingpoint")
                {
                    Caption = 'Residency Time at off-loading point';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Residency Time at off-loading point  field.';
                   // Visible = false;
                }
                field("Sales Document No."; Rec."Sales Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Document No. field.';
                }
                field(Shortages; Rec.Shortages)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortages field.';
                }
                field("Shortages Amount"; Rec."Shortages Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortages Amount field.';
                }
                field("Location Destination"; Rec."Location Destination")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Source Destination field.';
                }
                field("Tolerance KG"; Rec."Tolerance KG")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tolerance KG field.';
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transaction Date field.';
                }
                field(Treated; Rec.Treated)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Treated field.';
                }
                field("Truck Id"; Rec."Truck Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Truck Id field.';
                }
                field("Truck No."; Rec."Truck No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Truck No. field.';
                }
                field("Truck Type"; Rec."Truck Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Truck Type field.';
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Of Measure field.';
                }
                field("User Id"; Rec."User Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User Id field.';
                }
                field("Variable Cost"; Rec."Variable Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Variable Cost field.';
                }
                field("Variable Rate"; Rec."Variable Rate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Variable Rate field.';
                }
                field("WayBill No."; Rec."WayBill No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the WayBill No. field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
                   field("Item Description"; Rec."Item Description")
                {
                   ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Description field.';
                }
                field("Truck Capacity"; Rec."Truck Capacity")
                {
                     ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Truck Capacity field.';
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
                }
                field("Source Location Name"; Rec."Source Location Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Source Location Name field.';
                }
                field("Destination Location Name"; Rec."Destination Location Name")
                {
                      ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Destination Location Name field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Truck Capacity field.';
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
                }
                field("Fixed Invoice No."; Rec."Fixed Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fixed Invoice No. field.';
                }

            }
        }
    }
}
