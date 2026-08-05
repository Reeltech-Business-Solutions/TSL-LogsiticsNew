page 80025 "Job Material Request"
{
    PageType = Card;
    ApplicationArea = All;
    PromotedActionCategories = 'New,Process,Report,Request Approval';
    SourceTable = "Material Request Header";
    SourceTableView = WHERE("Request Type" = CONST(Job), "Entry Type" = FILTER(Issue));
    InsertAllowed = false;

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

                    trigger OnAssistEdit()
                    begin
                        IF Rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = All;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Job Task Description"; Rec."Job Task Description")
                {
                    ApplicationArea = All;
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    Editable = FieldEditable;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Request Type"; Rec."Request Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    NotBlank = true;
                    ApplicationArea = All;
                    Editable = false;
                    Visible = true;
                    Caption = 'Location';
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                    ApplicationArea = All;
                    Editable = false;
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
                field("ECP No."; Rec."ECP No.")
                {
                    ApplicationArea = All;
                }

                field("Additional Material Request"; Rec."Additional Material Request")
                {
                    ApplicationArea = All;
                }

                field("Purchase req Doc No"; Rec."purch. req doc no")
                {
                    ApplicationArea = All;
                    Editable = false;

                    trigger onDrillDown()
                    var
                        purchReq: Record "Purchase Header";
                        purList: page "Purchase Local Req List";
                    begin
                        purchReq.Reset();
                        PurchReq.setFilter("No.", rec."purch. req doc no");

                        if PurchReq.FindSet() then begin
                            purList.SetTableView(PurchReq);
                            purList.Run();
                        end;
                    end;
                }

            }
            part(RequestLine; "Job Material Request Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD("No.");
            }
            group("User Trial")
            {
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
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
                field(Processed; Rec.Processed)
                {
                    ApplicationArea = All;
                }



            }
        }
        area(factboxes)
        {
            // systempart(Control26; Outlook)
            // {
            //     ApplicationArea = All;
            // }
            // systempart(Control27; Notes)
            // {
            //     ApplicationArea = All;
            // }
            // systempart(Control28; MyNotes)
            // {
            //     ApplicationArea = All;
            // }
            // systempart(Control29; Links)
            // {
            //     ApplicationArea = All;
            // }
            part(JobMaterialFactboxControl; "Job Material Factbox")
            {
                ApplicationArea = All;
                SubpageLink = "No." = field("No.");
                caption = 'Job Material Request Factbox';
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
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                    end;
                }
                action("A&pprovals")
                {
                    Caption = 'A&pprovals';
                    Image = Approvals;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        Approvalentries: Page "Approval Entries";
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                        doctype: Enum "Approval Document Type";
                    begin
                        doctype := doctype::Requisition;
                        //   WorkflowsEntriesBuffer.RunWorkflowEntriesPage(Rec.RecordId, DATABASE::"Material Request Header", DocType.AsInteger(), Rec."No.");
                        Approvalentries.SetRecordFilters(80001, Doctype, rec."No.");
                        Approvalentries.Run();
                    end;
                }
            }
        }
        area(processing)
        {
            group(Release)
            {
                Caption = 'Release';
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Get Job Planning Lines")
                {
                    Caption = 'Get Job Planning Lines';
                    Image = JobLines;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        JobPlanningLine: Record "Job Planning Line";
                        JobMatMgt: Codeunit "Job Request Management";
                    begin
                        JobPlanningLine.RESET;
                        JobPlanningLine.SETRANGE(JobPlanningLine."Job No.", Rec."Job No.");
                        JobPlanningLine.SETRANGE(JobPlanningLine.Type, JobPlanningLine.Type::Item);
                        IF JobPlanningLine.FIND('-') THEN
                            REPEAT
                            BEGIN
                                //Look for JOB LEDger here on Task line.

                                //////USed to check Default qty for battery and Tyres   ddada04132020
                                IF (JobPlanningLine."Gen. Prod. Posting Group" = 'TYRE') AND (NOT JobPlanningLine."Allow Approved Usage") THEN BEGIN

                                    TOTQty := JobPlanningLine."Quantity CONSM Per Year" + JobPlanningLine.Quantity;
                                    IF TOTQty > 8 THEN BEGIN
                                        JobPlanningLine.RESET;
                                        JobPlanningLine.TESTFIELD(JobPlanningLine."Approve/Reject", 0);
                                        JobPlanningLine."Reason For Approval" := 2;
                                        JobPlanningLine."BLocking Notification" := TRUE;
                                        ERROR('You cannot Create Jobs-Sales Invoice. The Item %4 \You had Prev. Consu. %1 Already + current qty %2 = %3 Tyres \You have excedded the 8 Batteries Default Qty. \please contact your Head Of Operations'
                                        , JobPlanningLine."Quantity CONSM Per Year", JobPlanningLine.Quantity, TOTQty, JobPlanningLine."No.");
                                    END;
                                END;

                                //////USed to check Default qty for battery and Tyres   ddada04132020

                                IF (JobPlanningLine."Gen. Prod. Posting Group" = 'BATTERY') AND (NOT JobPlanningLine."Allow Approved Usage") THEN BEGIN

                                    TOTQty := JobPlanningLine."Quantity CONSM Per Year" + JobPlanningLine.Quantity;
                                    IF TOTQty > 2 THEN BEGIN
                                        JobPlanningLine.RESET;
                                        JobPlanningLine.TESTFIELD(JobPlanningLine."Approve/Reject", 0);
                                        JobPlanningLine."Reason For Approval" := 2;
                                        JobPlanningLine."BLocking Notification" := TRUE;
                                        ERROR('You cannot Create Jobs-Sales Invoice. The Item %4 \You had Prev. Consu. %1 Already + current qty %2 = %3 Tyres \You have excedded the 2 Tyres Default Qty. \please contact your Head Of Operations'
                                        , JobPlanningLine."Quantity CONSM Per Year", JobPlanningLine.Quantity, TOTQty, JobPlanningLine."No.");
                                        // VALIDATE(Quantity,0);
                                    END;
                                END;
                            END;
                            UNTIL JobPlanningLine.NEXT = 0;

                        //////USed to check Default qty for battery and Tyres   ddada04132020




                        /*IF (JobPlanningLine."Gen. Prod. Posting Group" = 'TYRE') AND  (NOT JobPlanningLine."Allow Approved Usage") THEN
                          BEGIN

                           TOTQty := JobPlanningLine."Quantity CONSM Per Year" + JobPlanningLine.Quantity;
                           IF   TOTQty > 8   THEN
                           BEGIN
                              JobPlanningLine.RESET;
                              JobPlanningLine.TESTFIELD(JobPlanningLine."Approve/Reject",0);
                              JobPlanningLine."Reason For Approval" := 2;
                              JobPlanningLine."BLocking Notification" :=TRUE;
                              ERROR('You cannot Create Jobs-Sales Invoice. The Item %4 \You had Prev. Consu. %1 Already + current qty %2 = %3 Tyres \You have excedded the 8 Batteries Default Qty. \please contact your Head Of Operations'
                              ,JobPlanningLine."Quantity CONSM Per Year",JobPlanningLine.Quantity,TOTQty,JobPlanningLine."No.");
                            END;
                          END;

                        IF (JobPlanningLine."Gen. Prod. Posting Group" = 'BATTERY')  AND (NOT JobPlanningLine."Allow Approved Usage") THEN
                          BEGIN

                           TOTQty := JobPlanningLine."Quantity CONSM Per Year" + JobPlanningLine.Quantity;
                           IF TOTQty>2 THEN
                           BEGIN
                              JobPlanningLine.RESET;
                              JobPlanningLine.TESTFIELD(JobPlanningLine."Approve/Reject",0);
                              JobPlanningLine."Reason For Approval" := 2;
                              JobPlanningLine."BLocking Notification" :=TRUE;
                              ERROR('You cannot Create Jobs-Sales Invoice. The Item %4 \You had Prev. Consu. %1 Already + current qty %2 = %3 Tyres \You have excedded the 2 Tyres Default Qty. \please contact your Head Of Operations'
                              ,JobPlanningLine."Quantity CONSM Per Year",JobPlanningLine.Quantity,TOTQty,JobPlanningLine."No.");
                              // VALIDATE(Quantity,0);
                            END;
                          END;
                        //////USed to check Default qty for battery and Tyres   ddada04132020
                         */



                        JobMatMgt.GetJobPlanningLines(Rec);
                        CurrPage.RequestLine.PAGE.UpdateSubform;
                        //

                    end;
                }
                action("Send A&pproval Request")
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    ApplicationArea = All;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        Confirmation: Label 'Are you sure you want to send this document for approval';
                    begin
                        IF NOT LinesExists THEN
                            ERROR('There are no Lines created for this Document');
                        begin
                            if ApprovalsMgmt.CheckJobMaterialRequestApprovalsWorkflowEnable(rec) then
                                ApprovalsMgmt.OnSendJobMaterialForApproval(Rec);
                        end;

                        //Status:=Status::Released;
                        //MODIFY;

                        //Release the Imprest for Approval
                        /// IF ApprovalMgt.SendJobMatRequestApprovalRequest(Rec) THEN;
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    Caption = 'Cancel Approval Re&quest';
                    Image = Reject;
                    Promoted = true;
                    ApplicationArea = All;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        Confirmation: Label 'Are you sure you want to cancel approval request?';
                    begin
                        ApprovalsMgmt.OnCancelJobMaterialForApproval(Rec);
                    end;
                }
                action(Action1000000002)
                {
                    Caption = 'Release';
                    Image = ReleaseDoc;
                    ApplicationArea = All;
                    RunObject = Codeunit "Job Material Request Release";
                    Visible = false;

                }
                action(Repoen)
                {
                    Caption = 'Repoen';
                    Image = ReOpen;
                    ApplicationArea = All;
                    Visible = false;


                    trigger OnAction()
                    begin
                        /// MatReqRelease.Reopen(Rec);
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
            }
            group("&Print")
            {
                Caption = '&Print';
                action(Print)
                {
                    Caption = 'Print';
                    Image = Print;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        JobPlanningLine: Record "Job Planning Line";
                        MatReqHeader: Record "Material Request Header";
                    begin
                        //////USed to check Default qty for battery and Tyres   ddada04132020
                        IF (JobPlanningLine."Gen. Prod. Posting Group" = 'TYRE') AND (NOT JobPlanningLine."Allow Approved Usage") THEN BEGIN

                            TOTQty := JobPlanningLine."Quantity CONSM Per Year" + JobPlanningLine.Quantity;
                            IF TOTQty > 8 THEN BEGIN
                                JobPlanningLine.RESET;
                                JobPlanningLine.TESTFIELD(JobPlanningLine."Approve/Reject", 0);
                                JobPlanningLine."Reason For Approval" := 2;
                                JobPlanningLine."BLocking Notification" := TRUE;
                                ERROR('You cannot Create Jobs-Sales Invoice. The Item %4 \You had Prev. Consu. %1 Already + current qty %2 = %3 Tyres \You have excedded the 8 Batteries Default Qty. \please contact your Head Of Operations'
                                , JobPlanningLine."Quantity CONSM Per Year", JobPlanningLine.Quantity, TOTQty, JobPlanningLine."No.");
                            END;
                        END;

                        IF (JobPlanningLine."Gen. Prod. Posting Group" = 'BATTERY') AND (NOT JobPlanningLine."Allow Approved Usage") THEN BEGIN

                            TOTQty := JobPlanningLine."Quantity CONSM Per Year" + JobPlanningLine.Quantity;
                            IF TOTQty > 2 THEN BEGIN
                                JobPlanningLine.RESET;
                                JobPlanningLine.TESTFIELD(JobPlanningLine."Approve/Reject", 0);
                                JobPlanningLine."Reason For Approval" := 2;
                                JobPlanningLine."BLocking Notification" := TRUE;
                                ERROR('You cannot Create Jobs-Sales Invoice. The Item %4 \You had Prev. Consu. %1 Already + current qty %2 = %3 Tyres \You have excedded the 2 Tyres Default Qty. \please contact your Head Of Operations'
                                , JobPlanningLine."Quantity CONSM Per Year", JobPlanningLine.Quantity, TOTQty, JobPlanningLine."No.");
                                // VALIDATE(Quantity,0);
                            END;
                        END;
                        //////USed to check Default qty for battery and Tyres   ddada04132020

                        MatReqHeader.SETRANGE("No.", Rec."No.");
                        IF MatReqHeader.FINDFIRST THEN
                            REPORT.RUN(50568, TRUE, FALSE, MatReqHeader);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Request Type" := Rec."Request Type"::Job;
        Rec."Entry Type" := Rec."Entry Type"::Issue;

        IF rec."Request Date" = 0D THEN
            rec."Request Date" := WORKDATE;

        rec."Created By" := USERID;
        rec."Created Date" := TODAY;
        rec."Created Time" := TIME;
        rec."Requested By" := rec."Created By";
    end;

    // trigger OnOpenPage()

    // begin
    //     // rec.SetFilter("Created By", '%1', UserId);
    //     if rec.Status = rec.Status::"Pending Approval" then
    //         CurrPage.Editable := false;

    //     if rec.Status = rec.Status::Released then
    //         CurrPage.Editable := false;


    // end;

    trigger OnOpenPage()
    begin
        FieldEditable := true;

        if ((Rec.Status = Rec.Status::Released) OR (Rec.Status = Rec.Status::"Pending Approval")) then
            FieldEditable := false;

        currPage.RequestLine.Page.SetHeaderStatus(Rec.Status);
    end;

    trigger OnAfterGetRecord()
    begin
        CurrPage.RequestLine.Page.SetHeaderStatus(Rec.Status);
    end;



    var
        JobMatMgt: Codeunit "Job Request Management";
        MatReqRelease: Codeunit "Job Material Request Release";
        MatReqHeader: Record "Material Request Header";
        ApprovalMgt: Codeunit "Approval mgt custom";
        HasLines: Boolean;
        JobPlanningLine: Record "Job Planning Line";
        TOTQty: Decimal;
        ApprovalsMgmt: Codeunit "Approval Mgmt. ExtCal";

        FieldEditable: Boolean;

    procedure LinesExists(): Boolean
    var
        JobMatReqLines: Record "Material Request Line";
    begin
        HasLines := FALSE;
        JobMatReqLines.RESET;
        JobMatReqLines.SETRANGE(JobMatReqLines."Document No.", Rec."No.");
        IF JobMatReqLines.FIND('-') THEN BEGIN
            JobMatReqLines.TESTFIELD(JobMatReqLines."Gen. Bus. Posting Group");    //DDADA
            HasLines := TRUE;
            EXIT(HasLines);
        END;
    end;


}



