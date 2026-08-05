page 80026 "Job Material Request Subform"
{
    AutoSplitKey = true;
    Caption = 'Lines';
    PageType = ListPart;
    SourceTable = "Material Request Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    Editable = FieldEditable;
                    trigger OnValidate()
                    begin
                        //ERROR('YOU CANNOT ADD AN ITEM TO THE MATERIAL ISSUE, ADD FROM JOB PLNNING LINES');
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = FieldEditable;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Product Group Code"; Rec."Product Group Code")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    Editable = FieldEditable;
                }
                field("Quantity in Inventory"; Rec."Quantity in Inventory")
                {
                    ApplicationArea = All;
                    Editable = FieldEditable;
                }
                field("Request from procurement"; Rec.Notifications)
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Qty on Purch. Order"; Rec."Qty on Purch. Order")
                {
                    ApplicationArea = All;
                    Editable = FieldEditable;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    Editable = FieldEditable;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    Editable = false;
                    ApplicationArea = All;
                    visible = false;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    Editable = false;
                    ApplicationArea = All;
                    visible = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    Editable = FieldEditable;
                    ApplicationArea = All;
                }
                field("Job No."; Rec."Job No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = All;
                    Editable = FieldEditable;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    // Visible = false;
                    ApplicationArea = All;
                    Editable = FieldEditable;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    // Visible = false;
                    ApplicationArea = All;
                    Editable = FieldEditable;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    // Visible = false;
                    ApplicationArea = All;
                    Editable = FieldEditable;
                }



                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    Editable = FieldEditable;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    Editable = FieldEditable;
                    ApplicationArea = All;
                }
                field("Planning Line GBPG"; Rec."Planning Line GBPG")
                {
                    ApplicationArea = All;
                    Editable = FieldEditable;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = All;
                    Editable = FieldEditable;
                }
                field("Service Item"; Rec."Service Item")
                {
                    /// BlankZero = true;
                    ApplicationArea = All;
                    Editable = FieldEditable;
                }
                field("Approve/Reject"; Rec."Approve/Reject")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Send To"; Rec."Send To")
                {
                    ApplicationArea = All;
                    Editable = FieldEditable;
                }
                field(Sender; Rec.Sender)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Send For Approval"; Rec."Send For Approval")
                {
                    ApplicationArea = All;
                    Editable = FieldEditable;
                }
                field("Sent Date"; Rec."Sent Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Approved By"; Rec."Approved By")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Reasons for Rejecting Part"; Rec."Reasons for Rejecting Part")
                {
                    ApplicationArea = All;
                    Editable = FieldEditable;
                }
                field("Quantity CONSM Per Year"; Rec."Quantity CONSM Per Year")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Quotation Approved By"; Rec."Quotation Approved By")
                {
                    Editable = false;
                    ApplicationArea = All;

                }
                field("Quotation Approval Date"; Rec."Quotation Approval Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }


                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field("Additional Material Request"; Rec."Additional Material Request")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action(Dimension)
                {
                    Caption = 'Dimension';
                    ApplicationArea = All;
                    Image = Dimensions;

                    trigger OnAction()
                    begin
                        Rec.ShowDimensions;
                    end;
                }

                action("Create Purchase Requisition")
                {
                    Caption = 'Create Purch. Req';
                    ApplicationArea = All;
                    Image = SendTo;


                    trigger OnAction()
                    begin
                        if not Confirm('Do you want to transfer record to purchase line?', true) then
                            exit;
                        TransferRecordToPurchaseline();
                    end;

                }


                action("Update Purchase Requisition")
                {
                    Caption = 'Update Purchase Requisition';
                    ApplicationArea = All;
                    Image = SendTo;


                    trigger OnAction()
                    begin
                        if not Confirm('Do you want to update purchase requisition?', true) then
                            exit;
                        updateRecordOnPurchaseLine();
                    end;

                }
            }





        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        //ERROR('YOU CANNOT ADD TO THE MATERIAL REQUEST, ADD FROM JOB PLNNING LINES');
    end;

    var
        ItemNoEnable: Boolean;
        MaterialReqHeader: Record "Material Request Header";
        purReq: Record "Purchases & Payables Setup";
        PurRecPage: page "Purchase Local Req";

    procedure UpdateSubform()
    begin
        CurrPage.Update(false);
    end;

    procedure TransferRecordToPurchaseline()
    var
        DocNo: Code[30];
        JobMaterialRequestHeader: Record "Material Request Header";
        JobMaterialRequestLines: Record "Material Request Line";
        PurchaseLine: Record "Purchase Line";
        PurchaseLineQuantity: Decimal;
        PurchaseHeader: Record "Purchase Header";
        // NoSer: Codeunit NoSeriesManagement;
        NoSer: Codeunit "No. Series";
        purReq: Record "Purchases & Payables Setup";
        Item: Record Item;
        Success: Boolean;
        Jobs: Record Job;
        JobMaterialRequestLines2: Record "Material Request Line";
    // recalculatedPurchaseLineAmount: Decimal;
    begin
        // Fetch Purchases & Payables Setup
        Clear(PurRecPage);

        JobMaterialRequestHeader.Get(Rec."Document No.");
        if JobMaterialRequestHeader."purch. req doc no" <> '' then
            Error('A purchase requisition already exists for these job material request lines %1.', JobMaterialRequestHeader."purch. req doc no");
        JobMaterialRequestLines.Reset();
        JobMaterialRequestLines.setRange("Document No.", JobMaterialRequestHeader."No.");
        if JobMaterialRequestLines.FindSet() then
            if not (JobMaterialRequestLines.Notifications = true) then
                error('The Request from procurement field is not ticked');

        JobMaterialRequestLines2.setRange("Document No.", JobMaterialRequestHeader."No.");
        if JobMaterialRequestLines2.findSet() then
            if Jobs.Get(Rec."Job No.") then
                if ((Jobs."Workshop Status" = Jobs."Workshop Status"::Completed) OR (Jobs.Status = Jobs.Status::Completed)) then
                    Error('You cannot send for material request because job is completed');
        purReq.Get();
        Success := false;

        DocNo := NoSer.GetNextNo(purReq."Local Purcahse Req", Today, true); // Generate DocNo

        PurchaseHeader.Init();
        PurchaseHeader."Document Type" := PurchaseHeader."Document Type"::Quote;
        PurchaseHeader."Purchase Type" := PurchaseHeader."Purchase Type"::"Local Requisition";

        PurchaseHeader."No." := DocNo;
        PurchaseHeader."No. Series" := purReq."Local Purcahse Req";
        PurchaseHeader."Shortcut Dimension 1 Code" := JobMaterialRequestHeader."Global Dimension 1 Code";
        PurchaseHeader."Shortcut Dimension 2 Code" := JobMaterialRequestHeader."Global Dimension 2 Code";
        PurchaseHeader."Shortcut Dimension 3 Code" := JobMaterialRequestHeader."Shortcut Dimension 3 Code";
        PurchaseHeader."Shortcut Dimension 4 Code" := JobMaterialRequestHeader."Shortcut Dimension 4 Code";
        PurchaseHeader."Shortcut Dimension 5 Code" := JobMaterialRequestHeader."Shortcut Dimension 5 Code";
        PurchaseHeader."Shortcut Dimension 6 Code" := JobMaterialRequestHeader."Shortcut Dimension 6 Code";
        PurchaseHeader."Shortcut Dimension 7 Code" := JobMaterialRequestHeader."Shortcut Dimension 7 Code";
        PurchaseHeader."Shortcut Dimension 8 Code" := JobMaterialRequestHeader."Shortcut Dimension 8 Code";
        PurchaseHeader."Material Req. No." := JobMaterialRequestHeader."No.";
        PurchaseHeader."Request Type" := PurchaseHeader."Request Type"::Requisition;
        // Message('hey %1', PurchaseHeader."Shortcut Dimension 1 Code");
        // exit;
        PurchaseHeader."Buy-from Vendor No." := 'INT0001';
        PurchaseHeader."Pay-to Vendor No." := 'INT0001';
        PurchaseHeader."Order Date" := Today;
        if PurchaseHeader.Insert(true) then begin
            PurchaseHeader.VALIDATE("No.", DocNo);

            PurchaseHeader.Validate("Buy-from Vendor No.", 'INT0001');
            PurchaseHeader.Validate("Pay-to Vendor No.", 'INT0001');
            PurchaseHeader.Validate("Order Date", Today);
            PurchaseHeader.Validate("Shortcut Dimension 1 Code", JobMaterialRequestHeader."Global Dimension 1 Code");
            PurchaseHeader.Validate("Shortcut Dimension 2 Code", JobMaterialRequestHeader."Global Dimension 2 Code");
            PurchaseHeader.Validate("Shortcut Dimension 3 Code", JobMaterialRequestHeader."Shortcut Dimension 3 Code");
            PurchaseHeader.Validate("Shortcut Dimension 4 Code", JobMaterialRequestHeader."Shortcut Dimension 4 Code");
            PurchaseHeader.Validate("Shortcut Dimension 5 Code", JobMaterialRequestHeader."Shortcut Dimension 5 Code");
            PurchaseHeader.Validate("Shortcut Dimension 6 Code", JobMaterialRequestHeader."Shortcut Dimension 6 Code");
            PurchaseHeader.Validate("Shortcut Dimension 7 Code", JobMaterialRequestHeader."Shortcut Dimension 7 Code");
            PurchaseHeader.Validate("Shortcut Dimension 8 Code", JobMaterialRequestHeader."Shortcut Dimension 8 Code");
        end;


        JobMaterialRequestLines.Reset();
        JobMaterialRequestLines.SetRange("Document No.", JobMaterialRequestHeader."No.");
        JobMaterialRequestLines.SetRange(Notifications, true);

        if JobMaterialRequestLines.FindSet() then begin
            repeat
                JobMaterialRequestLines.CalcFields("Quantity in Inventory");


                if JobMaterialRequestLines.Quantity > 0 then begin
                    if JobMaterialRequestLines."Quantity in Inventory" < JobMaterialRequestLines.Quantity then
                        PurchaseLineQuantity := JobMaterialRequestLines.Quantity - JobMaterialRequestLines."Quantity in Inventory"
                    else
                        PurchaseLineQuantity := JobMaterialRequestLines.Quantity;



                    if PurchaseLineQuantity > 0 then begin
                        PurchaseLine.Init();
                        PurchaseLine."Document Type" := PurchaseHeader."Document Type";

                        PurchaseLine."Document No." := PurchaseHeader."No.";
                        PurchaseLine.Type := PurchaseLine.Type::Item;
                        PurchaseLine.Validate("No.", JobMaterialRequestLines."Item No.");
                        PurchaseLine.Validate("Quantity", PurchaseLineQuantity);

                        PurchaseLine.Validate("Gen. Bus. Posting Group", JobMaterialRequestLines."Gen. Bus. Posting Group");
                        PurchaseLine."Location Code" := JobMaterialRequestLines."Location Code";
                        PurchaseLine."Line No." := JobMaterialRequestLines."Line No.";
                        PurchaseLine.Validate("Shortcut Dimension 1 Code", JobMaterialRequestLines."Shortcut Dimension 1 Code");
                        PurchaseLine.Validate("Shortcut Dimension 2 Code", JobMaterialRequestLines."Shortcut Dimension 2 Code");
                        PurchaseLine.Validate("Shortcut Dimension 5 Code", JobMaterialRequestLines."Shortcut Dimension 5 Code");
                        PurchaseLine.Validate("Shortcut Dimension 6 Code", JobMaterialRequestLines."Shortcut Dimension 6 Code");
                        PurchaseLine.Validate("Shortcut Dimension 7 Code", JobMaterialRequestLines."Shortcut Dimension 7 Code");
                        PurchaseLine.Validate("Shortcut Dimension 8 Code", JobMaterialRequestLines."Shortcut Dimension 8 Code");

                        if PurchaseLine."No." <> '' then
                            if Item.Get(PurchaseLine."No.") then
                                PurchaseLine."Description" := Item.Description;
                        PurchaseLine."Gen. Prod. Posting Group" := Item."Gen. Prod. Posting Group";
                        PurchaseLine."VAT Prod. Posting Group" := Item."VAT Prod. Posting Group";
                        PurchaseLine."Direct Unit Cost" := Item."Unit Cost";
                        PurchaseLine."Unit of Measure" := item."Base Unit of Measure";
                        PurchaseLine."Unit of Measure Code" := item."Base Unit of Measure";
                        PurchaseLine.Validate("Direct Unit Cost", 0);
                        if PurchaseLine.Insert(true) then
                            Success := true;

                    end;
                end;
            until JobMaterialRequestLines.Next() = 0;
        end;
        if Success then begin
            JobMaterialRequestHeader."purch. req doc no" := DocNo;
            JobMaterialRequestHeader.Modify();
            Message('The document has been transferred successfully to the purchase requisition %1.', DocNo);
        end;
    end;


    procedure updateRecordOnPurchaseLine()
    var
        JobMaterialRequestHeader: Record "Material Request Header";
        JobMaterialRequestLines: Record "Material Request Line";
        PurchaseLine: Record "Purchase Line";
        PurchaseLineQuantity: Decimal;
        PurchaseHeader: Record "Purchase Header";
        Item: Record Item;
        Success: Boolean;
        Jobs: Record Job;
        JobMaterialRequestLines2: Record "Material Request Line";


    begin
        Success := false;
        JobMaterialRequestHeader.Get(Rec."Document No.");
        if JobMaterialRequestHeader."purch. req doc no" = '' then
            Error('The Material Request has not been transferred to a Purchase Requisition Document yet.');

        JobMaterialRequestLines.Reset();
        JobMaterialRequestLines.setRange("Document No.", JobMaterialRequestHeader."No.");
        if JobMaterialRequestLines.FindSet() then
            if not (JobMaterialRequestLines.Notifications = true) then
                error('The Request from procurement field is not ticked');

        JobMaterialRequestLines2.setRange("Document No.", JobMaterialRequestHeader."No.");
        if JobMaterialRequestLines2.findSet() then
            if Jobs.Get(Rec."Job No.") then
                if ((Jobs."Workshop Status" = Jobs."Workshop Status"::Completed) OR (Jobs.Status = Jobs.Status::Completed)) then
                    Error('You cannot send for material request because job is completed');

        if PurchaseHeader.Get(purchaseHeader."Document Type"::Quote, JobMaterialRequestHeader."purch. req doc no") then begin
            PurchaseHeader."Shortcut Dimension 1 Code" := JobMaterialRequestHeader."Global Dimension 1 Code";
            PurchaseHeader."Shortcut Dimension 2 Code" := JobMaterialRequestHeader."Global Dimension 2 Code";
            PurchaseHeader."Shortcut Dimension 3 Code" := JobMaterialRequestHeader."Shortcut Dimension 3 Code";
            PurchaseHeader."Shortcut Dimension 4 Code" := JobMaterialRequestHeader."Shortcut Dimension 4 Code";
            PurchaseHeader."Shortcut Dimension 5 Code" := JobMaterialRequestHeader."Shortcut Dimension 5 Code";
            PurchaseHeader."Shortcut Dimension 6 Code" := JobMaterialRequestHeader."Shortcut Dimension 6 Code";
            PurchaseHeader."Shortcut Dimension 7 Code" := JobMaterialRequestHeader."Shortcut Dimension 7 Code";
            PurchaseHeader."Shortcut Dimension 8 Code" := JobMaterialRequestHeader."Shortcut Dimension 8 Code";
            PurchaseHeader."Order Date" := Today;
            PurchaseHeader.Modify(true);
        end;

        JobMaterialRequestLines.Reset();
        JobMaterialRequestLines.SetRange("Document No.", JobMaterialRequestHeader."No.");
        JobMaterialRequestLines.SetRange(Notifications, true);

        if JobMaterialRequestLines.FindSet() then begin
            repeat
                JobMaterialRequestLines.CalcFields("Quantity in Inventory");
                if JobMaterialRequestLines."Quantity in Inventory" < JobMaterialRequestLines.Quantity then
                    PurchaseLineQuantity := (JobMaterialRequestLines.Quantity - JobMaterialRequestLines."Quantity in Inventory");

                // if PurchaseLine.Get(PurchaseLine."Document Type"::Quote, JobMaterialRequestHeader."purch. req doc no", JobMaterialRequestLines."Line No.") then begin
                PurchaseLine.Reset();
                PurchaseLine.setFilter("Document No.", '%1', JobMaterialRequestHeader."purch. req doc no");
                PurchaseLine.SetFilter("Line No.", '%1', JobMaterialRequestLines."Line No.");
                IF PurchaseLine.findfirst() then begin

                    // PurchaseLine."Document No." := PurchaseHeader."No.";
                    PurchaseLine."No." := JobMaterialRequestLines."Item No.";
                    PurchaseLine."Quantity" := PurchaseLineQuantity;
                    PurchaseLine."Location Code" := JobMaterialRequestLines."Location Code";
                    PurchaseLine.Validate("Shortcut Dimension 1 Code", JobMaterialRequestLines."Shortcut Dimension 1 Code");
                    PurchaseLine.Validate("Shortcut Dimension 2 Code", JobMaterialRequestLines."Shortcut Dimension 2 Code");
                    PurchaseLine.Validate("Gen. Prod. Posting Group", JobMaterialRequestLines."Gen. Bus. Posting Group");

                    PurchaseLine.Type := PurchaseLine.Type::Item;

                    if PurchaseLine."No." <> '' then
                        if Item.Get(PurchaseLine."No.") then
                            PurchaseLine."Description" := Item.Description;
                    PurchaseLine."Gen. Prod. Posting Group" := Item."Gen. Prod. Posting Group";
                    PurchaseLine."VAT Prod. Posting Group" := Item."VAT Prod. Posting Group";
                    PurchaseLine."Direct Unit Cost" := Item."Unit Cost";
                    PurchaseLine."Unit of Measure" := item."Base Unit of Measure";
                    PurchaseLine."Unit of Measure Code" := item."Base Unit of Measure";
                    PurchaseLine.Validate("Direct Unit Cost", 0);


                    if PurchaseLine.Modify(true) then
                        Success := true;


                end else begin

                    PurchaseLine.Init();
                    PurchaseLine."Document Type" := PurchaseHeader."Document Type";
                    PurchaseLine."Document No." := PurchaseHeader."No.";
                    PurchaseLine."No." := JobMaterialRequestLines."Item No.";
                    PurchaseLine.Validate("Quantity", PurchaseLineQuantity);

                    PurchaseLine."Location Code" := JobMaterialRequestLines."Location Code";
                    PurchaseLine."Line No." := JobMaterialRequestLines."Line No.";
                    PurchaseLine.Validate("Shortcut Dimension 1 Code", JobMaterialRequestLines."Shortcut Dimension 1 Code");
                    PurchaseLine.Validate("Shortcut Dimension 2 Code", JobMaterialRequestLines."Shortcut Dimension 2 Code");
                    PurchaseLine.Validate("Gen. Bus. Posting Group", JobMaterialRequestLines."Gen. Bus. Posting Group");
                    PurchaseLine.Type := PurchaseLine.Type::Item;

                    if PurchaseLine."No." <> '' then
                        if Item.Get(PurchaseLine."No.") then
                            PurchaseLine."Description" := Item.Description;
                    PurchaseLine."Gen. Prod. Posting Group" := Item."Gen. Prod. Posting Group";
                    PurchaseLine."VAT Prod. Posting Group" := Item."VAT Prod. Posting Group";
                    PurchaseLine."Direct Unit Cost" := Item."Unit Cost";
                    PurchaseLine."Unit of Measure" := item."Base Unit of Measure";
                    PurchaseLine."Unit of Measure Code" := item."Base Unit of Measure";
                    PurchaseLine.Validate("Direct Unit Cost", Item."Unit Cost");


                    if PurchaseLine.Insert(true) then
                        Success := true;

                end;


            until JobMaterialRequestLines.Next() = 0;

            JobMaterialRequestLines.Reset();
            JobMaterialRequestLines.SetRange("Document No.", JobMaterialRequestHeader."No.");
            JobMaterialRequestLines.SetRange(Notifications, false);

            if JobMaterialRequestLines.FindSet() then begin
                repeat
                    PurchaseLine.Reset();
                    PurchaseLine.setFilter("Document No.", '%1', JobMaterialRequestHeader."purch. req doc no");
                    PurchaseLine.SetFilter("Line No.", '%1', JobMaterialRequestLines."Line No.");
                    if PurchaseLine.FindFirst() then
                        PurchaseLine.Delete();
                until JobMaterialRequestLines.Next() = 0;
            end;
        end;
        if Success then begin
            Message('The document has been modified and transferred successfully to the purchase requisition document.');
        end;



    end;

    procedure SetHeaderStatus(Status: Option Open,"Pending Approval",Released)
    begin
        HeaderStatus := Status;

        // Lock all lines if status is Released
        FieldEditable := true;
        if ((HeaderStatus = HeaderStatus::Released) OR (HeaderStatus = HeaderStatus::"Pending Approval")) then
            FieldEditable := false;
    end;

    trigger OnAfterGetRecord()
    var
        matReq: Record "Material Request Header";
    begin
        if matReq.Get(Rec."Document No.") then begin
            Rec."Service Item" := matReq."Service Vehicle";
            Rec."Vehicle Registration No." := MatReq."Vehicle Registration No.";
            Rec.Modify();
        end;

    end;

    var
        HeaderStatus: Option Open,"Pending Approval",Released;
        FieldEditable: Boolean;
}

