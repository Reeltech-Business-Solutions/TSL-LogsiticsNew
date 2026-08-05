report 50200 "Monthly summary Invoice"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'monthlyinvoice.rdl';


    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = Sorting("No.") where("Document Type" = Const(Invoice));
            RequestFilterFields = "Sell-to Customer No.";
            column(No_; "No.")
            {

            }
            column(dateConfigured; "dateConfigured")
            {

            }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {

            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {

            }
            column(Amount; Amount)
            {

            }

            column(counter; counter)
            {

            }

            column(startDateConfigured; startDateConfigured)
            {

            }

            column(endDateConfigured; endDateConfigured)
            {

            }


            column(picture; CompanyInfo.Picture)
            {

            }

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
                Setfilter("posting Date", '%1..%2', StartDate, EndDate);
            end;

            trigger OnAfterGetRecord()
            begin
                counter += 1;
                dateConfigured := Format("Posting Date", 0, '<Day,2>/<Month,2>/<Year4>');
                startDateConfigured := Format(StartDate, 0, '<Day,2>/<Month,2>/<Year4>');
                endDateConfigured := Format(EndDate, 0, '<Day,2>/<Month,2>/<Year4>');

            end;

        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {

                field(StartDate; StartDate)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }

                field(EndDate; EndDate)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }

                // field("Sell-to Customer No."; "Sell-to Customer No.")
                // {
                //     ApplicationArea = All;
                //     ShowMandatory = true;
                //     TableRelation= Customer."No.";

                // }

            }
        }


    }



    var
        StartDate, EndDate : Date;
        counter: integer;
        CompanyInfo: Record "Company Information";
        customer: Record Customer;
        dateConfigured, startDateConfigured, endDateConfigured : Text;
}