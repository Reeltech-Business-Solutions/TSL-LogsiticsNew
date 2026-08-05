page 80076 "Vehicle Tyre Evaluation"
{

    Caption = 'On-Vehicle Tyre Evaluation';
    PageType = Document;
    SourceTable = "Vehicle Tyre Valuation ";

    layout
    {
        area(content)
        {
            group(General)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Inspection By"; Rec."Inspection By")
                {
                    ToolTip = 'Specifies the value of the Inspection By field.';
                    ApplicationArea = All;
                }
                field("Inspection By (Name)"; Rec."Inspection By(Name)")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Fleet Name"; Rec."Fleet Name")
                {
                    ToolTip = 'Specifies the value of the Fleet Name field.';
                    ApplicationArea = All;
                }
            }
            group(Info)
            {
                ShowCaption = false;
                grid(MyGrid)
                {
                    group("General Info")
                    {
                        ShowCaption = false;
                        field("Date"; Rec."Date")
                        {
                            ToolTip = 'Specifies the value of the Date field.';
                            ApplicationArea = All;
                        }
                        field("Vehicle Type"; Rec."Vehicle Type")
                        {
                            ToolTip = 'Specifies the value of the Vehicle Type field.';
                            ApplicationArea = All;

                        }
                        field("Vehicle Number"; Rec."Vehicle Number")
                        {
                            ToolTip = 'Specifies the value of the Vehicle Number field.';
                            ApplicationArea = All;

                        }
                        field(VIR; Rec.VIR)
                        {
                            ToolTip = 'Specifies the value of the VIR field.';
                            ApplicationArea = All;
                        }

                    }
                    group("General Info2")
                    {
                        ShowCaption = false;
                        field(Odometer; Rec.Odometer)
                        {
                            ToolTip = 'Specifies the value of the Odometer field.';
                            ApplicationArea = All;
                        }
                        field("Unit Of Measure"; Rec."Unit Of Measure")
                        {
                            ApplicationArea = All;
                        }

                    }
                    group("General Info3")
                    {
                        ShowCaption = false;
                        field("Steer Size"; Rec."Steer Size")
                        {
                            ToolTip = 'Specifies the value of the Steer Size field.';
                            ApplicationArea = All;
                        }
                        field("Drive Size"; Rec."Drive Size")
                        {
                            ToolTip = 'Specifies the value of the Drive Size field.';
                            ApplicationArea = All;
                        }
                        field("Free Rolling Size"; Rec."Free Rolling Size")
                        {
                            ToolTip = 'Specifies the value of the Free Rolling Size field.';
                            ApplicationArea = All;
                        }
                        field("Spare Size"; Rec."Spare Size")
                        {
                            ToolTip = 'Specifies the value of the Spare Size field.';
                            ApplicationArea = All;
                        }
                    }

                }

            }
            part("Vehicle Evaluation Subform"; "Vehicle Evalution Subform")
            {
                Caption = 'Vehicle Evaluation Line';
                SubPageLink = "Document No." = FIELD("No.");
                ApplicationArea = All;
            }
        }
    }

}
