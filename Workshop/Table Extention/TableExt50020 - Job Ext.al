tableextension 50020 "Job Ext" extends Job
{
    fields
    {
        field(50000; "Registration Card Ref"; Code[20])
        {

        }

        field(50001; "Customer Ship to Name"; Text[30])
        {

        }
        field(50002; "Vehicle Registr. Plate No"; Code[20])
        {

        }
        field(50003; "Customer Identification No"; Code[20])
        {

        }
        field(50004; "Vehicle/Equipment Make"; Code[20])
        {

        }
        field(50005; "Vehicle/Equipment Model"; Code[30])
        {

        }
        field(50006; "Vehicle Reporting Date"; Date)
        {

        }
        field(50007; "Vehicle Reporting Time"; Time)
        {

        }
        field(50008; "Vehicle In Date"; Date)
        {

        }
        field(50009; "Vehicle In Time"; Time)
        {

        }
        field(50010; "Estimate No"; Code[20])
        {

        }
        field(50011; "Estimate Date"; Date)
        {

        }
        field(50012; "Estimate Value (Price)"; Decimal)
        {

        }
        field(50013; "Work Order No"; Code[20])
        {

        }
        field(50014; "Work Order Date"; Date)
        {

        }
        field(50015; "Work Order Rcpt. Date"; Date)
        {

        }
        field(50016; "Work Order Value"; Decimal)
        {

        }
        field(50017; "Job Type"; Option)
        {
            OptionMembers = ,"KM Service",Repair,Warranty,PDI,FOC,"OEM Recall",Installation,PrevMaint,"Warranty Repairs","Non Warranty Repairs","Aggregate Repairs";

        }
        field(50018; "Job Narration"; Text[250])
        {

        }
        field(50019; "Failure Code"; Code[20])
        {

        }
        field(50020; "Failure Sub Code"; Code[20])
        {

        }
        field(50021; "Labour Item Code"; Code[20])
        {

        }
        field(50022; "Labour SRT Hours"; Integer)
        {

        }
        field(50023; "Labour SRT Description"; Text[50])
        {

        }
        field(50024; "Labour Rate per Hour"; Decimal)
        {

        }
        field(50025; "Labour Rate Discount"; Decimal)
        {

        }
        field(50026; "Towing Charges"; Decimal)
        {

        }
        field(50027; "Misclleneous Work Description"; Text[50])
        {

        }
        field(50028; "Misclleneous Charges"; Decimal)
        {

        }
        field(50029; "Pre Invoice Number"; Code[20])
        {

        }
        field(50030; "Pre Invoice Date"; Date)
        {

        }
        field(50031; "Pre Invoice Amount"; Decimal)
        {

        }
        field(50032; "Final Invoice Number"; Code[20])
        {

        }
        field(50033; "Final Invoice Date"; Date)
        {

        }
        field(50034; "Final Invoice Amount"; Decimal)
        {

        }
        field(50035; "Job Completion Date"; Date)
        {

        }
        field(50036; "Job Collection Date"; Date)
        {

        }
        field(50037; "Service Code"; Code[20])
        {

        }
        field(50038; "Approve Job"; Boolean)
        {

        }
        field(50039; "Job Completion Time"; Time)
        {

        }
        field(50040; "Work Order No2"; Code[20])
        {

        }
        field(50041; "Work Order Date2"; Date)
        {

        }
        field(50042; "Work Order Rcpt. Date2"; Date)
        {

        }
        field(50043; "Work Order Value2"; Decimal)
        {

        }
        field(50044; "No. 2"; Code[20])
        {

        }
        field(50045; "Receptionist"; Text[80])
        {

        }
        field(50046; "Item Cost Value"; Decimal)
        {
            /*  TableRelation = Sum("Job Ledger Entry"."Total Cost (LCY)" WHERE (Job No.=FIELD(No.),Entry Type=FILTER(Usage),Type=FILTER(Item),"Posting Date"=FIELD("Posting Date Filter"))) */

        }
        field(50072; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50073; "User ID"; Code[25])
        {

        }
        field(50074; "Fuel Level"; Option)
        {
            OptionMembers = ,Full,"3/4","1/2","1/4",Empty;
        }
        field(50075; "KM Reading"; Decimal)
        {

        }
        field(50076; "Op Bal Value"; Decimal)
        {
            /*  TableRelation = SUM("Job Ledger Entry"."Total Cost (LCY)" WHERE (Job No.=FIELD(No.),Entry Type=FILTER(Usage),Type=FILTER(Item),No.=FIELD(No.))); */

        }
        field(50077; "Workshop Status"; Option)
        {
            OptionMembers = Open,Completed,"Quality Check";
            // Editable = false;

            trigger onValidate()
            begin
                if Rec."Workshop Status" = Rec."Workshop Status"::Completed then
                    "Workshop Completion Date" := Today;
            end;
        }
        field(50078; "Workshop Completion Date"; Date)
        {
            Editable = false;

        }
        // field(50079; "Ship-to Code"; Code[20])
        // {

        // }
        // field(50080; "Ship-to Name"; Text[50])
        // {

        // }
        // field(50081; "Ship-to Name 2"; Text[50])
        // {

        // }
        // field(50082; "Ship-to Address"; Text[50])
        // {

        // }
        // field(50083; "Ship-to Address 2"; Text[50])
        // {

        // }
        // field(50084; "Ship-to City"; Text[30])
        // {

        // } tolu/6/19/23
        field(50085; "Contract Invoiced Price"; Decimal)
        {

        }
        field(50086; "Contract Total Price"; Decimal)
        {

        }
        field(50087; "Next KM Service/PM Service"; Decimal)
        {

        }
        field(50088; "Update Next KM Service"; Boolean)
        {

        }
        field(50089; "Curr. KM Service/PM Service"; Decimal)
        {

        }
        field(50100; "AppStatus"; Option)
        {
            OptionMembers = Open,"1st Approval","2nd Approval","Cheque Printing",Posted,Cancelled,Checking,VoteBook,"Pending Approval",Approved;
            OptionCaption = 'Open,,,,Posted,Cancelled,,,"Pending Approval",Approved';
        }
        field(50101; "Brought By"; Text[30])
        {

        }
        field(50102; "Mileage"; Code[20])
        {

        }
        field(50103; "Customer Job Type"; Code[20])
        {

        }
        field(50104; "Job Type Code"; Code[20])
        {
            TableRelation = "Job Type Code"."Job Type Code" WHERE("Customer Job Type" = FIELD("Customer Job Type"));

            trigger OnValidate()
            var
                JobTypeCode: Record "Job Type Code";
            begin
                IF JobTypeCode.GET("Customer Job Type", "Job Type Code") THEN BEGIN

                    "Job Posting Group" := JobTypeCode."Job Posting Group";
                END
            end;

        }
        field(50105; "Responsibility Center"; Code[20])
        {

        }
        field(50106; "Consumed Value (Cost)"; Decimal)
        {

        }
        field(50107; "G/L Entries"; Decimal)
        {

        }
        field(50108; "Buisness Type"; Option)
        {
            OptionMembers = ,FBO,"RT_FLEET-MAINT",EXTERNAL,"REFURBISHED_ENGPARTs",MOVEABLE,MARKETING,COT,"NON_MOVEABLE","PM_FLEET-MAINT";
        }
        field(50109; "NOVATRACK ID"; Code[20])
        {

        }
        field(50110; "Post WIP"; Boolean)
        {

        }

        field(50111; "Post WIP to G/L"; Boolean)
        {

        }
        field(50120; "Serv. Tech. Job Closure"; Boolean)
        {

        }
        field(50124; "KM Odometer Reading"; Decimal)
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
        field(50130; "Truck BreakDown No."; Code[20])
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

        }
        field(50137; Operation; Option)
        {
            OptionMembers = ,NBC,PZ,FRIGOGLASS,"NIGERIA BREWERIES",CHIVITA;
        }
        field(50138; "Validity Date"; Date)
        {

        }
        field(50139; "Validity Period"; DateFormula)
        {

        }
        field(50140; "Daily Avail. TruckBrkDwn Code"; Code[20])
        {

        }
        field(61003; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;

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
        field(61005; "Assigned User ID"; Code[50])
        {

        }
        field(61006; "Service Item"; Code[20])
        {

        }
        field(61014; "WIP Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("G/L Entry".Amount WHERE("G/L Account No." = FILTER(201002), "Posting Date" = FIELD("Posting Date Filter"), "Job No." = FIELD("No.")));

        }
        field(61015; "Invoice Exist"; Boolean)
        {
            FieldClass = FlowField;

            CalcFormula = Exist("Job Ledger Entry" WHERE("Job No." = FIELD("No."), "Entry Type" = CONST(Sale), "Posting Date" = FIELD("Posting Date Filter")));
        }
        field(61016; "Invoice Date*"; Date)
        {

        }
        field(61017; "Estimate Value (Cost)"; Decimal)
        {

        }
        field(61018; "Daily Availability Code"; Code[20])
        {

        }
        field(61019; "Next Service Date"; Date)
        {

        }
        field(61020; "KM Run"; Code[15])
        {

        }
        field(61021; "Job OPL  total Cost (INV)"; Decimal)
        {

        }
        field(61022; "Job OPL  total Cost (CONS)"; Decimal)
        {

        }
        field(61023; "Resource Job Price"; Decimal)
        {

        }
        field(61024; "Resource Qty"; Decimal)
        {

        }
        field(61025; "Job Price (<>OPL INV)"; Decimal)
        {

        }
        field(61026; "Sundry Price"; Decimal)
        {

        }
        field(61027; "RecognizeCostAcc"; Code[20])
        {

        }
        field(61028; "ServiceAPP No."; Code[20])
        {

        }
        field(61029; "VehReg. No."; Code[20])
        {

        }
        field(61030; "VehReg User ID"; Code[80])
        {

        }
        field(61031; "VBD Report Date"; Date)
        {

        }
        field(61032; "VBD Restore Date"; Date)
        {

        }
        field(61033; "Estimate Date  OPL"; Date)
        {

        }
        field(61034; "Estimate Value (Cost) OPL"; Decimal)
        {

        }
        field(61035; "Estimate Value (RES) OPL"; Decimal)
        {

        }
        field(61036; "Estimate Value (PRICE) EXT|INT"; Decimal)
        {

        }
        field(61040; "Consptn/Cls Date  OPL"; Date)
        {

        }
        field(61042; "Consptn/Cls Value (Cost) OPL"; Decimal)
        {

        }
        field(61045; "Consptn/Cls Value (RES) OPL"; Decimal)
        {

        }
        field(61046; "Consptn/Cls Value (PRIC) EXT|I"; Decimal)
        {

        }
        field(61050; "Invoice Value (Cost) OPL"; Decimal)
        {

        }
        field(61055; "Invoice Value (RES) OPL"; Decimal)
        {

        }
        field(61056; "Invoice Value (PRICE) EXT"; Decimal)
        {

        }
        field(61057; "Created By"; Text[50])
        {

        }
        field(61058; "Created Date"; Date)
        {

        }
        field(61059; "Repair Location"; Code[30])
        {
            Caption = 'Repair Location';

        }
        field(61060; "Service Vehicle"; Code[20])
        {

        }
        field(61061; "Trailer"; Text[50])
        {

        }

        field(61070; "No. of Mat. Req. Created"; Integer)
        {
            fieldClass = flowfield;
            CalcFormula = count("Material Request Header" where("Job No." = field("No."), "Request Type" = const(Job), "Entry Type" = CONST(Issue), "Store Issue No." = FILTER('')));
            caption = 'No. of Material Request Created';

        }
        field(61071; "No. of Posted Mat. Req. Created"; Integer)
        {
            fieldClass = flowfield;
            CalcFormula = count("Material Request Header" where("Job No." = field("No."), "Request Type" = const(Job), "Entry Type" = CONST(Issue), "Store Issue No." = FILTER(<> '')));
            caption = 'No. of Posted Material Request Created';

        }

        field(61072; "No. of Quality check"; Integer)
        {
            fieldClass = flowfield;
            CalcFormula = count("Quality Check" where("Job No." = field("No.")));
            caption = 'No. of Quality Check Created';

        }
        field(61062; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(61063; "Trailer No."; Code[20])
        {
            Caption = 'Trailer Asset No.';
            Editable = false;
        }
        field(61064; "ECP No."; Code[50])
        {
            Editable = false;
        }

        field(61065; "Location Codes"; Code[30])
        {
            Editable = false;
            TableRelation = Location;
            Caption = 'Location';
        }
        field(61066; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
            end;
        }
        //  field(61066; "Location Code"; Code[20])
        // {
        //     TableRelation = Location;
        // }
        field(61067; "WiP Amount1"; Decimal)
        {
            fieldClass = FlowField;
            CalcFormula = Sum("G/L Entry".Amount where("G/L Account No." = filter('209100'), "Posting Date" = field("Posting Date Filter"), "Job No." = field("No.")));
        }



    }




    trigger OnInsert()
    begin
        "Created By" := "User ID";
        "Created Date" := Today;
    end;

    trigger OnAfterInsert()
    begin
        "Created By" := "User ID";
        "Created Date" := Today;



    end;

    var
        ServiceQuote: Record "Service Header";
}
