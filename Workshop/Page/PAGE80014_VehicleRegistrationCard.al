page 80014 "Vehicle Registration Card"
{
    PageType = Document;
    SourceTable = "Vehicle Registration";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Control1000000044)
            {
                ShowCaption = false;
                field("Registration ID"; Rec."Registration ID")
                {
                    Editable = false;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        Rec."Registration by" := USERID;
                        Rec."Registration Date" := TODAY;
                    end;
                }
                field("Buisness Type"; Rec."Buisness Type")
                {
                    // NotBlank = true;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Service Item"; Rec."Service Item")
                {
                    Caption = 'Service Vehicle';
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        /*
                           TESTFIELD("Buisness Type");

                           //USED TO STOP HAVING MORE THAN ONE OPEN SERVICE JOB APP OPENED FOR A TRUCK AT THE SAME TIME  //ddada
                           JobRec.RESET;
                           JobRec.SETRANGE(JobRec."Vehicle Registr. Plate No", "Service Item");
                           ////JobRec.SETFILTER(JobRec.Status, '%1', JobRec.Status::Order);
                           JobRec.SETFILTER(JobRec."Job Type", '<>%1&<>%2', "Job Type"::"KM Service", "Job Type"::PrevMaint);
                           /// JobRec.SETFILTER(JobRec."Creation Date",'>%1',040116D);
                           JobRec.CALCFIELDS(JobRec."Invoice Exist", JobRec."WIP Amount");
                           JobRec.SETRANGE(JobRec."Invoice Exist", FALSE);
                           IF JobRec.FIND('-') THEN
                               ERROR('There are still some pending job Cards for Serv. yet to be invoiced  Item/Vehicle: %1, Check Job No.: %2; created: %3. Contact your adminsitator.',
                               JobRec."Vehicle Registr. Plate No", JobRec."No.", JobRec."Creation Date");

                       */
                    end;
                }
                field("FLeet No."; Rec."FLeet No.")
                {
                    Caption = 'Asset No.';
                    ApplicationArea = All;
                }
                field(Trailer; Rec.Trailer)
                {
                    ApplicationArea = All;
                    caption = 'Trailer/Tractor';

                    trigger OnLookup(var TrailerText: Text): Boolean
                    var
                        serviceItem: Record "Service Item";
                        serviceItemPage: Page "Service Item List";
                    begin
                        ServiceItem.Reset();
                        if ServiceItem.Get(Rec."Service Item") then
                            if ServiceItem."MACHINE TYPE" = ServiceItem."MACHINE TYPE"::Trailer then
                                ServiceItem.SetRange("MACHINE TYPE", ServiceItem."MACHINE TYPE"::Tractor)
                            else if ServiceItem."MACHINE TYPE" = ServiceItem."MACHINE TYPE"::Tractor then
                                ServiceItem.SetRange("MACHINE TYPE", ServiceItem."MACHINE TYPE"::Trailer);

                        if Page.RunModal(page::"Service Item List", serviceItem) = Action::LookupOK then begin
                            //serviceItemPage.GetRecord(ServiceItem);
                            Rec.Validate("Trailer", ServiceItem."No.");
                            TrailerText := serviceItem."No.";
                            exit(true);
                        end;
                        exit(false);

                    end;
                }
                field("Trailer No."; Rec."Trailer No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Job Type"; Rec."Job Type")
                {
                    ApplicationArea = All;
                    Visible = false;

                    trigger OnValidate()
                    var
                        ServItem: Record "Service Item";
                    begin
                        //to remove while When service App starts

                        //  TESTFIELD("Buisness Type");
                        /* IF ("Job Type" = "Job Type"::PrevMaint) OR ("Job Type" = "Job Type"::"KM Service") THEN
                             ERROR(' You can not Do %1 Service from this Page, Please use the Vehicle Regitration (Prevent. Maint.) Card on your system', "Job Type");
                   */  //Dennis
                       /*
                            if "Job Type" = "Job Type"::PrevMaint then
                                ShowPrev := true
                            else
                                ShowPrev := false;
    */
                        if ServItem.Get(Rec."Service Item") then begin
                            if ServItem."Preventive Maintenace Cycle" = 4 then
                                Rec."Preventive Maintenace Cycle" := 1
                            else
                                Rec."Preventive Maintenace Cycle" := ServItem."Preventive Maintenace Cycle" + 1;
                        end;



                    end;
                }
                field("Customer Type"; Rec."Customer Type")
                {
                    OptionCaption = '< ,Internal,External,Warranty,Contract,Lease Operation,Insurance>';
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Customer Job Type"; Rec."Customer Job Type")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        EnableCustomerJobControl;
                    end;
                }
                field("Job Type Code"; Rec."Job Type Code")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        IF (Rec."Job Type Code" = 'PM-LEASING') OR (Rec."Job Type Code" = 'PM') THEN
                            ERROR(' You can not Do %1 Service from this Page', Rec."Job Type Code");

                    end;
                }
                field("Preventive Maintenace Cycle"; Rec."Preventive Maintenace Cycle")
                {
                    /// Visible = ShowPrev;
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Truck BreakDown No."; Rec."Truck BreakDown No.")
                {
                    Caption = 'Truck BreakDown No.';
                    Style = Favorable;
                    StyleExpr = TRUE;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Customer Bill to Code"; Rec."Customer Bill to Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Customer Bill to Name"; Rec."Customer Bill to Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Customer Bill to Address"; Rec."Customer Bill to Address")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Customer Ship to Code"; Rec."Customer Ship to Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Customer Ship to Name"; Rec."Customer Ship to Name")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Customer Ship to Address"; Rec."Customer Ship to Address")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Contact Person Name"; Rec."Contact Person Name")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Contact Person Designation"; Rec."Contact Person Designation")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Contact Person Telephone"; Rec."Contact Person Telephone")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Customer Contact email"; Rec."Customer Contact email")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Bill to Account No."; Rec."Bill to Account No.")
                {
                    visible = false;
                    ApplicationArea = All;
                }
                field("Bill to Account Name"; Rec."Bill to Account Name")
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
                field("Service Advisor"; Rec."Service Advisor")
                {
                    trigger OnValidate()
                    var
                        EmployRec: Record Employee;
                    begin
                        if EmployRec.Get(rec."Service Advisor") then
                            rec."S/A Advisor" := EmployRec.FullName();
                    end;
                }
                field("S/A Advisor"; Rec."S/A Advisor")
                {

                }
                field("Fleet Manager"; Rec."Fleet Manager")
                {
                    ApplicationArea = All;
                    Visible = false;

                }
                field("Fleet Manager Name"; Rec."Fleet Manager Name")
                {
                    ApplicationArea = All;


                }
                field("Fleet Manager Phone No."; Rec."Fleet Manager Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Fleet Manger  Location"; Rec."Fleet Manger  Location")
                {
                    ApplicationArea = All;
                }
                field("Fleet  Manager E-Mail"; Rec."Fleet  Manager E-Mail")
                {
                    ApplicationArea = All;
                }
                field("Location"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Shortcut dimension 3"; Rec."Shortcut dimension 3")
                {
                    // Caption = ' Posting Location';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Global Dimension 7 Code"; Rec."Global Dimension 7 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = All;
                }
                field("Narrative of Problem"; Rec."Narrative of Problem")
                {
                    ApplicationArea = All;
                }
                field("Driver No.:"; Rec."Phone No 1.")
                {
                    caption = 'Driver Phone No. 1';
                    ApplicationArea = All;
                }
                field("Contact No.:"; Rec."Phone No. 2.")
                {
                    caption = 'Driver Phone No. 2';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Job Card No"; Rec."Job Card No")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Technician; Rec.Technician)
                {
                    ApplicationArea = All;
                    Caption = 'Engineer';
                    Visible = false;
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("ECP No."; Rec."ECP No.")
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    var
                        ECP: Page ECP;
                        ECPrec: Record "ECP Header";
                    begin
                        ECPrec.Reset();
                        rec.CalcFields("ECP No.");
                        ECPrec.SetFilter(ECPrec."Doc. No.", '%1', rec."ECP No.");
                        if ECPrec.FindFirst() then begin
                            ECP.SetTableView(ECPrec);
                            ECP.Run();
                        end

                    end;
                }
                field(Status; Rec.Status)
                {

                }
            }
            group(Details)
            {
                Caption = 'Details';
                field("Date of Failure"; Rec."Date of Failure")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Failure Location"; Rec."Failure Location")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("NEW_TACOMETER KM Od. Rdng"; Rec."NEW_TACOMETER KM Od. Rdng")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Tacomter Reset"; Rec."Tacomter Reset")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("KM Odometer Reading"; Rec."KM Odometer Reading")
                {
                    ApplicationArea = All;
                }
                field("Curr. KM Service/PM Service"; Rec."Curr. KM Service/PM Service")
                {
                    editable = false;
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        PREFServ := 1000;
                        IF Rec."Curr. KM Service/PM Service" < Rec."KM Odometer Reading" - PREFServ THEN
                            ERROR('You cannot Service This Vehicle until it has Reacehed the Preferred Odometer Service KM, Pick a Service type close to the Odometer')
                        ELSE
                            IF Rec."Curr. KM Service/PM Service" > Rec."KM Odometer Reading" + PREFServ THEN
                                ERROR('You cannot Service This Vehicle if it has passed the Preferred Odometer Service KM, Pick a Service type close to the Odometer');
                    end;
                }
                field("Last KM Odometer Reading"; Rec."Last KM Odometer Reading")
                {
                    Enabled = false;
                    Style = Attention;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
                field("Last Service KM  Reading"; Rec."Last Service KM  Reading")
                {
                    Enabled = false;
                    Style = Attention;
                    StyleExpr = TRUE;
                    ApplicationArea = All;

                }
                field("Hours Run"; Rec."Hours Run")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Vehicle Reporting Date"; Rec."Vehicle Reporting Date")
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Vehicle Reporting Time"; Rec."Vehicle Reporting Time")
                {
                    ApplicationArea = All;
                    editable = false;

                }
                field("Vehicle In at LM Date"; Rec."Vehicle In at LM Date")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Vehicle In at LM Time"; Rec."Vehicle In at LM Time")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Date in Service"; Rec."Date in Service")
                {
                    ApplicationArea = All;
                }
                field("Warranty Status"; Rec."Warranty Status")
                {
                    ApplicationArea = All;
                }
                field("Aggregate 1 Description"; Rec."Aggregate 1 Description")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Aggregate 1 Serial Number"; Rec."Aggregate 1 Serial Number")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Aggregate 2 Description"; Rec."Aggregate 2 Description")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Aggregate 2 Serial Number"; Rec."Aggregate 2 Serial Number")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Aggregate 3 Description"; Rec."Aggregate 3 Description")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Aggregate 3 Serial Number"; Rec."Aggregate 3 Serial Number")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Aggregate 4 Description"; Rec."Aggregate 4 Description")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Aggregate 4 Serial Number"; Rec."Aggregate 4 Serial Number")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Aggregate 5 Description"; Rec."Aggregate 5 Description")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Aggregate 5 Serial Number"; Rec."Aggregate 5 Serial Number")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
            }
            group(Others)
            {
                Caption = 'Vehicle Details';
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Vehicle Registr. Plate No."; Rec."Vehicle Registr. Plate No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("NOVATRACK ID"; Rec."NOVATRACK ID")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Vehicle/Equipment Make"; Rec."Vehicle/Equipment Make")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Vehicle/Equipment Model"; Rec."Vehicle/Equipment Model")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Engine Serial Number"; Rec."Engine Serial Number")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Chassis No."; Rec."Chassis No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Engine Make"; Rec."Engine Make")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Engine Model"; Rec."Engine Model")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Acquistion Date"; Rec."Acquistion Date")
                {
                    ApplicationArea = All;
                }
                /*
                field("Customer Waybill No"; "Customer Waybill No")
                {
                    Visible = false;
                ApplicationArea = All;}
                field("Customer Identification No"; "Customer Identification No")
                {
                ApplicationArea = All;}
                field("Transmission Serial Number"; "Transmission Serial Number")
                {
                ApplicationArea = All;}
                field("Transmission Model"; "Transmission Model")
                {
                ApplicationArea = All;}
                field("Pre Paid Receipt No"; "Pre Paid Receipt No")
                {

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        PostedVoucherHead.SETRANGE(PostedVoucherHead."Voucher Type", PostedVoucherHead."Voucher Type"::CRV);
                        IF PAGE.RUNMODAL(50011, PostedVoucherHead) = ACTION::LookupOK THEN BEGIN
                            "Pre Paid Receipt No" := PostedVoucherHead."No.";
                            "Pre Paid Amount" := PostedVoucherHead.Amount;
                        END;
                    end;
                ApplicationArea = All;}
                field("Pre Paid Amount"; "Pre Paid Amount")
                {
                    Editable = false;
                ApplicationArea = All;}
                field("Vehicle Accessories at In 1"; "Vehicle Accessories at In 1")
                {
                ApplicationArea = All;}
                field("Vehicle Accessories at In 2"; "Vehicle Accessories at In 2")
                {
                ApplicationArea = All;}
                field("Vehicle Accessories at In 3"; "Vehicle Accessories at In 3")
                {
                    Visible = false;
                ApplicationArea = All;}
                field("Vehicle Accessories at In 4"; "Vehicle Accessories at In 4")
                {
                    Visible = false;
                ApplicationArea = All;}
                field("Vehicle Accessories at In 5"; "Vehicle Accessories at In 5")
                {
                    Visible = false;
                ApplicationArea = All;}
                field("Vehicle Accessories at In 6"; "Vehicle Accessories at In 6")
                {
                    Visible = false;
                ApplicationArea = All;}
                field("Vehicle Accessories at In 7"; "Vehicle Accessories at In 7")
                {
                ApplicationArea = All;}
                field("Vehicle Accessories at In 8"; "Vehicle Accessories at In 8")
                {
                    Visible = false;
                ApplicationArea = All;}
                field("Vehicle Accessories at In 9"; "Vehicle Accessories at In 9")
                {
                    Visible = false;
                ApplicationArea = All;}
                field("Vehicle Accessories at In 10"; "Vehicle Accessories at In 10")
                {
                    Visible = false;
                ApplicationArea = All;}
                */
                field("Registration by"; Rec."Registration by")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Serviced; Rec.Serviced)
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Created Date"; Rec."Created Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                Visible = false;

                field("Send To"; Rec."Send To")
                {
                    ApplicationArea = All;
                }
                field("Send For Approval"; Rec."Send For Approval")
                {
                    ApplicationArea = All;
                }
                field(Sender; Rec.Sender)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Sent Date"; Rec."Sent Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Approve/Reject"; Rec."Approve/Reject")
                {
                    ApplicationArea = All;
                }
                field("Approved By"; Rec."Approved By")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Approval Date"; Rec."Approval Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

            }

            group("Vehicle Problem Reporting Checklist")
            {
                Visible = false;
                group("Engine & Performance")
                {
                    field("Engine won't start"; Rec."Engine won't start")
                    {
                        ApplicationArea = All;

                    }

                    field("Engine overheating"; Rec."Engine overheating")
                    {
                        ApplicationArea = All;
                    }

                    field("Engine misfiring or rough idling"; Rec."Engine misfiring or rough idling")
                    {
                        ApplicationArea = All;
                    }

                    field("Unusual engine noise (knocking, ticking)"; Rec."Unusual engine noise (knocking, ticking)")
                    {
                        ApplicationArea = All;
                    }

                    field("Reduced engine power"; Rec."Reduced engine power")
                    {
                        ApplicationArea = All;
                    }

                    field("Check Engine light is on"; Rec."Check Engine light is on")
                    {
                        ApplicationArea = All;
                    }


                }

                group("Battery & Electrical")
                {
                    field("Battery won't hold charge"; Rec."Battery won't hold charge")
                    {
                        ApplicationArea = All;
                    }

                    field("vehicle won't start due to battery"; Rec."vehicle won't start due to battery")
                    {
                        ApplicationArea = All;
                    }

                    field("	Electrical components not working (radio, lights, etc.)"; Rec."Electrical Issues")
                    {
                        ApplicationArea = All;
                    }

                    field("Dashboard lights flickering"; Rec."Dashboard lights flickering")
                    {
                        ApplicationArea = All;
                    }

                    field("Alternator issue"; Rec."Alternator issue")
                    {
                        ApplicationArea = All;
                    }
                }

                group("Fluids & Leaks")
                {
                    field("Oil leak under vehicle"; Rec."Oil leak under vehicle")
                    {
                        ApplicationArea = All;
                    }

                    field("Coolant leak"; Rec."Coolant leak")
                    {
                        ApplicationArea = All;
                    }

                    field("Fuel leak/smell"; Rec."Fuel leak/smell")
                    {
                        ApplicationArea = All;
                    }

                    field("Low oil level"; Rec."Low oil level")
                    {
                        ApplicationArea = All;
                    }

                    field("Transmission fluid leak"; Rec."Transmission fluid leak")
                    {
                        ApplicationArea = All;
                    }

                    field("Brake fluid leak"; Rec."Brake fluid leak")
                    {
                        ApplicationArea = All;
                    }


                }

                group(Brakes)
                {
                    field("Squeaking or grinding noise when braking"; Rec."Squeaking or grinding noise when braking")
                    {
                        ApplicationArea = All;
                    }

                    field("Vehicle pulls to one side while braking"; Rec."Vehicle pulls to one side while braking")
                    {
                        ApplicationArea = All;
                    }

                    field("Brake pedal feels soft or spongy"; Rec."Brake pedal feels soft or spongy")
                    {
                        ApplicationArea = All;
                    }

                    field("ABS warning light is on"; Rec."ABS warning light is on")
                    {
                        ApplicationArea = All;
                    }

                    field("Reduced braking performance"; Rec."Reduced braking performance")
                    {
                        ApplicationArea = All;
                    }
                }

                group("Exhaust System")
                {
                    field("Loud exhaust noise"; Rec."Loud exhaust noise")
                    {
                        ApplicationArea = All;
                    }

                    field("Excess smoke from exhaust"; Rec."Excess smoke from exhaust")
                    {
                        ApplicationArea = All;
                    }

                    field("Exhaust smell inside the vehicle"; Rec."Exhaust smell inside the vehicle")
                    {
                        ApplicationArea = All;
                    }
                }

                group("Tires & Wheels")
                {
                    field("Flat tire"; Rec."Flat tire")
                    {
                        ApplicationArea = All;
                    }
                    field("Uneven tire wear"; Rec."Uneven tire wear")
                    {
                        ApplicationArea = All;
                    }

                    field("Tire pressure warning light on"; Rec."Tire pressure warning light on")
                    {
                        ApplicationArea = All;
                    }

                    field("Steering wheel vibration"; Rec."Steering wheel vibration")
                    {
                        ApplicationArea = All;
                    }

                    field("Wheel alignment issue"; Rec."Wheel alignment issue")
                    {
                        ApplicationArea = All;
                    }
                }


                group("Transmission & Gearbox")
                {
                    field("Difficulty shifting gears"; Rec."Difficulty shifting gears")
                    {
                        ApplicationArea = All;
                    }

                    field("Gear slipping"; Rec."Gear slipping")
                    {
                        ApplicationArea = All;
                    }

                    field("Unusual noise from transmission"; Rec."Unusual noise from transmission")
                    {
                        ApplicationArea = All;
                    }

                    field("Transmission fluid leaks"; Rec."Transmission fluid leaks")
                    {
                        ApplicationArea = All;
                    }
                }

                group("Lights & Indicators")
                {
                    field("Headlights not working"; Rec."Headlights not working")
                    {
                        ApplicationArea = All;
                    }

                    field("Brake lights not working"; Rec."Brake lights not working")
                    {
                        ApplicationArea = All;
                    }

                    field("Turn signals not working"; Rec."Turn signals not working")
                    {
                        ApplicationArea = All;
                    }

                    field("Dashboard warning lights on"; Rec."Dashboard warning lights on")
                    {
                        ApplicationArea = All;
                    }
                }

                group("Cooling & AC")
                {
                    field("Air conditioning not cooling"; Rec."Air conditioning not cooling")
                    {
                        ApplicationArea = All;
                    }

                    field("Heater not working"; Rec."Heater not working")
                    {
                        ApplicationArea = All;
                    }

                    field("Strange odor from vents"; Rec."Strange odor from vents")
                    {
                        ApplicationArea = All;
                    }

                    field("Fan not working"; Rec."Fan not working")
                    {
                        ApplicationArea = All;
                    }
                }
                group("Windows, Doors & Mirrors")
                {
                    field("Power windows not working"; Rec."Power windows not working")
                    {
                        ApplicationArea = All;
                    }

                    field("Doors won’t lock/unlock properly"; Rec."Doors won’t lock/unlock properly")
                    {
                        ApplicationArea = All;
                    }

                    field("Side/rear-view mirror damaged"; Rec."Side/rear-view mirror damaged")
                    {
                        ApplicationArea = All;
                        visible = Rec."Side/rear-view mirror damaged";
                    }

                    field("  Windshield wipers not functioning"; Rec."Windshield wipers not functioning")
                    {
                        ApplicationArea = All;
                    }
                }
                group("Interior & Comfort")
                {
                    field("Seat belt not functioning"; Rec."Seat belt not functioning")
                    {
                        ApplicationArea = All;
                    }

                    field("Strange noise inside cabin"; Rec."Strange noise inside cabin")
                    {
                        ApplicationArea = All;
                    }

                    field("Unusual vibration inside vehicle"; Rec."Unusual vibration inside vehicle")
                    {
                        ApplicationArea = All;
                    }

                    field("•Driver seat adjustment not working"; Rec."•Driver seat adjustment not working")
                    {
                        ApplicationArea = All;
                    }
                }
                group("Load & Suspension")
                {
                    field("Suspension feels bouncy or stiff"; Rec."Suspension feels bouncy or stiff")
                    {
                        ApplicationArea = All;
                    }

                    field("Vehicle tilts to one side"; Rec."Vehicle tilts to one side")
                    {
                        ApplicationArea = All;
                    }
                }

                group("Security & Miscellaneous")
                {
                    field("Alarm not working"; Rec."Alarm not working")
                    {
                        ApplicationArea = All;
                    }

                    field("Vehicle won’t start due to immobilizer"; Rec."Vehicle won’t start due to immobilizer")
                    {
                        ApplicationArea = All;
                    }

                    field("Unusual smells inside the car"; Rec."Unusual smells inside the car")
                    {
                        ApplicationArea = All;
                    }

                    field("Other (please specify)"; Rec."Other (please specify)")
                    {
                        ApplicationArea = All;
                        MultiLine = true;
                    }
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(80011), "No." = FIELD("Registration ID");
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(Dimensions)
            {
                ApplicationArea = All;
                Caption = 'Dimensions';
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Process;
                // PromotedIsBig = true;
                ShortCutKey = 'Shift+Ctrl+D';

                trigger OnAction()
                begin
                    Rec.ShowDocDim;
                end;
            }
        }
        area(processing)
        {
            action("<Action1000000030>")
            {
                Caption = 'Create Job Card';
                Visible = false;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    IF Rec."Job Card No" <> '' THEN
                        ERROR('Job Card No: %1 has already been created!', Rec."Job Card No");

                    JobRec.INIT;
                    JobRec.VALIDATE("Bill-to Customer No.", Rec."Customer Bill to Code");
                    JobRec."Global Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";
                    JobRec."Global Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                    UserSetup.GET(USERID);
                    JobRec."Job Posting Group" := Rec."Job Posting Group";
                    JobRec."Creation Date" := TODAY;
                    JobRec.VALIDATE("Registration Card Ref", Rec."Registration ID");
                    JobRec.INSERT(TRUE);

                    JobTaskRec.INIT;
                    JobTaskRec."Job No." := JobRec."No.";
                    JobTaskRec."Job Task No." := JobRec."No.";
                    JobTaskRec.INSERT(TRUE);

                    VehicleReg.SETRANGE(VehicleReg."Registration ID", Rec."Registration ID");
                    IF VehicleReg.FINDFIRST THEN BEGIN
                        VehicleReg."Job Card No" := JobRec."No.";
                        VehicleReg.MODIFY;
                    END;

                    MESSAGE('Job Card No: %1 has been created!', JobRec."No.");
                end;
            }
            action("<Action1000000032>")
            {
                Caption = 'View Job Card';
                Image = Job;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Job Card";
                RunPageLink = "No." = FIELD("Job Card No");

                trigger OnAction()
                begin
                    IF JobRec2.GET(Rec."Job Card No") THEN
                        PAGE.RUN(PAGE::"Job Card", JobRec2);
                end;
            }
            action("Create ECP")
            {
                Caption = 'Create ECP';
                Image = CreateDocument;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ECP: Record "ECP Header";
                    // NOSeries: Codeunit NoSeriesManagement;
                    NOSeries: Codeunit "No. Series";
                    DocNo: Code[20];
                    GLSetup: Record "General Ledger Setup";
                    ECPPage: Page ECP;
                    Ecprec: Record "ECP Header";
                    jobSetup: Record "Jobs Setup";
                begin
                    rec.TestField("Shortcut Dimension 1 Code");
                    //  rec.TestField("Shortcut Dimension 2 Code");
                    //  rec.TestField("Shortcut dimension 3");
                    //  rec.TestField("Shortcut Dimension 4 Code");
                    rec.TestField("Shortcut Dimension 5 Code");
                    rec.TestField("Shortcut Dimension 6 Code");
                    rec.TestField("Shortcut Dimension 8 Code");
                    rec.CalcFields("ECP No.");
                    if rec."ECP No." <> '' then
                        Error('An ECP Document %1 already exist for this record', rec."ECP No.");
                    DocNo := '';
                    jobSetup.Get();
                    jobSetup.TestField("ECP No.");
                    DocNo := NOSeries.GetNextNo(jobSetup."ECP No.", Today, true);
                    ECP.Init();
                    ECP."Doc. No." := DocNo;
                    ECP."Vehicle Registration No." := rec."Registration ID";
                    ECP."No." := rec."FLeet No.";
                    Ecp.Odometer := Rec."KM Odometer Reading";
                    ECP.Date := Today;
                    ecp."Staff No" := UserId;
                    ECP."Time In" := Time;
                    ECP.Insert();
                    Ecprec.Reset();
                    Ecprec.SetFilter("Doc. No.", '%1', DocNo);
                    if Ecprec.FindFirst() then begin
                        ECPPage.SetRecord(Ecprec);
                        ECPPage.Run();
                    end

                end;
            }
            action("Create Estimate")
            {
                Caption = 'Create Estimate';
                Image = CreateDocument;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;


                trigger OnAction()
                begin
                    rec.CalcFields("ECP No.");
                    if rec."ECP No." = '' then
                        Error('ECP Document must be created');

                    Rec.TESTFIELD("Responsibility Center");
                    Rec.TESTFIELD("Vehicle Reporting Date");
                    Rec.TESTFIELD("Vehicle Reporting Time");
                    Rec.TESTFIELD("Job Type Code");
                    // TESTFIELD("KM Odometer Reading");//REM WHEN PM READY
                    Rec.TESTFIELD("Shortcut Dimension 1 Code");
                    //  Rec.TESTFIELD("Shortcut Dimension 2 Code");
                    //  Rec.TESTFIELD("Shortcut dimension 3");
                    //  Rec.TESTFIELD("Shortcut Dimension 4 Code");
                    Rec.TESTFIELD("Shortcut Dimension 5 Code");
                    Rec.TESTFIELD("Shortcut Dimension 6 Code");
                    Rec.TESTFIELD("Shortcut Dimension 8 Code");

                    IF Rec."Phone No 1." = '' THEN
                        ERROR('Update the Driver phone no or Conatact person No')
                    ELSE
                        //to remove while When service App starts
                        //to stop using this card for PM.
                        ///  IF ("Job Type" = "Job Type"::PrevMaint) OR ("Job Type" = "Job Type"::"KM Service") THEN
                        ///   ERROR(' You can not Do PM/KM Service from this Page, Please use the Vehicle Regitration (Prevent. Maint.) Card on your system');


                        ////IF ("Job Type Code" = 'PM-LEASING') OR ("Job Type Code" = 'PM') THEN
                        /// ERROR(' You can not Do %1 Service from this Page, Please use the PM-LEASING or PM OPTION on your system', "Job Type Code");
                        //Dennis

                        IF Rec."Customer Type" = Rec."Customer Type"::"Lease Operation"
                        THEN BEGIN
                            Rec.TESTFIELD("Shortcut Dimension 4 Code");
                            //TESTFIELD("Truck BreakDown No.");
                            //VALIDATE("Expense Job",TRUE);  //DD hold on
                        END;


                    //IF "Phone No. 2."='' THEN
                    //ERROR('Update the Driver phone no or Conatact person No');

                    //RELEASE WHN READY TO USE PREVENTIVE MAINTANACE
                    IF (Rec."Job Type" = Rec."Job Type"::"KM Service") OR (Rec."Job Type" = Rec."Job Type"::PrevMaint) THEN BEGIN
                        Rec.TESTFIELD("Curr. KM Service/PM Service");
                    END;


                    IF Rec."Job Type Code" = 'Lease Operation' THEN BEGIN
                        IF Rec."Vehicle code" = '' THEN
                            ERROR('Please Put a VEHICLE CODE for This Job Before Converting to Operation Leasing Order or Contact MIS for Update');
                        Rec.TESTFIELD("Truck BreakDown No.");

                    END;

                    //USED TO STOP HAVING MORE THAN ONE JOB CARD OPENED FOR A TRUCK AT THE SAME TIME  //ddada
                    JobRec.RESET;
                    JobRec.SETRANGE(JobRec."Vehicle Registr. Plate No", Rec."Service Item");
                    ////JobRec.SETFILTER(JobRec.Status, '%1', JobRec.Status::Order); Dennis
                    //JobRec.SETFILTER(JobRec."Job Type",'%1',"Job Type"::Repair);
                    JobRec.SETFILTER(JobRec."Job Type", '<>%1|<>%2', Rec."Job Type"::"KM Service", Rec."Job Type"::PrevMaint);
                    ///JobRec.SETFILTER(JobRec."Creation Date",'>%1',040116D);
                    //JobRec.CALCFIELDS(JobRec."Invoice Exist", JobRec."WIP Amount");
                    //JobRec.SETFILTER(JobRec."WIP Amount",'<>%1',0);
                    JobRec.SETRANGE(JobRec."Invoice Exist", FALSE);
                    IF JobRec.FIND('-') THEN
                        ERROR('There are still some pending job Cards for Truck: %1, yet to be invoiced. Check Job No.: %2; created: %3. Contact your adminsitator.',
                        JobRec."Vehicle Registr. Plate No", JobRec."No.", JobRec."Creation Date");



                    IF Rec."Job Card No" <> '' THEN ERROR('Service Quote Has Already Been Created For Vehicle Registration %1', Rec."Registration ID");
                    IF NOT CONFIRM('Are you sure you want to convert document %1 into a Service Quote', FALSE, Rec."Registration ID") THEN EXIT;
                    ServiceHeader.INIT;
                    ServiceHeader."Document Type" := ServiceHeader."Document Type"::Quote;
                    ServiceHeader."No." := '';
                    ServiceHeader."Registration No." := Rec."Vehicle Registr. Plate No.";
                    ServiceHeader."Chassis No." := Rec."Chassis No.";
                    ServiceHeader."Engine No." := Rec."Engine Serial Number";
                    ServiceHeader."Job Type" := Rec."Job Type";


                    //ServiceHeader."Customer Type" := "Customer Type";
                    ServiceHeader."Engine No." := Rec."Engine Serial Number";
                    ServiceHeader."Vehicle Make" := Rec."Vehicle/Equipment Make";
                    ServiceHeader."Vehicle Model" := Rec."Vehicle/Equipment Model";
                    //ServiceHeader.VALIDATE("Customer No.","Customer Bill to Code");
                    ServiceHeader."Customer No." := Rec."Customer Bill to Code";
                    ServiceHeader."Assigned User ID" := USERID;
                    ServiceHeader."KM Run" := Rec."KM Run";
                    ServiceHeader.VALIDATE("Order Date", WORKDATE);
                    ServiceHeader.VALIDATE("Posting Date", WORKDATE);
                    ServiceHeader."Customer Type" := Rec."Customer Type";
                    // ServiceHeader."Buisness Type" := "Buisness Type";Dennis
                    ServiceHeader."NOVATRACK ID" := Rec."NOVATRACK ID";
                    ServiceHeader.Description := Rec."Narrative of Problem";
                    ServiceHeader."Curr. KM Service/PM Service" := Rec."Curr. KM Service/PM Service";
                    ServiceHeader."KM Odometer Reading" := Rec."KM Odometer Reading";
                    ServiceHeader."Phone No 1." := Rec."Phone No 1.";
                    ServiceHeader."Phone No. 2." := Rec."Phone No. 2.";
                    ServiceHeader."FLeet No." := Rec."FLeet No.";
                    ServiceHeader."Acquistion Date" := Rec."Acquistion Date";
                    ServiceHeader."Job Type Code" := Rec."Job Type Code";
                    ServiceHeader."Service Vehicle" := Rec."Service Item";
                    ServiceHeader.Trailer := Rec.Trailer;
                    ServiceHeader."Trailer No" := rec."Trailer No.";
                    ServiceHeader."ECP No." := rec."ECP No.";
                    ServiceHeader."Vehicle Reg No." := rec."Registration ID";
                    //ServiceHeader."Responsibility Center" := "Responsibility Center";
                    //ServiceHeader.Validate("Responsibility Center", rec."Responsibility Center");
                    ServiceHeader."Shortcut Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";

                    //ServiceHeader."Truck BreakDown No.":="Truck BreakDown No.";
                    ServiceHeader.VALIDATE(ServiceHeader."Truck BreakDown No.", Rec."Truck BreakDown No.");            //ddada
                    ServiceHeader.VALIDATE(ServiceHeader."Fleet Manager", Rec."Fleet Manager");
                    ServiceHeader."Quote No." := Rec."Registration ID";
                    ServiceHeader.VALIDATE("Customer Job Type", Rec."Customer Job Type");
                    ServiceHeader.VALIDATE("Job Type Code", Rec."Job Type Code");
                    ServiceHeader.VALIDATE("Job Posting Group", Rec."Job Posting Group");
                    //ServiceHeader.VALIDATE("Responsibility Center", "Responsibility Center");
                    ServiceHeader.VALIDATE("Shortcut Dimension 1 Code", Rec."Shortcut Dimension 1 Code");
                    ServiceHeader.VALIDATE("Shortcut Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
                    ServiceHeader.VALIDATE("Shortcut dimension 3", Rec."Shortcut dimension 3");
                    ServiceHeader.VALIDATE("Shortcut dimension 4", Rec."Shortcut Dimension 4 Code");
                    ServiceHeader.VALIDATE("Shortcut dimension 5 Code", Rec."Shortcut Dimension 5 Code");
                    ServiceHeader.VALIDATE("Shortcut dimension 6 Code", Rec."Shortcut Dimension 6 Code");
                    ServiceHeader.Validate("Shortcut Dimension 8 Code", Rec."Shortcut Dimension 8 Code");
                    /* ServiceHeader.VALIDATE("Shortcut dimension 7", "Shortcut Dimension 7 Code");
                     ServiceHeader.VALIDATE("Shortcut dimension 8", "Shortcut Dimension 8 Code");
                     */
                    //ServiceHeader.Validate("Location Code", "Location Code");
                    //ServiceHeader."Responsibility Center"
                    ServiceHeader."Responsibility Center" := rec."Responsibility Center";
                    ServiceHeader.validate("Location Code", rec."Location Code");

                    ServiceHeader.INSERT(TRUE);

                    IF ServiceHeader."Customer No." <> '' THEN BEGIN
                        ServiceHeader.VALIDATE("Customer No.");
                        ServiceHeader.Validate("Bill-to Customer No.");
                        ServiceHeader."Responsibility Center" := rec."Responsibility Center";
                        ServiceHeader."Location Code" := rec."Location Code";
                        ServiceHeader.MODIFY;
                    END;





                    //RBS
                    ServiceHeader2.SETRANGE(ServiceHeader2."Document Type", ServiceHeader2."Document Type"::Quote);
                    ServiceHeader2.SETRANGE(ServiceHeader2."No.", ServiceHeader."No.");
                    IF ServiceHeader2.FIND('-') THEN BEGIN
                        IF Rec."Bill to Account No." <> '' THEN BEGIN
                            ServiceHeader2.VALIDATE("Bill-to Customer No.", Rec."Bill to Account No.");
                            ServiceHeader2.VALIDATE("Shortcut Dimension 1 Code", Rec."Shortcut Dimension 1 Code");
                            ServiceHeader2.VALIDATE("Shortcut Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
                            ServiceHeader2.VALIDATE("Shortcut dimension 3", Rec."Shortcut dimension 3");
                            ServiceHeader2.VALIDATE("Shortcut dimension 4", Rec."Shortcut Dimension 4 Code");
                            ServiceHeader2.VALIDATE("Shortcut dimension 5 Code", Rec."Shortcut Dimension 5 Code");
                            ServiceHeader2.VALIDATE("Shortcut dimension 6 Code", Rec."Shortcut Dimension 6 Code");
                            ServiceHeader2.Validate("Shortcut Dimension 8 Code", rec."Shortcut Dimension 8 Code");
                            IF ServiceHeader2."Job Type Code" = 'FM RETAIL (NBC)' THEN
                                ServiceHeader2.VALIDATE("Customer Price Group", 'FM-NBC');
                            ServiceHeader2.MODIFY;
                        END;

                    END;

                    //
                    if Rec."Job Type" <> Rec."Job Type"::PrevMaint then begin

                        ServiceLine.INIT;
                        ServiceLine."Document Type" := ServiceLine."Document Type"::Quote;
                        ServiceLine."Document No." := ServiceHeader."No.";
                        ServiceLine."Line No." := 10000;
                        ServiceLine.VALIDATE("Service Item No.", Rec."Service Item");

                        ServiceLine.INSERT(TRUE);
                    end else begin

                        ServiceLine.INIT;
                        ServiceLine."Document Type" := ServiceLine."Document Type"::Quote;
                        ServiceLine."Document No." := ServiceHeader."No.";
                        ServiceLine."Line No." := 10000;
                        ServiceLine.VALIDATE("Service Item No.", Rec."Service Item");
                        // Message('This is', '%1', Rec."Service Item");
                        ServiceLine.Validate("Service Item No.2", Rec."Service Item");
                        ServiceLine.INSERT(TRUE);

                    end;



                    VehicleReg.SETRANGE(VehicleReg."Registration ID", Rec."Registration ID");
                    IF VehicleReg.FINDFIRST THEN BEGIN
                        VehicleReg."Job Card No" := ServiceHeader."No.";//JobRec."No.";
                        VehicleReg.MODIFY;
                        VehicleReg.RESET;
                    END;
                    /*
                                        DailyTAT.SETRANGE(DailyTAT."No.", "Truck BreakDown No.");
                                        IF DailyTAT.FINDFIRST THEN BEGIN
                                            DailyTAT."Job No." := "Truck BreakDown No.";
                                            MESSAGE('Daily TAT Morning Page updated.');
                                        END;
                    */
                    Rec."Registration by" := USERID;
                    Rec."Registration Date" := TODAY;

                    MESSAGE('%1 converted into Quote %2', Rec."Registration ID", ServiceHeader."No.");
                    CurrPage.Update();
                    //..... Tolu 5/10/23
                    ServiceHeader.SetFilter("No.", '%1', ServiceHeader."No.");

                    if ServiceHeader.FindFirst() then
                        page.Run(Page::"Service Quote - External", ServiceHeader);
                end;
                //..... Tolu 5/10/23
                // end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        EnableCustomerJobControl;

        if Rec."Job Card No" <> '' then begin
            CurrPage.Editable(false);
            CurrPage.Update();
        end;
    end;

    trigger OnClosePage()
    begin
        //TESTFIELD("Job Type");
        //TESTFIELD("Customer Ship to Code");
    end;

    trigger OnInit()
    begin
        InterJobTypeEnable := TRUE;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        //"Registration by" := USERID;
        //"Registration Date":=TODAY;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        //TESTFIELD("Customer Type");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        EnableCustomerJobControl;
        Rec."Registration by" := USERID;
        Rec."Registration Date" := TODAY;
    end;

    trigger OnOpenPage()
    begin
        begin
            //  rec.SetFilter("Created By", '%1', UserId);
        end;
        IF UserMgt.GetPurchasesFilter <> '' THEN BEGIN
            Rec.FILTERGROUP(2);
            Rec.SETRANGE("Responsibility Center", UserMgt.GetPurchasesFilter);
            Rec.FILTERGROUP(0);
        END;
        if Rec."Job Type" = Rec."Job Type"::PrevMaint then
            ShowPrev := true
        else
            ShowPrev := false;
        if Rec."Job Card No" <> '' then begin
            CurrPage.Editable(false);
            CurrPage.Update();
        end;
        //CurrPage.Update();


    end;



    var
        PostedVoucherHead: Record "Posted Voucher Header";
        JobRec: Record Job;
        JobRecChk: Record Job;
        JobTaskRec: Record "Job Task";
        UserSetup: Record "User Setup";
        JobRec2: Record Job;
        VehicleReg: Record "Vehicle Registration";
        ServiceHeader: Record "Service Header";
        ServiceLine: Record "Service Item Line";
        UserMgt: Codeunit "User Setup Management";
        //  [InDataSet]
        InterJobTypeEnable: Boolean;
        ServiceHeader2: Record "Service Header";
        PREFServ: Decimal;
        ShowPrev: Boolean;

        ServQterec: Record "Service Header";

        ServQtlistrec: Page "Service Quote - External";


    local procedure EnableCustomerJobControl()
    begin
        InterJobTypeEnable := Rec."Customer Job Type." = Rec."Customer Job Type."::Internal;
    end;
}

