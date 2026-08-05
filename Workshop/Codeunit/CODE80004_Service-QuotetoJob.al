codeunit 80004 "Service-Quote to Job"
{
    Permissions = TableData "Loaner Entry" = m,
                  TableData "Service Order Allocation" = rimd;
    TableNo = "Service Header";

    trigger OnRun()
    var
        ServQuoteLine: Record "Service Line";
        CustCheckCreditLimit: Codeunit "Cust-Check Cr. Limit";
        ItemCheckAvail: Codeunit "Item-Check Avail.";
        ApprovalsManagement: Codeunit "Approval mgt custom";
        ECPRec: record "ECP Header";
    begin
        JobRec.INIT;
        JobRec."No." := Rec."No.";
        JobRec.INSERT;
        JobRec.VALIDATE("Bill-to Customer No.", Rec."Bill-to Customer No.");
        JobRec.VALIDATE("Creation Date", TODAY);
        JobRec.VALIDATE("Starting Date", Rec."Starting Date");
        JobRec.VALIDATE("Customer Job Type", Rec."Customer Job Type");
        JobRec.VALIDATE("Job Type Code", Rec."Job Type Code");
        JobRec.VALIDATE("Job Posting Group", Rec."Job Posting Group");
        JobRec.VALIDATE(JobRec."Customer Price Group", Rec."Customer Price Group");
        JobRec.VALIDATE(JobRec."WIP Method", 'COST VALUE');
        JobRec."Job Narration" := Rec.Description;
        JobRec.Description := Rec.Description;
        JobRec.VALIDATE(JobRec."Job Type", Rec."Job Type");
        JobRec."Vehicle Registr. Plate No" := Rec."Registration No.";
        JobRec."ECP No." := Rec."ECP No.";
        JobRec."Location Codes" := Rec."Location Code";

        JobRec."Service Item" := Rec."Registration No.";
        JobRec."Service Vehicle" := rec."Service Vehicle";
        JobRec."FLeet No." := rec."FLeet No.";
        JobRec.Trailer := rec.Trailer;
        JobRec."Trailer No." := rec."Trailer No";
        JobRec."Created By" := UserId;
        JobRec."Created Date" := Today;
        // JobRec."Location Code" := rec."Location Code";

        JobRec."Buisness Type" := Rec."Business Type";
        JobRec.VALIDATE(JobRec."NOVATRACK ID", Rec."NOVATRACK ID");
        JobRec."Vehicle/Equipment Make" := Rec."Vehicle Make";
        JobRec."Vehicle/Equipment Model" := Rec."Vehicle Model";
        JobRec."KM Run" := Rec."KM Run";
        JobRec."KM Odometer Reading" := Rec."KM Odometer Reading";
        JobRec."Phone No 1." := Rec."Phone No 1.";
        JobRec."Phone No. 2." := Rec."Phone No. 2.";
        JobRec.VALIDATE(JobRec."Truck BreakDown No.", Rec."Truck BreakDown No.");                 //ddada
        JobRec."Curr. KM Service/PM Service" := Rec."Curr. KM Service/PM Service";
        JobRec."FLeet No." := Rec."FLeet No.";
        JobRec.VALIDATE(JobRec."Fleet Manager", Rec."Fleet Manager");
        JobRec."User ID" := USERID;
        JobRec."VehReg. No." := Rec."Quote No.";
        JobRec.VALIDATE(JobRec."Registration Card Ref");
        JobRec.VALIDATE(JobRec."Fleet Manager", Rec."Fleet Manager");
        JobRec."Assigned User ID" := USERID;

        VehRegRec.SETRANGE(VehRegRec."Job Card No", Rec."No.");
        //JobRec.Operation :=
        //IF VehRegRec.GET("No.") THEN
        IF VehRegRec.FINDFIRST THEN BEGIN
            JobRec."Vehicle Reporting Date" := VehRegRec."Vehicle Reporting Date";
            JobRec."Vehicle Reporting Time" := VehRegRec."Vehicle Reporting Time";
            JobRec."Vehicle In Date" := VehRegRec."Vehicle In at LM Date";
            JobRec."Vehicle In Time" := VehRegRec."Vehicle In at LM Time";
            JobRec.Description := VehRegRec."Narrative of Problem";
            JobRec."KM Run" := VehRegRec."KM Run";
            JobRec."Starting Date" := VehRegRec."Registration Date";
            JobRec."Vehicle/Equipment Make" := VehRegRec."Vehicle/Equipment Make";
            JobRec."Vehicle/Equipment Model" := VehRegRec."Vehicle/Equipment Model";
            //JobRec."ServiceAPP No." := VehRegRec."ServiceAppNo.";
            JobRec.VALIDATE(JobRec."Registration Card Ref", VehRegRec."Registration ID");

            //Fola12112023 Stamping Job No on ECP
            VehRegRec.CalcFields("ECP No.");
            ECPRec.Reset();
            if ECPRec.Get(VehRegRec."ECP No.") then begin
                ECPRec."J/C No." := Rec."No.";
                ECPRec.Modify();
            end;
            //Fola12112023

            // JobRec.VALIDATE("Estimate Date",VehRegRec."Registration Date");
            // "Job Narration" := VehRegRec."Narrative of Problem";
            JobRec.MODIFY;
        END;

        //JobRec."Job Type":= "Job Type";
        JobRec."Starting Date" := TODAY;
        JobRec.VALIDATE("Global Dimension 1 Code", Rec."Shortcut Dimension 1 Code");
        JobRec.VALIDATE("Global Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
        JobRec.VALIDATE("Shortcut Dimension 3 Code", Rec."Shortcut dimension 3");
        JobRec.VALIDATE("Shortcut Dimension 4 Code", Rec."Shortcut dimension 4");
        JobRec.Validate("Shortcut Dimension 5 Code", Rec."Shortcut Dimension 5 Code");
        JobRec.Validate("Shortcut Dimension 6 Code", Rec."Shortcut Dimension 6 Code");
        JobRec.Validate("Shortcut Dimension 8 Code", rec."Shortcut Dimension 8 Code");
        JobRec.VALIDATE("Responsibility Center", Rec."Responsibility Center");
        JobRec.VALIDATE("Estimate Date", Rec."Order Date");
        Rec.CALCFIELDS("Amount Including VAT");
        JobRec.VALIDATE("Estimate Value (Price)", Rec."Amount Including VAT");
        JobRec.VALIDATE("Assigned User ID", Rec."Assigned User ID");

        JobRec.MODIFY;


        ServiceItemLine.SETRANGE("Document No.", Rec."No.");
        IF ServiceItemLine.FINDSET THEN
            REPEAT
                JobTasks.INIT;
                JobTasks."Job No." := Rec."No.";
                JobTasks."Job Task No." := FORMAT(ServiceItemLine."Line No.");
                //JobTasks.Description := COPYSTR(Description +' '+ "Bill-to Name",1,50);
                JobTasks.Description := COPYSTR(ServItemLine.Description + ' ' + Rec."Bill-to Name", 1, 50);
                //DDADA
                JobTasks."Global Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";                      //DDADA
                JobTasks."Global Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";

                //DDADA
                //JobTasks."Shortcut Dimension 3 Code" := "Shortcut dimension 3";
                //JobTasks."Shortcut Dimension 4 Code" := "Shortcut dimension 4";
                //JobTasks."Customer Job Type" := "Customer Job Type";
                //JobTasks."Job Type Code" := "Job Type Code";
                JobTasks.INSERT(TRUE);

                ServiceLine.SETRANGE(ServiceLine."Document No.", Rec."No.");
                ServiceLine.SETRANGE(ServiceLine."Service Item Line No.", ServiceItemLine."Line No.");
                IF ServiceLine.FINDSET THEN
                    REPEAT
                        JobPlanningLine.INIT;
                        JobPlanningLine."Job No." := Rec."No.";
                        JobPlanningLine."Job Task No." := JobTasks."Job Task No.";
                        JobPlanningLine."Line No." := ServiceLine."Line No.";
                        JobPlanningLine.VALIDATE("Line Type", JobPlanningLine."Line Type"::"Both Budget and Billable");
                        JobPlanningLine.VALIDATE("Planning Date", TODAY);
                        JobPlanningLine.VALIDATE(JobPlanningLine."Customer Price Group", Rec."Customer Price Group");      //DDADA

                        CASE ServiceLine.Type OF
                            ServiceLine.Type::" ":
                                BEGIN
                                    JobPlanningLine.Type := JobPlanningLine.Type::Text
                                END;
                            ServiceLine.Type::Item:
                                BEGIN
                                    JobPlanningLine.Type := JobPlanningLine.Type::Item;
                                    JobPlanningLine.VALIDATE("No.", ServiceLine."No.");
                                    JobPlanningLine.Description := ServiceLine.Description;             //DDADA
                                                                                                        //JobPlanningLine.VALIDATE(Description,ServiceLine.Description);
                                END;
                            ServiceLine.Type::"G/L Account":
                                BEGIN
                                    JobPlanningLine.Type := JobPlanningLine.Type::"G/L Account";
                                    JobPlanningLine.VALIDATE("No.", ServiceLine."No.");
                                    JobPlanningLine.Description := ServiceLine.Description;               //DDADA
                                                                                                          //JobPlanningLine.VALIDATE(Description,ServiceLine.Description);
                                END;
                            ServiceLine.Type::Resource:
                                BEGIN
                                    JobPlanningLine.Type := JobPlanningLine.Type::Resource;
                                    JobPlanningLine.VALIDATE("No.", ServiceLine."No.");
                                    JobPlanningLine.Description := ServiceLine.Description;          //DDADA
                                    JobPlanningLine."Unit of Measure Code" := ServiceLine."Unit of Measure Code";                                                                 //JobPlanningLine.Description:= ServiceLine.Description;

                                END;
                            ServiceLine.Type::Cost:
                                BEGIN
                                    JobPlanningLine.Type := JobPlanningLine.Type::"G/L Account";
                                    IF ServiceCost.GET(ServiceLine."No.") THEN
                                        JobPlanningLine.VALIDATE("No.", ServiceCost."Account No.");
                                    JobPlanningLine.Description := ServiceLine.Description;          //DDADA
                                                                                                     //JobPlanningLine.VALIDATE(Description,ServiceLine.Description);

                                END;

                        END;
                        JobPlanningLine.VALIDATE(Quantity, ServiceLine.Quantity);
                        JobPlanningLine.VALIDATE("Location Code", ServiceLine."Location Code");
                        IF ((ServiceLine.Type = ServiceLine.Type::Item) AND (ServiceLine."Customer Job Type" = 'INTERNAL')) THEN
                            JobPlanningLine.VALIDATE(JobPlanningLine."Unit Price", 0)
                        ELSE
                            JobPlanningLine.VALIDATE("Unit Price", ServiceLine."Unit Price");

                        JobPlanningLine.VALIDATE("Line Discount Amount", ServiceLine."Line Discount Amount");
                        JobPlanningLine.VALIDATE("Customer Job Type", Rec."Customer Job Type");
                        JobPlanningLine.VALIDATE("Job Type Code", Rec."Job Type Code");
                        //JobPlanningLine.VALIDATE("Gen. Bus. Posting Group",'JOBS');   //Removed till we review
                        JobPlanningLine.VALIDATE("Gen. Bus. Posting Group", ServiceLine."Gen. Bus. Posting Group");   // Bring what GBP from the Service Quote 050417
                        JobPlanningLine.VALIDATE("Document No.", ServiceLine."Document No.");

                        //battery and tyre control 04152020
                        //JobPlanningLine.VALIDATE(JobPlanningLine."Approve/Reject",ServiceLine."Approve/Reject");
                        JobPlanningLine.VALIDATE("Allow Approved Usage", ServiceLine."Allow Approved Usage");
                        JobPlanningLine.VALIDATE("Quantity CONSM Per Year", ServiceLine."Quantity CONSM Per Year");
                        JobPlanningLine.VALIDATE("Reason For Approval", ServiceLine."Reason For Approval");
                        JobPlanningLine.VALIDATE("Approved By", ServiceLine."Approved By");
                        JobPlanningLine.VALIDATE("Approval Date", ServiceLine."Approval Date");
                        JobPlanningLine.VALIDATE("Service Item No.", ServiceLine."Service Item No.");
                        //battery and tyre control 04152020 //ddada


                        JobPlanningLine.INSERT(TRUE);
                    UNTIL ServiceLine.NEXT = 0;

            UNTIL ServiceItemLine.NEXT = 0;
        SendEmail(JobRec);
        MESSAGE('%1 converted into Job %2', Rec."No.", JobRec."No.");

        If VehRegRec.Get((JobRec."VehReg. No.")) THEN BEGIN
            VehRegRec.Status := VehRegRec.Status::"Job Card Created";
            VehRegRec.modify;
        END

    end;

    var
        ServMgtSetup: Record "Service Mgt. Setup";
        RepairStatus: Record "Repair Status";
        ServItemLine: Record "Service Item Line";
        ServItemLine2: Record "Service Item Line";
        ServLine: Record "Service Line";
        ServLine2: Record "Service Line";
        ServOrderAlloc: Record "Service Order Allocation";
        NewServHeader: Record "Service Header";
        LoanerEntry: Record "Loaner Entry";
        ServCommentLine: Record "Service Comment Line";
        ServCommentLine2: Record "Service Comment Line";
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeriesMgt: Codeunit "No. Series";
        ServLogMgt: Codeunit ServLogManagement;
        ReserveServiceLine: Codeunit "Service Line-Reserve";

        //ArchServLine:record "Archived Service Line";
        //ArchServHeader:record "Archived Service Header";

        JobRec: Record Job;
        Job: Record Job;
        JobTasks: Record "Job Task";
        ServiceLine: Record "Service Line";
        ServiceItemLine: Record "Service Item Line";
        JobPlanningLine: Record "Job Planning Line";
        ServiceCost: Record "Service Cost";
        VehRegRec: Record "Vehicle Registration";

    local procedure TestNoSeries(): Boolean
    begin
        ServMgtSetup.TESTFIELD("Service Order Nos.");
    end;

    local procedure GetNoSeriesCode(): Code[20]
    begin
        EXIT(ServMgtSetup."Service Order Nos.");
    end;

    procedure ReturnOrderNo(): Code[20]
    begin
        EXIT(NewServHeader."No.");
    end;

    procedure UpdateJob()
    var
        Job: Record Job;
        JobTasks: Record "Job Task";
        ServiceLine: Record "Service Line";
        ServiceItemLine: Record "Service Item Line";
        JobPlanningLine: Record "Job Planning Line";
    begin
    end;

    local procedure SendEmail(Var JRec: Record "Job")
    var
        Email: Codeunit Email;
        EmailMsg: Codeunit "Email Message";
        createSubject: Label 'Job Card Creation';
        customer: Record Customer;
        RecipientEmail: Text[100];
        EmailSent: Boolean;
        MsgBody: Text[200];
    begin
        if JRec."Bill-to Customer No." = '' then
            exit;
        if Customer.Get(JRec."Bill-to Customer No.") then begin
            if (Customer."E-Mail" = '') then
                Error('Email not found in Job card');
            RecipientEmail := customer."E-Mail";
            MsgBody := StrSubstNo('<b>Dear %1,</b> <br><br> A job card <b>%2</b> has been created for you.', customer.Name, JRec."No.");
            EmailMsg.Create(
                RecipientEmail, createSubject, MsgBody, true
            );

            EmailSent := Email.Send(EmailMsg, Enum::"Email Scenario"::Default);

            if not EmailSent then
                Error('Failed to send email to %1.', RecipientEmail);
        end;
    end;
}

