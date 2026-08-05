page 50105 "Contract Line"
{

    Caption = 'Contract Line';
    PageType = ListPart;
    SourceTable = "COntract Line";
    AutoSplitKey = true;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Truck Code"; Rec."Truck Code")
                {
                    ToolTip = 'Specifies the value of the Truck Code field.';
                    ApplicationArea = All;
                }
                field("Truck Name"; Rec."Truck Name")
                {
                    ToolTip = 'Specifies the value of the Truck Name field.';
                    ApplicationArea = All;
                }
                field("Truck Type"; Rec."Truck Type")
                {
                    ToolTip = 'Specifies the value of the Truck Type field.';
                    ApplicationArea = All;
                }

                field("Formular Type"; Rec."Formular Type")
                {
                    ToolTip = 'Specifies the optional formular for the Truck Type field.';
                    ApplicationArea = All;
                }
                field("Asset Registration No."; Rec."Asset Registration No.")
                {
                    Caption = 'Asset Registration No.';
                    ToolTip = 'Specifies the Asset Registration No. for the Truck Type field.';
                    ApplicationArea = All;
                    
                }
                field("Asset Tin No."; Rec."Asset Tin No.")
                {
                    Caption = 'Asset Tin No.';
                    ToolTip = 'Specifies the Asset Asset Tin No. for the Truck Type field.';
                    ApplicationArea = All;
                }

            }

        }
    }

}
