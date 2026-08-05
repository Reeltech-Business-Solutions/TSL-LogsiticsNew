page 50205 "LC Request Line"
{
    Caption = 'LC Request Line';
    PageType = ListPart;
    SourceTable = "Payments Line";

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                ShowCaption = false;
                field(Type; rec.Type)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        checkstatus(Rec);
                    end;
                }
                field("Account No."; rec."Account No.")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        checkstatus(Rec);
                    end;
                }
                field("Account Name"; rec."Account Name")
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    Editable = true;
                    trigger OnValidate()
                    begin
                        checkstatus(Rec);
                    end;
                }
                field("Global Dimension 1 Code"; rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        checkstatus(Rec);
                    end;
                }
                field("Shortcut Dimension 2 Code"; rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        checkstatus(Rec);
                    end;
                }
                field("Shortcut Dimension 3 Code"; rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    trigger OnValidate()
                    begin
                        checkstatus(Rec);
                    end;
                }
                field("Shortcut Dimension 4 Code"; rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    trigger OnValidate()
                    begin
                        checkstatus(Rec);
                    end;
                }
                field("Invoice No."; rec."Invoice No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                    trigger OnValidate()
                    begin
                        checkstatus(Rec);
                    end;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        checkstatus(Rec);
                        //check if the payment reference is for farmer purchase
                        if Rec."Payment Reference" = Rec."Payment Reference"::"Farmer Purchase" then begin
                            if Rec.Amount <> xRec.Amount then begin
                                Error('Amount cannot be modified');
                            end;
                        end;

                        Rec."Amount With VAT" := Rec.Amount;
                        IF Rec."Account Type" IN [Rec."Account Type"::Customer, Rec."Account Type"::Vendor,
                        Rec."Account Type"::"G/L Account", Rec."Account Type"::"Bank Account", Rec."Account Type"::"Fixed Asset"] THEN
                            CASE Rec."Account Type" OF
                                Rec."Account Type"::"G/L Account":
                                    BEGIN

                                        Rec.TESTFIELD(Amount);
                                        RecPayTypes.RESET;
                                        RecPayTypes.SETRANGE(RecPayTypes.Code, Rec.Type);
                                        RecPayTypes.SETRANGE(RecPayTypes.Type, RecPayTypes.Type::Payment);
                                        IF RecPayTypes.FIND('-') THEN BEGIN
                                            IF RecPayTypes."VAT Chargeable" = RecPayTypes."VAT Chargeable"::Yes THEN BEGIN
                                                RecPayTypes.TESTFIELD(RecPayTypes."VAT Code");
                                                TarriffCodes.RESET;
                                                TarriffCodes.SETRANGE(TarriffCodes.Code, RecPayTypes."VAT Code");
                                                IF TarriffCodes.FIND('-') THEN BEGIN
                                                    Rec."VAT Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    Rec."VAT Amount" := (Rec.Amount / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage);
                                                END;
                                            END
                                            ELSE BEGIN
                                                Rec."VAT Amount" := 0;
                                            END;

                                            IF RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."Withholding Tax Chargeable"::Yes THEN BEGIN
                                                RecPayTypes.TESTFIELD(RecPayTypes."Withholding Tax Code");
                                                TarriffCodes.RESET;
                                                TarriffCodes.SETRANGE(TarriffCodes.Code, RecPayTypes."Withholding Tax Code");
                                                IF TarriffCodes.FIND('-') THEN BEGIN
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    Rec."Withholding Tax Amount" := (Rec.Amount - Rec."VAT Amount") * (TarriffCodes.Percentage / 100);
                                                END;
                                            END
                                            ELSE BEGIN
                                                Rec."Withholding Tax Amount" := 0;
                                            END;
                                        END;
                                    END;
                                Rec."Account Type"::Customer:
                                    BEGIN
                                        Rec.TESTFIELD(Amount);
                                        RecPayTypes.RESET;
                                        RecPayTypes.SETRANGE(RecPayTypes.Code, Rec.Type);
                                        RecPayTypes.SETRANGE(RecPayTypes.Type, RecPayTypes.Type::Payment);
                                        IF RecPayTypes.FIND('-') THEN BEGIN
                                            IF RecPayTypes."VAT Chargeable" = RecPayTypes."VAT Chargeable"::Yes THEN BEGIN
                                                Rec.TESTFIELD("VAT Code");
                                                TarriffCodes.RESET;
                                                TarriffCodes.SETRANGE(TarriffCodes.Code, Rec."VAT Code");
                                                IF TarriffCodes.FIND('-') THEN BEGIN
                                                    //"VAT Amount":=(TarriffCodes.Percentage/100)*Amount;
                                                    Rec."VAT Amount" := (Rec.Amount / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage);
                                                    //
                                                END;
                                            END
                                            ELSE BEGIN
                                                Rec."VAT Amount" := 0;
                                            END;

                                            IF RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."Withholding Tax Chargeable"::Yes THEN BEGIN
                                                Rec.TESTFIELD("Withholding Tax Code");
                                                TarriffCodes.RESET;
                                                TarriffCodes.SETRANGE(TarriffCodes.Code, Rec."Withholding Tax Code");
                                                IF TarriffCodes.FIND('-') THEN BEGIN
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;

                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * (Rec.Amount - Rec."VAT Amount");

                                                END;
                                            END
                                            ELSE BEGIN
                                                Rec."Withholding Tax Amount" := 0;
                                            END;
                                        END;
                                    END;
                                Rec."Account Type"::Vendor:
                                    BEGIN

                                        Rec.TESTFIELD(Amount);
                                        RecPayTypes.RESET;
                                        RecPayTypes.SETRANGE(RecPayTypes.Code, Rec.Type);
                                        RecPayTypes.SETRANGE(RecPayTypes.Type, RecPayTypes.Type::Payment);
                                        IF RecPayTypes.FIND('-') THEN BEGIN
                                            IF RecPayTypes."VAT Chargeable" = RecPayTypes."VAT Chargeable"::Yes THEN BEGIN
                                                Rec.TESTFIELD("VAT Code");
                                                TarriffCodes.RESET;
                                                TarriffCodes.SETRANGE(TarriffCodes.Code, Rec."VAT Code");
                                                IF TarriffCodes.FIND('-') THEN BEGIN
                                                    Rec."VAT Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    //
                                                    Rec."VAT Amount" := (Rec.Amount / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage);
                                                    //
                                                END;
                                            END
                                            ELSE BEGIN
                                                Rec."VAT Amount" := 0;
                                            END;

                                            IF RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."Withholding Tax Chargeable"::Yes THEN BEGIN
                                                Rec.TESTFIELD("Withholding Tax Code");
                                                TarriffCodes.RESET;
                                                TarriffCodes.SETRANGE(TarriffCodes.Code, Rec."Withholding Tax Code");
                                                IF TarriffCodes.FIND('-') THEN BEGIN
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    //
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * (Rec.Amount - Rec."VAT Amount");
                                                    //
                                                END;
                                            END
                                            ELSE BEGIN
                                                Rec."Withholding Tax Amount" := 0;
                                            END;
                                        END;


                                    END;
                                Rec."Account Type"::"Bank Account":
                                    BEGIN

                                        rec.TESTFIELD(Amount);
                                        RecPayTypes.RESET;
                                        RecPayTypes.SETRANGE(RecPayTypes.Code, Rec.Type);
                                        RecPayTypes.SETRANGE(RecPayTypes.Type, RecPayTypes.Type::Payment);
                                        IF RecPayTypes.FIND('-') THEN BEGIN
                                            IF RecPayTypes."VAT Chargeable" = RecPayTypes."VAT Chargeable"::Yes THEN BEGIN
                                                RecPayTypes.TESTFIELD(RecPayTypes."VAT Code");
                                                TarriffCodes.RESET;
                                                TarriffCodes.SETRANGE(TarriffCodes.Code, RecPayTypes."VAT Code");
                                                IF TarriffCodes.FIND('-') THEN BEGIN
                                                    //
                                                    Rec."VAT Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    Rec."VAT Amount" := (Rec.Amount / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage);
                                                    //
                                                END;
                                            END
                                            ELSE BEGIN
                                                Rec."VAT Amount" := 0;
                                            END;

                                            IF RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."Withholding Tax Chargeable"::Yes THEN BEGIN
                                                RecPayTypes.TESTFIELD(RecPayTypes."Withholding Tax Code");
                                                TarriffCodes.RESET;
                                                TarriffCodes.SETRANGE(TarriffCodes.Code, RecPayTypes."Withholding Tax Code");
                                                IF TarriffCodes.FIND('-') THEN BEGIN
                                                    //
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * (Rec.Amount - Rec."VAT Amount");
                                                    //
                                                END;
                                            END
                                            ELSE BEGIN
                                                Rec."Withholding Tax Amount" := 0;
                                            END;
                                        END;


                                    END;
                                Rec."Account Type"::"Fixed Asset":
                                    BEGIN

                                        rec.TESTFIELD(Amount);
                                        RecPayTypes.RESET;
                                        RecPayTypes.SETRANGE(RecPayTypes.Code, Rec.Type);
                                        RecPayTypes.SETRANGE(RecPayTypes.Type, RecPayTypes.Type::Payment);
                                        IF RecPayTypes.FIND('-') THEN BEGIN
                                            IF RecPayTypes."VAT Chargeable" = RecPayTypes."VAT Chargeable"::Yes THEN BEGIN
                                                RecPayTypes.TESTFIELD(RecPayTypes."VAT Code");
                                                TarriffCodes.RESET;
                                                TarriffCodes.SETRANGE(TarriffCodes.Code, RecPayTypes."VAT Code");
                                                IF TarriffCodes.FIND('-') THEN BEGIN
                                                    //"VAT Amount":=(TarriffCodes.Percentage/100)*Amount;
                                                    Rec."VAT Amount" := (Rec.Amount / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage);
                                                END;
                                            END
                                            ELSE BEGIN
                                                Rec."VAT Amount" := 0;
                                            END;

                                            IF RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."Withholding Tax Chargeable"::Yes THEN BEGIN
                                                RecPayTypes.TESTFIELD(RecPayTypes."Withholding Tax Code");
                                                TarriffCodes.RESET;
                                                TarriffCodes.SETRANGE(TarriffCodes.Code, RecPayTypes."Withholding Tax Code");
                                                IF TarriffCodes.FIND('-') THEN BEGIN
                                                    //
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * (Rec.Amount - Rec."VAT Amount");
                                                    //
                                                END;
                                            END
                                            ELSE BEGIN
                                                Rec."Withholding Tax Amount" := 0;
                                            END;
                                        END;
                                    END;
                            END;

                        Rec."Net Amount" := Rec.Amount - Rec."Withholding Tax Amount";
                        Rec.VALIDATE("Net Amount");
                    end;
                }
                field("Due Date"; rec."Due Date")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        checkstatus(Rec);
                    end;
                }
            }
        }
    }

    actions
    {
    }

    procedure checkstatus(var PYLine: Record "Payments Line")
    var
        LCReqrec: Record "Payments Header";
    begin
        if LCReqrec.Get(PYLine."No.") then begin
            LCReqrec.TestField(Status, LCReqrec.Status::Open);
        end;
    end;


    var
        RecPayTypes: Record "Receipts and Payment Types";
        TarriffCodes: Record "Tariff Codes2";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        LineNo: Integer;
        CustLedger: Record "Vendor Ledger Entry";
        CustLedger1: Record "Vendor Ledger Entry";
        Amt: Decimal;
        TotAmt: Decimal;
        ApplyInvoice: Codeunit "Purchase Header Apply";
        VendEntries: Record "Vendor Ledger Entry";
        PInv: Record "Purch. Inv. Header";
        VATPaid: Decimal;
        VATToPay: Decimal;
        PInvLine: Record "Purch. Inv. Line";
        VATBase: Decimal;

}

