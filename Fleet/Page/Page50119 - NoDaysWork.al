page 50119 NoDaysWork
{

    ApplicationArea = All;
    Caption = 'NoDaysWork';
    PageType = List;
    SourceTable = "No. Days Work";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Trans Date"; Rec."Trans Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                    ApplicationArea = All;
                }
                field(Discription; Rec.Discription)
                {
                    ToolTip = 'Specifies the value of the Discription field.';
                    ApplicationArea = All;
                }
                field("Truck No"; Rec."Truck No")
                {
                    ToolTip = 'Specifies the value of the Discription field.';
                    ApplicationArea = All;
                }
                field("Truck Type"; Rec."Truck Type")
                {
                    ToolTip = 'Specifies the value of the Discription field.';
                    ApplicationArea = All;
                }
                field("OffLoading Depot"; Rec."OffLoading Depot")
                {
                    ToolTip = 'Specifies the value of the Discription field.';
                    ApplicationArea = All;
                }
                field("Direct Dispatch"; Rec."Direct Dispatch")
                {
                    ToolTip = 'Specifies the value of the Discription field.';
                    ApplicationArea = All;
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ToolTip = 'Specifies the value of the Discription field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}
