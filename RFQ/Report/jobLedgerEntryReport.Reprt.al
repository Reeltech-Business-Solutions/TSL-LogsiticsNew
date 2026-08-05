report 50044 "Job Ledger Entry Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './JobLedgerEntries.rdl';


    dataset
    {
        dataitem("Job Ledger Entry"; "Job Ledger Entry")
        {
            RequestFilterFields = "Service Item No.";
            column(count; counter)
            {

            }



            column("Document_No"; "Document No.")
            {

            }

            column("Posting_Date"; "Posting Date")
            {

            }

            column(Service_Item_No_; "Service Item No.")
            {

            }

            column(AssetNo; AssetNo)
            {

            }


            column("Item_No"; "No.")
            {

            }




            column("Description"; "Description")
            {

            }

            column("Quantity"; "Quantity")
            {

            }

            column("Direct_Unit_Cost_LCY"; "Direct Unit Cost (LCY)")
            {

            }

            column("Unit_Cost_LCY"; "Unit Cost (LCY)")
            {

            }

            column("Total_Cost_LCY"; "Total Cost (LCY)")
            {

            }

            column("Unit_Price_LCY"; "Unit Price (LCY)")
            {

            }

            column("Total_Price_LCY"; "Total Price (LCY)")
            {

            }

            column("Location_Code"; "Location Code")
            {

            }

            column("Warranty_Start_Date"; "Warranty Start Date")
            {

            }

            column("Warranty_End_Date"; "Warranty End Date")
            {

            }



            column(picture; CompanyInfo.Picture)
            {

            }




            trigger OnPreDataItem()
            begin
                companyInfo.Get();
                companyInfo.CalcFields(Picture);
                setFilter("Entry Type", '%1', "Entry Type"::Usage);
                setFilter("Posting Date", '%1..%2', startDate, endDate);
            end;

            trigger OnAfterGetRecord()

            begin
                counter += 1;

                serviceItem.setRange("No.", "Service Item No.");
                if serviceItem.FindFirst() then
                    AssetNo := serviceItem."Flee Veht No.";

            end;


        }




    }

    requestpage
    {
        layout
        {
            area(Content)

            {
                group(Options)

                {

                    field(startDate; startDate)
                    {
                        ShowMandatory = true;
                        ApplicationArea = All;
                        caption = 'Start Date';
                    }
                    field(endDate; endDate)
                    {
                        ShowMandatory = true;
                        ApplicationArea = All;
                        caption = 'End Date';
                    }
                }

            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    var
        counter: integer;
        companyInfo: Record "Company Information";
        startDate: Date;
        serviceItem: Record "Service Item";
        AssetNo: Text;
        endDate: Date;
}