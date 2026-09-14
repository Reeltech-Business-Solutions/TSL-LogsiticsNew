page 52347 "Trucks API"
{
    APIGroup = 'truck';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'trucksAPI';
    DelayedInsert = true;
    EntityName = 'trucktslapi';
    EntitySetName = 'trucktslapis';
    PageType = API;
    SourceTable = "Fixed Asset";
    SourceTableView = where("FA Subclass Code" = filter('*TRAILER*'));

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
                field(No; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("faSubclassCode"; Rec."FA Subclass Code")
                {
                    ApplicationArea = All;
                }
                field("vehicleMake"; Rec."Vehicle Make")
                {
                    ApplicationArea = All;
                }
                field("faClassCode"; Rec."FA Class Code")
                {
                    ApplicationArea = All;
                }
                field("vehicleModel"; Rec."Vehicle Model")
                {
                    ApplicationArea = All;
                }
                field("responsibleEmployee"; Rec."Responsible Employee")
                {
                    ApplicationArea = All;
                }
                field("assetType"; Rec."Asset Type")
                {
                    ApplicationArea = All;
                }
                field("contractCode"; Rec."Contract Code")
                {
                    ApplicationArea = All;
                }
                field(engineSerialNo; Rec."Engine Serial No.")
                {
                    Caption = 'Engine Serial No.';
                }
                field(registrationNo; Rec."Registration No.")
                {
                    Caption = 'Registration No.';
                }
            }
        }
    }
}
