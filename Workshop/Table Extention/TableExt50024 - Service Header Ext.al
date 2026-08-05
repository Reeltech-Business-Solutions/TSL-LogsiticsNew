tableextension 50024 "Service Header Ext" extends "Service Header"
{
    fields
    {
        field(50012; "Customer Job Type"; Code[20])
        {
            TableRelation = "Customer Job Type";

        }
        field(50013; "Job Type Code"; Code[20])
        {
            TableRelation = "Job Type Code"."Job Type Code" WHERE("Customer Job Type" = FIELD("Customer Job Type"));
        }
        field(50014; "Job Posting Group"; Code[20])
        {
            TableRelation = "Job Posting Group";
        }
        field(50015; Amount1; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Service Line".Amount WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
        }
        field(50016; "Amount Including VAT1"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Service Line"."Amount Including VAT" WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
        }
        field(50017; "Job Type"; Option)
        {
            OptionMembers = ,"KM Service",Repair,Warranty,PDI,FOC,"OEM Recall",Installation,PrevMaint,"Warranty Repairs","Non Warranty Repairs","Aggregate Repairs";

        }
        field(50019; "Business Type"; Option)
        {
            OptionMembers = ,FBO,"RT_FLEET-MAINT",EXTERNAL,REFURBISHED_ENGPARTs,MOVEABLE,MARKETING,COT,NON_MOVEABLE,"PM_FLEET-MAINT";

        }
        field(50020; "NOVATRACK ID"; Code[20])
        {

        }
        field(50021; "Quote Registered Date"; Date)
        {

        }

        field(50022; "Quote Registered By"; Code[50])
        {

        }
        field(50023; "Truck BreakDown No."; Code[20])
        {

        }
        field(50024; "KM Odometer Reading"; Decimal)
        {

        }
        field(50089; "Curr. KM Service/PM Service"; Decimal)
        {

        }
        field(50099; "User ID. Updated"; Code[50])
        {

        }
        field(50100; "User Date Updated"; Date)
        {

        }
        field(50101; "User time Updated"; Time)
        {

        }
        field(50125; "Phone No 1."; Code[20])
        {

        }
        field(50126; "Phone No. 2."; Code[20])
        {

        }
        field(50127; "Phone No. 3 (GSM)."; Code[20])
        {

        }
        field(50128; "FLeet No."; Code[20])
        {

        }
        field(50129; "Acquistion Date"; Date)
        {

        }
        field(50131; "Fleet Manager Name"; Text[100])
        {

        }
        field(50132; "Fleet Manager Phone No."; Code[30])
        {

        }
        field(50133; "Fleet Manger  Location"; Code[20])
        {

        }
        field(50134; "Fleet  Manager E-Mail"; Code[150])
        {

        }
        field(50135; "Fleet Manager"; Code[20])
        {
            /*
        IF FM.GET("Fleet Manager")   THEN
            "Fleet Manager Name" := FM."Fleet Manager Name" ;
             "Fleet Manager Phone No.":= FM."Phone No.";
             "Fleet Manger  Location":=  FM."FM Location";
             "Fleet  Manager E-Mail" := FM."FM Manager E-Mail";
    */

        }
        field(61004; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;

        }
        field(61005; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(90000; "Invoice Exist"; Boolean)
        {

        }
        field(69024; "Order No."; Code[20])
        {

        }
        field(69021; "Invoice Created"; Boolean)
        {

        }
        field(69022; "Registration No."; Code[50])
        {

        }
        field(69023; "Chassis No."; Code[50])
        {

        }
        field(69026; "Engine No."; Code[50])
        {

        }
        field(69025; "Vehicle Make"; Code[50])
        {
            TableRelation = "Vehicle Make";
        }
        field(69027; "Vehicle Model"; Code[50])
        {
            TableRelation = "Vehicle Model" where("Vehicle Make" = field("Vehicle Make"));
        }
        field(69028; "Expense Job"; Boolean)
        {

        }
        field(69029; "Shortcut dimension 3"; Code[20])

        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                          Blocked = CONST(false));
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut dimension 3")
            end;
        }

        field(69031; "AppStatus"; Option)
        {
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";

        }

        field(69032; "KM Run"; Code[20])
        {

        }
        field(69033; "Customer Type"; Option)
        {
            OptionMembers = ,Internal,External,Warranty,Contract,"Lease Operation",Insurance;

        }
        field(69034; "Shortcut dimension 4"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                          Blocked = CONST(false));
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut dimension 4")
            end;
        }
        field(69035; "Total Cost"; Decimal)
        {

        }
        field(69036; "Fuel Level"; Code[20])
        {

        }
        field(69037; "User ID"; Code[50])
        {

        }
        field(69038; "Qty Shipped"; Decimal)
        {

        }
        field(69039; "Qty Invoice"; Decimal)
        {

        }
        field(69040; Status2; Option)
        {
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";

        }
        field(69041; Cancelled; Boolean)
        {

        }
        field(69042; "Cancelled By"; Code[30])
        {

        }
        field(69043; "Cancelled Date"; Date)
        {

        }
        field(69044; "DocApprovalType"; Option)
        {
            OptionMembers = Purchase,Requisition,Quote,Capex,Service;

        }
        field(69045; "Procurement Type Code"; Code[20])
        {

        }
        field(69046; "Qty Issued from Store"; Decimal)
        {

        }
        field(69047; "Store  Location"; Code[30])
        {

        }
        field(69048; "Store Requistion No"; Code[30])
        {

        }
        field(69049; "Store Req Shipped"; Boolean)
        {

        }
        field(69050; "Return to Store"; Boolean)
        {

        }
        field(69051; "Ready For Invoice"; Boolean)
        {

        }
        field(69052; "Total WIP QTY"; Decimal)
        {

        }
        field(69053; "Total WIP Cost"; Decimal)
        {

        }
        field(69054; "Qty to Ship"; Decimal)
        {

        }
        field(69055; "Qty to  Invoice"; Decimal)
        {

        }
        field(69056; "Quotation page"; Code[20])
        {

        }

        field(69057; "Job No."; Code[20])
        {

        }
        field(69058; "Created By"; Text[50])
        {

        }
        field(69059; "Created Date"; Date)
        {

        }
        field(69060; "Approval Status"; Enum ApprovalStatus)
        {
            DataClassification = ToBeClassified;
        }
        field(69061; "Service Vehicle"; Code[20])
        {

        }
        field(69062; "Trailer"; Text[50])
        {

        }
        field(69063; "Trailer No"; Code[20])
        {
            Caption = 'Trailer Asset No.';
        }
        field(69064; "Vehicle Reg No."; Code[30])
        {
            Caption = 'Vehicle Registration No.';
        }
        field(69065; "ECP No."; Code[50])
        {
            Editable = false;
        }

        field(69066; "Job Created"; Code[20])
        {
            Editable = false;
        }
        field(69067; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
            end;
        }




    }

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created Date" := Today;
    end;

    procedure ShowDocDim()
    var
        DocDim: Record "IC Document Dimension";
        /// DocDims: Page "IC Document Dimensions";
        OldDimSetID: Integer;
        DimMgt: Codeunit DimensionManagement;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
         DimMgt.EditDimensionSet(
           "Dimension Set ID", STRSUBSTNO('%1', "No."),
           "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
            MODIFY;
            // IF PurchReqtLineExist THEN;
            //UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;
    end;

}