page 80011 "Serv. App. Sch. (CLosed)"
{
    Caption = 'Serv. App. Sch. (CLosed)';
    //CardPageID = "Service App Schedule";
    DataCaptionFields = "Service Item", "Service Code (KM)";
    PageType = List;
    AdditionalSearchTerms = 'Service App. Sch. (CLosed)';
    SourceTable = "Service App Schedules";
    SourceTableView = WHERE(Serviced = FILTER(TRUE));

    layout
    {
        area(content)
        {
            repeater(Control1000000088)
            {
                ShowCaption = false;
                field(MONTH; Rec.MONTH)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Base Location"; Rec."Base Location")
                {
                    ApplicationArea = All;
                }
                field("CUSTOMER OPERATION"; Rec."CUSTOMER OPERATION")
                {
                    ApplicationArea = All;
                }
                field("Service Due Kilometer"; Rec."Service Due Kilometer")
                {
                    ApplicationArea = All;
                }
                field("LOT NOs."; Rec."LOT NOs.")
                {
                    ApplicationArea = All;
                }
                field("Job Type Code"; Rec."Job Type Code")
                {
                    ApplicationArea = All;
                }
                field("Buisness Type"; Rec."Buisness Type")
                {
                    ApplicationArea = All;
                }
                field("Shortcut dimension 3"; Rec."Shortcut dimension 3")
                {
                    ApplicationArea = All;
                }
                field("Officer In Charge"; Rec."Officer In Charge")
                {
                    ApplicationArea = All;
                }
                field("Service Item"; Rec."Service Item")
                {
                    ApplicationArea = All;
                }
                field("Last/ Current Od Reading (KM)"; Rec."Last/ Current Od Reading (KM)")
                {
                    BlankZero = true;
                    Style = Strong;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
                field("Service Code (KM)"; Rec."Service Code (KM)")
                {
                    ApplicationArea = All;
                }
                field("Service Due Projected Date"; Rec."Service Due Projected Date")
                {
                    ApplicationArea = All;
                }
                field("Next Call Date."; Rec."Next Call Date.")
                {
                    ApplicationArea = All;
                }
                field("Service Due KilometerXXXXX"; Rec."Service Due KilometerXXXXX")
                {
                    ApplicationArea = All;
                }
                field("Send Appointment Reminder"; Rec."Send Appointment Reminder")
                {
                    ApplicationArea = All;
                }
                field(Serviced; Rec.Serviced)
                {
                    ApplicationArea = All;
                }
                field("Serviced Kilometer"; Rec."Serviced Kilometer")
                {
                    ApplicationArea = All;
                }
                field("Fixed Asset No."; Rec."Fixed Asset No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Service Date"; Rec."Service Date")
                {
                    ApplicationArea = All;
                }
                field("Fleet Manager"; Rec."Fleet Manager")
                {
                    ApplicationArea = All;
                }
                field("Fleet Manager Name"; Rec."Fleet Manager Name")
                {
                    ApplicationArea = All;
                }
                field("Fleet Manager No."; Rec."Fleet Manager No.")
                {
                    ApplicationArea = All;
                }
                field("Fleet Manager Email"; Rec."Fleet Manager Email")
                {
                    ApplicationArea = All;
                }
                field("Cust. Veh. Reg Form No."; Rec."Cust. Veh. Reg Form No.")
                {
                    ApplicationArea = All;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = All;
                }
                field("Appointment Status"; Rec."Appointment Status")
                {
                    ApplicationArea = All;
                }
                field("Reception Date"; Rec."Reception Date")
                {
                    ApplicationArea = All;
                }
                field(Remark; Rec.Remark)
                {
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = All;
                }
                field("Phone No 1."; Rec."Phone No 1.")
                {
                    ApplicationArea = All;
                }
                field("Phone No. 2."; Rec."Phone No. 2.")
                {
                    ApplicationArea = All;
                }
                field("Phone No. 3 (GSM)."; Rec."Phone No. 3 (GSM).")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Job Type"; Rec."Customer Job Type")
                {
                    ApplicationArea = All;
                }
                field("Engine No."; Rec."Engine No.")
                {
                    ApplicationArea = All;
                }
                field("Chasis No."; Rec."Chasis No.")
                {
                    ApplicationArea = All;
                }
                field("Model Code"; Rec."Model Code")
                {
                    ApplicationArea = All;
                }
                field("Contact E-Mail"; Rec."Contact E-Mail")
                {
                    ApplicationArea = All;
                }
                field("Response Action"; Rec."Response Action")
                {
                    ApplicationArea = All;
                }
                field("Call Type"; Rec."Call Type")
                {
                    ApplicationArea = All;
                }
                field("Cust. Veh. Reg Form Date"; Rec."Cust. Veh. Reg Form Date")
                {
                    ApplicationArea = All;
                }
                field("Walk-In"; Rec."Walk-In")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                action(Card)
                {
                    Caption = 'Card';
                    Image = EditLines;
                    ShortCutKey = 'Shift+F7';
                    ApplicationArea =all;

                    trigger OnAction()
                    begin
                        /*CASE "Document Type" OF
                          "Document Type"::Quote:
                            PAGE.RUN(PAGE::"Sales Quote",Rec);
                          "Document Type"::Order:
                            PAGE.RUN(PAGE::"Purch. Stock Quote Subform",Rec);
                          "Document Type"::Invoice:
                            PAGE.RUN(PAGE::"Sales Invoice",Rec);
                          "Document Type"::"Return Order":
                            PAGE.RUN(PAGE::"Sales Return Order",Rec);
                          "Document Type"::"Credit Memo":
                            PAGE.RUN(PAGE::"Sales Credit Memo",Rec);
                          "Document Type"::"Blanket Order":
                            PAGE.RUN(PAGE::"Blanket Sales Order",Rec);
                        END;
                         */

                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        /* IF Usersetup.GET(USERID) THEN
         IF NOT Usersetup."PM Appointment Reminder" THEN
            ERROR('you do not have permissions to create new PM Reminder'); */
    end;

    var
        Usersetup: Record "User Setup";
}

