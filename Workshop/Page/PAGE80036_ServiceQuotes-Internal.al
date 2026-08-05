page 80036 "Service Quotes - Internal"
{
    Caption = 'J-Service Quotes - Internal';
    CardPageID = "Service Quote - Internal";
    Editable = false;
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    AdditionalSearchTerms = 'Job- Service Quotes - Internal';
    SourceTable = "Service Header";
    SourceTableView = WHERE("Document Type" = FILTER(Quote), "Customer Job Type" = FILTER('INTERNAL'));
    //UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                }
                field("Order Time"; Rec."Order Time")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        DimMgt: Codeunit DimensionManagement;
                    begin
                        DimMgt.LookupDimValueCodeNoUpdate(1);
                    end;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        DimMgt: Codeunit DimensionManagement;
                    begin
                        DimMgt.LookupDimValueCodeNoUpdate(2);
                    end;
                }
                field("Shortcut dimension 3"; Rec."Shortcut dimension 3")
                {
                    ApplicationArea = All;
                }
                field("Shortcut dimension 4"; Rec."Shortcut dimension 4")
                {
                    ApplicationArea = All;
                }
                field("Customer Type"; Rec."Customer Type")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = All;
                }
                field("Notify Customer"; Rec."Notify Customer")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Service Order Type"; Rec."Service Order Type")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Response Date"; Rec."Response Date")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Warning Status"; Rec."Warning Status")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Allocated Hours"; Rec."Allocated Hours")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Finishing Date"; Rec."Finishing Date")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;

                }
            }
        }
        area(factboxes)
        {
            part(Control1902018507; "Customer Statistics FactBox")
            {
                SubPageLink = "No." = FIELD("Bill-to Customer No."), "Date Filter" = FIELD("Date Filter");
                Visible = true;
                ApplicationArea = All;
            }
            part(Control1900316107; "Customer Details FactBox")
            {
                SubPageLink = "No." = FIELD("Customer No."), "Date Filter" = FIELD("Date Filter");
                Visible = true;
                ApplicationArea = All;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
                ApplicationArea = All;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Quote2")
            {
                Caption = '&Quote';
                Image = Quote;
                action("&Dimensions")
                {
                    ApplicationArea = All;
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                    end;
                }
                separator(Separator1102601006)
                {
                }
                action("Co&mments")
                {
                    ApplicationArea = All;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Service Comment Sheet";
                    RunPageLink = "Table Name" = CONST("Service Header"), "Table Subtype" = FIELD("Document Type"), "No." = FIELD("No."), Type = CONST(General);
                }
                separator(Separator1102601008)
                {
                    Caption = '';
                }
                action(Statistics)
                {
                    ApplicationArea = All;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F7';

                    trigger OnAction()
                    begin
                        Rec.CalcInvDiscForHeader;
                        COMMIT;
                        PAGE.RUNMODAL(PAGE::"Service Statistics", Rec);
                    end;
                }
                action("Customer Card9")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Card';
                    Image = Customer;
                    RunObject = Page "Customer Card";
                    RunPageLink = "No." = FIELD("Customer No.");
                    ShortCutKey = 'Shift+F7';
                }
                separator(Separator1102601011)
                {
                    Caption = '';
                }
                action("Service Document Lo&g")
                {
                    ApplicationArea = All;
                    Caption = 'Service Document Lo&g';
                    Image = Log;

                    trigger OnAction()
                    var
                        ServDocLog: Record "Service Document Log";
                    begin
                        ServDocLog.ShowServDocLog(Rec);
                    end;
                }
            }
        }
        area(processing)
        {
            action("&Print")
            {
                ApplicationArea = All;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    DocPrint: Codeunit "Document-Print";
                begin
                    CurrPage.UPDATE(TRUE);
                  //  DocPrint.PrintServiceHeader(Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        UserMgt: Codeunit 5700;
    begin
        Rec."Document Type" := Rec."Document Type"::Quote;
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter;
        Rec."Customer Type" := Rec."Customer Type"::Internal;

        Rec."User ID" := USERID;
    end;

    trigger OnOpenPage()
    begin
        Rec.SetSecurityFilterOnRespCenter;
    end;

    var
        DimMgt: Codeunit DimensionManagement;
        CreateServiceOrder: Codeunit "Serv-Quote to Order (Yes/No)";
        UserMgt: Codeunit "User Setup Management";
}

