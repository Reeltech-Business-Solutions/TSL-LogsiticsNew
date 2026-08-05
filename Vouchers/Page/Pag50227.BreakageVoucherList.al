page 50227 "Issue Voucher List"
{
    ApplicationArea = All;
    Caption = 'Store Issue Voucher List';
    PageType = List;
    SourceTable = "Inv.Voucher Header";
    SourceTableView = WHERE("Voucher Type" = FILTER(Issue));
    CardPageId = "Issue Voucher";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Voucher Type"; Rec."Voucher Type")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field(Narration; Rec.Narration)
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Created By Date"; Rec."Created By Date")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
