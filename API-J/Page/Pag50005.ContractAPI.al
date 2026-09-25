page 50005 "Contract API TSL"
{
    APIGroup = 'contract';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'contractAPI';
    DelayedInsert = true;
    EntityName = 'contract';
    EntitySetName = 'contracts';
    PageType = API;
    SourceTable = "Contract Agreement";
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(SystemId; Rec.SystemId)
                {

                }
                field("No"; Rec."No.")
                {

                }
                field("contractName"; Rec."Contract Name")
                {

                }
                field("contractType"; Rec."Contract Type")
                {

                }
                field("contractGroup"; Rec."Contract Group")
                {

                }
                field("customerCode"; Rec."Customer Code")
                {

                }
                field("customerName"; Rec."Customer Name")
                {

                }
                field("customerAddress"; Rec."Customer Address")
                {

                }
                field("customerPhone"; Rec.Phone)
                {

                }
                field("revenueCalcCode"; Rec."Revenue Calc. Code")
                {

                }
                field("vehicleCount"; Rec."Vehicle Count")
                {

                }


                part(lines; "Contract Lines TSL API")
                {
                    EntitySetName = 'contractlines';
                    EntityName = 'contractline';
                    SubPageLink = "Header Id" = field(SystemId);
                }
            }
        }
    }

}
