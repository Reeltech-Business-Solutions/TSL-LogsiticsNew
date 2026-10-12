page 50282 "Approved LC Line"
{
    APIGroup = 'applc';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'approvedLCLine';
    DelayedInsert = true;
    EntityName = 'line';
    EntitySetName = 'lines';
    PageType = API;
    SourceTable = "Payments Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(SystemId; Rec.SystemId)
                {

                }
                field(Type; Rec.Type)
                {

                }
                field("AccountNo"; Rec."Account No.")
                {

                }
                field(description; Rec."Account Name")
                {

                }
                field(costCenterCode; Rec."Global Dimension 1 Code")
                {

                }
                field(revenueCenterCode; Rec."Shortcut Dimension 2 Code")
                {

                }
                field(Quantity; Rec.Quantity)
                {

                }
                field(Amount; Rec.Amount)
                {
                    trigger OnValidate()
                    begin

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
            }
            field(NetAmount; Rec."Net Amount")
            {

            }
        }
    }
    var
        IsDeepInsert: Boolean;
        RecPayTypes: Record "Receipts and Payment Types";
        TarriffCodes: Record "Tariff Codes2";

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        PayHeader: Record "Payments Header";
        PayLine: Record "Payments Line";

    begin
        if IsDeepInsert then begin
            PayHeader.GetBySystemId(Rec."Header Id");
            Rec."No." := PayHeader."No.";
            PayLine.SetRange("No.", Rec."No.");
            if PayLine.FindLast() then
                Rec."Line No." := PayLine."Line No." + 10000

            else
                Rec."Line No." := 10000
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        PayHeader: Record "Payments Header";
    begin
        IsDeepInsert := IsNullGuid(Rec."Header Id");
        if not IsDeepInsert then begin
            PayHeader.GetBySystemId(Rec."Header Id");
            Rec."No." := PayHeader."No.";
        end
    end;

}

