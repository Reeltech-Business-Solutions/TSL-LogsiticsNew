page 80012 "Service Quotes - Insurance"
{
    Caption = 'J-Service Quotes - Insurance';
    CardPageID = "Service Quote - Insurance";
    Editable = false;
    PageType = List;
    AdditionalSearchTerms = 'Job Service Quote - Insurance';
    SourceTable = "Service Header";
    SourceTableView = WHERE("Document Type" = FILTER(Quote), "Customer Job Type" = FILTER('INSURANCE'));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = All;
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
                    Visible = false;
                    ApplicationArea = all;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        /// DimMgt.LookupDimValueCodeNoUpdate(1);
                    end;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        ///  DimMgt.LookupDimValueCodeNoUpdate(2);
                    end;
                }
                field("Shortcut dimension 3"; Rec."Shortcut dimension 3")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Shortcut dimension 4"; Rec."Shortcut dimension 4")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Customer Type"; Rec."Customer Type")
                {
                    ShowCaption = false;
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
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Service Order Type"; Rec."Service Order Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Response Date"; Rec."Response Date")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Warning Status"; Rec."Warning Status")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Allocated Hours"; Rec."Allocated Hours")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Finishing Date"; Rec."Finishing Date")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ShowCaption = false;
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
            }
        }
        area(factboxes)
        {

            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments1';
                SubPageLink = "Table ID" = CONST(5900), "No." = FIELD("No.");

            }

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
            group("&Quote")
            {
                Caption = '&Quote';
                Image = Quote;
                action("&Dimensions")
                {
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ApplicationArea = All;

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
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page 5911;
                    RunPageLink = "Table Name" = CONST("Service Header"), "Table Subtype" = FIELD("Document Type"), "No." = FIELD("No."), Type = CONST(General);
                    ApplicationArea = All;
                }
                separator(Separator1102601008)
                {
                    Caption = '';

                }
                action(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F7';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.CalcInvDiscForHeader;
                        COMMIT;
                        PAGE.RUNMODAL(PAGE::"Service Statistics", Rec);
                    end;
                }
                action("Customer Card")
                {
                    Caption = 'Customer Card';
                    Image = Customer;
                    RunObject = Page 21;
                    RunPageLink = "No." = FIELD("Customer No.");
                    ShortCutKey = 'Shift+F7';
                    ApplicationArea = All;
                }
                separator(Separator1102601011)
                {
                    Caption = '';

                }
                action("Service Document Lo&g")
                {
                    Caption = 'Service Document Lo&g';
                    Image = Log;
                    ApplicationArea = All;

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
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;

                trigger OnAction()
                var
                    DocPrint: Codeunit 229;
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
    ///DimMgt: Codeunit DimensionManagement;
    /// CreateServiceOrder: Codeunit "Serv-Quote to Order (Yes/No)";
    /// UserMgt: Codeunit "User Setup Management";

}

