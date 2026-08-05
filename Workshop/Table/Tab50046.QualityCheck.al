table 50046 "Quality Check"
{
    Caption = 'Quality Check';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    JobSetup.Get();
                    NoSeriesMgt.TestManual(JobSetup."Quality Check No.");
                    "No. Series" := '';
                end;
            end;
        }

        field(3; "Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Location;

            trigger OnValidate()
            var
                LocatRec: Record Location;
            begin
                if LocatRec.Get("Location Code") then
                    "Location Name" := LocatRec.Name;
            end;
        }
        field(4; "Truck No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Trailer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Diesel"; Decimal)
        {
            Caption = 'Diesel(Ltrs.)';
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(7; "Date In"; Date)
        {
            Caption = 'DATE IN';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Date Out"; Date)
        {
            Caption = 'DATE OUT';
            DataClassification = ToBeClassified;
        }
        field(9; "Odometer"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Next Serv Date"; Date)
        {
            Caption = 'NEXT SERV. DATE';
            DataClassification = ToBeClassified;
        }
        field(11; "Next MPM"; Date)
        {
            Caption = 'NEXT MPM DATE';
            DataClassification = ToBeClassified;
        }
        field(12; "Location Name"; Text[50])
        {
            Caption = 'Location';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(14; "Job No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger onValidate()
            var
                Job: Record Job;
                ECP: Record "ECP Header";
            begin

                if Job.Get(Rec."Job No.") then begin
                    ECP.SetRange("Vehicle Registration No.", Job."Registration Card Ref");
                    if ECP.FindFirst() then
                        "Driver" := ECP."Driver's Name";
                    Odometer := Job."KM Odometer Reading";
                    "Vehicle Reg No." := Job."VehReg. No.";
                    "Location Code" := Job."Location Codes";
                    "Trailer No." := Job."Trailer No.";
                    "Truck No." := Job."FLeet No.";
                    Validate("Location Code");
                    // QualityCheckLines();



                end;
            end;


        }

        field(2; "Driver"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(19; "Driver Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            // TableRelation = Employee where(Driver = const(true));

        }
        field(15; "Vehicle Reg No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }



    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    var
        JobSetup: Record "Jobs Setup";
        //  NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeriesMgt: Codeunit "No. Series";
        LineCounter: Integer;
        QualityLines: Record "Quality Check Line";
        NextLineNo: Integer;
        EmpRecord: Record Employee;

    trigger OnInsert()
    begin
        begin
            if "No." = '' then begin
                JobSetup.Get();
                JobSetup.TestField("Quality Check No.");
                "No. Series" := JobSetup."Quality Check No.";
                if NoSeriesMgt.AreRelated(JobSetup."Quality Check No.", xRec."No. Series") then
                    "No. Series" := xRec."No. Series";
                "No." := NoSeriesMgt.GetNextNo("No. Series", 0D);
                //  NoSeriesMgt.InitSeries(JobSetup."Quality Check No.", xRec."No. Series", 0D, "No.", "No. Series");
            end;
            Rec."Date In" := Today();

            if EmpRecord.Get(Rec.Driver) then
                "Driver Name" := EmpRecord."Search Name";

            QualityCheckLines();

        end;
    end;

    procedure QualityCheckLines()
    var
        myInt: Integer;
    begin
        if Rec."Job No." <> '' then begin
            LineCounter := 1;
            NextLineNo := 1000;

            QualityLines.SetRange("Document No.", "No.");
            if not QualityLines.FindFirst() then begin
                for LineCounter := 1 to 70 do begin
                    QualityLines.Init();
                    QualityLines."Document No." := Rec."No.";
                    QualityLines."Line No." += NextLineNo;
                    case LineCounter of
                        1:
                            begin
                                QualityLines.Description := 'Minimum of 8 container- Trailer Twist Locks';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;

                        2:
                            begin
                                QualityLines.Description := 'Air System:Pressure Build up(>or=8 Bar) ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        3:
                            begin
                                QualityLines.Description := 'All Adjacent and same axle tyred of same height(vi)';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        4:
                            begin
                                QualityLines.Description := 'Truck Appearance(mudguard,bumper,bulds etc)';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        5:
                            begin
                                QualityLines.Description := 'Secured terminals, insulated covers, secured to T';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        6:
                            begin
                                QualityLines.Description := 'Bonding Cables, hose and bonding points/Plugs ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        7:
                            begin
                                QualityLines.Description := 'Functional Brake Lights';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        8:
                            begin
                                QualityLines.Description := 'Brake System';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        9:
                            begin
                                QualityLines.Description := 'Functional bulbs';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        10:
                            begin

                                QualityLines.Description := 'Bulges';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        11:
                            begin
                                QualityLines.Description := 'Cab, Seat Belt, Internal & External, Neat Tidy';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        12:
                            begin
                                QualityLines.Description := 'Check Cab(must be clean and free of loose objects)';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        13:
                            begin

                                QualityLines.Description := 'Chasis or leaf springs- no cracks';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        14:
                            begin
                                QualityLines.Description := 'Cuts>1 ply deep/rethreat ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        15:
                            begin
                                QualityLines.Description := 'Dash board/Instrument Panel/Warning Devices';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        16:
                            begin
                                QualityLines.Description := 'Vehicle Documents ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;


                        17:
                            begin
                                QualityLines.Description := 'Valid Driver'' s License(must be Class G) ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;

                        18:
                            begin
                                QualityLines.Description := 'Drivers Particulars ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        19:
                            begin
                                QualityLines.Description := 'Drivers PPE ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;

                        20:
                            begin
                                QualityLines.Description := 'Electrical Wiring(no exposure,secure connections)';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;

                        21:
                            begin
                                QualityLines.Description := 'Alternator/Fan/Waterpump Belt/Tension ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;

                        22:
                            begin
                                QualityLines.Description := 'Engine Shielded(at least 1.5m seperation from tank ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;

                        23:
                            begin
                                QualityLines.Description := 'Exhaust System(routing opp.sides from valves) ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;

                        24:
                            begin
                                QualityLines.Description := 'First Aid Kit  ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        25:
                            begin
                                QualityLines.Description := 'Fuel Tank Mechanical Support(Robust & NFlexible)';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        26:
                            begin
                                QualityLines.Description := 'Fuel Tank & Extra Tank  ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        27:
                            begin
                                QualityLines.Description := 'Hazard Lights ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        28:
                            begin
                                QualityLines.Description := 'Head Restraints installed  ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        29:
                            begin
                                QualityLines.Description := 'Headlamps';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        30:
                            begin
                                QualityLines.Description := 'Functional horn and Wiper(Full motion and blades)';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        31:
                            begin
                                QualityLines.Description := 'Functional Indicators';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;

                        32:
                            begin
                                QualityLines.Description := 'Inertia reel 3 point seat belt for all seats';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        33:
                            begin
                                QualityLines.Description := 'Hydraulic Jack';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        34:
                            begin
                                QualityLines.Description := 'Jack Kit';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        35:
                            begin
                                QualityLines.Description := 'Rear light and front light ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;

                        36:
                            begin
                                QualityLines.Description := 'Low Air Pressure Warning Alarm Test ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        37:
                            begin
                                QualityLines.Description := 'Live Tracker On';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        38:
                            begin
                                QualityLines.Description := 'Master Switch';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        39:
                            begin
                                QualityLines.Description := 'Midline capacities marked on the trailer tank ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        40:
                            begin
                                QualityLines.Description := 'No Leakage of oil from engine ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        41:
                            begin
                                QualityLines.Description := 'No Spill from fuel tank ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;

                        42:
                            begin
                                QualityLines.Description := 'Overall vehicle appearance, condition and integrity';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        43:
                            begin
                                QualityLines.Description := 'Overfill Protection System  ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        44:
                            begin
                                QualityLines.Description := 'Fish Eye mirror ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        45:
                            begin
                                QualityLines.Description := 'Wide angle rear view mirror';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        46:
                            begin
                                QualityLines.Description := 'Product identification mark &company logo on vehicle';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        47:
                            begin
                                QualityLines.Description := 'Radiator Cover';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        48:
                            begin
                                QualityLines.Description := 'Rearguards and sideguards';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        49:
                            begin
                                QualityLines.Description := 'Rims not bent or dented';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        50:
                            begin
                                QualityLines.Description := 'Safety Cones (3 minimum) ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        51:
                            begin
                                QualityLines.Description := 'Speedometer and Odometer ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        52:
                            begin
                                QualityLines.Description := 'Spare Tyres(2) ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        53:
                            begin
                                QualityLines.Description := 'Steering and tuntable condition(excessive play in)';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        54:
                            begin
                                QualityLines.Description := 'Tank Calibration certificate/Valid Calibration';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        55:
                            begin
                                QualityLines.Description := 'Trafficators';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        56:
                            begin
                                QualityLines.Description := 'Trailer Tank Hose and Valve';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        57:
                            begin
                                QualityLines.Description := 'Tread Depth >=3mm';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        58:
                            begin
                                QualityLines.Description := 'yre inflation(visble and guage; tube tyres)';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        59:
                            begin
                                QualityLines.Description := 'Tank Calibration certificate/Valid Calibration';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        60:
                            begin
                                QualityLines.Description := 'Valid Hackney Permit/Cariage License';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        61:
                            begin
                                QualityLines.Description := 'Valid Insurance ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        62:
                            begin
                                QualityLines.Description := 'Valid Road Worthiness certificate ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        63:
                            begin
                                QualityLines.Description := 'Valid Truck Registration/License';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        64:
                            begin
                                QualityLines.Description := 'Warning Triangles(c caution, reflector stickers)';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        65:
                            begin
                                QualityLines.Description := 'Wheels(Check if nuts and studs are complete)';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        66:
                            begin
                                QualityLines.Description := 'Windshield(not broken or cracked;lamination double';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        67:
                            begin
                                QualityLines.Description := 'Wiper-Full Motions and Blade Condition';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        68:
                            begin
                                QualityLines.Description := 'Wiper Washer and Tank - Spray Condition';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        69:
                            begin
                                QualityLines.Description := 'Wooden Wedge(2), Triangular Type';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;
                        70:
                            begin
                                QualityLines.Description := 'Correct warning Panels ';
                                QualityLines.InspectedBy := UserId;
                                QualityLines.DateInspected := Today;
                            end;



                        else
                            QualityLines.Description := '';
                    end;

                    QualityLines.Insert();
                end;
            end;
        end;
    end;

}
