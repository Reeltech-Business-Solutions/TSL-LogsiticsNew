page 50007 "Contract Lines TSL API"
{
    APIGroup = 'contract';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'contractLinesTSLAPI';
    DelayedInsert = true;
    EntityName = 'contractline';
    EntitySetName = 'contractlines';
    PageType = API;
    SourceTable = "Contract Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                }
                field("truckCode"; Rec."Truck Code")
                {
                    ApplicationArea = All;
                }
                field("vehicleMake"; Rec."Truck Type")
                {
                    ApplicationArea = All;
                }

                field("formularType"; Rec."Formular Type")
                {
                    ApplicationArea = All;
                }
                field("assetRegistrationNo"; Rec."Asset Registration No.")
                {
                    ApplicationArea = All;
                }
                field("assetTinNo"; Rec."Asset Tin No.")
                {
                    ApplicationArea = All;
                }
                field("headerId"; Rec."Header Id")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        IsDeepInsert: Boolean;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        Contract: Record "Contract Agreement";
        ContractLine: Record "Contract Line";
    begin
        if IsDeepInsert then begin
            Contract.GetBySystemId(Rec."Header Id");
            Rec."Document No." := Contract."No.";

            ContractLine.SetRange("Document No.", Rec."Document No.");
            if ContractLine.FindLast() then
                Rec."Line No." := ContractLine."Line No." + 10000
            else
                Rec."Line No." := 10000;

        end;
    end;


    trigger OnNewRecord(BelowxRec: Boolean)
    var
        contract: Record "Contract Agreement";
    begin
        IsDeepInsert := IsNullGuid(Rec."Header Id");
        if not IsDeepInsert then begin
            contract.GetBySystemId(Rec."Header Id");
            Rec."Document No." := contract."No.";
        end;
    end;
}
