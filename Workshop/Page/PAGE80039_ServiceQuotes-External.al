page 80039 "Service Quotes - External"
{
    Caption = 'Service Quote';
    CardPageID = "Service Quote - External";
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Service Header";
    SourceTableView = WHERE("Document Type" = CONST(Quote));
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            repeater(ServiceQuote)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Approval Status"; Rec."Approval Status")
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
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field(Priority; Rec.Priority)
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
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = All;
                }
                field("Notify Customer"; Rec."Notify Customer")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Customer Type"; Rec."Customer Type")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Shortcut dimension 4"; Rec."Shortcut dimension 4")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Service Order Type"; Rec."Service Order Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Contract No."; Rec."Contract No.")
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
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Payment Discount %"; Rec."Payment Discount %")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Payment Method Code"; Rec."Payment Method Code")
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
                field("Job Type"; Rec."Job Type")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Created Date"; Rec."Created Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Job Created"; Rec."Job Created")
                {
                    Editable = false;
                    ApplicationArea = All;
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
            group("&Quote3")
            {
                Caption = '&Quote';
                Image = Quote;
                action("&Dimensions")
                {
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    ApplicationArea = All;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                    end;
                }
                separator(Separator1102601006)
                {
                }
                action("Co&mments10")
                {
                    Caption = 'Co&mments';
                    ApplicationArea = All;
                    Image = ViewComments;
                    /* RunObject = Page "Service Comment Sheet";
                                    RunPageLink = "Table Name"=CONST("Service Header"), "Table Subtype"=FIELD("Document Type"), "No."=FIELD("No."), Type=CONST(General);  */
                }
                separator(Separator1102601008)
                {
                    Caption = '';
                }
                action(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    ApplicationArea = All;
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
                action("Customer Card5")
                {
                    Caption = 'Customer Card5';
                    Image = Customer;
                    ApplicationArea = All;
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
                    Caption = 'Service Document Lo&g';
                    ApplicationArea = All;
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
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    DocPrint: Codeunit 229;
                begin
                    //CurrPage.UPDATE(TRUE);
                    //DocPrint.PrintServiceHeader(Rec);
                    Rec.RESET;
                    Rec.SETFILTER("No.", Rec."No.");
                    REPORT.RUN(5902, TRUE, TRUE, Rec);
                    Rec.RESET;

                    // 50530
                end;
            }
        }
    }

    trigger OnInit()
    begin
        //
    end;

    trigger OnOpenPage()
    begin

        Rec.SetSecurityFilterOnRespCenter;


    end;


    var
        Job: Record Job;
        ServiceHeader: Record "Service Header";
    ///  DimMgt: Codeunit DimensionManagement;
    ///  CreateServiceOrder: Codeunit "Serv-Quote to Order (Yes/No)";
    /// CreateJobOrder: Codeunit "Serv-Quote to Job (Yes/No)";
}

