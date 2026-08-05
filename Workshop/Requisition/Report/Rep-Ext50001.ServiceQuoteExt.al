reportextension 50001 ServiceQuoteExt extends "Service Quote"
{
    RDLCLayout = './ServiceQuote1.rdlc';

    dataset
    {
        add("Service Header")
        {
            column(Description; Description)
            {
            }
            column(Location_Code; "Location Code")
            {
            }
            column(Job_Type; "Job Type")
            {
            }
            column(Company1Info; Company1Info.Picture)
            {
            }
        }
    }
    trigger OnPreReport();
    begin
        Company1Info.get();
        Company1Info.calcfields(Picture);


    end;


    var
        Company1Info: Record "Company Information";
}
