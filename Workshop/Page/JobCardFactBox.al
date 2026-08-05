page 80096 "Job Card FactBox"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Job;

    layout
    {
        area(Content)
        {

            field("No. of Material Request Created"; Rec."No. of Mat. Req. Created")
            {
                ApplicationArea = All;

                trigger OnDrillDown()
                var
                    MatReqHeader: Record "Material Request Header";
                    MatReqList: Page "Job Material Request List";
                begin
                    MatReqHeader.Reset();
                    MatReqHeader.setRange("Job No.", Rec."No.");
                    if MatReqHeader.FindSet() then begin
                        MatReqList.SetTableView(MatReqHeader);
                        MatReqList.Run();
                    end;

                end;
            }

            field("No. of Posted Material Request Created"; Rec."No. of Posted Mat. Req. Created")
            {
                ApplicationArea = All;

                trigger OnDrillDown()
                var
                    MatReqHeader: Record "Material Request Header";
                    PostedMatReqList: Page "Posted Job Material Req. List";
                begin
                    MatReqHeader.Reset();
                    MatReqHeader.setRange("Job No.", Rec."No.");
                    if MatReqHeader.FindSet() then begin
                        PostedMatReqList.SetTableView(MatReqHeader);
                        PostedMatReqList.Run();
                    end;

                end;
            }

            field("No. of Quality check Created"; Rec."No. of Quality check")
            {
                ApplicationArea = All;

                trigger OnDrillDown()
                var
                    QualityCheckHeader: Record "Quality Check";
                    QualityCheckList: Page "Quality CheckList";
                begin
                    QualityCheckHeader.Reset();
                    QualityCheckHeader.setRange("Job No.", Rec."No.");
                    if QualityCheckHeader.FindSet() then begin
                        QualityCheckList.SetTableView(QualityCheckHeader);
                        QualityCheckList.Run();
                    end;

                end;
            }



        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}