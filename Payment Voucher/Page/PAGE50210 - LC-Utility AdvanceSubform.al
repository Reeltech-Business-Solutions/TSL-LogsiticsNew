page 50210 "LC-Utility Advance Subform"
{
    Caption = 'LC-Utility Advance Subform';
    PageType = ListPart;
    SourceTable = "Staff Advance Lines";
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                Editable = Editno;
                ShowCaption = false;
                field("Type of Advance"; rec."Type of Advance")
                {
                    ApplicationArea = all;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        rec."Type of Advance" := rec."Type of Advance"::LC;
                    end;
                }
                field("Advance Type"; rec."Advance Type")
                {
                    ApplicationArea = all;
                }
                field("No."; rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Account No."; rec."Account No.")
                {
                    Editable = false;
                    ApplicationArea = all;

                    trigger OnValidate()
                    var
                        Bank: Record "Bank Account";
                        RecPay: Record "Receipts and Payment Types";

                    begin

                        if Bank.Get(rec."Account No.") then
                            rec."Account Name" := Bank.Name;
                    end;
                }
                field("Account Name"; rec."Account Name")
                {
                    Caption = 'Description';
                    Editable = false;
                    ApplicationArea = all;
                }

                field(Purpose; rec.Purpose)
                {
                    ApplicationArea = all;
                }
                field("Currency Code"; rec."Currency Code")
                {
                    //Editable = false;
                    ApplicationArea = all;
                }
                field(Amount; rec.Amount)
                {
                    Editable = Editno;
                    ApplicationArea = all;
                    trigger OnValidate()
                    begin

                        /*{Get the total amount paid}
                        Bal:=0;
                        
                        PayHeader.RESET;
                        PayHeader.SETRANGE(PayHeader."Line No.",No);
                        IF PayHeader.FINDFIRST THEN
                          BEGIN
                            PayLine.RESET;
                            PayLine.SETRANGE(PayLine.No,PayHeader."Line No.");
                            IF PayLine.FIND('-') THEN
                              BEGIN
                                REPEAT
                                  Bal:=Bal + PayLine."Pay Mode";
                                UNTIL PayLine.NEXT=0;
                              END;
                          END;
                        //Bal:=Bal + Amount;
                        
                        IF Bal > PayHeader.Amount THEN
                          BEGIN
                            ERROR('Please ensure that the amount inserted does not exceed the amount in the header');
                          END;
                          */

                    end;
                }
                field("Amount LCY"; rec."Amount LCY")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Due Date"; rec."Due Date")
                {
                    ApplicationArea = all;
                    Caption = 'Payment Date';
                }
                field("Date Issued"; rec."Date Issued")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Global Dimension 1 Code"; rec."Global Dimension 1 Code")
                {
                    Editable = false;
                    Visible = true;
                    ApplicationArea = all;
                    trigger OnValidate()
                    begin
                        DimVal.Reset;
                        DimVal.SetRange(DimVal."Global Dimension No.", 1);
                    end;
                }
                field("Shortcut Dimension 2 Code"; rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    begin
                        DimVal.Reset;
                        DimVal.SetRange(DimVal."Global Dimension No.", 2);
                    end;
                }
                field("Shortcut Dimension 3 Code"; rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec."Type of Advance" := Rec."Type of Advance"::LC;
    end;

    trigger OnInit()
    begin
        // if PayHeader."Type of Advance" = PayHeader."Type of Advance"::LC then
        //     Rec."Type of Advance" := Rec."Type of Advance"::LC;
    end;

    trigger OnOpenPage()
    begin


        Editno := true;
        if Rec.Status <> Rec.Status::Open
        then
            Editno := false;
    end;


    var
        PayHeader: Record "Staff Advance Header";
        PayLine: Record "Staff Advance Lines";
        Bal: Decimal;
        DimVal: Record "Dimension Value";
        Editno: Boolean;

}


