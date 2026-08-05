page 50240 Asset
{
    APIGroup = 'AssetType';
    APIPublisher = 'CapitalCore';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'asset';
    DelayedInsert = true;
    EntityName = 'AssetType';
    EntitySetName = 'AssetTypeAPI';
    PageType = API;
    SourceTable = "Service Item";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ApplicationArea = All;
                }
                field(engineNo; Rec."Engine No.")
                {
                    Caption = 'Engine No.';
                    ApplicationArea = All;
                }
                field(vehicleRegNo; Rec."Vehicle Reg. No.")
                {
                    Caption = 'Vehicle Reg. No.';
                    ApplicationArea = All;
                }
                field(model; Rec.Model)
                {
                    Caption = 'Model';
                    ApplicationArea = All;
                }
                field(chasisNo; Rec."Chasis No.")
                {
                    Caption = 'Chasis No.';
                    ApplicationArea = All;
                }
                field(machineTYPE; Rec."MACHINE TYPE")
                {
                    Caption = 'MACHINE TYPE';
                    ApplicationArea = All;
                }
                field(locationOfServiceItem; Rec."Location of Service Item")
                {
                    Caption = 'Location of Service Item';
                    ApplicationArea = All;
                }
                field(fleeVehtNo; Rec."Flee Veht No.")
                {
                    Caption = 'Flee Veht No.';
                    ApplicationArea = All;
                }
                field(make; Rec.Make)
                {
                    Caption = 'Vehicle Make';
                    ApplicationArea = All;
                }
                field(customerName; Rec."Customer Name")
                {
                    Caption = 'Customer Name';
                    ApplicationArea = All;
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
