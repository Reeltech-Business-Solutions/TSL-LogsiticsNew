page 50230 "Posted Issue Voucher"
{
    ApplicationArea = All;
    Caption = 'Posted Store Issue Voucher';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Inv.Voucher Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    Caption = 'Posting Date';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field("Cost Centre Code"; Rec."Cost Centre Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cost centre code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Revenue Centre Code"; Rec."Revenue Centre Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Revenue centre code field.';
                }
                field("2Description"; Rec."2Description")
                {
                    Caption = 'Description';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description';
                }
                field("Request Description"; Rec."Request Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request Description field.';
                }
                field("Required Date"; Rec."Required Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Required Date field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    Caption = 'Issuing Store';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issuing Store field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Responsibility center field.';
                }
                field("Issued To"; Rec."Issued To")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Issued To field.';
                }
                field("Created By Date"; Rec."Created By Date")
                {
                    Caption = 'Creation Date';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Creation Date field';
                }
                field(Narration; Rec.Narration)
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Narration field.';
                }
            }
            part(lines; "Issue Voucher Subform")
            {
                Caption = 'Store Issue Voucher Lines';
                ApplicationArea = All;
                SubPageLink = "Document No." = field("Document No."), "Voucher Type" = field("Voucher Type");
            }
            group(Usertrail)
            {
                Editable = false;
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Created By Name"; Rec."Created By Name")
                {
                    ApplicationArea = All;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = All;
                }
                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = All;
                }
                field("Modified By Name"; Rec."Modified By Name")
                {
                    ApplicationArea = All;
                }
                field("Modified Date"; Rec."Modified Date")
                {
                    ApplicationArea = All;
                }
                field("Modified Time"; Rec."Modified Time")
                {
                    ApplicationArea = All;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = All;
                }
                field("Posted By Name"; Rec."Posted By Name")
                {
                    ApplicationArea = All;
                }
                field("Posted Time"; Rec."Posted Time")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}