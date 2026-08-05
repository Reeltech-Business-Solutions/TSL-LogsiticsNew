page 80016 "Vehicle Reg List-Service APP"
{
    CardPageID = "Vehicle Registration Card";
    PageType = List;
    AdditionalSearchTerms = 'Vehicle Reg List-Service APP';
    SourceTable = "Vehicle Registration";
    SourceTableView = WHERE("Appointment Status" = FILTER(Approved));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Registration ID"; Rec."Registration ID")
                {
                    ApplicationArea = All;
                }
                field("Buisness Type"; Rec."Buisness Type")
                {
                    ApplicationArea = All;
                }
                field("Service Item"; Rec."Service Item")
                {
                    ApplicationArea = All;
                }
                field("Job Card No"; Rec."Job Card No")
                {
                    ApplicationArea = All;
                }
                field("Job Type"; Rec."Job Type")
                {
                    ApplicationArea = All;
                }
                field("Job Type Code"; Rec."Job Type Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut dimension 3"; Rec."Shortcut dimension 3")
                {
                    ApplicationArea = All;
                }
                field("Vehicle code"; Rec."Vehicle code")
                {
                    ApplicationArea = All;
                }
                field("Customer Bill to Code"; Rec."Customer Bill to Code")
                {
                    ApplicationArea = All;
                }
                field("Customer Ship to Code"; Rec."Customer Ship to Code")
                {
                    ApplicationArea = All;
                }
                field("Customer Bill to Name"; Rec."Customer Bill to Name")
                {
                    ApplicationArea = All;
                }
                field("Customer Ship to Name"; Rec."Customer Ship to Name")
                {
                    ApplicationArea = All;
                }
                field("Customer Bill to Address"; Rec."Customer Bill to Address")
                {
                    ApplicationArea = All;
                }
                field("Customer Ship to Address"; Rec."Customer Ship to Address")
                {
                    ApplicationArea = All;
                }
                field("Contact Person Name"; Rec."Contact Person Name")
                {
                    ApplicationArea = All;
                }
                field("Contact Person Designation"; Rec."Contact Person Designation")
                {
                    ApplicationArea = All;
                }
                field("Contact Person Telephone"; Rec."Contact Person Telephone")
                {
                    ApplicationArea = All;
                }
                field("Contact Person Mobile Number"; Rec."Contact Person Mobile Number")
                {
                    ApplicationArea = All;
                }
                field("Customer Contact email"; Rec."Customer Contact email")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Registr. Plate No."; Rec."Vehicle Registr. Plate No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Identification No"; Rec."Customer Identification No")
                {
                    ApplicationArea = All;
                }
                field("Vehicle/Equipment Make"; Rec."Vehicle/Equipment Make")
                {
                    ApplicationArea = All;
                }
                field("Vehicle/Equipment Model"; Rec."Vehicle/Equipment Model")
                {
                    ApplicationArea = All;
                }
                field("Date in Service"; Rec."Date in Service")
                {
                    ApplicationArea = All;
                }
                field("Warranty Status"; Rec."Warranty Status")
                {
                    ApplicationArea = All;
                }
                field("Engine Serial Number"; Rec."Engine Serial Number")
                {
                    ApplicationArea = All;
                }
                field("Engine Make"; Rec."Engine Make")
                {
                    ApplicationArea = All;
                }
                field("Engine Model"; Rec."Engine Model")
                {
                    ApplicationArea = All;
                }
                field("Transmission Serial Number"; Rec."Transmission Serial Number")
                {
                    ApplicationArea = All;
                }
                field("Transmission Model"; Rec."Transmission Model")
                {
                    ApplicationArea = All;
                }
                field("Fleet Manager"; Rec."Fleet Manager")
                {
                    ApplicationArea = All;
                }
                field("Fleet Manager Name"; Rec."Fleet Manager Name")
                {
                    ApplicationArea = All;
                }
                field("Fleet Manager Phone No."; Rec."Fleet Manager Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Fleet Manger  Location"; Rec."Fleet Manger  Location")
                {
                    ApplicationArea = All;
                }
                field("Fleet  Manager E-Mail"; Rec."Fleet  Manager E-Mail")
                {
                    ApplicationArea = All;
                }
                field("Aggregate 1 Description"; Rec."Aggregate 1 Description")
                {
                    ApplicationArea = All;
                }
                field("Aggregate 1 Serial Number"; Rec."Aggregate 1 Serial Number")
                {
                    ApplicationArea = All;
                }
                field("Aggregate 2 Description"; Rec."Aggregate 2 Description")
                {
                    ApplicationArea = All;
                }
                field("Aggregate 2 Serial Number"; Rec."Aggregate 2 Serial Number")
                {
                    ApplicationArea = All;
                }
                field("Aggregate 3 Description"; Rec."Aggregate 3 Description")
                {
                    ApplicationArea = All;
                }
                field("Aggregate 3 Serial Number"; Rec."Aggregate 3 Serial Number")
                {
                    ApplicationArea = All;
                }
                field("Aggregate 4 Description"; Rec."Aggregate 4 Description")
                {
                    ApplicationArea = All;
                }
                field("Aggregate 4 Serial Number"; Rec."Aggregate 4 Serial Number")
                {
                    ApplicationArea = All;
                }
                field("Aggregate 5 Description"; Rec."Aggregate 5 Description")
                {
                    ApplicationArea = All;
                }
                field("Aggregate 5 Serial Number"; Rec."Aggregate 5 Serial Number")
                {
                    ApplicationArea = All;
                }
                field("Date of Failure"; Rec."Date of Failure")
                {
                    ApplicationArea = All;
                }
                field("Failure Location"; Rec."Failure Location")
                {
                    ApplicationArea = All;
                }
                field("Narrative of Problem"; Rec."Narrative of Problem")
                {
                    ApplicationArea = All;
                }
                field("KM Run"; Rec."KM Run")
                {
                    ApplicationArea = All;
                }
                field("Hours Run"; Rec."Hours Run")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Reporting Date"; Rec."Vehicle Reporting Date")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Reporting Time"; Rec."Vehicle Reporting Time")
                {
                    ApplicationArea = All;
                }
                field("Vehicle In at LM Date"; Rec."Vehicle In at LM Date")
                {
                    ApplicationArea = All;
                }
                field("Vehicle In at LM Time"; Rec."Vehicle In at LM Time")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Accessories at In 1"; Rec."Vehicle Accessories at In 1")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Accessories at In 2"; Rec."Vehicle Accessories at In 2")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Accessories at In 3"; Rec."Vehicle Accessories at In 3")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Accessories at In 4"; Rec."Vehicle Accessories at In 4")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Accessories at In 5"; Rec."Vehicle Accessories at In 5")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Accessories at In 6"; Rec."Vehicle Accessories at In 6")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Accessories at In 7"; Rec."Vehicle Accessories at In 7")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Accessories at In 8"; Rec."Vehicle Accessories at In 8")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Accessories at In 9"; Rec."Vehicle Accessories at In 9")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Accessories at In 10"; Rec."Vehicle Accessories at In 10")
                {
                    ApplicationArea = All;
                }
                field("Pre Paid Amount"; Rec."Pre Paid Amount")
                {
                    ApplicationArea = All;
                }
                field("Pre Paid Receipt No"; Rec."Pre Paid Receipt No")
                {
                    ApplicationArea = All;
                }
                field("Registration by"; Rec."Registration by")
                {
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    var
        UserMgt: Codeunit 5700;
    begin
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
            Rec.FILTERGROUP(2);
            Rec.SETRANGE("Responsibility Center", UserMgt.GetPurchasesFilter());
            Rec.FILTERGROUP(0);
        END;
    end;

    var
    // UserMgt: Codeunit Codeunit39005487;

}

