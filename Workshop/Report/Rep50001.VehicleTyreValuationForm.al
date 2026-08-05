report 50001 VehicleTyreValuation
{
    ApplicationArea = All;
    Caption = 'Vehicle TyreValuation';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'VehicleTyreValuation.rdl';

    dataset
    {
        dataitem(VehicleTyreValuation; "Vehicle Tyre Valuation ")
        {
            column(Date; "Date")
            {
            }
            column(DriveSize; "Drive Size")
            {
            }
            column(FleetName; "Fleet Name")
            {
            }
            column(FreeRollingSize; "Free Rolling Size")
            {
            }
            column(Hours; Hours)
            {
            }
            column(InspectionBy; "Inspection By")
            {
            }
            column(InspectionByName; "Inspection By(Name)")
            {
            }
            column(Kilometers; Kilometers)
            {
            }
            column(Miles; Miles)
            {
            }
            column(No; "No.")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(Odometer; Odometer)
            {
            }
            column(SpareSize; "Spare Size")
            {
            }
            column(SteerSize; "Steer Size")
            {
            }
            column(SystemCreatedAt; SystemCreatedAt)
            {
            }
            column(SystemCreatedBy; SystemCreatedBy)
            {
            }
            column(SystemId; SystemId)
            {
            }
            column(SystemModifiedAt; SystemModifiedAt)
            {
            }
            column(SystemModifiedBy; SystemModifiedBy)
            {
            }
            column(VIR; VIR)
            {
            }
            column(VehicleNumber; "Vehicle Number")
            {
            }
            column(VehicleType; "Vehicle Type")
            {
            }
            dataitem("Vehicle Tyre Valuation Line"; "Vehicle Tyre Valuation Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Ply_Rate; "Ply Rate")
                {
                }
                column(Product_Code_; "Product Code")
                {
                }
                column(Rec_Air; "Rec Air")
                { }
                column(Air_Found; "Air Found")
                { }
                column(Tread_Depth; "Tread Depth")
                { }
                column(Line_No; "Line No")
                { }
                column(Document_No_; "Document No.")
                { }
                column(Tyre_Id; "Tyre Id")
                { }
                column(Position_Code; "Position Code")
                { }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
