report 50070 "negative adjustment"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './negativeadjustment.rdl';

    dataset
    {
        dataitem("Job Ledger Entry"; "Job Ledger Entry")
        {
            // DataItemTableView = where("Entry Type" = const("Entry Type"::));
            column(No_; "No.")
            {

            }
            column(Description; Description)
            {

            }
            column(Quantity; Quantity)
            {

            }

            column(assetNo; assetNo)
            {

            }

            trigger OnAfterGetRecord()
            begin
                vehicleRegistration.setRange("Service Item", "Service Item No.");
                if vehicleRegistration.FindFirst() then begin
                    assetNo := vehicleRegistration."FLeet No.";
                end;
            end;


        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
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
            area(processing)
            {
                action(LayoutName)
                {
                    ApplicationArea = All;
                }
            }
        }
    }



    var
        vehicleRegistration: Record "Vehicle Registration";
        assetNo: code[10];
}