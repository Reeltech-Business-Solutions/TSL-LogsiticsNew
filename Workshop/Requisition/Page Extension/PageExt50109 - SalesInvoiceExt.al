pageextension 50109 "Sales Invoice Ext" extends "Sales Invoice"
{
    layout
    {
        addafter("Posting Date")
        {
            field("Start Date"; Rec."Start Date")
            {
                Caption = 'Start Date';
                ApplicationArea = All;
            }

            field("End Date"; Rec."End Date")
            {
                Caption = 'End Date';
                ApplicationArea = All;
            }

            field("Contract Id"; Rec."Contract Id")
            {
                Caption = 'Contract Id';
                ApplicationArea = All;
            }
            field("Monthly Status"; Rec."Monthly Status")
            {
                Caption = 'Monthly Status';
                ApplicationArea = All;
            }



        }
        addafter("Sell-to")
        {
            field("OEM Code"; Rec."OEM Code")
            {
                ApplicationArea = All;
            }
            field(LPO; Rec.LPO)
            {
                ApplicationArea = All;
            }
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = All;
            }
            field("Asset No."; Rec."Asset No.")
            {
                ApplicationArea = All;
            }
            field("Service Vehicle"; Rec."Service Vehicle")
            {
                ApplicationArea = All;
            }
            field(Trailer; Rec.Trailer)
            {
                ApplicationArea = All;
            }
            field("Trailer No."; Rec."Trailer No.")
            {
                ApplicationArea = All;
            }

        }


    }

    actions
    {

        addafter("&Invoice")
        {
            action(BillingInvoice)
            {
                ApplicationArea = All;
                Caption = 'BillingInvoice', comment = 'NLB="YourLanguageCaption"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    BillingInvoice: Codeunit "Posting Check FP1";
                    TransactionBufferLine: Record "Transaction Buffer";
                    ProcessedBillingLine: Record "Processed Billing Line";
                begin

                    // IF "Monthly Status" = "Monthly Status"::"Full Month" THEN
                    ProcessedBillingLine.SetCurrentKey("Sales Document No.");
                    ProcessedBillingLine.SetFilter("Sales Document No.", Rec."No.");
                    ProcessedBillingLine.DeleteAll(true);

                    BillingInvoice.BillingCalculation(Rec."Contract Id", Rec."Start Date", Rec."End Date", Rec."No.");


                    // ELSE IF "Monthly Status" = "Monthly Status"::"Half Month" THEN
                    //      BillingInvoice.HalfMonth(Rec."Contract Id",Rec."No.",Rec."Monthly Status",Rec."Start Date",Rec."End Date");
                    // TransactionBufferLine.DeleteAll(true);


                end;
            }
        }
        addafter("Test Report")
        {
            action(ReportOVH)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Report OVH';
                Ellipsis = true;
                Image = TestReport;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category5;
                ToolTip = 'View a test report so that you can find and correct any errors before you perform the actual posting of the journal or document.';

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader.Reset();
                    SalesHeader.SetRange("No.", Rec."No.");
                    Report.RunModal(50008, True, False, SalesHeader)
                end;
            }

            action(ReportBoxBody)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Report BoxBody';
                Ellipsis = true;
                Image = TestReport;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category5;
                ToolTip = 'View a test report so that you can find and correct any errors before you perform the actual posting of the journal or document.';

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader.Reset();
                    SalesHeader.SetRange("No.", Rec."No.");
                    Report.RunModal(50009, True, False, SalesHeader)
                end;
            }
            action(SpotHire)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Report Sport Hire';
                Ellipsis = true;
                Image = TestReport;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category5;
                ToolTip = 'View a test report so that you can find and correct any errors before you perform the actual posting of the journal or document.';

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader.Reset();
                    SalesHeader.SetRange("No.", Rec."No.");
                    Report.RunModal(50016, True, False, SalesHeader)
                end;
            }
            action(ReportNBL)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Report NBL';
                Ellipsis = true;
                Image = TestReport;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category5;
                ToolTip = 'View a test report so that you can find and correct any errors before you perform the actual posting of the journal or document.';

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader.Reset();
                    SalesHeader.SetRange("No.", Rec."No.");
                    Report.RunModal(50014, True, False, SalesHeader)
                end;
            }
            action("Truck Transaction Detail")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Truck Transaction Detail Report';
                Ellipsis = true;
                Image = TestReport;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category5;
                ToolTip = 'View a test report so that you can find and correct any errors before you perform the actual posting of the journal or document.';

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    ProcessedLine: Record "Processed Billing Line";
                begin
                    //ProcessedLine.Reset();
                    //  ProcessedLine.SetRange("Sales Document No.", Rec."No.");
                    Report.RunModal(50010, True, False, ProcessedLine)
                end;
            }

        }
    }

}
