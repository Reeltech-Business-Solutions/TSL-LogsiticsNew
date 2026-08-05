table 50015 "ECP Header"
{
    Caption = 'ECP';
    DataClassification = ToBeClassified;
    LookupPageId = "ECP List";

    fields
    {
        field(1; "Doc. No."; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            var

                GLSetup: Record "General Ledger Setup";
            begin
                if "No." <> xRec."No." then begin
                    JobSetup.Get();
                    NoSeriesMgt.TestManual(JobSetup."ECP No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "J/C No."; Code[20])
        {
            Caption = 'J/C No.';
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(4; "No."; Code[20])
        {
            Caption = 'T-No.';
            DataClassification = ToBeClassified;
        }
        field(5; "5th Wheel Serial No."; Code[20])
        {
            Caption = '5th Wheel Serial No.';
            DataClassification = ToBeClassified;
        }
        field(6; Brand; Text[50])
        {
            Caption = 'Brand';
            DataClassification = ToBeClassified;
        }
        field(7; Image; Blob)
        {
            Caption = 'Image';
            SubType = Bitmap;
        }
        field(8; "Description Of Part(Image)"; Blob)
        {
            Caption = 'Description Of Part(Image)';
            SubType = Bitmap;
        }
        field(9; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(10; "Wear Limits"; Blob)
        {

        }
        field(11; "Comments"; Text[250])
        {
            Caption = 'Comments';

        }
        field(12; "Driver's Name"; Code[50])
        {
            TableRelation = Employee where(Driver = const(true));
        }
        field(13; "Staff No"; Text[50])
        {
            // TableRelation = Employee;
        }
        field(14; "Odometer"; Decimal)
        {

        }
        field(15; "Time In"; Time)
        {

        }
        field(16; "Work Order No"; Text[50])
        {

        }
        field(17; "Contract"; Text[50])
        {

        }
        field(18; "Vehicle Registration No."; Code[50])
        {
            Editable = false;
        }
        field(19; "DriverName"; Text[50])
        {

        }
        field(20; "VSI Name"; Text[50])
        {

        }
        field(21; VIN; Code[50])
        {

        }
        field(22; "Inspected By"; code[30])
        {
            TableRelation = Employee;
        }
        field(23; "InspectedbyName"; Text[100])
        {
            Editable = false;
        }


    }
    keys
    {
        key(PK; "Doc. No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if "Doc. No." = '' then begin
            JobSetup.Get();
            JobSetup.TestField("ECP No.");
            "No. Series" := JobSetup."ECP No.";
            if NoSeriesMgt.AreRelated(JobSetup."ECP No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Doc. No." := NoSeriesMgt.GetNextNo("No. Series", Date);
            //   NoSeriesMgt.InitSeries(JobSetup."ECP No.", xRec."No. Series", 0D, "Doc. No.", "No. Series");

            ECPCheckList();
        end;

    end;




    // [Scope('Cloud')


    // procedure AssistEdit(OldECP: Record "ECP Header"): Boolean
    // begin
    //     // with ECP do begin
    //     ECP := Rec;
    //     GLSetup.Get();
    //     GLSetup.TestField("ECP No.");
    //     if NoSeriesMgt.SelectSeries(GLSetup."ECP No.", OldECP."No. Series", "No. Series") then begin
    //         NoSeriesMgt.SetSeries("Doc. No.");
    //         Rec := ECP;
    //         exit(true);
    //     end;

    // end;

    var
        GLSetup: Record "General Ledger Setup";
        //   NoSeriesMgt: codeunit NoSeriesManagement;
        NoSeriesMgt: Codeunit "No. Series";
        ECP: Record "ECP Header";
        JobSetup: Record "Jobs Setup";
        LineCounter: Integer;
        NextLineNo: Integer;
        ECPLine: Record "ECP Line";

    procedure ECPCheckList()
    var

    begin
        if rec."No." <> '' then begin
            LineCounter := 1;
            NextLineNo := 1000;

            ECPLine.Reset();
            ECPLine.SetRange("Document No.", "Doc. No.");
            if not ECPLine.FindFirst() then begin
                for LineCounter := 1 to 23 do begin
                    ECPLine.Init();
                    ECPLine."Document No." := "Doc. No.";
                    ECPLine."Line No." += NextLineNo;
                    case LineCounter of
                        1:
                            begin
                                ECPLine.Description := 'Brakes: Check front and rear brake pads, Brake Discs, Hand Brake etc';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;

                            end;
                        2:
                            begin
                                ECPLine.Description := 'Electrical: Correctness of headlamps, Brake lights, Hazard lights, Side lights, Side lights, horns, reverse alarm, window lifters etc... Battery fluid level, acid density & voltage';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        3:
                            begin
                                ECPLine.Description := 'Dashboard: Lights, Display messages, Speedometer status etc...';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        4:
                            begin
                                ECPLine.Description := 'Chasis and Cabin: Checking the paint, cabin dents, etc...';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        5:
                            begin
                                ECPLine.Description := 'Windscreen, Wipers and mirror : Condition of wipers, mirrors, etc... check for damage.';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        6:
                            begin
                                ECPLine.Description := 'Rubber hoses and Air connections: Visual check';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        7:
                            begin
                                ECPLine.Description := 'Aggregate (Engine, Gearbox, Axies): Visual check';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        8:
                            begin
                                ECPLine.Description := 'Preventive Maintenance Status: (Due or Not Due)';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        9:
                            begin
                                ECPLine.Description := 'Suspension: Check shocks absorbers, Torsion-bar, Tie-rod, etc ...';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;


                        10:
                            begin
                                ECPLine.Description := 'Short Test: Star diagnosis quick test 1 and 2';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        11:
                            begin
                                ECPLine.Description := 'Fuel-level: Check fuel level';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        12:
                            begin
                                ECPLine.Description := 'Kickstarter / Battery Status';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        13:
                            begin
                                ECPLine.Description := 'Tyres + Spare Tyre Condition and position (Adequately secured)';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        14:
                            begin
                                ECPLine.Description := 'Brakes: Check air connections, coupling devices, brake servo, brake lining';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        15:
                            begin
                                ECPLine.Description := 'Suspension: Check springs, ballons, stabilizer, U-bolts, shackle bolt';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        16:
                            begin
                                ECPLine.Description := 'Axle: Check wheel studs, Wheel hub covers';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        17:
                            begin
                                ECPLine.Description := 'Fifth Wheel Inspection: Visual check of king pin, check King pin diameter, Locking jaw, Turntable height platform and coupling, Nipples, springs';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        18:
                            begin
                                ECPLine.Description := 'Brakes Disc Rotos/Sensors : Visual check for clogs, Check Speed Sensor, Check Reader';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        19:
                            begin
                                ECPLine.Description := 'Tracking Device: Visual check of locks, status of Device on Tracking device';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        20:
                            begin
                                ECPLine.Description := 'Discharge Valves: Check compartment 1 2 3';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        21:
                            begin
                                ECPLine.Description := 'Landing Gear: Visual Gear';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        22:
                            begin
                                ECPLine.Description := 'Underride Bar and Side Bar Status (Check for damage and adequacy)';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        23:
                            begin
                                ECPLine.Description := 'Mud Guards and Bumbers Visual Check, tyre inspection.';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        else
                            ECPLine.Description := '';
                    end;
                    ECPLine.Insert();
                end;
            end;
        end;
    end;
}
