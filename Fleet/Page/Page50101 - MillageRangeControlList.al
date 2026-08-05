page 50101 "Millage Range Control List"
{

    ApplicationArea = All;
    Caption = 'Fixed and Variable Rate Control List';
    PageType = List;
    //CardPageId = "Millage Range Controls Card";
    SourceTable = "Millage Range Controls";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Contract No."; Rec."Contract No.")
                {
                    ToolTip = 'Specifies the value of the Contract No. field.';
                    ApplicationArea = All;
                }

                field("Contract Name"; Rec."Contract Name")
                {
                    ToolTip = 'Specifies the name of the contract';
                    ApplicationArea = All;
                }
                field(Maximum; Rec.Maximum)
                {
                    ToolTip = 'Specifies the value of the Maximum field.';
                    ApplicationArea = All;
                }
                field(Minimum; Rec.Minimum)
                {
                    ToolTip = 'Specifies the value of the Minimum field.';
                    ApplicationArea = All;
                }
                field(Rate; Rec.Rate)
                {
                    ToolTip = 'Specifies the value of the Rate field.';
                    ApplicationArea = All;
                }
                field("Standard Millage Code"; Rec."Standard Millage Code")
                {
                    ToolTip = 'Specifies the value of the Standard Millage Code field.';
                    ApplicationArea = All;
                }
                field("Truck Type"; Rec."Truck Type")
                {
                    ToolTip = 'Specifies the value of the Truck Type field.';
                    ApplicationArea = All;
                }

                field("Freight Charge"; Rec."Freight Charge")
                {
                    ToolTip = 'Specifies the value of the Freight Charge field.';
                    ApplicationArea = All;
                }

                field("Loading Delay Rate"; Rec."Loading Delay Rate")
                {
                    ToolTip = 'Specifies the value of the Loading Delay Rate field.';
                    ApplicationArea = All;
                }
                field("Fixed Rate"; Rec."Fixed Rate")
                {
                    ToolTip = 'Specifies the value of the Fixed Rate field.';
                    ApplicationArea = All;
                }

                field("Discount Rate"; Rec."Discount Rate")
                {
                    ToolTip = 'Specifies the value of the Fixed Rate field.';
                    ApplicationArea = All;
                }

                field("Shortage Tolerance"; Rec."Shortage Tolerance")
                {
                    ToolTip = 'Specifies the value of the Shortage Tolerance field.';
                    ApplicationArea = All;
                }
                field("Shortage Rate"; Rec."Shortage Rate")
                {
                    ToolTip = 'Specifies the value of the Shortage Rate field.';
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Upload&Transaction")
            {
                Caption = 'Upload&Millage Control';
                action("Upload Transaction")
                {
                    Caption = 'Upload Millage Control';
                    Image = "Report";
                    RunObject = Report 50003;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //ShowDocDim;
                        /*RESET;
                        SETFILTER("No.","No.");
                        REPORT.RUN(50554,TRUE,TRUE,Rec);
                        */
                    end;
                }

            }
        }
    }

}
