page 80072 "Daily Tyre Groov Subform"
{

    Caption = 'Daily Tyre Groov';
    PageType = ListPart;
    MultipleNewLines = true;
    AutoSplitKey = true;
    DelayedInsert = true;
    SourceTable = "Daily Tyre Line";
    SourceTableView = where("Daily Tyre Type" = filter(Regroove));

    layout
    {
        area(content)
        {
            repeater(Control)
            {
                field("Truck No"; Rec."Truck No")
                {
                    ToolTip = 'Specifies the value of the Truck code field.';
                    ApplicationArea = All;
                }
                field("Asset Type"; Rec."Asset Type")
                {
                    ToolTip = 'Specifies the value of the Asset Type field.';
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Contract; Rec.Contract)
                {
                    ToolTip = 'Specifies the value of the Contract field.';
                    ApplicationArea = All;
                    Visible = false;
                }


                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                    ApplicationArea = All;
                }
                field(Depth; Rec.Depth)
                {
                    ToolTip = 'Specifies the value of the Depth field.';
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                    ApplicationArea = All;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ToolTip = 'Specifies the value of the Driver Name field.';
                    ApplicationArea = All;
                }
                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.';
                    ApplicationArea = All;
                }
                field("New  PSI"; Rec."New  PSI")
                {
                    ToolTip = 'Specifies the value of the New  PSI field.';
                    ApplicationArea = All;
                }
                field("New Depth"; Rec."New Depth")
                {
                    ToolTip = 'Specifies the value of the New Depth field.';
                    ApplicationArea = All;
                }
                field("New Tyre Position"; Rec."New Tyre Position")
                {
                    ToolTip = 'Specifies the value of the New Tyre Position field.';
                    ApplicationArea = All;
                }
                field("Odmeter Brands f Tyre"; Rec."Odmeter Brands f Tyre")
                {
                    ToolTip = 'Specifies the value of the Odmeter Brands f Tyre field.';
                    ApplicationArea = All;
                }
                field("Old Depth"; Rec."Old Depth")
                {
                    ToolTip = 'Specifies the value of the Old Depth field.';
                    ApplicationArea = All;
                }
                field("Old Tyre Position"; Rec."Old Tyre Position")
                {
                    ToolTip = 'Specifies the value of the Old Tyre Position field.';
                    ApplicationArea = All;
                }
                field(Pattern; Rec.Pattern)
                {
                    ToolTip = 'Specifies the value of the Pattern field.';
                    ApplicationArea = All;
                }
                field("Previously Regrooved"; Rec."Previously Regrooved")
                {
                    ToolTip = 'Specifies the value of the Previously Regrooved field.';
                    ApplicationArea = All;
                }
                field("Radia Patches"; Rec."Radia Patches")
                {
                    ToolTip = 'Specifies the value of the Radia Patches field.';
                    ApplicationArea = All;
                }
                field(Size; Rec.Size)
                {
                    ToolTip = 'Specifies the value of the Size field.';
                    ApplicationArea = All;
                }

                field("Tyre Serial No"; Rec."Tyre Serial No")
                {
                    ToolTip = 'Specifies the value of the Tyre Serial No field.';
                    ApplicationArea = All;
                }


            }
        }
    }

}
