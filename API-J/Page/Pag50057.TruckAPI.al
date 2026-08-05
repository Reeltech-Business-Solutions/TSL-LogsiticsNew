page 50057 "Truck API"
{
    APIGroup = 'TFleet';
    APIPublisher = 'CapitalCore';
    APIVersion = 'v1.0';
    Caption = 'truckAPI';
    DelayedInsert = true;
    EntityName = 'Trucks';
    EntitySetName = 'Truckdetails';
    PageType = API;
    SourceTable = "Fixed Asset";
    SourceTableView = where("FA Subclass Code" = filter('*TRAILER*'));
    Editable = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ID; Rec.ID)
                {
                    Caption = 'ID';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(vehicleMake; Rec."Vehicle Make")
                {
                    Caption = 'Vehicle Make';
                }
                field(vehicleModel; Rec."Vehicle Model")
                {
                    Caption = 'Vehicle Model';
                }
                field(assetType; Rec."Asset Type")
                {
                    Caption = 'Asset Type';
                }
                field(assetTypeNo; Rec."Asset Type No.")
                {
                    Caption = 'Asset T No.';
                }
                field(chassisSerialNo; Rec."Chassis Serial No.")
                {
                    Caption = 'Chassis Serial No.';
                }
                field(engineSerialNo; Rec."Engine Serial No.")
                {
                    Caption = 'Engine Serial No.';
                }
                field(registrationNo; Rec."Registration No.")
                {
                    Caption = 'Registration No.';
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                }
                field(inactive; Rec.Inactive)
                {
                    Caption = 'Inactive';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(contractCode; Rec."Contract Code")
                {
                    Caption = 'Contract Code';
                }
                field(faClassCode; Rec."FA Class Code")
                {
                    Caption = 'FA Class Code';
                }
                field(faLocationCode; Rec."FA Location Code")
                {
                    Caption = 'FA Location Code';
                }
                field(faPostingGroup; Rec."FA Posting Group")
                {
                    Caption = 'FA Posting Group';
                }
                field(faSubclassCode; Rec."FA Subclass Code")
                {
                    Caption = 'FA Subclass Code';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
            }
        }
    }
}
