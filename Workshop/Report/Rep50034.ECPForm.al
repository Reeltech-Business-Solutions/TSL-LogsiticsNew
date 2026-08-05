report 50034 ECPForm
{
    ApplicationArea = All;
    Caption = 'ECPForm';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'ECPForm.rdl';

    dataset
    {
        dataitem("ECP Header"; "ECP Header")
        {
            DataItemTableView = SORTING("Doc. No.");
            RequestFilterFields = "Doc. No.", "J/C No.";

            column(Doc__No_; "Doc. No.")
            {

            }

            column(J_C_No_; "J/C No.")
            {

            }
            column(Date; Date)
            {

            }
            column(No_; "No.")
            {

            }
            column("WHeel"; "5th Wheel Serial No.")
            {

            }
            column(Brand; Brand)
            {

            }
            column(Image; Image)
            {

            }
            column(Description_Of_Part_Image_; "Description Of Part(Image)")
            {

            }
            column(Driver_s_Name; "Driver's Name")
            {

            }
            column(Staff_No; "Staff No")
            {

            }
            column(Odometer; Odometer)
            {

            }
            column(Work_Order_No; "Work Order No")
            {

            }
            column(Contract; Contract)
            {

            }
            column(Comments; Comments)
            {

            }
            column(Pic_compInfo; compInfo.Picture)
            {

            }
            column(Add_compInfo; compInfo.Address)
            {

            }
            column(compInfoPhone; compInfo."Phone No.")
            {

            }
            column(compInfoAdd; compInfo."Address 2")
            {

            }
            column(compInfo; compInfo.City)
            {

            }
            dataitem("ECP Line"; "ECP Line")
            {
                DataItemLink = "Document No." = field("Doc. No.");

                column(Line_No_; "Line No.")
                {

                }
                column(Replaceable__Parts; "Replaceable  Parts")
                {

                }
                column(Document_No_; "Document No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Fair; Fair)
                { }
                column(Good; Good)
                { }
                column(Measurement; Measurement)
                { }
                column(Poor; Poor)
                { }
                column(Remarks; Remarks)
                { }
                trigger OnAfterGetRecord()
                begin
                    //    ECPLine += 1;
                end;
            }
            dataitem("King Pin"; "King Pin")
            {
                column(Descriptions; Description)
                { }
                column(Measurements; Measurement)
                { }
                column(Remark; Remark)
                { }
                trigger OnAfterGetRecord()
                begin
                    //  KinPin += 1;
                end;
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
    trigger OnPreReport()
    begin
        compInfo.Get();
        compInfo.CalcFields(Picture);

    end;

    var
        compInfo: Record "Company Information";
        ECPLine: Integer;
        KinPin: Integer;
}
