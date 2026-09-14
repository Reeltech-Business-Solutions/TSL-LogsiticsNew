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
}
