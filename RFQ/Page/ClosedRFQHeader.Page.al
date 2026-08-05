page 50160 "Closed RFQ Header"
{
    PageType = Document;
    SourceTable = "Purchase Quote Header";
    SourceTableView = WHERE(Status = FILTER(Closed | Cancelled | Stopped));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = All;
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = All;
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = All;
                }
                field("Expected Opening Date"; Rec."Expected Opening Date")
                {
                    ApplicationArea = All;
                }
                field("Expected Closing Date"; Rec."Expected Closing Date")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                }
            }
            part("RFQ Subform"; "RFQ Subform")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(New)
            {

                //Showcaption = false;
                action("Assign Vendor(s)")
                {
                    ApplicationArea = All;
                    Caption = 'Assign Vendor(s)';
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        Vends: Record "Quotation Request Vendors";
                    begin

                        Vends.RESET;
                        Vends.SETRANGE(Vends."Document Type", Rec."Document Type");
                        Vends.SETRANGE(Vends."Document No.", Rec."No.");

                        PAGE.RUN(PAGE::"Quotation Request Vendors", Vends);
                    end;
                }
                action("Print/Preview")
                {
                    ApplicationArea = All;
                    Caption = 'Print/Preview';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    begin

                        PQH.SETRECFILTER;
                        PQH.SETFILTER(PQH."Document Type", '%1', Rec."Document Type");
                        PQH.SETFILTER("No.", Rec."No.");
                        // repvend.SETTABLEVIEW(PQH);
                        // repvend.RUN; Dennis
                    end;
                }
            }
            group(Status1)
            {

                Caption = 'Status';
                action(Cancel)
                {
                    ApplicationArea = All;
                    Caption = 'Cancel';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin

                        //check if the quotation for request number has already been used
                        /*
                        PurchHeader.RESET;
                        PurchHeader.SETRANGE(PurchHeader."Document Type",PurchHeader."Document Type"::Quote);
                        PurchHeader.SETRANGE(PurchHeader."Request for Quote No.","No.");
                        IF PurchHeader.FINDFIRST THEN
                          BEGIN
                            ERROR('The Quotation for request is already tied to a Quotation. Cannot be Reopened');
                          END;
                        */
                        IF CONFIRM('Cancel Document?', FALSE) = FALSE THEN BEGIN EXIT END;
                        Rec.Status := Rec.Status::Cancelled;
                        Rec.MODIFY;

                    end;
                }
                action(Stop)
                {
                    ApplicationArea = All;
                    Caption = 'Stop';
                    Image = Stop;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin

                        //check if the quotation for request number has already been used
                        /*
                        PurchHeader.RESET;
                        PurchHeader.SETRANGE(PurchHeader."Document Type",PurchHeader."Document Type"::Quote);
                        PurchHeader.SETRANGE(PurchHeader."Request for Quote No.","No.");
                        IF PurchHeader.FINDFIRST THEN
                          BEGIN
                            ERROR('The Quotation for request is already tied to a Quotation. Cannot be Reopened');
                          END;
                        */
                        IF CONFIRM('Close Document?', FALSE) = FALSE THEN BEGIN EXIT END;
                        Rec.Status := Rec.Status::Closed;
                        Rec.MODIFY;

                    end;
                }
                action(Close)
                {
                    ApplicationArea = All;
                    Caption = 'Close';
                    Image = Close;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin

                        //check if the quotation for request number has already been used
                        /*
                        PurchHeader.RESET;
                        PurchHeader.SETRANGE(PurchHeader."Document Type",PurchHeader."Document Type"::Quote);
                        PurchHeader.SETRANGE(PurchHeader."Request for Quote No.","No.");
                        IF PurchHeader.FINDFIRST THEN
                          BEGIN
                            ERROR('The Quotation for request is already tied to a Quotation. Cannot be Reopened');
                          END;
                        */
                        IF CONFIRM('Close Document?', FALSE) = FALSE THEN BEGIN EXIT END;
                        Rec.Status := Rec.Status::Closed;
                        Rec.MODIFY;

                    end;
                }
                action(Release)
                {
                    ApplicationArea = All;
                    Caption = 'Release';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin

                        IF CONFIRM('Release document?', FALSE) = FALSE THEN BEGIN EXIT END;
                        //check if the document has any lines
                        Lines.RESET;
                        Lines.SETRANGE(Lines."Document Type", Rec."Document Type");
                        Lines.SETRANGE(Lines."Document No.", Rec."No.");
                        IF Lines.FINDFIRST THEN BEGIN
                            REPEAT
                                Lines.TESTFIELD(Lines.Quantity);
                                //Lines.TESTFIELD(Lines."Direct Unit Cost");
                                Lines.TESTFIELD("No.");
                            UNTIL Lines.NEXT = 0;
                        END
                        ELSE BEGIN
                            ERROR('Document has no lines');
                        END;
                        Rec.Status := Rec.Status::Released;
                        Rec.MODIFY;
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = All;
                    Caption = 'Reopen';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin

                        //check if the quotation for request number has already been used
                        PurchHeader.RESET;
                        PurchHeader.SETRANGE(PurchHeader."Document Type", PurchHeader."Document Type"::Quote);
                        //PurchHeader.SETRANGE(purchheader."request for quote no","No.");
                        IF PurchHeader.FINDFIRST THEN BEGIN
                            ERROR('The Quotation for request is already tied to a Quotation. Cannot be Reopened');
                        END;

                        IF CONFIRM('Reopen Document?', FALSE) = FALSE THEN BEGIN EXIT END;
                        Rec.Status := Rec.Status::Open;
                        Rec.MODIFY;
                    end;
                }
            }
        }
    }

    var
        PurchHeader: Record 38;
        PParams: Record "Purchase Quote Params";
        Lines: Record "Purchase Quote Line";
        PQH: Record "Purchase Quote Header";
    //repvend: Report "Purchase Quote Request Report";  Dennis
}

