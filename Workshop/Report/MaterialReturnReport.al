report 50039 "Material Return Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './MaterialReturnReport.rdl';



    dataset
    {

        dataitem("Store Issue Header"; "Store Issue Header")
        {
            RequestFilterFields = "No.";
            column(No_; "No.")
            {

            }
            column(Description; Description)
            {

            }
            column(Posting_Date; postingDate)
            {

            }

            column(Material_Request_No_; "Material Request No.")
            {

            }

            column(Requested_Receipt_Date; requestedreceiptDate)
            {

            }

            column(CompayInfo; CompayInfo.Picture)
            {

            }


            dataitem("Store Issue Line"; "Store Issue Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                column(Document_No_;
                "Document No.")
                {

                }

                column(Descriptions; Description)
                {

                }

                column(Location_Code; "Location Code")
                {

                }

                column(Quantity; Quantity)
                {

                }

                column(Job_No_; "Job No.")
                {

                }

                column(Job_Task_No_; "Job Task No.")
                {

                }

                column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
                {

                }

                column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code")
                {

                }

                column(Shortcut_Dimension_3_Code; "Shortcut Dimension 3 Code")
                {

                }

                column(Unit_Cost; "Unit Cost")
                {

                }

                column(Amount; Amount)
                {

                }

                column(Item_No_; "Item No.")
                {

                }
                column(Request_Date; "Request Date")
                {

                }




            }

            trigger OnAfterGetRecord()
            begin
                postingDate := FORMAT("Posting Date", 10, '<Year4>/<Month,2>/<Day,2>');
                requestedreceiptDate := FORMAT("Requested Receipt Date", 10, '<Year4>/<Month,2>/<Day,2>');
            end;
        }
    }

    requestpage
    {

        layout
        {
            // area(Content)
            // {
            //     group(GroupName)
            //     {
            //         // field(Name; SourceExpression)
            //         // {

            //         // }
            //     }
            // }
        }

        actions
        {
            // area(processing)
            // {
            //     action(LayoutName)
            //     {

            //     }
            // }
        }
    }
    trigger OnPreReport()
    begin
        CompayInfo.GET;
        CompayInfo.CALCFIELDS(Picture);
    end;

    var
        CompayInfo: Record "Company Information";
        postingDate: Text[50];
        requestedreceiptDate: Text[50];
}