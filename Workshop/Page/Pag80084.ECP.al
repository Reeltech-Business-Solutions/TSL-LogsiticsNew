page 80084 ECP
{
    Caption = 'ECP';
    PageType = Document;
    //RefreshOnActivate = true;
    SourceTable = "ECP Header";
    InsertAllowed = false;



    layout
    {
        area(content)
        {
            group(General)
            {
                field("Doc. No."; Rec."Doc. No.")
                {
                    ToolTip = 'Specifies the value of the Doc. No. field.';
                    ApplicationArea = All;

                    // trigger OnAssistEdit()
                    // begin
                    //     IF Rec.AssistEdit(xRec) THEN
                    //         CurrPage.UPDATE;
                    // end;
                }
                field("J/C No."; Rec."J/C No.")
                {
                    ToolTip = 'Specifies the value of the J/C No. field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                    ApplicationArea = All;
                }
                field("5th Wheel Serial No."; Rec."5th Wheel Serial No.")
                {
                    ToolTip = 'Specifies the value of the 5th Wheel Serial No. field.';
                    ApplicationArea = All;
                }
                field(Brand; Rec.Brand)
                {
                    ToolTip = 'Specifies the value of the Brand field.';
                    ApplicationArea = All;
                }
                field(Image; Rec.Image)
                {
                    ToolTip = 'Specifies the value of the Image field.';
                    ApplicationArea = All;
                }
                field("Description Of Part(Image)"; Rec."Description Of Part(Image)")
                {
                    ToolTip = 'Specifies the value of the Description Of Part(Image) field.';
                    ApplicationArea = All;

                }
                field("Driver's Name"; Rec."Driver's Name")
                {
                    Caption = 'Driver';
                    ApplicationArea = All;
                    Visible = false;
                    trigger OnValidate()
                    var
                        Emprec: Record Employee;
                    begin
                        if Emprec.Get(rec."Driver's Name") then
                            Rec.DriverName := Emprec.FullName;
                    end;
                }
                field(DriverName; Rec.DriverName)
                {
                    ApplicationArea = All;
                    Caption = 'Driver s Name';

                }
                field("Staff No"; Rec."Staff No")
                {
                    Caption = 'Created By.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Odometer; Rec.Odometer)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Work Order No"; Rec."Work Order No")
                {
                    Caption = 'Work Order No.';
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Contract; Rec.Contract)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Inspected By"; Rec."Inspected By")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        Emp: Record Employee;
                    begin
                        if Emp.Get(rec."Inspected By") then
                            rec.InspectedbyName := Emp.FullName();
                    end;
                }
                field(InspectedbyName; Rec.InspectedbyName)
                {
                    ApplicationArea = All;
                    Caption = 'Insp. Name';
                }
            }
            part(ECP; "ECP Line")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD("Doc. No.");
            }
            part("King Pin"; "King Pin")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("Doc. No.");
            }
            group("Comment")
            {
                Caption = 'Comments';

                field(Comments; Rec.Comments)
                {
                    Caption = 'Comments';
                    ApplicationArea = All;
                    MultiLine = true;
                }

            }

        }

    }
    actions
    {
        area(Navigation)
        {
            action("Report")
            {
                ApplicationArea = All;
                Caption = 'Print ECP';
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Visible = false;



                trigger OnAction()
                var
                    ECPRec: Record "ECP Header";

                begin
                    ECPRec.Reset();
                    ECPRec.SetFilter("Doc. No.", '%1', rec."Doc. No.");
                    report.Run(Report::ECPForm, true, false, ECPRec);
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        rec.ECPCheckList();
    end;

    trigger OnAfterGetRecord()
    begin
        rec.ECPCheckList();
    end;

    var
    // DriverName: Text[50];

}


