pageextension 50016 FixedAssetList extends "Fixed Asset List"
{
    layout
    {
        addafter("FA Location Code")
        {
            field("Asset Type No."; Rec."Asset Type No.")
            {
                ApplicationArea = All;
            }
            field("Asset Type"; Rec."Asset Type")
            {
                ApplicationArea = All;
            }
            field("Registration No."; Rec."Registration No.")
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
                action(DeleteOpeningBal)
                {
                    ApplicationArea = All;
                    Promoted = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        Accschd: Codeunit AccSchedManagementExt;
                    begin
                        Accschd.TansactionData();
                    end;
                }
            }
        }
    }

}

