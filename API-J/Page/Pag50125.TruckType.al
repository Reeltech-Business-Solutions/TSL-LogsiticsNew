page 50125 TruckType
{
    APIGroup = 'TFleet';
    APIPublisher = 'CapitalCore';
    APIVersion = 'v1.0';
    Caption = 'truckType';
    DelayedInsert = true;
    EntityName = 'truckType';
    EntitySetName = 'truckType';
    PageType = API;
    SourceTable = "Vehicle Make";
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
                field(CalculateType; Rec."Calculate Type")
                {
                    ToolTip = 'Specifies the value of the Calculate Type field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}