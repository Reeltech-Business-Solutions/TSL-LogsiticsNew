page 80054 "Store Material Return Subform"
{
    AutoSplitKey = true;
    Caption = 'Lines';
    PageType = ListPart;
    SourceTable = "Store Issue Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                /*  field("Inventory Qty.";"Inventory Qty.")
                 {
                     Style = Subordinate;
                     StyleExpr = TRUE;
                 } */
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = All;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Product Group Code"; Rec."Product Group Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }

                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }

                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                }

                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = All;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                /* field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                } */
                /*   field("Applies from Item Entry";"Applies from Item Entry")
                  {
                  } */
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = All;
                }
                /* field("Appl.-to Item Entry";"Appl.-to Item Entry")
                {
                } */
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unction")
            {
                Caption = 'F&unction';
                action("Get Material Req. Line")
                {
                    ApplicationArea = All;
                    Caption = 'Get Material Req. Line';
                }


            }
            group("&Line")
            {
                Caption = '&Line';
                action(Dimensions)
                {
                    ApplicationArea = All;
                    Caption = 'Dimensions';

                    trigger OnAction()
                    begin
                        rec.ShowDimensions();

                    end;
                }
                group("Item Availability by")
                {
                    Caption = 'Item Availability by';
                    action("Event")
                    {
                        ApplicationArea = All;
                        Caption = 'Event';

                        trigger OnAction()
                        begin
                            //ItemAvailFormsMgt.ShowItemAvailFromMatReqLine(Rec,ItemAvailFormsMgt.ByEvent)
                        end;
                    }
                    action(Period)
                    {
                        ApplicationArea = All;
                        Caption = 'Period';

                        trigger OnAction()
                        begin
                            //ItemAvailFormsMgt.ShowItemAvailFromMatReqLine(Rec,ItemAvailFormsMgt.ByPeriod);
                        end;
                    }
                    action(Variant)
                    {
                        ApplicationArea = All;
                        Caption = 'Variant';

                        trigger OnAction()
                        begin
                            //ItemAvailFormsMgt.ShowItemAvailFromMatReqLine(Rec,ItemAvailFormsMgt.ByVariant);
                        end;
                    }
                    action(Location)
                    {
                        ApplicationArea = All;
                        Caption = 'Location';

                        trigger OnAction()
                        begin
                            //ItemAvailFormsMgt.ShowItemAvailFromMatReqLine(Rec,ItemAvailFormsMgt.ByLocation);
                        end;
                    }
                }
            }
        }
    }

    var
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";

    procedure UpdateSubform()
    begin
        CurrPage.UPDATE(FALSE);
    end;
}

