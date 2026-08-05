page 50104 "Contract Agreement Card"
{

    Caption = 'Contract Agreement Card';
    PageType = Document;
    SourceTable = "Contract Agreement";
    UsageCategory = Documents;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Contract No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Contract No. field.';
                    //ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        IF Rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Contract Name"; Rec."Contract Name")
                {

                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ToolTip = 'Specifies the value of the Contract Type field.';
                    ApplicationArea = All;
                }
                field("Contract Group"; Rec."Contract Group")
                {
                    ToolTip = 'Specifies the value of the Contract Group field.';
                    ApplicationArea = All;
                }

                field("Contract Date"; Rec."Contract Date")
                {
                    ToolTip = 'Specifies the value of the Contract Date field.';
                    ApplicationArea = All;
                }

                field("Customer Code"; Rec."Customer Code")
                {
                    ToolTip = 'Specifies the value of the Customer Code field.';
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ApplicationArea = All;
                }
                field("Customer Address"; Rec."Customer Address")
                {
                    ToolTip = 'Specifies the value of the Address field.';
                    ApplicationArea = All;
                }
                field(Phone; Rec.Phone)
                {
                    ToolTip = 'Specifies the value of the Phone field.';
                    ApplicationArea = All;
                }
                field("Revenue Calc. Code"; Rec."Revenue Calc. Code")
                {
                    ToolTip = 'Specifies the value of the Revenue Calc. Code field.';
                    ApplicationArea = All;
                }


                field("Vehicle Count"; Rec."Vehicle Count")
                {
                    ToolTip = 'Specifies the value of the Vehicle Count field.';
                    ApplicationArea = All;
                }
                field("Formular Type"; Rec."Formular Type")
                {
                    ToolTip = 'Specifies the value of the Formular Type field.';
                    ApplicationArea = All;
                }
                field("Target Availability"; Rec."Target Availability")
                {
                    ApplicationArea = All;
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ApplicationArea = All;
                }
                field("Use Non-Avail. Entry"; Rec."Use Non-Avail. Entry")
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(KiloPerTrip; Rec."Kilometer Per Trip")
                {
                    ApplicationArea = All;

                }
                field(TripRequency; Rec."Freqency Per trip")
                {
                    ApplicationArea = All;

                }
            }
            part(ContractLines; "Contract Line")
            {
                Caption = 'Lines';

                ApplicationArea = Suite;
                SubPageLink = "Document No." = FIELD("No.");
                //UpdatePropagation = Both;
            }

        }

    }
    trigger OnOpenPage()

    begin
        // rec.SetFilter("Created By", UserId);
    end;

}
