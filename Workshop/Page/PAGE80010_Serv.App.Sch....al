page 80010 "Serv. App. Sch. .."
{
    Caption = 'Serv. App. Sch......';
    /*  CardPageID = "Service App Schedule";
     DataCaptionFields = "Service Item","Service Code (KM)";
     PageType = List;
     SourceTable = Table50070;
     SourceTableView = WHERE(Buisness Type=FILTER(FBO|RT_FLEET-MAINT|COT|MARKETING), Serviced=FILTER(No)); */

    /* layout
    {
        area(content)
        {
            repeater(Control1000000088)
            {
                ShowCaption = false;
                field(MONTH;MONTH)
                {
                    Editable = false;
                }
                field("CUSTOMER OPERATION";"CUSTOMER OPERATION")
                {
                }
                field("LOT NOs.";"LOT NOs.")
                {
                }
                field("Service Due Kilometer";"Service Due Kilometer")
                {
                }
                field("Base Location";"Base Location")
                {
                }
                field("Job Type Code";"Job Type Code")
                {
                }
                field("Buisness Type";"Buisness Type")
                {
                }
                field("Shortcut dimension 3";"Shortcut dimension 3")
                {
                }
                field("Officer In Charge";"Officer In Charge")
                {
                }
                field("Service Item";"Service Item")
                {
                }
                field("Last/ Current Od Reading (KM)";"Last/ Current Od Reading (KM)")
                {
                    BlankZero = true;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Service Due Projected Date";"Service Due Projected Date")
                {
                }
                field("Next Call Date.";"Next Call Date.")
                {
                }
                field("Send Appointment Reminder";"Send Appointment Reminder")
                {
                }
                field(Serviced;Serviced)
                {
                }
                field("Serviced Kilometer";"Serviced Kilometer")
                {
                }
                field("Fixed Asset No.";"Fixed Asset No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Service Date";"Service Date")
                {
                }
                field("Fleet Manager";"Fleet Manager")
                {
                }
                field("Fleet Manager Name";"Fleet Manager Name")
                {
                }
                field("Fleet Manager No.";"Fleet Manager No.")
                {
                }
                field("Fleet Manager Email";"Fleet Manager Email")
                {
                }
                field("Cust. Veh. Reg Form No.";"Cust. Veh. Reg Form No.")
                {
                }
                field("Job No.";"Job No.")
                {
                }
                field("Appointment Status";"Appointment Status")
                {
                }
                field("Reception Date";"Reception Date")
                {
                }
                field(Remark;Remark)
                {
                }
                field("E-Mail";"E-Mail")
                {
                }
                field("Contact Person";"Contact Person")
                {
                }
                field("Phone No 1.";"Phone No 1.")
                {
                }
                field("Phone No. 2.";"Phone No. 2.")
                {
                }
                field("Phone No. 3 (GSM).";"Phone No. 3 (GSM).")
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field("Customer Job Type";"Customer Job Type")
                {
                }
                field("Engine No.";"Engine No.")
                {
                }
                field("Chasis No.";"Chasis No.")
                {
                }
                field("Model Code";"Model Code")
                {
                }
                field("Contact E-Mail";"Contact E-Mail")
                {
                }
                field("Response Action";"Response Action")
                {
                }
                field("Call Type";"Call Type")
                {
                }
                field("Cust. Veh. Reg Form Date";"Cust. Veh. Reg Form Date")
                {
                }
                field("Walk-In";"Walk-In")
                {
                }
            }
        }
    }
 */
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        ERROR('you do not have permissions to create new PM Reminder');
    end;

    trigger OnOpenPage()
    begin
        /* IF usersetup.GET(USERID) THEN
         IF NOT usersetup."PM Appointment Reminder" THEN
            ERROR('you do not have permissions to create new PM Reminder'); */
    end;

    var
        usersetup: Record "User Setup";
}

