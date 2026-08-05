page 50228 "Issue Voucher"
{
    ApplicationArea = All;
    Caption = 'Store Issue Voucher';
    PageType = Card;
    SourceTable = "Inv.Voucher Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    Caption = 'Posting Date';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field("Cost Centre Code"; Rec."Cost Centre Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost centre code field.';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));


                }

                field("Revenue Centre Code"; Rec."Revenue Centre Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Revenue centre code field.';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Request Description"; Rec."Request Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request Description field.';
                }
                field("Required Date"; Rec."Required Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Required Date field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    Caption = 'Issuing Store';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issuing Store field.';
                    TableRelation = Location;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Responsibility center field.';
                    TableRelation = "Responsibility Center";
                }
                field("Issued To"; Rec."Issued To")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issued To field.';
                    TableRelation = Employee;
                }
                field("Created By Date"; Rec."Created By Date")
                {
                    Caption = 'Creation Date';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Creation Date field';


                }
                field(Narration; Rec.Narration)
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Narration field.';
                }
            }
            part(lines; "Issue Voucher Subform")
            {
                Caption = 'Store Issue Voucher Lines';
                ApplicationArea = All;
                SubPageLink = "Document No." = field("Document No."), "Voucher Type" = field("Voucher Type");
            }


        }
        area(FactBoxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(50041), "No." = field("Document No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("PostP&rint")
            {
                ApplicationArea = All;
                Caption = 'Post & Print';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Print;

                trigger OnAction()
                begin

                    ReleaseVoucher.RUN(Rec);

                    //ReleaseVoucher.Reopen(Rec);
                    Rec.TESTFIELD(Status, Rec.Status::Released);
                    IF NOT CONFIRM('Do you want to Post the Store Issue out Voucher?') THEN
                        EXIT;
                    Rec.TESTFIELD("Document No.");
                    Rec.TESTFIELD("Posting Date");
                    Rec.TESTFIELD("Location Code");

                    Rec.PostIssue(Rec);
                    InvtSetup.GET;


                    InvVoucherHdr := Rec;
                    InvVoucherHdr."Voucher Type" := InvVoucherHdr."Voucher Type"::"Issue Voucher";
                    InvVoucherHdr."Document Type." := InvVoucherHdr."Document Type."::"Negative Adjmt";
                    InvVoucherHdr."Posting Date" := Rec."Posting Date";
                    InvVoucherHdr."Document No." := Rec."Document No.";
                    //InvVoucherHdr.Narration := Rec.
                    // copy lines to posted entry
                    InvVoucherLine.SETRANGE(InvVoucherLine."Voucher Type", Rec."Voucher Type");
                    InvVoucherLine.SETRANGE(InvVoucherLine."Document No.", Rec."Document No.");
                    if InvVoucherLine.FIND('-') then
                        REPEAT
                            InvVoucherLine2.INIT;
                            InvVoucherLine2.TRANSFERFIELDS(InvVoucherLine);
                            InvVoucherLine2."Document Type." := InvVoucherLine2."Document Type."::"Negative Adjmt";
                            InvVoucherLine2."Voucher Type" := InvVoucherLine2."Voucher Type"::"Issue Voucher";
                            InvVoucherLine2."Document No." := InvVoucherHdr."Document No.";
                            InvVoucherLine2.INSERT;
                        UNTIL InvVoucherLine.NEXT = 0;

                    // print voucher
                    // {InvVoucherHdr2.SETRANGE("Pre Assigned No.", InvVoucherHdr."Document No.");
                    //                     IF InvVoucherHdr2.FINDFIRST THEN
                    //                         REPORT.RUN(50009, FALSE, FALSE, InvVoucherHdr2);
                    // }
                    // delete voucher
                    InvVoucherLine.DELETEALL;
                    Rec.DELETE;
                end;
            }
            group("&Print")
            {
                Caption = '&Print';
                action("Print Voucher")
                {
                    Caption = 'Print Voucher';
                    Promoted = false;
                    ApplicationArea = All;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;

                    // trigger OnAction()
                    // begin
                    //     InvVoucherHdr.SETRANGE("Voucher Type", Rec."Voucher Type");
                    //     InvVoucherHdr.SETRANGE("Customer No.", rec."Customer No.");
                    //     IF InvVoucherHdr.FINDFIRST THEN
                    //         REPORT.RUN(50054, TRUE, FALSE, InvVoucherHdr);
                    // end;
                }
                action(Print)
                {
                    ApplicationArea = All;
                    Caption = 'Print Voucher';
                    Image = Report;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    //RunObject = Report "Store Issue Report";
                    trigger OnAction()
                    var




                        InvVouchRec: record "Inv.Voucher Header";
                    begin
                        InvVouchRec.SetFilter("Document No.", rec."Document No.");

                        Report.Run(Report::"Store Issue Report", true, false, InvVouchRec);
                    end;
                }

            }
            group("Approval")
            {
                Caption = 'Approval';



                action("Send for Approval")
                {
                    ApplicationArea = All;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    var
                        Confirmation: Label 'Are you sure you want to send this document for approval';
                    begin
                        if ApprovalsMgmt.CheckStoreIssueVoucherApprovalsWorkflowEnable(rec) then
                            ApprovalsMgmt.OnSendIssueVoucherForApproval(Rec);
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = All;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    var
                        Confirmation: Label 'Are you sure you want to cancel approval request?';
                    begin
                        ApprovalsMgmt.OnCancelIssueVoucherForApproval(Rec);
                    end;
                }
                action("Approval Entries")
                {
                    image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        ApprovalDocType: enum "Approval Document Type";
                    begin

                        ApprovalEntries.SetRecordFilters(Database::"Inv.Voucher Header", ApprovalDocType::"Issue Voucher", rec."Document No.");
                        ApprovalEntries.Run();
                    end;
                }
                action(Comment)
                {
                    Promoted = true;
                    PromotedCategory = Process;
                    Image = Comment;
                    PromotedIsBig = true;
                    ApplicationArea = All;
                    Caption = 'Comment(s)';
                    Visible = false;
                    //  RunObject = page "Comments/Reason Page";
                    // RunPageLink = "Document No." = FIELD("No.");
                    // RunPageView = SORTING("Document No.", "Line No.")
                    //                ORDER(Ascending);
                }

            }
        }


        //         ApprovalsMgmtCut: codeunit "Approval Mgmt. Ext";

        //         EditableStatus: Boolean;

        //     trigger OnNewRecord(BelowxRec: Boolean)
        //     begin
        //         rec."Client Type" := rec."Client Type"::"Establsihed Client";
        //         rec."Document Date" := Today;
        //     end;

        //     procedure CheckApproval()
        //     begin
        //         if (rec.Status = rec.Status::Open) or (rec.Status = rec.Status::Rejected) then
        //             EditableStatus := true
        //         else
        //             EditableStatus := false;

        //     end;
        // }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec."Document Type." := rec."Document Type."::"Negative Adjmt";
    end;



    var
        ItemJnlPostBatch: Codeunit "Item Jnl.-Post Batch";
        ItemJnLline: Record "Item Journal Line";
        InvVoucherHdr: Record "Inv.Voucher Header";
        InvVoucherLine: Record "Inv. Voucher Line";
        InvVoucherLine2: Record "Inv. Voucher Line";
        InvtSetup: Record "Inventory Setup";
        ReleaseVoucher: Codeunit "Inventory Voucher Release";
        VoucherPost: Codeunit "Voucher Post";
        ApprovalsMgmt: Codeunit "Approval Mgmt. ExtCal";



}





