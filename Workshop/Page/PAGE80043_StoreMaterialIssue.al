page 80043 "Store Material Issue"
{
    Caption = 'Store Material Issue';
    PageType = Card;
    SourceTable = "Store Issue Header";
    PromotedActionCategories = 'New,Process,Report,Request Approval';
    SourceTableView = WHERE("Request Type" = CONST(Job), "Entry Type" = FILTER(Issue));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = All;

                    // trigger OnAssistEdit()
                    // begin
                    //     IF Rec.AssistEdit(xRec) THEN
                    //         CurrPage.UPDATE;
                    // end;
                }
                field("Request Type"; Rec."Request Type")
                {
                    Editable = false;
                    ApplicationArea = All;
                }


                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }

                field("Material Request No."; Rec."Material Request No.")
                {
                    ApplicationArea = All;
                }

                field("Customer Job Type"; Rec."Customer Job Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Job Type Code"; Rec."Job Type Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Requested Receipt Date"; Rec."Requested Receipt Date")
                {
                    ApplicationArea = All;
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = All;
                    Caption = 'Requested By';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ApplicationArea = All;
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
                    Visible = true;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = All;
                }

                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                    ApplicationArea = All;
                }
                field("Asset No."; Rec."Asset No.")
                {
                    ApplicationArea = All;
                }
                field("Service Vehicle"; Rec."Service Vehicle")
                {
                    ApplicationArea = All;
                }
                field(Trailer; Rec.Trailer)
                {
                    ApplicationArea = All;
                }
                field("Trailer No."; Rec."Trailer No.")
                {
                    ApplicationArea = All;
                }
            }
            part(RequestLine; "Store Material Issue Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD("No.");
            }
            group("User Trail")
            {
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = All;
                }
                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        //
                    end;
                }
                field("Modified Date"; Rec."Modified Date")
                {
                    ApplicationArea = All;
                }
                field("Modified Time"; Rec."Modified Time")
                {
                    ApplicationArea = All;
                }
                field("Released Date"; Rec."Released Date")
                {
                    ApplicationArea = All;
                }
                field("Released By"; Rec."Released By")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control29; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control28; Notes)
            {
                ApplicationArea = All;
            }
            part("Attachments"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }

        }
    }

    actions
    {
        area(navigation)
        {
            group("&Request")
            {
                Caption = '&Request';
                action(Dimensions)
                {
                    ApplicationArea = All;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                    // PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                    end;
                }

                action("A&pprovals")
                {
                    image = Approvals;
                    Caption = 'A&pprovals';
                    ApplicationArea = All;


                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        ApprovalDocType: enum "Approval Document Type";
                    begin
                        ApprovalEntries.SetRecordFilters(Database::"Store Issue Header", ApprovalDocType::"Store Issued", rec."No.");
                        ApprovalEntries.Run();

                    end;
                }
                // action("A&pprovals")
                // {
                //     ApplicationArea = All;
                //     Caption = 'A&pprovals';
                //     Image = Approvals;

                //     trigger OnAction()
                //     var
                ///  ApprovalEntries: Page "Approval Entries";
                // begin
                //ApprovalEntries.Setfilters(DATABASE::"Purchase Request Header",13,"No.");
                //ApprovalEntries.RUN;
                // end;
                // }
            }
        }
        area(processing)
        {

            group(ActionGroup38)
            {
                Caption = 'Release';
                action(Release)
                {
                    ApplicationArea = All;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';
                    Visible = false;

                    trigger OnAction()
                    var
                        PurchReqRelease: Codeunit PurchReqRelease;
                    begin

                        PurchReqRelease.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = All;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction()
                    var
                        PurchReqRelease: Codeunit PurchReqRelease;
                    begin

                        PurchReqRelease.PerformManualReopen(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';

                action("Send For Approval")
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    //  PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        Jobs: Record Job;
                        StoreIssLin: Record "Store Issue Line";
                    begin
                        StoreIssLin.Reset();
                        StoreIssLin.SetRange("Document No.", rec."No.");
                        if StoreIssLin.IsEmpty then
                            Error('You can not send this document for approval fill in the Store Issue lines fast tab');
                        if Jobs.Get(Rec."Job No.") then
                            if ((Jobs."Workshop Status" = Jobs."Workshop Status"::Completed) OR (Jobs.Status = Jobs.Status::Completed)) then
                                Error(' "Workshop status" or "status" is completed on job card');
                        if ApprovalsMagmt.CheckStoreIssueApprovalsWorkflowEnable(Rec) then
                            ApprovalsMagmt.OnSendStoreIssuedForApproval(Rec);

                        CurrPage.Update();

                    end;
                }
                action("Cancel Approval Request")
                {
                    image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        ApprovalsMagmt.OnCancelStoreIssuedForApproval(Rec);

                    end;
                }

            }
            group("Get Mat.Req")
            {

                action("Get Material Request Lines")
                {
                    ApplicationArea = All;
                    Caption = 'Get Material Request Lines';
                    Image = ItemTrackingLines;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        JobMatMgt: Codeunit "Job Request Management";
                    begin
                        JobMatMgt.GetMatReqLines(Rec);
                        CurrPage.RequestLine.PAGE.UpdateSubform;

                        //MIS 091917
                        IF Rec."Entry Type" = Rec."Entry Type"::Issue THEN BEGIN
                            JobMatMgt.P_GetMatReqLines(Rec);
                            CurrPage.RequestLine.PAGE.UpdateSubform;
                        END ELSE BEGIN
                            JobMatMgt.GetMatReqLines(Rec);
                            CurrPage.RequestLine.PAGE.UpdateSubform;
                        END;
                        //MIS 091917
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                action("Post&Print")
                {
                    ApplicationArea = All;
                    Caption = 'Post';
                    Description = 'Codeunit Job Issue Post';
                    Image = PostPrint;
                    Promoted = true;
                    //  PromotedIsBig = true;
                    PromotedCategory = Process;
                    RunObject = Codeunit "Job Issue Post";
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    var
                        StoreReqLine: Record "Store Issue Line";
                        ServiceLine: Record "Store Issue Line";
                    begin
                        //DDada
                        //
                        /*
                        usersetup.GET;
                        IF (usersetup."User ID" ='AGLEVENTIS\DDADA') OR (usersetup."User ID" ='AGLEVENTIS\MISLEVENTIS')THEN
                        MESSAGE('Becareful, you are about to open jobs',TRUE)
                        ELSE
                        ERROR('YOu do not have permission to do this');
                         */





                        /* StoreReqLine.RESET;
                        StoreReqLine.SETRANGE(StoreReqLine."Document No.", "No.");
                        IF StoreReqLine.FINDSET THEN BEGIN
                            REPEAT
                                StoreReqLine.CALCFIELDS(StoreReqLine."Inventory Qty.");
                                IF (ServiceLine."Gen. Prod. Posting Group" = 'TYRE') AND (NOT ServiceLine."Allow Approved Usage") THEN BEGIN

                                    TOTQty := ServiceLine."Quantity CONSM Per Year" + ServiceLine.Quantity;
                                    IF TOTQty > 8 THEN BEGIN
                                        ServiceLine.TESTFIELD(ServiceLine."Approve/Reject", 0);
                                        ServiceLine.VALIDATE(ServiceLine."Reason For Approval", ServiceLine."Reason For Approval"::"SparePart Issued + Qty Requesting is More than Yearly Def. Qty");
                                        ServiceLine."BLocking Notification" := TRUE;
                                        ERROR('You cannot collect more than 8 tires in a year. \You have consumed %1 Already + current qty %2 = %3 Tyres \have excedded Default Qty , please contact your Head Of Operations'
                                        , ServiceLine."Quantity CONSM Per Year", ServiceLine.Quantity, TOTQty);
                                        //ServiceLine."Reason For Approval" := 2;
                                        //ServiceLine."BLocking Notification" :=TRUE;
                                    END;
                                END;

                                IF (ServiceLine."Gen. Prod. Posting Group" = 'BATTERY') AND (NOT ServiceLine."Allow Approved Usage") THEN BEGIN

                                    TOTQty := ServiceLine."Quantity CONSM Per Year" + ServiceLine.Quantity;
                                    IF TOTQty > 2 THEN BEGIN
                                        ServiceLine.TESTFIELD(ServiceLine."Approve/Reject", 0);
                                        ServiceLine.VALIDATE(ServiceLine."Reason For Approval", ServiceLine."Reason For Approval"::"SparePart Issued + Qty Requesting is More than Yearly Def. Qty");
                                        ServiceLine."BLocking Notification" := TRUE;
                                        ERROR('You cannot collect more than 2 Battery in a year \You have consumed %1 Already + current qty %2. = %3 Batteries \have excedded Default Qty, \please contact your Head Of Operations'
                                        , ServiceLine."Quantity CONSM Per Year", ServiceLine.Quantity, TOTQty);
                                        //ServiceLine."Reason For Approval" := 2;
                                        //ServiceLine."BLocking Notification" :=TRUE;
                                        // VALIDATE(Quantity,0);
                                    END;
                                END;
                            //////USed to check Default qty for battery and Tyres   ddada04132020

                            UNTIL StoreReqLine.NEXT = 0;
                        END;


                        JobRec.RESET;
                        JobRec.SETRANGE(JobRec."No.", "Job No.");
                        JobRec.CALCFIELDS(JobRec."Invoice Date*");
                        IF JobRec.FINDFIRST THEN BEGIN
                            IF JobRec."Invoice Date*" <> 0D THEN
                                ERROR('YOu cannot Post into issue into a job tha is Already Closed/ Invoiced')
                        END */
                        //DDada

                    end;
                }
            }


            group("&Print")
            {
                Caption = '&Print';
                action(Print)
                {
                    Caption = 'Print';
                    ApplicationArea = All;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        StoreReqLine: Record "Store Issue Line";
                        ServiceLine: Record "Store Issue Line";
                    begin
                        StoreReqLine.RESET;
                        StoreReqLine.SETRANGE(StoreReqLine."Document No.", Rec."No.");
                        IF StoreReqLine.FINDSET THEN BEGIN
                            REPEAT
                            /// StoreReqLine.CALCFIELDS(StoreReqLine."Inventory Qty.");
                            //  IF StoreReqLine.Quantity > StoreReqLine."Inventory Qty." THEN
                            //        ERROR('You cannot issue more than %1 for Item %2.',StoreReqLine."Inventory Qty.",StoreReqLine."Item No.");
                            //     StoreReqLine.TESTFIELD(StoreReqLine."Gen. Bus. Posting Group");    //DDADA





                            //////USed to check Default qty for battery and Tyres   ddada04132020
                            /* IF (ServiceLine."Gen. Prod. Posting Group" = 'TYRE') AND (NOT ServiceLine."Allow Approved Usage") THEN BEGIN

                                TOTQty := ServiceLine."Quantity CONSM Per Year" + ServiceLine.Quantity;
                                IF TOTQty > 8 THEN BEGIN
                                    ServiceLine.TESTFIELD(ServiceLine."Approve/Reject", 0);
                                    ServiceLine.VALIDATE(ServiceLine."Reason For Approval", ServiceLine."Reason For Approval"::"SparePart Issued + Qty Requesting is More than Yearly Def. Qty");
                                    ServiceLine."BLocking Notification" := TRUE;
                                    ERROR('You cannot collect more than 8 tires in a year. \You have consumed %1 Already + current qty %2 = %3 Tyres \have excedded Default Qty , please contact your Head Of Operations'
                                    , ServiceLine."Quantity CONSM Per Year", ServiceLine.Quantity, TOTQty);
                                    //ServiceLine."Reason For Approval" := 2;
                                    //ServiceLine."BLocking Notification" :=TRUE;
                                END;
                            END;

                            IF (ServiceLine."Gen. Prod. Posting Group" = 'BATTERY') AND (NOT ServiceLine."Allow Approved Usage") THEN BEGIN

                                TOTQty := ServiceLine."Quantity CONSM Per Year" + ServiceLine.Quantity;
                                IF TOTQty > 2 THEN BEGIN
                                    ServiceLine.TESTFIELD(ServiceLine."Approve/Reject", 0);
                                    ServiceLine.VALIDATE(ServiceLine."Reason For Approval", ServiceLine."Reason For Approval"::"SparePart Issued + Qty Requesting is More than Yearly Def. Qty");
                                    ServiceLine."BLocking Notification" := TRUE;
                                    ERROR('You cannot collect more than 2 Battery in a year \You have consumed %1 Already + current qty %2. =%3 Batteries \have excedded Default Qty, \please contact your Head Of Operations'
                                    , ServiceLine."Quantity CONSM Per Year", ServiceLine.Quantity, TOTQty); */
                            //ServiceLine."Reason For Approval" := 2;
                            //ServiceLine."BLocking Notification" :=TRUE;
                            // VALIDATE(Quantity,0);
                            /// END;
                            /// END;
                            //////USed to check Default qty for battery and Tyres   ddada04132020

                            UNTIL StoreReqLine.NEXT = 0;
                        END;





                        //// purchreq.SETRANGE("No.", "No.");
                        /* IF purchreq.FINDFIRST THEN
                        REPORT.RUN(50547,TRUE,FALSE,purchreq); */
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Request Type" := Rec."Request Type"::Job;
        Rec."Entry Type" := Rec."Entry Type"::Issue
    end;

    trigger OnOpenPage()
    var
        UserMgt: Codeunit 5700;
    begin
        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
            Rec.FILTERGROUP(2);
            Rec.SETRANGE("Responsibility Center", UserMgt.GetServiceFilter);
            Rec.FILTERGROUP(0);
        END;

        if rec.Status = rec.Status::"Pending Approval" then
            CurrPage.Editable := false;

        if rec.Status = rec.Status::Released then
            CurrPage.Editable := false;
    end;

    var
        JobMatMgt: Codeunit "Job Request Management";
        PurchReqRelease: Codeunit PurchReqRelease;
        // ApprovalMgt: Codeunit Codeunit439;
        purchreq: Record "Store Issue Header";
        UserMgt: Codeunit "User Setup Management";
        StoreReqLine: Record "Store Issue Line";
        StoreReqHead: Record "Store Issue Header";
        JobRec: Record Job;
        ServiceLine: Record "Store Issue Line";
        TOTQty: Decimal;
        ApprovalsMagmt: Codeunit "Approval Mgmt. ExtCal";

    /// usersetup: Record "User Setup";
}

