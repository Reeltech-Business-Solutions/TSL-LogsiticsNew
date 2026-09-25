page 50065 "Staff Advance Lines"
{
    Caption = 'Staff Advance Rqt Line';
    PageType = ListPart;
    SourceTable = "Staff Advance Lines";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                // Editable = Editno;
                ShowCaption = false;
                field("Advance Type"; Rec."Advance Type")
                {
                    ApplicationArea = all;
                    Editable = locklines;

                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = locklines;
                    Visible = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    Editable = locklines;
                    ApplicationArea = all;
                }
                field("Account Name"; Rec."Account Name")
                {
                    Caption = 'Description';
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Type of Advance"; Rec."Type of Advance")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = all;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    //Editable = false;
                    ApplicationArea = all;
                    Editable = locklines;
                }
                field(Amount; Rec.Amount)
                {
                    // Editable = Editno;

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
                field("Amount LCY"; Rec."Amount LCY")
                {
                    ApplicationArea = all;
                    Editable = locklines;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = all;
                    Caption = 'Payment Date';
                    Editable = locklines;
                }
                field("Date Issued"; Rec."Date Issued")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = locklines;
                    Visible = true;
                    ApplicationArea = all;
                    trigger OnValidate()
                    begin
                        DimVal.Reset;
                        DimVal.SetRange(DimVal."Global Dimension No.", 1);
                    end;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    begin
                        DimVal.Reset;
                        DimVal.SetRange(DimVal."Global Dimension No.", 2);
                    end;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = all;
                }
                field("Requested Amount"; Rec."Requested Amount")
                {
                    Editable = locklines;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportXML)
            {
                ApplicationArea = All;
                Caption = 'Import Staff Advance';
                Image = Import;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                Visible = false;


                trigger OnAction()
                begin
                    Xmlport.Run(50005, true, true);
                end;
            }
        }
    }

    // trigger OnOpenPage()
    // begin
    //     Editno := true;

    //     if Rec.Status <> Rec.Status::Open
    //     then
    //         Editno := false;
    // end;

    trigger OnAfterGetRecord()
    begin
        locklines := lockAdvLine();
    end;

    procedure lockAdvLine(): Boolean
    begin
        //  Editno := true;

        if Rec.Status <> Rec.Status::Open
        then
            exit(true) else
            exit(false);
    end;



    var
        PayHeader: Record "Staff Advance Header";
        PayLine: Record "Staff Advance Lines";
        Bal: Decimal;
        DimVal: Record "Dimension Value";
        Editno: Boolean;
        UserSetup: Record "User Setup";
        locklines: boolean;
}

