page 50243 "Quality Check"
{
    ApplicationArea = All;
    Caption = 'Quality Check Assurance Form';
    PageType = Card;
    SourceTable = "Quality Check";



    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Driver"; Rec."Driver")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Name field.', Comment = '%';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Name field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location Code field.', Comment = '%';
                }
                field("Location Name"; Rec."Location Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Date In"; Rec."Date In")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DATE IN field.', Comment = '%';
                }
                field("Date Out"; Rec."Date Out")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DATE OUT field.', Comment = '%';
                }
                field(Odometer; Rec.Odometer)
                {
                    ToolTip = 'Specifies the value of the Odometer field.', Comment = '%';
                }
                field("Truck No."; Rec."Truck No.")
                {
                    ToolTip = 'Specifies the value of the Truck No. field.', Comment = '%';
                }
                field("Trailer No."; Rec."Trailer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trailer No. field.', Comment = '%';
                }
                field(Diesel; Rec.Diesel)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Diesel(Ltrs.) field.', Comment = '%';
                }
                field("Next Serv Date"; Rec."Next Serv Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the NEXT SERV. DATE field.', Comment = '%';
                }
                field("Next MPM"; Rec."Next MPM")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the NEXT MPM DATE field.', Comment = '%';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Reg No."; Rec."Vehicle Reg No.")
                {
                    ApplicationArea = All;
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                    Visible = false;

                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                    Visible = false;
                }
            }
            part(Lines; "Quality Check Subform")
            {
                Caption = 'Lines';
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
            }


        }
    }
    actions
    {
        area(Processing)
        {
            action(Jobs)
            {
                ApplicationArea = All;
                Caption = 'Jobs';
                Image = Job;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = page "Job List - Internal";
                RunPageLink = "No." = field("Job No.");

            }
        }
        area(Reporting)
        {
            action("Report")
            {
                ApplicationArea = All;
                Caption = 'Quality Check Form';
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;
                // RunObject = report QualityCheckAssurance;

                trigger OnAction()
                begin
                    rec.Reset();
                    rec.SetRange("No.", rec."No.");
                    Report.Run(Report::QualityCheckAssurance, true, false, Rec);
                end;
            }

            action("Quality Passed")
            {
                ApplicationArea = All;
                caption = 'Quality Passed';
                Image = Approve;
                promoted = true;
                promotedIsBig = true;
                //Enabled = disButton;

                trigger OnAction()
                var
                    Job: Record Job;
                begin
                    if not Confirm('Do you want to Modify Status to Quality passed?', true) then
                        exit;
                    if Job.Get(Rec."Job No.") then begin
                        if Job."Workshop Status" = Job."Workshop Status"::Completed then
                            Error('This job has already been completed.');
                        Job."Workshop Status" := Job."Workshop Status"::Completed;
                        //disButton := false;
                        Job.Modify();
                        Message('Workshop status on Job Card updated to Completed.');
                        CurrPage.Update(true);
                    end else begin
                        Error('Job with Job No. %1 not found.', Rec."Job No.");
                    end;

                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        Job: Record Job;
    begin
        if Job.Get(Rec."Job No.") then begin
            if Job."Workshop Status" = Job."Workshop Status"::Completed then
                CurrPage.Editable(false);

        end;
    end;

    trigger OnOpenPage()
    var
        Job: Record Job;
    begin
        if Job.Get(Rec."Job No.") then begin
            if Job."Workshop Status" = Job."Workshop Status"::Completed then
                CurrPage.Editable(false);
            // disButton := false;
        end;
    end;

    var
        disButton: Boolean;
}
