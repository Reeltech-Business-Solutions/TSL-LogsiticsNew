table 50070 "Service App Schedules"
{

    fields
    {
        field(1; "Service Item"; Code[20])
        {
            Description = 'Could be Registeration No. of the Vehicle';
            /*            TableRelation = IF ("Buisness Type" = FILTER(FBO)) "Service Item"."No." WHERE("Blocked By MIS" = CONST(No), "Buisness Type" = FILTER(FBO)) ELSE
                        IF ("Buisness Type" = FILTER("RT_FLEET-MAINT")) "Service Item"."No." WHERE("Blocked By MIS" = CONST(No), "Buisness Type" = FILTER("RT_FLEET-MAINT")) ELSE
                        IF ("Buisness Type" = FILTER("PM_FLEET-MAINT")) "Service Item"."No." WHERE("Blocked By MIS" = CONST(No), "Buisness Type" = FILTER("PM_FLEET-MAINT")) ELSE
                        IF ("Buisness Type" = FILTER(COT)) "Service Item"."No." WHERE("Blocked By MIS" = CONST(No), "Buisness Type" = FILTER(EXTERNAL | "REFURBISHED_ENGPARTs" | MOVEABLE | MARKETING | COT)) ELSE
                        IF ("Buisness Type" = FILTER(EXTERNAL)) "Service Item"."No." WHERE ("Blocked By MIS"=CONST(No),"Buisness Type"=FILTER(EXTERNAL|"REFURBISHED_ENGPARTs"|MOVEABLE|MARKETING|COT)) ELSE IF ("Buisness Type"=FILTER("REFURBISHED_ENGPARTs")) "Service Item"."No." WHERE ("Blocked By MIS"=CONST(No), "Buisness Type"=FILTER(<>"RT_FLEET-MAINT"|EXTERNAL|<>"REFURBISHED_ENGPARTs"|MOVEABLE|MARKETING|COT|<>FBO))  ELSE IF ("Buisness Type"=FILTER(MOVEABLE)) "Service Item"."No." WHERE ("Blocked By MIS"=CONST(No) "Buisness Type"=FILTER(<>"RT_FLEET-MAINT"|EXTERNAL|<>"REFURBISHED_ENGPARTs"|MOVEABLE|MARKETING|COT|<>FBO)) ELSE IF ("Buisness Type"=FILTER(MARKETING)) "Service Item".No. WHERE ("Blocked By MIS"=CONST(No),     "Buisness Type"=FILTER(<>"RT_FLEET-MAINT"|<>EXTERNAL|<>"REFURBISHED_ENGPARTs"|<>MOVEABLE|MARKETING|<>COT|<>FBO)) ELSE IF ("Buisness Type"=FILTER(EXTERNAL)) "Service Item".No. WHERE ("Blocked By MIS"=CONST(No) "Buisness Type"=FILTER(<>"RT_FLEET-MAINT"|EXTERNAL|<>"REFURBISHED_ENGPARTs"|<>MOVEABLE|<>MARKETING|<>COT|<>FBO));
            */
            trigger OnValidate()
            var
                ServAppRec: Record "Service App Schedules";
            begin
                /*
                ServAppRec.SETRANGE(ServAppRec."Service Item", "Service Item");
                ServAppRec.SETRANGE(ServAppRec.Serviced, FALSE);
                ServAppRec.CALCFIELDS(ServAppRec."JOb No Updated");
                ServAppRec.SETFILTER(ServAppRec."JOb No Updated", '%1', '');
                ServAppRec.SETFILTER(ServAppRec."Job No.", '%1', '');
                IF ServAppRec.FIND('-') THEN BEGIN
                    ERROR(' You cannot Create a new Service App Schedule as you have one Created and not used, please Search for ( %1; Service KM: %2; Month: %3 ) then reuse the Doc. for the Service App Shedule.'
                    , ServAppRec."Service Item", ServAppRec."Service Code (KM)", ServAppRec.MONTH);
                END;



                IF ServRec.GET("Service Item") THEN BEGIN
                    ;
                    "Engine No." := ServRec."Engine No.";
                    //VALIDATE("Chasis No.",ServRec."Chasis No.");
                    "Fixed Asset No." := ServRec."FA Asset TRUCK No.";
                    IF FARec.GET("Fixed Asset No.") THEN
                        "Base Location" := FARec."Base Location";
                    //Operation := FARec.Operation;
                    "CUSTOMER OPERATION" := FARec."CUSTOMER OPERATION";
                    "LOT NOs." := FARec."LOT NOs.";
                    "Navatrack ID (VEH)" := ServRec."Navatrack ID (VEH)";
                    "Chasis No." := ServRec."Chasis No.";
                    "Model Code" := ServRec.Model;
                    //"Customer No." := ServRec."Customer No.";
                    VALIDATE("Customer No.", ServRec."Customer No.");
                    VALIDATE("Fleet Manager", ServRec."Fleet Mgr Code");
                    "Buisness Type" := ServRec."Buisness Type";
                    "Phone No 1." := ServRec."Phone No.";
                    "Contact Person" := ServRec."Phone No.";
                    //Operation := ServRec.Operation;
                    "Model Code" := ServRec.Model;
                    "E-Mail" := ServRec."User Email";
                    "First Call Date" := TODAY;
                    "First Call No." := ServRec."Phone No.";
                    "First Call Contact" := ServRec."User Person";
                    //"Customer Job Type":= //UPDATE ON PAGE when Created
                    "Buisness Type" := ServRec."Buisness Type";
                    //"Job Type Code":=
                    "Job Type" := "Job Type"::PrevMaint;
                END;


                VehRec.SETRANGE(VehRec."Service Item", "Service Item");
                VehRec.SETFILTER(VehRec."Job Type", '%1|%2', VehRec."Job Type"::PrevMaint, VehRec."Job Type"::"KM Service");
                IF VehRec.FIND('+') THEN BEGIN
                    i := VehRec.COUNT;
                    "Job No.1" := VehRec."Job Card No";
                    "Registration No. 1" := VehRec."Registration ID";
                    Odometer1 := VehRec."KM Odometer Reading";
                    Date1 := VehRec."Date in Service";
                    "Job Description1" := VehRec."Narrative of Problem";
                END
                ELSE BEGIN
                    "Job No.1" := '';
                    Odometer1 := 0;
                    Date1 := 0D;
                    "Job Description1" := '';
                END;

                IF i > 1 THEN BEGIN
                    VehRec.NEXT := -1;
                    "Job No.2" := VehRec."Job Card No";
                    "Registration No. 2" := VehRec."Registration ID";
                    Odometer2 := VehRec."KM Odometer Reading";
                    Date2 := VehRec."Date in Service";
                    "Job Description2" := VehRec."Narrative of Problem";
                END
                ELSE BEGIN
                    "Job No.2" := '';
                    Odometer2 := 0;
                    Date2 := 0D;
                END;

                IF i > 2 THEN BEGIN
                    VehRec.NEXT := -2;
                    "Job No.3" := VehRec."Job Card No";
                    "Registration No. 3" := VehRec."Registration ID";
                    Odometer3 := VehRec."KM Odometer Reading";
                    Date3 := VehRec."Date in Service";
                    "Job Description3" := VehRec."Narrative of Problem";
                    //"Job Description3" := COPYSTR(PoServLineRec.Description,1,MAXSTRLEN("Job Description3"));

                END
                ELSE BEGIN
                    "Job No.3" := '';
                    Odometer3 := 0;
                    Date3 := 0D;
                    "Job Description3" := '';
                END;
                //END;
                // END;

                "User ID.2" := USERID;
                "User Time" := TIME;
                "User Date" := TODAY;
                */
            end;
        }
        field(2; "Service Code (KM)"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 0;
            Description = 'Main Service required e.g 10000km service,20000KM  "Faulty Material setup Header"."Operation Code" WHERE (Service Item Model=FIELD(Model Code))';
            /*
             TableRelation = "Service KM";

             trigger OnValidate()
             begin
                 IF ServiceKm.GET("Service Code (KM)") THEN
                     Description := ServiceKm.Description + 'For ' + "Service Item";
                 "Service Expected Duration" := ServiceKm."Duration in Hours";  //FaultRec."Duration In Hours";
                 //"Service Slot" := FaultRec."Duration In Hours" * 2;
                 //"Service Due Kilometer" := FaultRec."Service KM.";
             end;
             */
        }
        field(3; Description; Text[50])
        {
        }
        field(4; "Service Due Projected Date"; Date)
        {

            trigger OnValidate()
            begin
                //IF ("Date Of Serv." < "Service Due Projected Date") OR ("Date Of Serv." < "Next Call Date.") OR ("Next Call Date." > "Service Due Projected Date")THEN
                //ERROR('Check your Date');
                /*
                                MONTH := FORMAT("Service Due Projected Date", 0, Text000);


                                "Next Call Date." := CALCDATE('-10D', "Service Due Projected Date");
                                RetDay := DATE2DWY("Next Call Date.", 1);
                                CASE RetDay OF
                                    6:
                                        "Next Call Date." := CALCDATE('2D', "Next Call Date.");
                                    7:
                                        "Next Call Date." := CALCDATE('1D', "Next Call Date.");
                                END;



                                VehRec.SETRANGE(VehRec."Service Item", "Service Item");
                                VehRec.SETFILTER(VehRec."Job Type", '%1|%2', VehRec."Job Type"::PrevMaint, VehRec."Job Type"::"KM Service");
                                IF VehRec.FIND('+') THEN BEGIN
                                    i := VehRec.COUNT;
                                    "Job No.1" := VehRec."Job Card No";
                                    "Registration No. 1" := VehRec."Registration ID";
                                    Odometer1 := VehRec."KM Odometer Reading";
                                    Date1 := VehRec."Date in Service";
                                    "Job Description1" := VehRec."Narrative of Problem";
                                END
                                ELSE BEGIN
                                    "Job No.1" := '';
                                    Odometer1 := 0;
                                    Date1 := 0D;
                                    "Job Description1" := '';
                                END;

                                IF i > 1 THEN BEGIN
                                    VehRec.NEXT := -1;
                                    "Job No.2" := VehRec."Job Card No";
                                    "Registration No. 2" := VehRec."Registration ID";
                                    Odometer2 := VehRec."KM Odometer Reading";
                                    Date2 := VehRec."Date in Service";
                                    "Job Description2" := VehRec."Narrative of Problem";
                                END
                                ELSE BEGIN
                                    "Job No.2" := '';
                                    Odometer2 := 0;
                                    Date2 := 0D;
                                END;

                                IF i > 2 THEN BEGIN
                                    VehRec.NEXT := -2;
                                    "Job No.3" := VehRec."Job Card No";
                                    "Registration No. 3" := VehRec."Registration ID";
                                    Odometer3 := VehRec."KM Odometer Reading";
                                    Date3 := VehRec."Date in Service";
                                    "Job Description3" := VehRec."Narrative of Problem";
                                    //"Job Description3" := COPYSTR(PoServLineRec.Description,1,MAXSTRLEN("Job Description3"));

                                END
                                ELSE BEGIN
                                    "Job No.3" := '';
                                    Odometer3 := 0;
                                    Date3 := 0D;
                                    "Job Description3" := '';
                                END;
                                //END;
                                // END;

                                "User ID.2" := USERID;
                                "User Time" := TIME;
                                "User Date" := TODAY;
                                */
            end;
        }
        field(5; "Service Date"; Date)
        {
        }
        field(6; "Service Due KilometerXXXXX"; Decimal)
        {
            //TableRelation = "Service KM";

            trigger OnValidate()
            begin
                /*
                                IF ServiceKm.GET("Service Due KilometerXXXXX") THEN
                                    Description := ServiceKm.Description + 'For ' + "Service Item";
                                "Service Expected Duration" := ServiceKm."Duration in Hours";  //FaultRec."Duration In Hours";
                                //"Service Slot" := FaultRec."Duration In Hours" * 2;
                                */
            end;
        }
        field(7; "Serviced Kilometer"; Integer)
        {
        }
        field(8; Serviced; Boolean)
        {

            trigger OnValidate()
            var
                VehicleReg: Record "Vehicle Registration";
            begin
                VehicleReg.RESET;
                //VehicleReg.SETRANGE(VehicleReg."Job Card No","JOb No Updated");
                VehicleReg.SETRANGE(VehicleReg."Registration ID", "Cust. Veh. Reg Form No.");
                VehicleReg.SETRANGE(VehicleReg."Service Item", "Service Item");       //"Vehicle Registr. Plate No");
                VehicleReg.SETRANGE(VehicleReg.Serviced, FALSE);
                IF VehicleReg.FIND('-') THEN BEGIN
                    VehicleReg.Serviced := TRUE;
                    VehicleReg.MODIFY;
                END;

            end;
        }
        field(9; Remark; Text[50])
        {
        }
        field(10; "Service Expected Duration"; Decimal)
        {

            trigger OnValidate()
            begin
                /// "Service Slot" := "Service Expected Duration" * 2;
            end;
        }
        field(11; "Contact Person"; Text[50])
        {
        }
        field(12; "Phone No 1."; Code[20])
        {
        }
        field(13; "Phone No. 2."; Code[20])
        {
        }
        field(14; "Phone No. 3 (GSM)."; Code[20])
        {
        }
        field(15; "E-Mail"; Text[80])
        {
            ExtendedDatatype = EMail;
        }
        field(16; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                Custrec: Record Customer;
            begin
                IF Custrec.GET("Customer No.") THEN BEGIN
                    "Customer Name" := COPYSTR(Custrec.Name, 1, MAXSTRLEN("Customer Name"));
                    Address := COPYSTR(Custrec.Address, 1, MAXSTRLEN(Address));
                    "Phone No 1." := Custrec."Phone No.";
                END
                ELSE BEGIN
                    "Customer Name" := '';
                    Address := '';
                    "Phone No 1." := '';
                END;
            end;
        }
        field(17; "Appointment Status"; Option)
        {
            OptionCaption = ' ,Approved,Call Back,Call Again,We are not Ready';
            OptionMembers = " ",Approved,"Call Back","Call Again","We are not Ready";

            trigger OnValidate()
            var
                VehRec: Record "Vehicle Registration";
                ServiceRec: Record "Service Item";
                VehicleReg: Record "Vehicle Registration";
            begin
                /*   TESTFIELD("Service Due Kilometer");
                   TESTFIELD("Service Code (KM)");
                   TESTFIELD("Job Type");
                   TESTFIELD("Customer Job Type");
                   TESTFIELD("Job Type Code");
                   TESTFIELD("Shortcut dimension 3");
                   TESTFIELD("Send Appointment Reminder", TRUE);
                   TESTFIELD("Officer In Charge");
                   */ //Dennis
                      //TESTFIELD();


                //TESTFIELD();
                //TESTFIELD();
                //TESTFIELD("Date Of Serv.");


                /*ServAppRec.SETRANGE(ServAppRec."Service Item","Service Item");
                ServAppRec.SETRANGE(ServAppRec.Serviced,FALSE);
                ServAppRec.CALCFIELDS(ServAppRec."JOb No Updated");
                ServAppRec.SETFILTER(ServAppRec."JOb No Updated",'%1','');
                ServAppRec.SETFILTER(ServAppRec."Job No.",'%1','');
                IF ServAppRec.FIND('-') THEN
                BEGIN
                  ERROR(' You cannot Create a new Service App Schedule as you have one Created and not used, please Search for %1 and Service KM %2 then reuse the Doc',ServAppRec."Service Item",ServAppRec."Service Code (KM)");
                END;
                 */

                /*ServAppRec.RESET;
                ServAppRec.SETRANGE(ServAppRec."Service Item","Service Item");
                ServAppRec.SETFILTER(ServAppRec."Appointment Status",'<>%1',ServAppRec."Appointment Status"::Approved);
                IF VehicleReg.FIND('-') THEN
                    BEGIN
                
                
                    END;*/



                /*
                                RESET;
                                IF "Appointment Status" = "Appointment Status"::Approved THEN BEGIN
                                    //IF VehRec.GET("Service Item") THEN BEGIN
                                    VehRec.INIT;
                                    VehRec.VALIDATE(VehRec."Service Item", "Service Item");
                                    VehRec."Registration ID" := VehRec."Registration ID";

                                    IF ServiceRec.GET(VehRec."Registration ID") THEN BEGIN
                                        VehicleReg."Buisness Type" := ServiceRec."Buisness Type";
                                    END;

                                    VehRec.VALIDATE(VehRec."Vehicle Registr. Plate No.", "Service Item");
                                    VehRec."Failure Location" := 'PREVENTIVE-MAINT';
                                    //VehRec.VALIDATE(VehRec."Customer Bill to Code","Customer No.");
                                    //VehRec.VALIDATE(,"Customer No.");
                                    VehRec."Vehicle Registr. Plate No." := "Service Item";
                                    VehRec."Narrative of Problem" := 'PREVENTIVE-MAINTEANCE';
                                    //VehRec."KM Odometer Reading":= "KM Odometer Reading";     // When serve starts let this be updated
                                    VehRec."Curr. KM Service/PM Service" := "Service Due Kilometer";
                                    VehRec."Customer Job Type" := "Customer Job Type";
                                    VehRec.VALIDATE(VehRec."Job Type Code", "Job Type Code");

                                    IF "Job Type Code" = 'Lease Operation' THEN BEGIN
                                        VehicleReg."Shortcut Dimension 4 Code" := "Service Item";
                                    END;

                                    VehRec."Buisness Type" := "Buisness Type";
                                    VehRec."Vehicle code" := "Service Item";
                                    VehRec."Phone No 1." := "Phone No 1.";
                                    VehRec."Curr. KM Service/PM Service" := "Service Due Kilometer";
                                    VehRec."Job Type" := "Job Type";
                                    VehRec."Appointment Status" := VehRec."Appointment Status"::Approved;
                                    VehRec."ServiceAppNo." := "ServiceAppNo. Increment";  //Act as a no series
                                    VehRec."Service App Generated By" := USERID;
                                    VehRec.VALIDATE(VehRec."Responsibility Center", "Responsibility Center");
                                    VehRec.VALIDATE(VehRec."Shortcut dimension 3", "Shortcut dimension 3");
                                    VehRec.INSERT(TRUE);
                                    VehRec.MODIFY;
                                    //   END;

                                    "Appointment No." := VehRec."Registration ID";
                                    VALIDATE("Cust. Veh. Reg Form No.", VehRec."Registration ID");
                                    VALIDATE("Cust. Veh. Reg Form No.");
                                    "Cust. Veh. Reg Form Date" := TODAY;
                                    MODIFY;
                                    MESSAGE('Estimate Created Doc. No. : %1', "Appointment No.");
                                END ELSE
                                    "Cust. Veh. Reg Form No." := '';
                                "Cust. Veh. Reg Form Date" := 0D;
                                //END;
                                //END;

                */
            end;
        }
        field(18; "First Call Date"; Date)
        {
        }
        field(19; "First Call No."; Code[20])
        {
        }
        field(20; "First Call Contact"; Text[50])
        {
        }
        field(21; "First Call Response"; Option)
        {
            OptionCaption = ' ,Confirmed,Call Back,Call Again,We are not Ready';
            OptionMembers = " ",Confirmed,"Call Back","Call Again","We are not Ready";

            trigger OnValidate()
            begin
                /*IF "First Call Response" = "First Call Response"::Confirmed THEN
                VALIDATE("Next Call Date.",(CALCDATE('+3D',"Reception Date")));
                */

            end;
        }
        field(22; "Repeat Call Date"; Date)
        {

            trigger OnValidate()
            begin
                IF "First Call Date" <> "Repeat Call Date" THEN BEGIN
                    IF ("Repeat Call Date" <> 0D) AND ("Repeat Call Date" <> "Next Call Date.") THEN
                        "Last Call Date" := "Next Call Date.";
                END;
            end;
        }
        field(23; "Repeat Call No."; Code[20])
        {
        }
        field(24; "Repeat Call Contact"; Text[50])
        {
        }
        field(25; "Repeat Call Response"; Option)
        {
            OptionCaption = ' ,Confirmed,Call Back,Call Again,We are not Ready';
            OptionMembers = " ",Confirmed,"Call Back","Call Again","We are not Ready";

            trigger OnValidate()
            begin
                IF "Repeat Call Response" = "Repeat Call Response"::Confirmed THEN
                    VALIDATE("Next Call Date.", (CALCDATE('+3D', "Reception Date")));
            end;
        }
        field(26; "Last Call Date"; Date)
        {
        }
        field(27; "Last Call No."; Code[20])
        {
        }
        field(28; "Last Call Response"; Option)
        {
            OptionCaption = ' ,Confirmed,Call Back,Call Again,We are not Ready';
            OptionMembers = " ",Confirmed,"Call Back","Call Again","We are not Ready";

            trigger OnValidate()
            begin
                IF "Last Call Response" = "Last Call Response"::Confirmed THEN
                    VALIDATE("Next Call Date.", (CALCDATE('-3D', "Reception Date")));
            end;
        }
        field(29; "Last Call Contact"; Text[50])
        {
        }
        field(30; "Reception Date"; Date)
        {

            trigger OnValidate()
            begin
                /*
                 IF "First Call Response" = 0 THEN BEGIN
                     "Next Call Date." := CALCDATE('+10D', "Reception Date");
                     RetDay := DATE2DWY("Next Call Date.", 1);
                     CASE RetDay OF
                         6:
                             "Next Call Date." := CALCDATE('2D', "Next Call Date.");
                         7:
                             "Next Call Date." := CALCDATE('1D', "Next Call Date.");
                     END;
                 END;
                 */
            end;
        }
        field(31; "Engine No."; Code[20])
        {
        }
        field(32; "Chasis No."; Code[20])
        {
        }
        field(33; "Model Code"; Code[20])
        {
        }
        field(34; "Contact E-Mail"; Text[50])
        {
        }
        field(35; "Response Action"; Option)
        {
            OptionCaption = ' ,Appointment Confirmed,Appointment Rescheduled,Appointment Cancled';
            OptionMembers = " ","Appointment Confirmed","Appointment Rescheduled","Appointment Cancled";
        }
        field(36; "Call Type"; Option)
        {
            OptionCaption = ' ,Confirm of Appt.,Maintenance Reminder,Appt. Booking';
            OptionMembers = " ","Confirm of Appt.","Maintenance Reminder","Appt. Booking";
        }
        field(37; "Schedule Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(38; "Next Call Date."; Date)
        {

            trigger OnValidate()
            begin
                /*
                RetDay := DATE2DWY("Next Call Date.", 1);
                CASE RetDay OF
                    //6:  "Next Call Date." := CALCDATE('2D',"Next Call Date.");
                    7:
                        "Next Call Date." := CALCDATE('1D', "Next Call Date.");
                END;

                IF ("Next Call Date." <> "First Call Date") AND ("Repeat Call Date" <> "Next Call Date.") THEN
                    "Last Call Date" := "Next Call Date.";
                    */
            end;
        }
        field(39; "Appointment No."; Code[20])
        {
            Description = '"Appointment Register"."Appointment No."';
        }
        field(40; "Additional Jobs"; Text[250])
        {
        }
        field(41; "Send Appointment Message"; Boolean)
        {

            trigger OnValidate()
            begin
                //Mailsent := mailgenerator.NewMessage("E-Mail","Contact E-Mail",Subject,STRSUBSTNO(Text0001,"Service Item","Service Code",
                //"Reception Date"),Attachment,FALSE);
            end;
        }
        field(42; "Send Appointment Reminder"; Boolean)
        {

            trigger OnValidate()
            begin
                //Mailsent := mailgenerator.NewMessage("E-Mail","Contact E-Mail",Subject,STRSUBSTNO(Text0002,"Service Item","Service Code",
                //"Reception Date"),Attachment,FALSE);
                /*
                                TESTFIELD("Job Type");
                                TESTFIELD("Customer Job Type");
                                TESTFIELD("Buisness Type");
                                TESTFIELD("Officer In Charge");
                                TESTFIELD("Service Due Kilometer");


                                IF "Send Appointment Reminder" = TRUE THEN BEGIN
                                    Sender := USERID;
                                    "Sent Date" := CURRENTDATETIME;
                                    Subject := STRSUBSTNO(text101, "Service Item", Description);
                                    //Body:= STRSUBSTNO(text102,"Service Item","Service Due KilometerXXXXX","Service Due Projected Date");
                                    Body := STRSUBSTNO(text102, "Service Item", "Service Code (KM)", "Service Due Projected Date");

                                    IF "Fleet Manager Email" <> '' THEN
                                        Mailsender.NewMessage("Fleet Manager Email", '', Subject, Body, attachement, FALSE)
                                    ELSE
                                        Mailsender.NewMessage("Contact E-Mail", '', Subject, Body, attachement, FALSE);

                                END
                                ELSE
                                    EXIT;
                                    */
            end;
        }
        field(43; "Cust. Veh. Reg Form No."; Code[20])
        {

            trigger OnValidate()
            begin
                //"Cust. Veh. Reg Form Date":=TODAY;
                //"User ID.2":= USERID;
                //"User Time":= TIME;
                //"User Date":= TODAY;
                //"Date Of Serv.":=TODAY;
            end;
        }
        field(44; "Cust. Veh. Reg Form Date"; Date)
        {
        }
        field(45; "Customer Name"; Text[50])
        {
        }
        field(46; Address; Text[50])
        {
        }
        field(47; "Model Year"; Integer)
        {
        }
        field(48; "Key Assigned No."; Code[20])
        {
        }
        field(58; "Appointment Offering 1 Date"; Date)
        {
        }
        field(59; "Appointment Offering 1 Time"; Time)
        {
        }
        field(60; "Appointment Offering 2 Date"; Date)
        {
        }
        field(61; "Appointment Offering 2 Time"; Time)
        {
        }
        field(72; "Responsibility Center"; Code[20])
        {
            //TableRelation = "Responsibility Center BR";
        }
        field(115; "Job No.1"; Code[20])
        {
        }
        field(116; "Job No.2"; Code[20])
        {
            TableRelation = Job;
        }
        field(117; "Job No.3"; Code[20])
        {
            TableRelation = "Vehicle Registration";
        }
        field(118; Odometer1; Decimal)
        {
        }
        field(119; Odometer2; Decimal)
        {
        }
        field(120; Odometer3; Decimal)
        {
        }
        field(121; Date1; Date)
        {
        }
        field(122; Date2; Date)
        {
        }
        field(123; Date3; Date)
        {
        }
        field(126; "CUSTOMER OPERATION"; Code[20])
        {
            // TableRelation = "FS Setup Table";
        }
        field(127; "LOT NOs."; Code[20])
        {
            //  TableRelation = "FS Setup Table"."LOT NOs." WHERE("CUSTOMER OPERATION" = FIELD("CUSTOMER OPERATION"));
        }
        field(131; "Job Description1"; Text[250])
        {
        }
        field(132; "Job Description2"; Text[250])
        {
        }
        field(133; "Job Description3"; Text[250])
        {
        }
        field(134; "Technician Code"; Code[20])
        {
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                /*
                IF "Technician Code" <> xRec."Technician Code" THEN
                BEGIN
                HourSlotInfo.SETRANGE(HourSlotInfo.Technician,xRec."Technician Code");
                HourSlotInfo.SETRANGE(HourSlotInfo.Date,xRec."Customer's Preferred Date");
                HourSlotInfo.SETRANGE(HourSlotInfo."COF No.",xRec."Customer Order Form No.");
                IF HourSlotInfo.FIND('-') THEN
                    HourSlotInfo.DELETEALL;
                END;
                 */

                /*
                                IF ResRec.GET("Technician Code") THEN BEGIN
                                    "Technician Name" := ResRec.Name;
                                    ResCapEntry.SETRANGE(ResCapEntry."Resource No.", "Technician Code");
                                    ResCapEntry.SETRANGE(ResCapEntry.Date, "Customer's Preferred Date");
                                    IF ResCapEntry.FIND('-') THEN
                                      "Man Hour Per Day" := ResCapEntry.Capacity;
                                END;
                */

                /*
                HourSlotInfo.SETRANGE(HourSlotInfo.Technician,"Technician Code");
                HourSlotInfo.SETRANGE(HourSlotInfo.Date,"Customer's Preferred Date");
                IF HourSlotInfo.FIND('-') THEN
                  Remaining := HourSlotInfo."Hours Remaining";
                 */

            end;
        }
        field(135; "Technician Name"; Text[30])
        {
        }
        field(136; "Customer's Preferred Date"; Date)
        {
        }
        field(137; "Customer's Preferred Time"; Time)
        {
        }
        field(138; "Man Hour Per Day"; Integer)
        {
        }
        field(139; "Service Slot"; Decimal)
        {

            trigger OnValidate()
            begin
                "Service Expected Duration" := "Service Slot" / 2;
                IF "Service Slot" < "Man Hour Per Day" THEN
                    "Remaining Hours" := "Man Hour Per Day" - "Service Slot";
            end;
        }
        field(140; "Serving Store"; Code[20])
        {
            TableRelation = Location.Code WHERE("Use As In-Transit" = CONST(false));
        }
        field(141; "Service Type"; Option)
        {
            OptionCaption = ' ,Periodic Maintenance,General Repairs';
            OptionMembers = " ","Periodic Maintenance","General Repairs";
        }
        field(142; "Remaining Hours"; Decimal)
        {
        }
        field(143; "Total Appointment Time"; Decimal)
        {
            //  Description = 'NameDataTypeSubtypeLength ResRecRecordResource';
        }
        field(144; "Total Rem Appt Time"; Decimal)
        {
        }
        field(145; "Total Walk in Time"; Decimal)
        {
            Description = 'Sum("Hour Slot Info".Hours WHERE (Walk-In=CONST(Yes)))';
        }
        field(146; "Total Rem W/I Time"; Decimal)
        {
        }
        field(147; "Vehicle Driven by"; Text[30])
        {
        }
        field(148; "For Appt Confirmation"; Boolean)
        {

            trigger OnValidate()
            begin
                //  IF "For Appt Confirmation" THEN
                //COFRec."For Appt Confirmation" := TRUE;    //DDada Update Later
            end;
        }
        field(149; "Starting Hour"; Code[20])
        {
            Description = 'Ask dada y d code was suspended';

            trigger OnValidate()
            begin

                //DAPO
                //GET("Service Item","Service Code");
                /*AGLBLOCKED
                IF (("Appointment Allocated Hr" + "Walk-In Allocated Hr") >= "Man Hour Per Day")  AND
                   ("Starting Hour" <> '')THEN
                  ERROR('This Technician hours fully allocated')
                  ELSE BEGIN
                
                TESTFIELD("Customer Order Form No.");
                IF HourSlot.GET("Starting Hour") THEN
                 BEGIN
                   //Hrrec := "Starting Hour";
                  FOR J := 1 TO ("Service Slot") DO
                   BEGIN
                     IF HourSlot.Break THEN BEGIN
                       HourSlot.NEXT(1);
                       Hrrec := HourSlot.Code;
                     END;
                       HourSlotInfo.INIT;
                       HourSlotInfo.VALIDATE(HourSlotInfo."Hour Slot",HourSlot.Code);
                       HourSlotInfo.VALIDATE(HourSlotInfo.Technician,"Technician Code");
                       HourSlotInfo.VALIDATE(HourSlotInfo."COF No.","Customer Order Form No.");
                       HourSlotInfo.VALIDATE(HourSlotInfo.Date,"Customer's Preferred Date");
                       HourSlotInfo.VALIDATE(HourSlotInfo."Date Filter","Customer's Preferred Date");
                       ResCapEntry.SETRANGE(ResCapEntry."Resource No.","Technician Code");
                       ResCapEntry.SETRANGE(ResCapEntry.Date,"Customer's Preferred Date");
                       IF ResCapEntry.FINDFIRST THEN
                         HourSlotInfo."Daily Man Hour" := ResCapEntry.Capacity;
                       HourSlotInfo."Walk-In" := "Walk-In";
                       HourSlotInfo."Service Code" := "Service Code";
                       HourSlotInfo."Veh Reg No." := "Service Item";
                       HourSlotInfo.VALIDATE(HourSlotInfo."Daily Man Hour","Man Hour Per Day");
                       HourSlotInfo.INSERT;
                       IF J <> "Service Slot" THEN
                         HourSlot.NEXT;
                       Hrrec := HourSlot.Code;
                   END;
                   "Ending Hour" := HourSlot.Code;//Hrrec;
                END;
                HourSlotInfo.SETRANGE(HourSlotInfo.Technician,"Technician Code");
                HourSlotInfo.SETRANGE(HourSlotInfo.Date,"Customer's Preferred Date");
                IF HourSlotInfo.FINDFIRST THEN
                  Remaining := HourSlotInfo."Hours Remaining";
                END;       */

                //GenScheduleCard;

                //New Function by Segunio to update the Workshop Calender
                // UpdateWrkShpCalendar;

            end;
        }
        field(150; "Ending Hour"; Code[20])
        {
        }
        field(151; "Appointment Allocated Hr"; Decimal)
        {
            Description = '<>Sum("Hour Slot Info".Hours WHERE (Date=FIELD(Customer''s Preferred Date),Walk-In=CONST(No),Technician=FIELD(Technician Code)))';
        }
        field(152; "Walk-In Allocated Hr"; Decimal)
        {
            Description = '<>Sum("Hour Slot Info".Hours WHERE (Date=FIELD(Customer''s Preferred Date),Walk-In=CONST(Yes),Technician=FIELD(Technician Code)))';
        }
        field(153; "Total Hour Available 4 day"; Decimal)
        {
            CalcFormula = Sum("Res. Capacity Entry".Capacity WHERE(Date = FIELD("Customer's Preferred Date")));
            FieldClass = FlowField;
        }
        field(154; "Walk-In"; Boolean)
        {

            trigger OnValidate()
            begin
                IF "Walk-In" THEN
                    "Customer's Requests" := "Customer's Requests"::"Walk-In"
                ELSE
                    "Customer's Requests" := "Customer's Requests"::Appointment;
            end;
        }
        field(155; Remaining; Decimal)
        {
            Description = '"Hour Slot Infon"."Hours Remaining" WHERE (Technician=FIELD(Technician Code))';
        }
        field(156; "Technician Code2"; Code[20])
        {

            trigger OnValidate()
            begin

                /*
                IF "Technician Code2" <> xRec."Technician Code2" THEN
                BEGIN
                HourSlotInfo.SETRANGE(HourSlotInfo.Technician,xRec."Technician Code2");
                HourSlotInfo.SETRANGE(HourSlotInfo.Date,xRec."Customer's Preferred Date");
                HourSlotInfo.SETRANGE(HourSlotInfo."COF No.",xRec."Customer Order Form No.");
                IF HourSlotInfo.FINDFIRST THEN
                    HourSlotInfo.DELETEALL;
                END;
                
                IF ResRec.GET("Technician Code2") THEN
                   BEGIN
                    "Technician Name2" := ResRec.Name;
                    "Man Hour Per Day" := ResRec."Man Hour Per Day";
                   END;
                
                HourSlotInfo.SETRANGE(HourSlotInfo.Technician,"Technician Code2");
                HourSlotInfo.SETRANGE(HourSlotInfo.Date,"Customer's Preferred Date");
                IF HourSlotInfo.FIND('-') THEN
                  Remaining := HourSlotInfo."Hours Remaining";
                                  */

            end;
        }
        field(157; "Technician Name2"; Text[30])
        {
        }
        field(158; VDS; Code[20])
        {
        }
        field(159; VIS; Code[20])
        {
        }
        field(160; "SSC Range From"; Code[20])
        {
        }
        field(161; "SSC Range To"; Code[20])
        {
        }
        field(162; "SSC Available"; Boolean)
        {
        }
        field(163; "Customer's Requests"; Option)
        {
            OptionCaption = 'Appointment,Walk-In,Others';
            OptionMembers = Appointment,"Walk-In",Others;
        }
        field(164; Internal; Boolean)
        {
        }
        field(165; "Customer Waiting"; Boolean)
        {
        }
        field(166; "General Repair"; Boolean)
        {
        }
        field(167; "Repeat Repair"; Boolean)
        {
        }
        field(168; Warranty; Boolean)
        {
        }
        field(169; "Customer Complaint"; Boolean)
        {
        }
        field(170; "Diag/Est"; Boolean)
        {
        }
        field(171; "B & P"; Boolean)
        {
            Description = 'Diagnosis';
        }
        field(172; Maintenance2; Boolean)
        {
            Description = 'Estimating';
        }
        field(173; Maintenance3; Text[30])
        {
        }
        field(174; "Maintenance Reminder"; Boolean)
        {
        }
        field(175; "Job Details"; Text[250])
        {
        }
        field(176; "Reception Time"; Time)
        {
        }
        field(181; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(182; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(183; "User ID"; Code[20])
        {
        }
        field(184; "Odometer Reading At Appointmen"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(185; Teams; Option)
        {
            OptionCaption = ' ,Quick Service,PMS A,PMS B,Running Repair,Body,Diagnosis';
            OptionMembers = " ","Quick Service","PMS A","PMS B","Running Repair",Body,Diagnosis;
        }
        field(186; "Service Advisor"; Code[20])
        {
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                /*  IF ResRec.GET("Service Advisor") THEN BEGIN
                      "Service Advisor's Name" := ResRec.Name;
                      //"Service Advisor's PHONE NO.":= ResRec."Phone No.";  //ddada
                  END
                  ELSE BEGIN
                      "Service Advisor's Name" := '';
                      "Service Advisor's PHONE NO." := '';
                  END;
                  */
            end;
        }
        field(187; "Service Advisor's Name"; Text[30])
        {
        }
        field(188; "Stall No."; Option)
        {
            OptionCaption = ' ,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30';
            OptionMembers = " ","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30";
        }
        field(189; "Appointment Date"; Date)
        {

            trigger OnValidate()
            begin
                IF "Appointment Date" <> 0D THEN BEGIN
                    "Appointment Time" := TIME;
                    "Appointment Staff Name" := USERID;
                END;
            end;
        }
        field(190; "Appointment Time"; Time)
        {
        }
        field(191; "Appointment Staff Name"; Text[30])
        {
        }
        field(192; "Delivery Date"; Date)
        {
        }
        field(193; "Delivery Time"; Time)
        {
        }
        field(194; "Fixed Asset No."; Code[20])
        {
            TableRelation = "Fixed Asset";

            trigger OnValidate()
            begin
                /*  IF FARec.GET("Fixed Asset No.") THEN
                      "Fixed Asset Description" := FARec.Description

                  ELSE
                      "Fixed Asset Description" := '';
                      */
            end;
        }
        field(195; "Fixed Asset Description"; Text[50])
        {
        }
        field(196; VMI; Code[20])
        {
        }
        field(197; "Check Serviced SC"; Boolean)
        {
            // CalcFormula = Exist(Job WHERE("No."= FIELD("Job No."), "Invoice Date*"=FILTER(<>'')));
            // FieldClass = FlowField;

            trigger OnValidate()
            begin
                /*IF "Check SSC" = TRUE THEN
                  VALIDATE("Chasis No.");
                               */
            end;
        }
        field(198; "Service Due Kilometer"; Decimal)
        {
            /*
            TableRelation = "Service KM";

            trigger OnValidate()
            begin
                IF ServiceKm.GET("Service Due Kilometer") THEN
                Description := ServiceKm.Description +'For '+"Service Item" ;
                "Service Expected Duration" := ServiceKm."Duration in Hours";  //FaultRec."Duration In Hours";
                //"Service Slot" := FaultRec."Duration In Hours" * 2;
                //"Service Due Kilometer" := FaultRec."Service KM.";
            end;
            */
        }
        field(50001; "Service Advisor's PHONE NO."; Code[20])
        {
        }
        field(50002; "Last/ Current Od Reading (KM)"; Decimal)
        {
            // CalcFormula = Max("Vehicle Registration"."KM Odometer Reading" WHERE("Service Item" = FIELD("Service Item"), "Job Card No" = FILTER(<> ''),Tacomter Reset" = FILTER(No)));
            Description = 'Make flowfield form list from novatrack';
            // FieldClass = FlowField;
        }
        field(50003; "KM Odometer Reading"; Decimal)
        {
            BlankZero = true;
        }
        field(50004; "Officer In Charge"; Code[70])
        {
            // TableRelation = "User Setup"."User ID" WHERE ("User Status"=FILTER(Enabled), "PM Appointment Reminder"=CONST(Yes));

            trigger OnValidate()
            begin
                //   IF USERSETUP.GET("Officer In Charge") THEN
                //     "Shortcut dimension 3" := USERSETUP."Shortcut Dimension 3 Code";
            end;
        }
        field(50005; Sender; Code[70])
        {
        }
        field(50006; "Sent Date"; DateTime)
        {
        }
        field(50007; "Registration No. 1"; Code[20])
        {
        }
        field(50008; "Registration No. 2"; Code[20])
        {
            TableRelation = "Vehicle Registration";
        }
        field(50009; "Registration No. 3"; Code[20])
        {
            TableRelation = "Vehicle Registration";
        }
        field(50011; "Navatrack ID (VEH)"; Code[15])
        {
        }
        field(50017; "Job Type"; Option)
        {
            OptionCaption = ' ,KM Service,Repair,Warranty,PDI,FOC,OEM Recall,Installation,PrevMaint,Warranty Repairs,Non Warranty Repairs,Aggregate Repairs';
            OptionMembers = " ","KM Service",Repair,Warranty,PDI,FOC,"OEM Recall",Installation,PrevMaint,"Warranty Repairs","Non Warranty Repairs","Aggregate Repairs";
        }
        field(50031; "Base Location"; Code[30])
        {
            //TableRelation = Location WHERE("Fleet Plant" = CONST(true));
        }
        field(50032; "Fleet Manager"; Code[20])
        {
            /*TableRelation = "Fleet Managers".No.;

            trigger OnValidate()
            begin
                      IF FM.GET("Fleet Manager")   THEN
                          "Fleet Manager Name" := FM."Fleet Manager Name" ;
                           "Fleet Manager No.":= FM."Phone No.";
                            "Fleet Manager Email":= FM."FM Manager E-Mail";
            end;
            */
        }
        field(50033; "Fleet Manager Name"; Text[100])
        {
        }
        field(50034; Operation; Option)
        {
            OptionMembers = " ",NBC,PZ,FRIGOGLASS,"NIGERIA BREWERIES",CHIVITA;
        }
        field(50035; "Fleet Manager No."; Code[30])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(50036; "Fleet Manager Email"; Text[70])
        {
            ExtendedDatatype = EMail;
        }
        field(50103; "Customer Job Type"; Code[20])
        {
            TableRelation = "Customer Job Type";

            trigger OnValidate()
            begin

                //IF NOT JobTypeCode.GET("Customer Job Type","Job Type Code") THEN
                //  VALIDATE("Job Type Code",'')
                //ELSE
                // VALIDATE("Job Type Code");
            end;
        }
        field(50104; "Job Type Code"; Code[20])
        {
            /*TableRelation = "Job Type Code"."Job Type Code" WHERE ("Customer Job Type"=FIELD("Customer Job Type"),"Job Type Code"=FILTER(PM|"PM-LEASING")); */
        }
        field(50108; "Buisness Type"; Option)
        {
            OptionCaption = '  ,FBO,"RT_FLEET-MAINT",EXTERNAL,"REFURBISHED_ENGPARTs",MOVEABLE,MARKETING,COT,NON_MOVEABLE,PM_FLEET-MAINT';
            OptionMembers = "  ",FBO,"RT_FLEET-MAINT",EXTERNAL,"REFURBISHED_ENGPARTs",MOVEABLE,MARKETING,COT,NON_MOVEABLE,"PM_FLEET-MAINT";
        }
        field(50109; "User ID.2"; Code[60])
        {
        }
        field(50110; "User Time"; Time)
        {
        }
        field(50111; "User Date"; Date)
        {
        }
        field(50112; "Mail Sent Confirmation"; Date)
        {
        }
        field(50137; "Service App Generated By"; Code[40])
        {
        }
        field(50139; "Job No."; Code[20])
        {
            TableRelation = Job;
        }
        field(50140; "Date Of Serv."; Date)
        {

            trigger OnValidate()
            begin
                //VALIDATE("Service Due Projected Date",CALCDATE('+3M',"Date Of Serv."));
            end;
        }
        field(50141; "Shortcut dimension 3"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Vehicle Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                //
                ValidateShortcutDimCode(3, "Shortcut dimension 3");
            end;
        }
        field(50142; "JOb No Updated"; Code[20])
        {
            CalcFormula = Lookup("Vehicle Registration"."Job Card No" WHERE("Service Item" = FIELD("Service Item"),
                                                                             "Registration ID" = FIELD("Cust. Veh. Reg Form No.")));
            FieldClass = FlowField;
            TableRelation = Job;

            trigger OnValidate()
            begin
                CALCFIELDS("JOb No Updated");
                IF "JOb No Updated" <> '' THEN
                    Serviced := TRUE
                ELSE
                    Serviced := FALSE;
            end;
        }
        field(50143; MONTH; Text[10])
        {
            Caption = 'MONTH';
        }
        field(50144; "ServiceAppNo. Increment"; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Service Item", "Service Code (KM)")
        {
            Clustered = true;
        }
        key(Key2; "Service Code (KM)")
        {
        }
        key(Key3; "Next Call Date.", "Service Code (KM)")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        TESTFIELD("Job No.", '');
        TESTFIELD("JOb No Updated", '');
        TESTFIELD(Serviced, FALSE);
    end;

    var
        // VehRec:	Record	"Vehicle Registration";
        VehRec: Record "Vehicle Registration";
        VehicleReg: Record "Vehicle Registration";
        //FM: Record "Fleet Managers";
        //ServiceKm: Record "Service KM";
        //FaultRec: Record "Name for Job card";
        ServRec: Record "Service Item";
        ServApp: Record "Material Request Line";
        ServADet: Record "Posted Material Request Header";
        SerappSch: Record "Job Type Code";
        SerappSch2: Record "Job Type Code";
        Custrec: Record Customer;
        RetDay: Integer;
        Mailsent: Boolean;
        //mailgenerator:Codeunit        Mail;
        Attachment: Text[100];
        COFRec: Record Job;
        NewCode: Code[20];
        OperationCodeCount: Integer;
        servsetup: Record "Service Mgt. Setup";
        PoServLineRec: Record Job;
        i: Integer;
        PoServHeadRec: Record "Service Shipment Header";
        //"SSC/SC": Record "Service KM";
        //HourSlot: Record "Service KM";
        HourUnit: Decimal;
        // HourSlotInfo: Record "Service KM";
        //        ServiceCode: Record "Service KM";
        J: Decimal;
        "LineNo.": Integer;
        Hrrec: Code[20];
        AppScheduling: Record "Posted Store Issue Line";
        AppScheduling2: Record "Posted Store Issue Line";
        USERSETUP: Record "User Setup";
        ServiceRec: Record "Service Item";
        ResCapEntry: Record "Res. Capacity Entry";
        "COF No.": Code[20];
        //FARec: Record "Leasing Fixed Asset";
        ServHeader: Record "Service Header";
        ResRec: Record Resource;
        //VehRec: Record "Vehicle Registration";
        //Mailsender:Codeunit  Mail;
        ToName: Text[80];
        CCName: Text[80];
        Subject: Text[150];
        Body: Text[260];
        attachement: Text[260];
        ServAppRec: Record "Service App Schedules";

        text101: Label 'Vehicle  ''%1''  requires your approval for PM Service For %2 ';
        text102: Label 'This  requires your approval. The Vehicle No. ''%1'' has being Sheduled for a  ''%2''KM PM Service on the %3  and Requires you permission to be Serviced.';
        //ServAppRec: Record "50070";
        Text000: Label '<Month Text>';

    [Scope('Cloud')]
    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        //OldDimSetID := "Dimension Set ID";
        //DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");

        //IF ServItemLineExists OR ServLineExists THEN
        //  UpdateAllLineDim("Dimension Set ID",OldDimSetID);
    end;
}

