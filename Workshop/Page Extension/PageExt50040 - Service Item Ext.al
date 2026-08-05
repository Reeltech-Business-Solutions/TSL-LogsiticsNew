pageextension 50040 "Service Item Ext" extends "Service Item Card" //OriginalId
{
    Caption = 'Asset';

    layout

    {
        modify("Item No.")
        {
            Visible = false;
        }
        modify("Item Description")
        {
            Visible = false;
        }
        modify("Service Item Group Code")
        {
            Visible = false;
        }
        modify("Service Price Group Code")
        {
            Visible = false;
        }
        modify(Shipping)
        {
            Visible = false;
        }
        modify(Vendor)
        {
            Visible = false;
        }
        modify(Detail)
        {
            Visible = false;
        }
        modify(Contract)
        {
            Visible = false;
        }
        modify("Warranty Starting Date (Parts)")
        {
            Visible = false;
        }
        modify("Warranty Ending Date (Parts)")
        {
            Visible = false;
        }
        modify("Warranty % (Labor)")
        {
            Visible = false;
        }
        modify("Warranty % (Parts)")
        {
            Visible = false;
        }
        modify("Warranty Starting Date (Labor)")
        {
            Visible = false;
        }
        modify("Warranty Ending Date (Labor)")
        {
            Visible = false;
        }
        modify("Serial No.")
        {
            Visible = false;
        }
        modify(Status)
        {
            Visible = false;
        }
        modify("Response Time (Hours)")
        {
            Visible = false;
        }
        modify(Priority)
        {
            Visible = false;
        }
        modify("Preferred Resource")
        {
            Visible = false;
        }


        addafter("Preferred Resource")
        {
            group("Vehicle Details")
            {
                Caption = 'VEHICLE DETAILS';
                field("Engine No."; Rec."Engine No.")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Reg. No."; Rec."Vehicle Reg. No.")
                {
                    ApplicationArea = All;
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = All;
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = All;
                }
                field("Flee Veht No."; Rec."Flee Veht No.")
                {
                    ApplicationArea = All;
                    Caption = 'Asset No.';
                }
                field("Chasis No."; Rec."Chasis No.")
                {
                    ApplicationArea = All;
                }
                field("MACHINE TYPE"; Rec."MACHINE TYPE")
                {
                    ApplicationArea = All;
                }
                field("Machine Type2"; Rec."Machine Type2")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Acquisition Date"; Rec."Acquistion Date")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Base Location"; Rec."Base Location")
                {
                    ApplicationArea = All;
                }
                field("Preventive Maintenace Cycle"; Rec."Preventive Maintenace Cycle")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Vehicle Picture"; Rec."Vehicle Picture")
                {
                    ApplicationArea = all;

                }
                field("Vehicle PicS"; Rec."Vehicle PicS")
                {
                    ApplicationArea = all;
                }
                field("Vehicle PicB"; Rec."Vehicle PicB")
                {
                    ApplicationArea = all;
                }
            }
        }
        addafter(General)

        {
            group("Warranty Details")
            {

                field("Warranty Starting Date (Parts)1"; Rec."Warranty Starting Date (Parts)")
                {
                    Caption = 'Warranty Starting Date (Parts)';
                    ApplicationArea = All;
                }
                field("Warranty Ending Date (Parts)1"; Rec."Warranty Ending Date (Parts)")
                {
                    Caption = 'Warranty Ending Date (Parts)';
                    ApplicationArea = All;
                }
                field("Warranty % (Parts)1"; Rec."Warranty % (Parts)")
                {
                    Caption = 'Warranty % (Parts)';
                    ApplicationArea = All;
                }
                field("Warranty Starting Date (Labor)1"; Rec."Warranty Starting Date (Labor)")
                {
                    Caption = 'Warranty Starting Date (Labor)';
                    ApplicationArea = All;
                }
                field("Warranty Ending Date (Labor)1"; Rec."Warranty Ending Date (Labor)")
                {
                    Caption = 'Warranty Ending Date (Labor)';
                    ApplicationArea = All;
                }
                field("Warranty % (Labor)1"; Rec."Warranty % (Labor)")
                {
                    Caption = 'Warranty % (Labor)';
                    ApplicationArea = All;
                }

            }
            group("Fleet Manager")
            {
                Visible = false;
                field("Fleet Mgr Code"; Rec."Fleet Mgr Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }//Lookup to Employee code
                field("Fleet Manager Name"; Rec."Fleet Manager Name")
                {
                    ApplicationArea = All;
                }
                field("Fleet Mgr  Phone No."; Rec."Fleet Mgr  Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Fleet Manager Email"; Rec."Fleet Manager Email")
                {
                    ApplicationArea = All;
                }
                field("Date In Service"; Rec."Date In Service")
                {
                    ApplicationArea = All;
                }

                field("Customer Type"; Rec."Customer Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
            }
        }
        addfirst(factboxes)
        {
            // part("Attachments"; "Document Attachment Factbox")
            // {
            //     ApplicationArea = All;
            //     //SubPageLink = "No." = field("No.");
            //     SubPageLink = "Table ID" = CONST(5940), "No." = FIELD("No.");
            // }
        }
    }

    actions
    {
        addafter("Ser&vice Contracts")
        {
            action(Jobs)
            {
                ApplicationArea = All;
                Caption = 'Jobs';
                Promoted = true;
                PromotedCategory = Process;
                Image = Job;
                RunObject = Page "Job List - Internal";
                RunPageLink = "Service Vehicle" = field("No.");


                trigger OnAction()
                var
                // job: Record Job;
                // joblist: page "Job List - Internal";

                begin
                    // job.Reset();
                    // job.setRange("Service Vehicle", Rec."No.");
                    // if Job.findfirst() then
                    //     Page.Run(Page::"Job List - Internal", job);
                end;

            }

            action("Issue Entries")
            {
                ApplicationArea = All;
                Caption = 'Issue Entries';
                Promoted = true;
                PromotedCategory = Process;
                Image = Job;
                RunObject = Page "Job Ledger Entries";
                RunPageLink = "Service Item No." = field("No."), "Entry Type" = Filter(Usage);

            }

        }
    }
}