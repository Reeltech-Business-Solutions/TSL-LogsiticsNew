page 50121 "Service Code Line"
{
    DelayedInsert = true;
    AutoSplitKey = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Faulty Material setup Line";

    layout
    {
        area(content)
        {
            repeater(new)
            {
                field("Operation code"; Rec."Operation code")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Make; Rec.Make)
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Service Item Model"; Rec."Service Item Model")
                {
                    Visible = false;
                    ApplicationArea = All;
                }

                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Total Price"; Rec."Total Price")
                {
                    ApplicationArea = All;
                }
                field("VAT%"; Rec."VAT%")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Price Incl VAT"; Rec."Price Incl VAT")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //SetUpNewLine;
        Rec.Newline;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

    end;


    var
        ServHeader: Record "Service Header";
        ServItem: Record "Service Item";
        ServItem2: Record "Service Item";
        ServItemList: Page "Service Item List";
        ServLoanerMgt: Codeunit "ServLoanerManagement";
        FMATHeader: Record "Faulty Material setup Header";


    [Scope('Cloud')]
    procedure FaultComments()
    var
        ServCommentLine: Record "Service Comment Line";
    begin
        /*ServHeader.GET("Order No.");
        ServHeader.TESTFIELD("Customer No.");
        TESTFIELD("Line No.");
        
        ServCommentLine.RESET;
        ServCommentLine.SETRANGE(Type,ServCommentLine.Type::Fault);
        ServCommentLine.SETRANGE("No.","Order No.");
        ServCommentLine.SETRANGE("Table Line No.","Line No.");
        Page.RUNMODAL(Page::"Service Comment Sheet",ServCommentLine);
         */

    end;

    [Scope('Cloud')]
    procedure ResolutionComments()
    var
        ServCommentLine: Record "Service Comment Line";
    begin
        /*ServHeader.GET("Order No.");
        ServHeader.TESTFIELD("Customer No.");
        TESTFIELD("Line No.");
        
        ServCommentLine.RESET;
        ServCommentLine.SETRANGE(Type,ServCommentLine.Type::Resolution);
        ServCommentLine.SETRANGE("No.","Order No.");
        ServCommentLine.SETRANGE("Table Line No.","Line No.");
        Page.RUNMODAL(Page::"Service Comment Sheet",ServCommentLine);
         */

    end;

    [Scope('Cloud')]
    procedure InternalComments()
    var
        ServCommentLine: Record "Service Comment Line";
    begin
        /*ServHeader.GET("Order No.");
        ServHeader.TESTFIELD("Customer No.");
        TESTFIELD("Line No.");
        
        ServCommentLine.RESET;
        ServCommentLine.SETRANGE(Type,ServCommentLine.Type::Internal);
        ServCommentLine.SETRANGE("No.","Order No.");
        ServCommentLine.SETRANGE("Table Line No.","Line No.");
        Page.RUNMODAL(Page::"Service Comment Sheet",ServCommentLine);
         */

    end;

    [Scope('Cloud')]
    procedure AccessoryComments()
    var
        ServCommentLine: Record "Service Comment Line";
    begin
        /*ServHeader.GET("Order No.");
        ServHeader.TESTFIELD("Customer No.");
        TESTFIELD("Line No.");
        
        ServCommentLine.RESET;
        ServCommentLine.SETRANGE(Type,ServCommentLine.Type::Accessory);
        ServCommentLine.SETRANGE("No.","Order No.");
        ServCommentLine.SETRANGE("Table Line No.","Line No.");
        Page.RUNMODAL(Page::"Service Comment Sheet",ServCommentLine);
         */

    end;

    [Scope('Cloud')]
    procedure LoanerComments()
    var
        ServCommentLine: Record "Service Comment Line";
    begin
        /*ServHeader.GET("Order No.");
        ServHeader.TESTFIELD("Customer No.");
        
        ServCommentLine.RESET;
        ServCommentLine.SETRANGE(Type,ServCommentLine.Type::"Service Item Loaner");
        ServCommentLine.SETRANGE("No.","Order No.");
        ServCommentLine.SETRANGE("Table Line No.","Line No.");
        Page.RUNMODAL(Page::"Service Comment Sheet",ServCommentLine);
         */

    end;

    [Scope('Cloud')]
    procedure RegisterServInvLines()
    var
        ServInvLine: Record "Service Line";
        ServInvLines: Page "Service Quote Lines";
    begin
        /*TESTFIELD("Order No.");
        TESTFIELD("Line No.");
        CLEAR(ServInvLine);
        ServInvLine.SETRANGE("Order No.","Order No.");
        ServInvLine.FILTERGROUP(2);
        CLEAR(ServInvLines);
        ServInvLines.Initialize("Line No.");
        ServInvLines.SETTABLEVIEW(ServInvLine);
        ServInvLines.RUNMODAL;
        ServInvLine.FILTERGROUP(0);
         */

    end;

    [Scope('Cloud')]
    procedure ShowServOrderWorksheet()
    var
        ServItemLine: Record "Service Item Line";
    begin
        /*TESTFIELD("Order No.");
        TESTFIELD("Line No.");
        
        CLEAR(ServItemLine);
        ServItemLine.SETRANGE("Order No.","Order No.");
        ServItemLine.FILTERGROUP(2);
        ServItemLine.SETRANGE("Line No.","Line No.");
        Page.RUNMODAL(Page::"Service Item Worksheet",ServItemLine);
        ServItemLine.FILTERGROUP(0);
         */

    end;

    [Scope('Cloud')]
    procedure AllocateResource()
    var
        ServOrderAlloc: Record "Service Order Allocation";
        ResAlloc: Page "Resource Allocations";
    begin
        /*TESTFIELD("Order No.");
        TESTFIELD("Line No.");
        ServOrderAlloc.RESET;
        ServOrderAlloc.FILTERGROUP(2);
        ServOrderAlloc.SETFILTER(Status,'<>%1',ServOrderAlloc.Status::Canceled);
        ServOrderAlloc.SETRANGE("Service Order No.","Order No.");
        ServOrderAlloc.FILTERGROUP(0);
        ServOrderAlloc.SETRANGE("Service Item Line No.","Line No.");
        IF ServOrderAlloc.FIND('-') THEN;
        ServOrderAlloc.SETRANGE("Service Item Line No.");
        CLEAR(ResAlloc);
        ResAlloc.SETRECORD(ServOrderAlloc);
        ResAlloc.SETTABLEVIEW(ServOrderAlloc);
        ResAlloc.SETRECORD(ServOrderAlloc);
        ResAlloc.RUN;
         */

    end;

    [Scope('Cloud')]
    procedure ShowServPricing()
    begin
        /*ServItemLinePricing.SETRANGE("Service Order No.","Order No.");
        ServItemLinePricing.SETRANGE("Service Item Line No.","Line No.");
        Page.RUNMODAL(Page::"Service Item Line Pricing",ServItemLinePricing);
         */

    end;

    [Scope('Cloud')]
    procedure ReceiveLoaner()
    begin
        //ServLoanerMgt.ReceiveLoaner(Rec);
    end;

    [Scope('Cloud')]
    procedure ShowServItemEventLog()
    var
        ServItemLog: Record "Service Item Log";
    begin
        /*TESTFIELD("Service Item No.");
        CLEAR(ServItemLog);
        ServItemLog.SETRANGE("Service Item No.","Service Item No.");
        Page.RUNMODAL(Page::"Service Item Log",ServItemLog);
         */

    end;

    [Scope('Cloud')]
    procedure ShowChecklist()
    var
        TblshtgHeader: Record "Troubleshooting Header";
    begin
        // TblshtgHeader.ShowForServItemLine(Rec);
    end;
}

