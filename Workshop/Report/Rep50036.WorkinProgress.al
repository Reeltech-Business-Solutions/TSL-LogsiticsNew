report 50036 "Work in Progress"
{
    ApplicationArea = All;
    Caption = 'Work In Progress';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './WorkInProgress1.rdl';
    dataset
    {
        dataitem(Job; Job)
        {
            RequestFilterFields = "No.", "Posting Date Filter";

            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(BilltoCustomerNo; "Bill-to Customer No.")
            {
            }

            // column(UsageCost; "Usage Cost")
            // {
            // }
            column(WiP_Amount1; "WiP Amount1")
            {
            }
            column(ReportFilter; GetFilter("Posting Date Filter"))
            {
            }
            column(Repair_Location; "Repair Location")
            {

            }
            column(Location_Codes; "Location Codes")
            {

            }
            column(Service_Vehicle; "Service Vehicle")
            {

            }
            column(Status; Status)
            {

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