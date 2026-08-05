page 80038 "Service Quotes - Leasing"
{
    Caption = 'Service Quotes - Lease Operation';
    CardPageID = "Service Quote - Leasing";
    Editable = false;
    PageType = List;
    AdditionalSearchTerms = 'Service Quotes - Leasing';
    SourceTable = "Service Header";
    /// SourceTableView = WHERE("Document Type"=FILTER(Quote), "Customer Job Type"=FILTER(INTERNAL), "Job Type Code"=FILTER("LEASE OPERATION"|"PM-LEASING"));

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
                    Editable = false;
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
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
                field("Customer Type"; Rec."Customer Type")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Shortcut dimension 4"; Rec."Shortcut dimension 4")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Visible = false;
                    ApplicationArea = All;

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
                    ShowCaption = false;
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
                field("Contract No."; Rec."Contract No.")
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
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Payment Discount %"; Rec."Payment Discount %")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Payment Method Code"; Rec."Payment Method Code")
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
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Finishing Date"; Rec."Finishing Date")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
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
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("Bill-to Customer No."), "Date Filter" = FIELD("Date Filter");
                Visible = true;
            }
            part(Control1900316107; "Customer Details FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("Customer No."), "Date Filter" = FIELD("Date Filter");
                Visible = true;
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = All;
                Visible = false;
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
                action("Co&mments")
                {
                    ApplicationArea = All;
                    /*  Caption = 'Co&mments';
                     Image = ViewComments;
                     RunObject = Page "Service Comment Sheet";
                                     RunPageLink = "Table Name"=CONST(Service Header), "Table Subtype"=FIELD("Document Type"), "No."=FIELD("No."), Type=CONST(General); */
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
                        /// PAGE.RUNMODAL(PAGE::"Service Statistics",Rec);
                    end;
                }
                action("Customer Card3")
                {
                    Caption = 'Customer Card';
                    Image = Customer;
                    ApplicationArea = All;
                    /* RunObject = Page "Customer Card";
                                    RunPageLink = "No."=FIELD("Customer No."); */
                    ShortCutKey = 'Shift+F7';
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
            group(Request)
            {
                Caption = 'Request';
                Image = SendApprovalRequest;
                action("Send A&pproval Request")
                {
                    ApplicationArea = All;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                    /// ApprovalMgt: Codeunit Codeunit439;
                    begin
                        /// IF ApprovalMgt.SendServiceApprovalRequest(Rec) THEN;                //Idada
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                    ///  ApprovalMgt: Codeunit Codeunit439;
                    begin
                        ///  IF ApprovalMgt.CancelServiceApprovalRequest(Rec,TRUE,TRUE) THEN     //Idada
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
                    DocPrint: Codeunit 229;
                     ServDocumentPrint: Codeunit "Serv. Document Print";
                begin
                    CurrPage.UPDATE(TRUE);
                    ServDocumentPrint.PrintServiceHeader(Rec);
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
        Rec."Customer Type" := Rec."Customer Type"::"Lease Operation";
        Rec."User ID" := USERID;
    end;

    trigger OnOpenPage()
    begin
        Rec.SetSecurityFilterOnRespCenter;
    end;

    var
    ///  DimMgt: Codeunit DimensionManagement;
    /// CreateServiceOrder: Codeunit "Serv-Quote to Order (Yes/No)";
    /// UserMgt: Codeunit "User Setup Management";
}

