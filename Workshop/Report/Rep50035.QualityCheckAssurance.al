report 50035 QualityCheckAssurance
{
    ApplicationArea = All;
    Caption = 'QualityCheckAssurance';
    DefaultLayout = RDLC;
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'QualityCheckForm.rdl';
    dataset
    {
        dataitem("Quality Check"; "Quality Check")
        {
            DataItemTableView = sorting("No.");

            column(No_; "No.")
            {
            }
            column(Driver_Name; "Driver Name")
            {
            }
            column(Location_Code; "Location Code")
            {
            }
            column(Date_In; Format("Date In"))
            {
            }
            column(Date_Out; Format("Date Out"))
            {
            }
            column(Odometer; Format(Odometer))
            {
            }
            column(Truck_No_; "Truck No.")
            {
            }
            column(Trailer_No_; "Trailer No.")
            {
            }
            column(Diesel; Format(Diesel))
            {
            }
            column(Next_Serv_Date; Format("Next Serv Date"))
            {
            }
            column(Next_MPM; Format("Next MPM"))
            {
            }
            column(compInfo; compInfo.Picture)
            {
            }
            column(compInfoN; compInfo.Name)
            {
            }
            column(Location_Name; "Location Name")
            {
            }
            dataitem("Quality Check Line"; "Quality Check Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Description; Description)
                {
                }
                column(Status; Status)
                {
                }
                column(Comment; Comment)
                {
                }
                column(InspectedBy; InspectedBy)
                {
                }
                column(DateInspected; Format(DateInspected))
                {
                }
            }

        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
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
    trigger OnPreReport()
    begin
        compInfo.Get();
        compInfo.CalcFields(Picture);
    end;

    var
        compInfo: Record "Company Information";
}
