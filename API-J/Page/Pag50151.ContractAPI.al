page 50151 "Contract API"
{
    APIGroup = 'Agreement';
    APIPublisher = 'CapitalCore';
    APIVersion = 'v1.0';
    Caption = 'contractAPI';
    DelayedInsert = true;
    EntityName = 'ContractAPI';
    EntitySetName = 'ContractAgreementAPI';
    PageType = API;
    SourceTable = "COntract Agreement";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'Contract No.';
                }
                field(customerAddress; Rec."Customer Address")
                {
                    Caption = 'Address';
                }
                field(contractDate; Rec."Contract Date")
                {
                    Caption = 'Contract Date';
                }
                field(contractType; Rec."Contract Type")
                {
                    Caption = 'Contract Type';
                }
                field(customerCode; Rec."Customer Code")
                {
                    Caption = 'Customer Code';
                }
                field(customerName; Rec."Customer Name")
                {
                    Caption = 'Customer Name';
                }
                field(phone; Rec.Phone)
                {
                    Caption = 'Phone';
                }
                field(revenueCalcCode; Rec."Revenue Calc. Code")
                {
                    Caption = 'Revenue Calc. Code';
                }
                field(vehicleCount; Rec."Vehicle Count")
                {
                    Caption = 'Vehicle Count';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
            }
        }
    }
}
