
pageextension 50015 fixedAssetExt extends "Fixed Asset Card"
{



    layout
    {
        addafter("FA Class Code")
        {
            field(ID; Rec.ID)
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("Asset Type"; Rec."Asset Type")
            {
                ApplicationArea = All;
            }
            field("Asset Type2"; Rec."Asset Type2")
            {
                ApplicationArea = All;
                Caption = 'Asset Type';
            }
            field("Vehicle Make"; Rec."Vehicle Make")
            {
                ApplicationArea = All;
            }
            field("Vehicle Model"; Rec."Vehicle Model")
            {
                ApplicationArea = All;
            }
            field("Registration No."; Rec."Registration No.")
            {
                ApplicationArea = All;
            }
            field("Asset Type No."; Rec."Asset Type No.")
            {
                ApplicationArea = All;
            }
            field("Chassis Serial No."; Rec."Chassis Serial No.")
            {
                ApplicationArea = All;
            }
            field("Engine Serial No."; Rec."Engine Serial No.")
            {
                ApplicationArea = All;
            }
            field("Contract Code"; Rec."Contract Code")
            {
                ApplicationArea = All;
            }
            field(Truck; Rec.Truck)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(Dimensions)
        {
            group(Update)
            {
                action("Update Asset Type")
                {
                    ApplicationArea = All;
                    Image = UpdateDescription;
                    Promoted = true;

                    trigger OnAction()
                    var
                        AssetType: Record "Fixed Asset";

                    begin
                        if
                        AssetType.Get(rec."No.") then begin
                            Evaluate(AssetType."Asset Type2", AssetType."Asset Type");
                            AssetType.Modify();
                        end;
                    end;
                }
            }
        }
    }
}