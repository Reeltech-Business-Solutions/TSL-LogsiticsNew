page 50245 "Quality CheckList"
{
    ApplicationArea = All;
    CardPageId = "Quality Check";
    Caption = 'Quality Check Assurance Form';
    PageType = List;
    SourceTable = "Quality Check";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Name field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location Code field.', Comment = '%';
                }
                field("Date In"; Rec."Date In")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DATE IN field.', Comment = '%';
                }
                field("Date Out"; Rec."Date Out")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DATE OUT field.', Comment = '%';
                }
                field(Odometer; Rec.Odometer)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Odometer field.', Comment = '%';
                }
                field("Truck No."; Rec."Truck No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Truck No. field.', Comment = '%';
                }
                field("Trailer No."; Rec."Trailer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trailer No. field.', Comment = '%';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = All;
                }
                field(Diesel; Rec.Diesel)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Diesel(Ltrs.) field.', Comment = '%';
                }
                field("Next Serv Date"; Rec."Next Serv Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the NEXT SERV. DATE field.', Comment = '%';
                }
                field("Next MPM"; Rec."Next MPM")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the NEXT MPM DATE field.', Comment = '%';
                }
            }
        }
    }
}
