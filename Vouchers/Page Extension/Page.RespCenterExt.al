pageextension 50021 RespCenterExt extends "Responsibility Center List"
{
    layout
    {
        addafter("Location Code")
        {
            // Add changes to table fields here
            field("CPV Nos."; Rec."CPV Nos.")
            {
                ApplicationArea = All;
                TableRelation = "No. Series";
            }
            field("BPV Nos."; Rec."BPV Nos.")
            {
                ApplicationArea = All;
            }
            field("CRV Nos."; Rec."CRV Nos.")
            {
                ApplicationArea = All;
                //TableRelation = "No. Series"; 
            }
            field("BRV Nos."; Rec."BRV Nos.")
            {
                ApplicationArea = All;
                // TableRelation = "No. Series"; 
            }
            field("JV Nos."; Rec."JV Nos.")
            {
                ApplicationArea = All;
                //TableRelation = "No. Series";
            }
            field("Posted CPV Nos."; Rec."Posted CPV Nos.")
            {
                ApplicationArea = All;
                //TableRelation = "No. Series";
            }
            field("Posted BPV Nos."; Rec."Posted BPV Nos.")
            {
                ApplicationArea = All;
                //TableRelation = "No. Series"; 
            }
            field("Posted CRV Nos."; Rec."Posted CRV Nos.")
            {
                ApplicationArea = All;
                //TableRelation = "No. Series"; 
            }
            field("Posted BRV Nos."; Rec."Posted BRV Nos.")
            {
                ApplicationArea = All;
                // TableRelation = "No. Series"; 
            }
            field("Posted JV Nos."; Rec."Posted JV Nos.")
            {
                ApplicationArea = All;
                //TableRelation = "No. Series"; 
            }
            field("Posted Contra Voucher Nos."; Rec."Posted Contra Voucher Nos.")
            {
                ApplicationArea = All;
                //TableRelation = "No. Series"; 
            }
            field("Petty Cash Nos"; Rec."Petty Cash Nos")
            {
                ApplicationArea = All;
                //TableRelation = "No. Series";
            }
            field("Posted Petty Cash Nos"; Rec."Posted Petty Cash Nos")
            {
                ApplicationArea = All;
                // TableRelation = "No. Series"; 
            }
            field("Contra Voucher Nos."; Rec."Contra Voucher Nos.")
            {
                ApplicationArea = All;
                // TableRelation = "No. Series"; 
            }

        }

    }
}