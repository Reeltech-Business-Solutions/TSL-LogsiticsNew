page 50300 "Job Material Factbox"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Material Request Header";

    layout
    {
        area(Content)
        {

            field(No; Rec."No.")
            {
                visible = false;
            }

            field("No. of Purch. req created"; Rec."No. of Purch. req created")
            {
                ApplicationArea = All;
                caption = 'Number of Purchase Request Document Created';

                trigger OnDrillDown()
                var
                    PurchHeader: Record "Purchase Header";
                    PurchReqList: Page "Purchase Local Req List";

                begin
                    PurchHeader.Reset();
                    PurchHeader.SetRange("Material Req. No.", Rec."No.");
                    if PurchHeader.findSet() then begin
                        PurchReqList.SetTableView(PurchHeader);
                        PurchReqList.Run();
                    end;
                end;
            }
            field("No. of App Purch. req created"; Rec."No. of App Purch. req created")
            {
                ApplicationArea = All;
                Caption = ' No. of Approved Purchase Requisition';
                trigger OnDrillDown()
                var

                    PurchHeader: Record "Purchase Header";
                    PurchReqList: Page "Approved Purchase Req.";
                begin
                    PurchHeader.Reset();
                    PurchHeader.SetRange("Material Req. No.", Rec."No.");
                    if PurchHeader.findSet() then begin
                        PurchReqList.SetTableView(PurchHeader);
                        PurchReqList.Run();
                    end;
                end;
            }

        }
    }

    actions
    {
        area(Processing)
        {
            // action(ActionName)
            // {

            //     trigger OnAction()
            //     begin

            //     end;
            // }
        }
    }

    var
        myInt: Integer;
}