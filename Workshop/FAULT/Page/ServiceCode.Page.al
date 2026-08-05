page 50120 "Service Code"
{
    Caption = 'Fault Material SetUp';
    DelayedInsert = true;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Faulty Material setup Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Operation Code"; Rec."Operation Code")
                {
                    ApplicationArea = All;
                    /*
                    trigger OnAssistEdit()
                    begin
                        IF AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                    */
                }
                field("Service Item Make"; Rec."Service Item Make")
                {
                    ApplicationArea = All;
                }
                field("Service Item Model"; Rec."Service Item Model")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Symptoms; Rec.Symptoms)
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Faulty Area"; Rec."Faulty Area")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Duration In Hours"; Rec."Duration In Hours")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Estimate; Rec.Estimate)
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(VAT; Rec.VAT)
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Estimate Incl. VAT"; Rec."Estimate Incl. VAT")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Preventive Maintenace Cycle"; Rec."Preventive Maintenace Cycle")
                {
                    ApplicationArea = All;
                }
            }
            part(ServItemLine; "Service Code Line")
            {
                ApplicationArea = All;
                SubPageLink = "Operation code" = FIELD("Operation Code"), Make = field("Service Item Make"), "Service Item Model" = field("Service Item Model");
                UpdatePropagation = Both;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Update All Service Codes")
            {
                ApplicationArea = All;
                Caption = 'Update All Service Codes';
                Promoted = true;
                PromotedCategory = Process;
                //RunObject = Report 50314;
                Visible = false;
            }
            action("Faulty Material header Import")
            {
                Caption = 'Faulty Material header Import';
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ApplicationArea = All;
            }
            action("Faulty Material Line Import")
            {
                Caption = 'Faulty Material Line Import';
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ApplicationArea = All;
            }
            action("Update Fault  Code Register")
            {
                Caption = 'Update Fault  Code Register';
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    FaultCode.INIT;
                    FaultCode."Fault Area Code" := Rec."Faulty Area";
                    FaultCode."Symptom Code" := Rec.Symptoms;
                    FaultCode.Code := Rec."Operation Code";
                    FaultCode.Description := Rec.Description;
                    IF FaultCode.INSERT(TRUE) THEN;
                end;
            }
        }
    }

    var
        Text004: Label 'You cannot open the form because %1 is %2 in the %3 table.';
        ServMgtSetup: Record "Service Mgt. Setup";
        ServItemLine: Record "Service Item Line";
        RepairStatus: Record "Repair Status";
        ChangeExchangeRate: Page "Change Exchange Rate";
        FaultResolutionRelation: Page "Fault/Resol. Cod. Relationship";
        ServOrderMgt: Codeunit "ServOrderManagement";
        ServLogMgt: Codeunit "ServLogManagement";
        ServCalcServPrice: Codeunit "Service Inv.-Printed";
        Mail: Codeunit Mail;
        ServItemMgt: Codeunit "ServItemManagement";
        UserMgt: Codeunit "User Setup Management";
        CreateServiceOrder: Codeunit "Serv-Quote to Order (Yes/No)";
        FaultCode: Record "Fault Code";
}

