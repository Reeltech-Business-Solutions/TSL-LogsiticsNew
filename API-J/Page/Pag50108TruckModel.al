page 50108 TruckModel
{
    APIGroup = 'TFleet';
    APIPublisher = 'CapitalCore';
    APIVersion = 'v1.0';
    Caption = 'truckModel';
    DelayedInsert = true;
    EntityName = 'truckModel';
    EntitySetName = 'truckModel';
    PageType = API;
    SourceTable = "Vehicle Model";
    Editable = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field(Manufacturer; Rec.Manufacturer)
                {
                    ToolTip = 'Specifies the value of the Manufacturer field.';
                    ApplicationArea = All;
                }

                field(VehicleMake; Rec."Vehicle Make")
                {
                    ToolTip = 'Specifies the value of the Vehicle Make field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}