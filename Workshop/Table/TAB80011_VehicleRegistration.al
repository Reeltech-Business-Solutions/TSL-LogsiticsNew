table 80011 "Vehicle Registration"
{
    DrillDownPageID = "Vehicle Registration List";
    LookupPageID = "Vehicle Registration List";

    fields
    {
        field(1; "Registration ID"; Code[50])
        {

            trigger OnValidate()
            var
                JobSetup: Record "Jobs Setup";
            begin
                IF "Registration ID" <> xRec."Registration ID" THEN BEGIN
                    JobSetup.GET;
                    NoSeries.TestManual(JobSetup."Registaration ID");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Customer Bill to Code"; Code[20])
        {
            TableRelation = Customer;
            /*
            TableRelation = IF ("Customer Type" = CONST(Internal)) Customer WHERE("Customer Category" = FILTER(Internal)) ELSE
            IF ("Customer Type" = CONST(External)) Customer WHERE("Customer Category" = FILTER(External)) ELSE
            IF ("Customer Type" = CONST("Lease Operation")) Customer WHERE("Customer Category" = FILTER("Lease Operation")) ELSE
            IF ("Customer Type" = CONST(Warranty)) Customer WHERE("Customer Category" = FILTER(Warranty));
*/
            trigger OnValidate()
            var
                CustRec: Record Customer;
            begin
                IF CustRec.GET("Customer Bill to Code") THEN BEGIN
                    "Customer Bill to Name" := CustRec.Name;
                    "Customer Bill to Address" := CustRec.Address;
                END;
            end;
        }
        field(3; "Customer Ship to Code"; Code[20])
        {

            trigger OnValidate()
            var
                CustRec: Record Customer;
            begin
                IF CustRec.GET("Customer Ship to Code") THEN BEGIN
                    "Customer Ship to Name" := CustRec.Name;
                    "Customer Ship to Address" := CustRec.Address;
                END;
            end;
        }
        field(4; "Customer Bill to Name"; Text[50])
        {
        }
        field(5; "Customer Ship to Name"; Text[50])
        {
        }
        field(6; "Customer Bill to Address"; Text[50])
        {
        }
        field(7; "Customer Ship to Address"; Text[50])
        {
        }
        field(8; "Contact Person Name"; Text[30])
        {
        }
        field(9; "Contact Person Designation"; Text[30])
        {
        }
        field(10; "Contact Person Telephone"; Code[20])
        {
        }
        field(11; "Contact Person Mobile Number"; Code[20])
        {
        }
        field(12; "Customer Contact email"; Text[50])
        {
        }
        field(13; "Vehicle Registr. Plate No."; Code[50])
        {
        }
        field(14; "Customer Identification No"; Code[20])
        {
        }
        field(15; "Vehicle/Equipment Make"; Code[50])
        {
            TableRelation = "Vehicle Make";
        }
        field(16; "Vehicle/Equipment Model"; Code[50])
        {
            TableRelation = "Vehicle Model" where("Vehicle Make" = field("Vehicle/Equipment Make"));
        }
        field(17; "Date in Service"; Date)
        {
        }
        field(18; "Warranty Status"; Option)
        {
            OptionCaption = ' ,Warranty,Outside Warranty';
            OptionMembers = " ",Warranty,"Outside Warranty";
        }
        field(19; "Engine Serial Number"; Code[20])
        {
        }
        field(20; "Engine Make"; Code[20])
        {
        }
        field(21; "Engine Model"; Code[20])
        {
        }
        field(22; "Transmission Serial Number"; Code[20])
        {
        }
        field(23; "Transmission Model"; Code[20])
        {
        }
        field(24; "Aggregate 1 Description"; Text[30])
        {
        }
        field(25; "Aggregate 1 Serial Number"; Code[20])
        {
        }
        field(26; "Aggregate 2 Description"; Text[30])
        {
        }
        field(27; "Aggregate 2 Serial Number"; Code[20])
        {
        }
        field(28; "Aggregate 3 Description"; Text[30])
        {
        }
        field(29; "Aggregate 3 Serial Number"; Code[20])
        {
        }
        field(30; "Aggregate 4 Description"; Text[30])
        {
        }
        field(31; "Aggregate 4 Serial Number"; Code[20])
        {
        }
        field(32; "Aggregate 5 Description"; Text[30])
        {
        }
        field(33; "Aggregate 5 Serial Number"; Code[20])
        {
        }
        field(34; "Date of Failure"; Date)
        {
        }
        field(35; "Failure Location"; Text[30])
        {
            TableRelation = Location;
        }
        field(36; "Narrative of Problem"; Text[1024])
        {
        }
        field(37; "KM Run"; Code[20])
        {
        }
        field(38; "Hours Run"; Integer)
        {
        }
        field(39; "Vehicle Reporting Date"; Date)
        {

            trigger OnValidate()
            begin
                TESTFIELD("Date of Failure");
                IF "Vehicle Reporting Date" < "Date of Failure" THEN
                    ERROR('Vehicle Reporting Date cannot be ealier than the Date of Failure!');
            end;
        }
        field(40; "Vehicle Reporting Time"; Time)
        {
        }
        field(41; "Vehicle In at LM Date"; Date)
        {

            trigger OnValidate()
            begin
                TESTFIELD("Date of Failure");
                TESTFIELD("Vehicle Reporting Date");
                IF "Vehicle In at LM Date" < "Vehicle Reporting Date" THEN
                    ERROR('Vehicle In at LM Date cannot be ealier than the Vehicle Reporting Date!');
            end;
        }
        field(42; "Vehicle In at LM Time"; Time)
        {
        }
        field(43; "Vehicle Accessories at In 1"; Text[30])
        {
        }
        field(44; "Vehicle Accessories at In 2"; Text[30])
        {
        }
        field(45; "Vehicle Accessories at In 3"; Text[30])
        {
        }
        field(46; "Vehicle Accessories at In 4"; Text[30])
        {
        }
        field(47; "Vehicle Accessories at In 5"; Text[30])
        {
        }
        field(48; "Vehicle Accessories at In 6"; Text[30])
        {
        }
        field(49; "Vehicle Accessories at In 7"; Text[30])
        {
        }
        field(50; "Vehicle Accessories at In 8"; Text[30])
        {
        }
        field(51; "Vehicle Accessories at In 9"; Text[30])
        {
        }
        field(52; "Vehicle Accessories at In 10"; Text[30])
        {
        }
        field(53; "Pre Paid Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                TESTFIELD("Date of Failure");
                TESTFIELD("Failure Location");
                TESTFIELD("Narrative of Problem");
                TESTFIELD("Vehicle Reporting Date");
                TESTFIELD("Vehicle Reporting Time");
                TESTFIELD("Vehicle In at LM Date");
                TESTFIELD("Vehicle In at LM Time");
            end;
        }
        field(54; "Pre Paid Receipt No"; Code[20])
        {
        }
        field(55; "Registration by"; Code[50])
        {
        }
        field(56; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(57; "Send To"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(58; Sender; Code[50])
        {
        }
        field(59; "Send For Approval"; Option)
        {
            OptionCaption = ' ,Send,Re-Send';
            OptionMembers = " ",Send,"Re-Send";

            trigger OnValidate()
            var
                UserSetup: Record "User Setup";
            begin
                /*
                IF ("Send For Approval" = "Send For Approval"::Send) OR
                ("Send For Approval" = "Send For Approval"::"Re-Send")
                  THEN
                    IF UserSetup.GET("Send To") THEN BEGIN
                        Sender := USERID;
                        "Sent Date" := CURRENTDATETIME;
                        TESTFIELD("Send To");
                        Subject := STRSUBSTNO(text001);
                        Body := STRSUBSTNO(text002, '');
                        Mailsender.NewMessage(UserSetup."E-Mail", '',
                        Subject, Body, attachement, FALSE);
                        TESTFIELD("Approve/Reject", 0);
                    END;
                    */
            end;
        }
        field(60; "Sent Date"; DateTime)
        {
        }
        field(61; "Approve/Reject"; Option)
        {
            OptionMembers = " ",Approve,Reject;
        }
        field(62; "Approved By"; Code[50])
        {
        }
        field(63; "Approval Date"; DateTime)
        {
        }
        field(64; "Service Item"; Code[20])
        {
            TableRelation = "Service Item"."No.";
            /*
            TableRelation = IF ("Buisness Type" = FILTER(FBO)) "Service Item"."No." WHERE("Blocked By MIS" = CONST(No), "Buisness Type" = FILTER(FBO)) ELSE
            IF ("Buisness Type" = FILTER("RT_FLEET-MAINT")) "Service Item"."No." WHERE("Blocked By MIS" = CONST(No), "Buisness Type" = FILTER("RT_FLEET-MAINT")) ELSE
            IF ("Buisness Type" = FILTER("PM_FLEET-MAINT")) "Service Item"."No." WHERE("Blocked By MIS" = CONST(No), "Buisness Type" = FILTER("PM_FLEET-MAINT")) ELSE
            IF ("Buisness Type" = FILTER(COT)) "Service Item"."No." WHERE("Blocked By MIS" = CONST(No), "Buisness Type" = FILTER(EXTERNAL | REFURBISHED_ENGPARTs | MOVEABLE | MARKETING | COT)) ELSE
            IF ("Buisness Type" = FILTER(EXTERNAL)) "Service Item"."No." WHERE("Blocked By MIS" = CONST(No), "Buisness Type" = FILTER(EXTERNAL | REFURBISHED_ENGPARTs | MOVEABLE | MARKETING | COT)) ELSE
            IF ("Buisness Type" = FILTER(REFURBISHED_ENGPARTs)) "Service Item"."No." WHERE("Blocked By MIS" = CONST(No), "Buisness Type" = FILTER(<> "RT_FLEET-MAINT" | EXTERNAL | <> REFURBISHED_ENGPARTs | MOVEABLE | MARKETING | COT | <> FBO)) ELSE
            IF ("Buisness Type" = FILTER(MOVEABLE)) "Service Item"."No." WHERE("Blocked By MIS" = CONST(No), "Buisness Type" = FILTER(<> "RT_FLEET-MAINT" | EXTERNAL | <> REFURBISHED_ENGPARTs | MOVEABLE | MARKETING | COT | <> FBO)) ELSE
            IF ("Buisness Type" = FILTER(MARKETING)) "Service Item"."No." WHERE("Blocked By MIS" = CONST(No), "Buisness Type" = FILTER(<> "RT_FLEET-MAINT" | <> EXTERNAL | <> REFURBISHED_ENGPARTs | <> MOVEABLE | MARKETING | <> COT | <> FBO)) ELSE
            IF ("Buisness Type" = FILTER(EXTERNAL)) "Service Item"."No." WHERE("Blocked By MIS" = CONST(No), "Buisness Type" = FILTER(<> "RT_FLEET-MAINT" | EXTERNAL | <> REFURBISHED_ENGPARTs | <> MOVEABLE | <> MARKETING | <> COT | <> FBO));
*/
            trigger OnValidate()
            var
                ServiceItem: Record "Service Item";
                VehRec: Record "Vehicle Registration";
                VehRec2: Record "Vehicle Registration";
            begin
                IF ServiceItem.GET("Service Item") THEN BEGIN
                    VALIDATE("Customer Bill to Code", ServiceItem."Customer No.");
                    "Vehicle/Equipment Make" := ServiceItem.Make;
                    "Vehicle/Equipment Model" := ServiceItem.Model;
                    "Engine Serial Number" := ServiceItem."Engine No.";
                    /// "FA Asset TRUCK No." := ServiceItem."FA Asset TRUCK No.";
                    "Chassis No." := ServiceItem."Chasis No.";
                    "Vehicle Registr. Plate No." := ServiceItem."Vehicle Reg. No.";
                    "Engine Serial Number" := ServiceItem."Engine No.";
                    "Engine Model" := ServiceItem.Model;          //RR
                    "Engine Make" := ServiceItem.Make;              //RR
                                                                    ///"Buisness Type":=ServiceItem."Buisness Type";
                                                                    ///  VALIDATE("NOVATRACK ID",ServiceItem."Navatrack ID (VEH)");
                    "Service Item Date" := ServiceItem."Installation Date";//ServiceItem."Creation Date";
                    "FLeet No." := ServiceItem."Flee Veht No.";
                    VALIDATE("Fleet Manager", ServiceItem."Fleet Mgr Code");
                    "Acquistion Date" := ServiceItem."Acquistion Date";
                    //  Validate("Shortcut dimension 3", ServiceItem."Vehicle Reg. No.");
                    "Fleet Manager Name" := ServiceItem."Fleet Manager Name";
                    "Fleet Manager" := ServiceItem."Fleet Mgr Code";
                    "Fleet Manager Phone No." := ServiceItem."Fleet Mgr  Phone No.";
                    "Fleet  Manager E-Mail" := ServiceItem."Fleet Manager Email";
                    "Location Code" := ServiceItem."Location of Service Item";
                    "Fleet Manger  Location" := ServiceItem."Location of Service Item";
                    VALIDATE("Shortcut Dimension 1 Code", ServiceItem."Customer No.");
                    "ServiceItem"."MACHINE TYPE" := ServiceItem."MACHINE TYPE";


                    //ServiceItem."FA Asset TRUCK No." := ;

                END;

                VehRec.SETRANGE(VehRec."Service Item", "Service Item");
                IF VehRec.FIND('+') THEN
                    "Last KM Odometer Reading" := VehRec."KM Odometer Reading";

                VehRec2.SETFILTER(VehRec2."Job Type", '%1|%2', VehRec2."Job Type"::PrevMaint, VehRec2."Job Type"::"KM Service");
                VehRec2.SETRANGE(VehRec2."Service Item", "Service Item");
                IF VehRec2.FIND('+') THEN
                    "Last Service KM  Reading" := VehRec2."Curr. KM Service/PM Service";
            end;

        }
        field(65; "Chassis No."; Code[50])
        {
        }
        field(66; "Service Item Date"; Date)
        {
        }
        field(67; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(68; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(69; "Job Type"; Option)
        {
            OptionCaption = ' ,KM Service,Repair,Warranty,PDI,FOC,OEM Recall,Installation,PrevMaint,Warranty Repairs,Non Warranty Repairs';
            OptionMembers = " ","KM Service",Repair,Warranty,PDI,FOC,"OEM Recall",Installation,PrevMaint,"Warranty Repairs","Non Warranty Repairs";
        }
        field(70; "Customer Waybill No"; Code[20])
        {
        }
        field(71; "Job Card No"; Code[20])
        {
            TableRelation = Job;

            trigger OnValidate()
            begin
                /*
                //    ServAppSch.SETCURRENTKEY(ServAppSch."Service Item",ServAppSch."Service Code (KM)");
                //ServAppSch.SETRANGE(ServAppSch."Service Item",JobRec."Vehicle Registr. Plate No");
                ServAppSch.SETRANGE(ServAppSch."Service Item", "Service Item");
                ServAppSch.SETRANGE(ServAppSch."Service Code (KM)", "Curr. KM Service/PM Service");                //ServAppSch.SETRANGE(ServAppSch.Serviced,FALSE);
                IF ServAppSch.FIND('-') THEN BEGIN
                    ServAppSch.Serviced := TRUE;
                    ServAppSch."Serviced Kilometer" := "Curr. KM Service/PM Service";
                    ServAppSch."Service Date" := TODAY;
                    ServAppSch."Job No." := "Job Card No";
                    MESSAGE('Done!ServAppSch_DADA');
                    ServAppSch.MODIFY;
                END;
                */
            end;
        }
        field(72; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center";
        }
        field(73; "Date/Time Engineer on Site"; DateTime)
        {
        }
        field(74; "Repair Workshop Location"; Text[30])
        {
            TableRelation = Location;
        }
        field(75; "Part Available"; Boolean)
        {
        }
        field(76; "VOR No."; Text[30])
        {
        }
        field(77; "Date/time of VOR"; DateTime)
        {
        }
        field(78; "Date/time VOR Parts Received"; DateTime)
        {
        }
        field(79; "Lost Time"; Time)
        {
        }
        field(80; "New Target Date"; Date)
        {
        }
        field(81; "Date/Time Repair completed"; DateTime)
        {
        }
        field(82; "Date/Time of collection"; DateTime)
        {
        }
        field(83; Remark; Text[100])
        {
        }
        field(84; "Date/Time Estimate Submitted"; DateTime)
        {
        }
        field(85; "Date/Time Estimate Approved"; DateTime)
        {
        }
        field(86; "Collection Target Date"; DateTime)
        {
        }
        field(132; "CUSTOMER OPERATION"; Code[20])
        {
            ///TableRelation = "FS Setup Table";
        }
        field(133; "LOT NOs."; Code[20])
        {
            //TableRelation = "FS Setup Table"."LOT NOs." WHERE ("CUSTOMER OPERATION"=FIELD("CUSTOMER OPERATION"));
        }
        field(50002; "Reading (KM)"; Decimal)
        {
            //CalcFormula = Max("Vehicle Registration"."KM Odometer Reading" WHERE (Service Item=FIELD(Service Item), Job Card No=FILTER(<>'')));
            Description = 'Make flowfield form list from novatrack';
            //FieldClass = FlowField;
        }
        field(50010; "Customer Job Type."; Option)
        {
            OptionCaption = ' ,Internal,External,Insurance';
            OptionMembers = " ",Internal,External,Insurance;
        }
        field(50011; "Internal Job Type."; Option)
        {
            OptionCaption = ' ,Lease Operation,PDI,B2B,COT,Warranty Free Serv.,Warraty Claim,Workshop Expenses';
            OptionMembers = " ","Lease Operation",PDI,B2B,COT,"Warranty Free Serv.","Warraty Claim","Workshop Expenses";
        }
        field(50012; "Customer Job Type"; Code[20])
        {
            TableRelation = "Customer Job Type";

            trigger OnValidate()
            var
                JobTypeCode: Record "Job Type Code";
            begin
                IF "Customer Job Type" <> xRec."Customer Job Type" THEN BEGIN
                    IF NOT JobTypeCode.GET("Customer Job Type", "Job Type Code") THEN
                        VALIDATE("Job Type Code", '')
                    ELSE
                        VALIDATE("Job Type Code");
                END
            end;

        }
        field(50013; "Job Type Code"; Code[20])
        {
            TableRelation = "Job Type Code"."Job Type Code" WHERE("Customer Job Type" = FIELD("Customer Job Type"));

            trigger OnValidate()
            var
                JobTypeCode: Record "Job Type Code";
            begin
                IF JobTypeCode.GET("Customer Job Type", "Job Type Code") THEN BEGIN
                    IF JobTypeCode."Customer Code" <> '' THEN
                        VALIDATE("Bill to Account No.", JobTypeCode."Customer Code")
                    ELSE
                        VALIDATE("Bill to Account No.", "Customer Bill to Code");
                    "Job Posting Group" := JobTypeCode."Job Posting Group";
                END
            end;
        }
        field(50014; "Bill to Account No."; Code[20])
        {
            TableRelation = Customer where("Customer Posting Group" = filter('Trade'));

            trigger OnValidate()
            var
                CustRec: Record Customer;
            begin
                IF CustRec.GET("Bill to Account No.") THEN
                    "Bill to Account Name" := CustRec.Name
                ELSE
                    "Bill to Account Name" := '';
            end;
        }
        field(50015; "Bill to Account Name"; Text[50])
        {
            Editable = false;
        }
        field(50016; "Job Posting Group"; Code[20])
        {
            TableRelation = "Job Posting Group";
        }
        field(50017; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50018; "Location Code"; Code[20])
        {
            TableRelation = Location;
            caption = 'Location';
        }
        field(50019; "Buisness Type"; Option)
        {
            OptionCaption = '  ,FBO,RT_FLEET-MAINT,EXTERNAL,REFURBISHED_ENGPARTs,MOVEABLE,MARKETING,COT,NON_MOVEABLE,PM_FLEET-MAINT';
            OptionMembers = "  ",FBO,"RT_FLEET-MAINT",EXTERNAL,REFURBISHED_ENGPARTs,MOVEABLE,MARKETING,COT,NON_MOVEABLE,"PM_FLEET-MAINT";
        }
        field(50020; "NOVATRACK ID"; Code[20])
        {
        }
        field(50021; "Repeat Repair"; Boolean)
        {
        }
        field(50022; "Registration Date"; Date)
        {
        }
        field(50023; "Truck BreakDown No."; Code[20])
        {
            /*
            Description = 'Restored=FILTER(No)  return by 070117';
            TableRelation = "Daily TAT Morning" WHERE(Restored = FILTER(No), "Job No." = FILTER(''), "Vehicle Registration No." = FIELD("Service Item"));

            trigger OnValidate()
            begin
                DailyTAT.SETRANGE(DailyTAT."No.", "Truck BreakDown No.");
                IF DailyTAT.FINDFIRST THEN BEGIN
                    IF DailyTAT."Job No." = '' THEN BEGIN
                        DailyTAT."Job No." := "Job Card No";
                        // DailyTAT."Job No.":= "Job Card No";
                        DailyTAT.MODIFY;
                        MESSAGE('Daily TAT Morning Page updated.');
                    END;
                END;
            end;
            */
        }

        field(50024; "KM Odometer Reading"; Decimal)
        {

            trigger OnValidate()
            begin

                //remmed 07/30/19
                //IF ("Job Type"="Job Type"::"KM Service") OR ("Job Type"="Job Type"::PrevMaint) THEN   BEGIN
                IF "KM Odometer Reading" < "Last KM Odometer Reading" THEN
                    ERROR('Curr. KM Service/PM Service has to be a more than %1 which is your last Odometer Reading', "Last KM Odometer Reading");
                //END;

                IF "KM Odometer Reading" < "Last Service KM  Reading" THEN
                    ERROR('Curr. KM Service/PM Service has to be a more than %1 which is your last Odometer Reading', "Last Service KM  Reading");
                //END;

                //  CALCFIELDS("Reading (KM)");
                //IF "Curr. KM Service/PM Service" < "Reading (KM)" THEN
                // ERROR('A Job with  WRONG Curr. KM Service/PM Service was created with a %1 OD reading. Contact MIS to assist you in correcting this issue', "Reading (KM)");
                "Curr. KM Service/PM Service" := "KM Odometer Reading";
            end;
        }
        field(50025; "FA Asset TRUCK No."; Code[15])
        {
            // TableRelation = "Leasing Fixed Asset" WHERE (Blocked=CONST(No));
            TableRelation = "Fixed Asset"."No.";
        }
        field(50031; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Global Dimension 7 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Global Dimension 7 Code");
            end;
        }
        field(50089; "Curr. KM Service/PM Service"; Decimal)
        {
            /// TableRelation = "Service KM";
            /*
                        trigger OnValidate()
                        var
                            SumCurrOd: Decimal;
                            VehRec: Record "Vehicle Registration";
                        begin
                            IF ("Job Type" = "Job Type"::"KM Service") OR ("Job Type" = "Job Type"::PrevMaint) THEN BEGIN
                                TESTFIELD("Curr. KM Service/PM Service");
                            END;


                            SumCurrOd := "Curr. KM Service/PM Service" - "KM Odometer Reading";
                            IF (SumCurrOd > 1001) OR (SumCurrOd < -1001) THEN
                                ERROR(' "Curr. KM Service/PM Service" can notbe to far from your "KM Odometer Reading", Cannot allow a %1KM Difference. Should not be more than 999KM Differnce', SumCurrOd);


                            IF "Curr. KM Service/PM Service" < "Last KM Odometer Reading" THEN
                                ERROR('Curr. KM Service/PM Service has to be a little more than %1', "KM Odometer Reading");

                            CALCFIELDS("Reading (KM)");
                            IF "Curr. KM Service/PM Service" < "Reading (KM)" THEN
                                ERROR('A Job with  WRONG Curr. KM Service/PM Service was created with a %1 OD reading. Contact MIS to assist you in correcting this issue', "Reading (KM)");


                            VehRec.SETRANGE(VehRec."Service Item", "Service Item");
                            IF VehRec.FIND('+') THEN
                                "Last KM Odometer Reading" := VehRec."KM Odometer Reading";


                            //IF "Curr. KM Service/PM Service"<> xRec."Curr. KM Service/PM Service" THEN
                            //  BEGIN


                            ServAppSch.SETRANGE(ServAppSch."ServiceAppNo. Increment", "ServiceAppNo.");
                            IF ServAppSch.FIND('-') THEN
                                ServAppSch."Service Due Kilometer" := "Curr. KM Service/PM Service";
                            MESSAGE('Service App. Sch. Updated');
                        end;
                        */
        }
        field(50090; "Last KM Odometer Reading"; Decimal)
        {
        }
        field(50091; "Last Service KM  Reading"; Decimal)
        {
        }
        field(50125; "Phone No 1."; Code[20])
        {
        }
        field(50126; "Phone No. 2."; Code[20])
        {
        }
        field(50127; "Phone No. 3 (GSM)."; Code[20])
        {
        }
        field(50128; "FLeet No."; Code[20])
        {
            Editable = false;
        }
        field(50129; "Acquistion Date"; Date)
        {
            Editable = false;
        }
        field(50130; "Fleet Manager"; Code[20])
        {
            // TableRelation = Employee;
            // trigger OnValidate()
            // var
            //     Emp: Record Employee;
            // begin
            //     if Emp.Get("Fleet Manager") then
            //         Emp.SetRange("No.", "Fleet Manager");
            //     if Emp.find('-') then begin
            //         "Fleet Manager Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
            //         "Fleet  Manager E-Mail" := Emp."E-Mail";
            //         "Fleet Manager Phone No." := emp."Phone No.";
            //         "Phone No 1." := Emp."Mobile Phone No.";
            //         // "Fleet Manger  Location" := emp.lo
            //     end;
            // end;

        }
        field(50131; "Fleet Manager Name"; Text[100])
        {
        }
        field(50132; "Fleet Manager Phone No."; Code[30])
        {
        }
        field(50133; "Fleet Manger  Location"; Code[20])
        {
            TableRelation = Location;
        }
        field(50134; "Fleet  Manager E-Mail"; Code[150])
        {
        }
        field(50135; "Response Action"; Option)
        {
            OptionCaption = ' ,Appointment Confirmed,Appointment Rescheduled,Appointment Cancled';
            OptionMembers = " ","Appointment Confirmed","Appointment Rescheduled","Appointment Cancled";
        }
        field(50136; "Appointment Status"; Option)
        {
            OptionCaption = ' ,Approved,Call Back,Call Again,We are not Ready';
            OptionMembers = " ",Approved,"Call Back","Call Again","We are not Ready";

            trigger OnValidate()
            begin
                /*
                TESTFIELD("Service Due Kilometer");
                TESTFIELD("Service Code (KM)");
                //TESTFIELD();

                RESET;
                IF "Appointment Status" = "Appointment Status"::Approved THEN BEGIN
                    //IF VehRec.GET("Service Item") THEN BEGIN
                    VehRec.INIT;
                    // VehRec."Registration ID" :='';
                    // VehRec.INSERT;

                    VehRec.VALIDATE(VehRec."Service Item", "Service Item");
                    VehRec."Registration ID" := VehRec."Registration ID";
                    VehRec."Vehicle Registr. Plate No." := "Service Item";
                    VehRec."Failure Location" := 'PREVENTIVE-MAINT';
                    //VehRec.VALIDATE(VehRec."Customer Bill to Code","Customer No.");
                    VehRec."Vehicle Registr. Plate No." := "Service Item";
                    VehRec."Narrative of Problem" := 'PREVENTIVE-MAINTEANCE';
                    //VehRec."KM Odometer Reading":= "KM Odometer Reading";     // When serve starts let this be updated
                    VehRec."Curr. KM Service/PM Service" := "Service Due Kilometer";
                    VehRec."Customer Job Type" := "Customer Job Type";
                    VehRec."Job Type Code" := "Job Type Code";
                    VehRec."Buisness Type" := "Buisness Type";
                    VehRec."Job Type" := VehRec."Job Type"::PM;
                    VehRec.VALIDTE(VehRec."Responsibility Center", "Responsibility Center");
                    VehRec.VALIDATE(VehRec."Shortcut dimension 3", "Shortcut dimension 3");
                    VehRec.INSERT(TRUE);
                    VehRec.MODIFY;
                    //   END;
                    "Appointment No." := VehRec."Registration ID";
                    "Cust. Veh. Reg Form No." := VehRec."Registration ID";
                    "Cust. Veh. Reg Form Date" := TODAY;
                    MESSAGE('Estimate Created Doc. No. : %1', "Appointment No.");
                END ELSE
                    "Cust. Veh. Reg Form No." := '';
                "Cust. Veh. Reg Form Date" := 0D;
                //END;
                //END;

*/ //Dennis
            end;
        }
        field(50137; "Service App Generated By"; Code[40])
        {
        }
        field(50138; "ServiceAppNo."; Integer)
        {
            ///TableRelation = "Service App Schedules" WHERE (ServiceAppNo.Increment=FIELD(ServiceAppNo.));
        }
        field(50139; "Serviced Kilometer"; Integer)
        {
        }
        field(50140; Serviced; Boolean)
        {

            trigger OnValidate()
            begin
                /*
                //VALIDATE(Serviced);
                ServAppSch.RESET;
                ServAppSch.SETCURRENTKEY(ServAppSch."Service Item", ServAppSch."Service Code (KM)");
                //ServAppSch.SETRANGE(ServAppSch."Service Item",JobRec."Vehicle Registr. Plate No");
                ServAppSch.SETRANGE(ServAppSch."Service Item", "Service Item");
                ServAppSch.SETRANGE(ServAppSch."Service Code (KM)", "Curr. KM Service/PM Service");
                //ServAppSch.SETRANGE(ServAppSch.Serviced,FALSE);
                IF ServAppSch.FIND('-') THEN BEGIN
                    ServAppSch.Serviced := TRUE;
                    ServAppSch."Serviced Kilometer" := "Curr. KM Service/PM Service";
                    ServAppSch."Service Date" := TODAY;
                    ServAppSch."Job No." := "Job Card No";
                    //MESSAGE('Done!ServAppSch');
                    ServAppSch.MODIFY;
                    //END ELSE BEGIN
                    //   ServAppSch.Serviced:=FALSE;
                    //   ServAppSch.MODIFY;
                END;
                //END;
                */ //Dennis
            end;
        }
        field(50141; Remarks; Text[100])
        {
        }
        field(50142; "Tacomter Reset"; Boolean)
        {

            trigger OnValidate()
            begin
                //"Tacometer Reset By" :=USERID;
                //TESTFIELD(Remarks);
                //TESTFIELD("NEW_TACOMETER KM Od. Rdng");
                // "Last KM Odometer Reading" := "NEW_TACOMETER KM Od. Rdng";
                //"Last Service KM  Reading" :=
                // "KM Odometer Reading" := "NEW_TACOMETER KM Od. Rdng";
                "Tacometer Reset By" := USERID;
            end;
        }
        field(50143; "NEW_TACOMETER KM Od. Rdng"; Decimal)
        {
            BlankZero = true;
        }
        field(50144; "Tacometer Reset By"; Code[30])
        {
        }
        field(50145; "Completely Serviced"; Boolean)
        {
            /// CalcFormula = Lookup("Service App Schedules".Serviced WHERE (ServiceAppNo. Increment=FIELD(ServiceAppNo.), Serviced=FILTER(Yes)));
            //FieldClass = FlowField;
        }
        field(39004251; "Customer Type"; Option)
        {
            OptionCaption = ' ,Internal,External,Warranty,Contract,Lease Operation,Insurance';
            OptionMembers = " ",Internal,External,Warranty,X,"Lease Operation",Insurance;
        }
        field(39004252; "Shortcut dimension 3"; Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin

                ValidateShortcutDimCode(3, "Shortcut dimension 3");
            end;
        }
        field(39004253; "Vehicle code"; Code[20])
        {
            CaptionClass = '1,2,4';
            //TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut dimension 4");

                // ValidateShortcutDimCode(4,"Shortcut dimension 4");
            end;
        }
        field(39004254; S; Code[20])
        {
            Description = 'Lookup(Job.No. WHERE (Invoice Exist=FILTER(Yes),Status=FILTER(Completed),No.=FIELD(Job Card No)))';
        }
        field(60001; "Preventive Maintenace Cycle"; Integer)
        {

        }
        field(60002; "Technician"; Text[100])
        {
            TableRelation = Employee;
        }
        field(60003; "Supervisor"; Text[100])
        {
            TableRelation = Employee;
        }
        field(60004; "Created By"; Text[50])
        {

        }
        field(60005; "Created Date"; Date)
        {

        }
        field(60006; "ECP No."; Code[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("ECP Header"."Doc. No." where("Vehicle Registration No." = field("Registration ID")));
            Editable = false;
        }
        field(60007; "Trailer"; Text[50])
        {
            // TableRelation = "Service Item" where("MACHINE TYPE" = filter('Trailer'));

            trigger OnValidate()
            var
                ServicItem: Record "Service Item";
            begin
                if ServicItem.Get(Trailer) then begin
                    "Trailer No." := ServicItem."Flee Veht No.";
                end else
                    "Trailer No." := '';

            end;


        }


        field(60008; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(60009; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(60010; "Trailer No."; Code[20])
        {
            Caption = 'Trailer Asset No.';

        }
        field(60011; Status; Option)
        {
            OptionMembers = "Pending","Job Card Created","Cancelled","On-Hold","Completed";
        }

        field(60012; "Engine won't start"; Boolean)
        {


        }


        field(60013; "Engine overheating"; Boolean)
        {


        }


        field(60014; "Engine misfiring or rough idling"; Boolean)
        {


        }

        field(60015; "Unusual engine noise (knocking, ticking)"; Boolean)
        {


        }

        field(60016; "Reduced engine power"; Boolean)
        {


        }

        field(60017; "Check Engine light is on"; Boolean)
        {


        }

        field(60018; "Battery won't hold charge"; Boolean)
        {


        }

        field(60020; "vehicle won't start due to battery"; Boolean)
        {


        }
        field(60021; "Electrical Issues"; Boolean)
        {


        }
        field(60074; "Electrical components not working (radio, lights, etc.)"; Boolean)
        {


        }
        field(60022; "Dashboard lights flickering"; Boolean)
        {


        }
        field(60023; "Alternator issue"; Boolean)
        {


        }
        field(60024; "Oil leak under vehicle"; Boolean)
        {


        }
        field(60025; "Coolant leak"; Boolean)
        {


        }
        field(60026; "Fuel leak/smell"; Boolean)
        {


        }
        field(60027; "Low oil level"; Boolean)
        {


        }
        field(60028; "Transmission fluid leak"; Boolean)
        {


        }
        field(60029; "Brake fluid leak"; Boolean)
        {


        }



        field(60030; "Squeaking or grinding noise when braking"; Boolean)
        {


        }
        field(60031; "Brake pedal feels soft or spongy"; Boolean)
        {


        }
        field(60032; "Vehicle pulls to one side while braking"; Boolean)
        {


        }

        field(60033; "ABS warning light is on"; Boolean)
        {


        }


        field(60034; "Reduced braking performance"; Boolean)
        {


        }
        field(60035; "Loud exhaust noise"; Boolean)
        {


        }
        field(60019; "Excess smoke from exhaust"; Boolean)
        {


        }
        field(60036; "Exhaust smell inside the vehicle"; Boolean)
        {


        }
        field(60037; "Flat tire"; Boolean)
        {


        }
        field(60038; "Uneven tire wear"; Boolean)
        {


        }

        field(60039; "Tire pressure warning light on"; Boolean)
        {


        }
        field(60040; "Steering wheel vibration"; Boolean)
        {


        }
        field(60041; "Wheel alignment issue"; Boolean)
        {


        }

        field(60042; "Difficulty shifting gears"; Boolean)
        {


        }
        field(60043; "Gear slipping"; Boolean)
        {


        }
        field(60044; "Unusual noise from transmission"; Boolean)
        {


        }

        field(60046; "Transmission fluid leaks"; Boolean)
        {


        }
        field(60047; "Headlights not working"; Boolean)
        {


        }


        field(60048; "Brake lights not working"; Boolean)
        {


        }
        field(60049; "Turn signals not working"; Boolean)
        {


        }
        field(60050; "Dashboard warning lights on"; Boolean)
        {


        }
        field(60051; "Air conditioning not cooling"; Boolean)
        {


        }
        field(60052; "Heater not working"; Boolean)
        {


        }


        field(60053; "Strange odor from vents"; Boolean)
        {


        }

        field(60054; "Fan not working"; Boolean)
        {


        }
        field(60055; "Power windows not working"; Boolean)
        {


        }
        field(60056; "Doors won’t lock/unlock properly"; Boolean)
        {


        }
        field(60057; "Side/rear-view mirror damaged"; Boolean)
        {


        }
        field(60058; "Windshield wipers not functioning"; Boolean)
        {


        }
        field(60059; "Seat belt not functioning"; Boolean)
        {


        }

        field(60060; "Strange noise inside cabin"; Boolean)
        {


        }
        field(60061; "Unusual vibration inside vehicle"; Boolean)
        {


        }
        field(60062; "•Driver seat adjustment not working"; Boolean)
        {


        }
        field(60063; "Suspension feels bouncy or stiff"; Boolean)
        {


        }
        field(60064; "Vehicle tilts to one side"; Boolean)
        {


        }
        field(60065; "Noise from under the vehicle when driving over bumps"; Boolean)
        {


        }
        field(60066; "Alarm not working"; Boolean)
        {


        }
        field(60067; "Vehicle won’t start due to immobilizer"; Boolean)
        {


        }
        field(60068; "Unusual smells inside the car"; Boolean)
        {


        }


        field(60069; "Other (please specify)"; Text[1000])
        {


        }
        field(60070; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Caption = 'Shortcut Dimension 8 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
            end;
        }
        field(60071; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(60072; "Service Advisor"; Code[50])
        {
            TableRelation = Employee;
        }
        field(60073; "S/A Advisor"; Text[100])
        {
            Caption = 'Service Advisor Name';
            Editable = false;
        }




    }


    keys
    {
        key(Key1; "Registration ID")
        {
        }
        key(Key2; "Job Card No")
        {
        }
        key(Key3; "Vehicle Registr. Plate No.")
        {
        }
        key(Key4; "ServiceAppNo.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Registration ID", "Job Card No", "Customer Bill to Name", Serviced)
        {
        }
    }

    trigger OnInsert()

    begin
        IF "Registration ID" = '' THEN BEGIN
            JobSetup.GET;
            JobSetup.TESTFIELD(JobSetup."Registaration ID");
            "No. Series" := JobSetup."Registaration ID";
            if NoSeries.AreRelated(JobSetup."Registaration ID", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Registration ID" := NoSeries.GetNextNo("No. Series", "Registration Date");
            //  NoSeries.InitSeries(JobSetup."Registaration ID", xRec."No. Series", 0D, "Registration ID", "No. Series");
        END;

        user := USERID;
        UserSetup.GET(user);
        UserSetup.SETRANGE("Purchase Resp. Ctr. Filter", UserSetup."Purchase Resp. Ctr. Filter");

        IF UserSetup.FINDFIRST THEN
            "Responsibility Center" := UserSetup."Purchase Resp. Ctr. Filter";
        "Vehicle Reporting Date" := Today;
        "Vehicle Reporting time" := Time;
        "Created By" := UserId;
        "Created Date" := Today;
    end;

    var
        JobSetup: Record "Jobs Setup";
        //  NoSeries: Codeunit NoSeriesManagement;
        NoSeries: Codeunit "No. Series";
        CustRec: Record Customer;
        UserRec: Record User;
        UserSetup: Record "User Setup";
        //Mailsender: Codeunit Mail;
        ToName: Text[80];
        CCName: Text[80];
        Subject: Text[50];
        Body: Text[100];
        attachement: Text[260];
        text001: Label 'Document  ''%1''  requires your approval';
        /// text002: ;
        text003: Label 'Document ''%1'' has been approved';
        text004: Label 'Document ''%1'' has been rejected';
        text005: Label 'Document ''%1'' is on hold';
        ///text006: ;
        ServiceItem: Record "Service Item";
        UserSet: Record "User Setup";
        user: Code[50];
        DimMgt: Codeunit DimensionManagement;
        JobTypeCode: Record "Job Type Code";
        VehRec: Record "Vehicle Registration";
        VehRec2: Record "Vehicle Registration";
        //  [InDataSet]
        ChassisnoEditable: Boolean;
        // [InDataSet]
        EngineNoEditable: Boolean;
        JobRec: Record Job;
        SumCurrOd: Decimal;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(DATABASE::"Vehicle Registration", "Registration ID", FieldNumber, ShortcutDimCode);
        MODIFY(TRUE);
    end;

    procedure ShowDocDim()
    var
        DocDim: Record "IC Document Dimension";
        /// DocDims: Page "IC Document Dimensions";
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
         DimMgt.EditDimensionSet(
           "Dimension Set ID", STRSUBSTNO('%1', "Registration ID"),
           "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
            MODIFY;
            // IF PurchReqtLineExist THEN;
            //UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;
    end;
}

