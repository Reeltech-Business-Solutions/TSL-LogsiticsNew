page 50152 ContracLinesAPI
{
    APIGroup = 'AgreementLines';
    APIPublisher = 'CapitalCore';
    APIVersion = 'v1.0';
    Caption = 'contracLinesAPI';
    DelayedInsert = true;
    EntityName = 'ContractAgreement';
    EntitySetName = 'ContractAPI';
    PageType = API;
    SourceTable = "Contract Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(truckCode; Rec."Truck Code")
                {
                    Caption = 'Truck Code';
                }
                field(truckName; Rec."Truck Name")
                {
                    Caption = 'Truck Name';
                }
                field(truckType; Rec."Truck Type")
                {
                    Caption = 'Truck Type';
                }
                field(formularType; Rec."Formular Type")
                {
                    Caption = 'Formular Type';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
            }
        }
    }
}
