page 50232 "Posted IssueVouch Subform"
{
    ApplicationArea = All;
    Caption = 'Posted IssueVouch Subform';
    PageType = ListPart;
    SourceTable = "Inv. Voucher Line";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.';

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field(Narration; Rec.Narration)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Narration field.';
                }
                field("Quantity in Location"; Rec."Quantity in Location")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity in Location field.';
                    
                }
                field("Qty on Sales Location"; Rec."Qty on Sales Location")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Qty on Sales Location field.';
                }
                field("Gen. Business Posting Group"; Rec."Gen. Business Posting Group")
                {
                    TableRelation = "Gen. Business Posting Group";

                }
                field("Qty on Transfer Order"; Rec."Qty on Transfer Order")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Qty on Transfer Order field.';
                }
            }
        }
    }
}
