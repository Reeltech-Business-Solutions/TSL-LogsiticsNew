table 50009 "Invoice Revenue"
{
    Caption = 'Invoice Revenue';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {

        }
        field(2; "Client Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                Cust: Record Customer;
            begin
                Cust.SetRange("No.", "Client Code");
                "Client Name" := Cust.Name;
            end;
        }
        field(3; "Client Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Contract ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "FixedprceperContrat/Trukavail."; Decimal)
        {
            Caption = 'Fixed price per Contract/Truck avail.';
            DataClassification = ToBeClassified;
        }
        field(6; "Variablerate0-30km/TruckAvail."; Decimal)
        {
            Caption = 'Variable rate 0-30km/Truck Avail.';
            DataClassification = ToBeClassified;
        }
        field(7; "Var.rateper30-50km/TruckAvail."; Decimal)
        {
            Caption = 'Variable rate per30-50km/TruckAvail.';
            DataClassification = ToBeClassified;
        }
        field(8; "Var.rateper50-60km/TruckAvail."; Decimal)
        {
            Caption = 'Variable rate per 50-60km/Truck Avail.';
            DataClassification = ToBeClassified;
        }
        field(9; "Var.rateper61-70km/TruckAvail."; Decimal)
        {
            Caption = 'Variable rate per 61-70km/Truck Avail.';
            DataClassification = ToBeClassified;
        }
        field(10; "Var.rateper71-80km/TruckAvail."; Decimal)
        {
            Caption = 'Variable rate per 71-80km/Truck Avail.';
            DataClassification = ToBeClassified;
        }
        field(11; "Var.rateper81-90km/TruckAvail."; Decimal)
        {
            Caption = 'Variable rate per 81-90km/Truck Avail.';
            DataClassification = ToBeClassified;
        }
        field(12; "Var.rateper91-100km/TrukAvail."; Decimal)
        {
            Caption = 'Variable rate per 91-100km/Truck Avail.';
            DataClassification = ToBeClassified;
        }
        field(13; "Var.rateabove100km/TruckAvail."; Decimal)
        {
            Caption = 'Variable rate above 100km/Truck Avail.';
            DataClassification = ToBeClassified;
        }
        field(14; "Var.rateper0-100km/TruckAvail."; Decimal)
        {
            Caption = 'Variable rate per 0-100km/Truck Avail.';
            DataClassification = ToBeClassified;
        }
        field(15; "Variable rate per 101-150km"; Decimal)
        { DataClassification = ToBeClassified; }
        field(16; "Variable rate per 151-200km"; Decimal)
        { DataClassification = ToBeClassified; }
        field(17; "Variable rate per 201-250km"; Decimal)
        { DataClassification = ToBeClassified; }
        field(18; "Variable rate per 250-300km"; Decimal)
        { DataClassification = ToBeClassified; }
        field(19; "Qty loaded"; Decimal)
        { DataClassification = ToBeClassified; }
        field(20; "PEF Freight rate"; Decimal)
        { DataClassification = ToBeClassified; }
        field(21; "Discount rate "; Decimal)
        { DataClassification = ToBeClassified; }
        field(22; "Avalablitypertruck(No of days)"; Decimal)
        {
            Caption = 'Availability per truck (No of days)';
            DataClassification = ToBeClassified;
        }
        field(23; "Round Distance (KM) Covered"; Decimal)
        { DataClassification = ToBeClassified; }
        field(24; "LAFWFxdrateActroshowoTrkAvblty"; Decimal)
        {
            Caption = 'LAF W- Fixed rate/Actros and howo/Truck/Availability';
            DataClassification = ToBeClassified;
        }
        field(25; "LAF W-VarrateActroshowoTrukKM"; Decimal)
        {
            Caption = 'LAF W- Variable rate/Actros and howo/Truck/KM"';
            DataClassification = ToBeClassified;
        }
        field(26; "LAF W- Fixed rate/Hohan"; Decimal)
        { DataClassification = ToBeClassified; }
        field(27; "LAF W- Fixed rate/Scania"; Decimal)
        { DataClassification = ToBeClassified; }
        field(28; "LAF W- Variable rate/Hohan"; Decimal)
        { DataClassification = ToBeClassified; }
        field(29; "LAF W- Variable rate/Scania"; Decimal)
        { DataClassification = ToBeClassified; }
        field(30; "No of bags of cement moved"; Decimal)
        { DataClassification = ToBeClassified; }
        field(31; "Direct Dispatch "; Decimal)
        { DataClassification = ToBeClassified; }
        field(32; "Offloading Depot"; Decimal)
        { DataClassification = ToBeClassified; }
        field(33; "Adjustment for Sunday"; Decimal)
        { DataClassification = ToBeClassified; }
        field(34; "Arrival time at loading point"; Decimal)
        { DataClassification = ToBeClassified; }
        field(35; "DepartureTime fromLoadingPoint"; Decimal)
        { DataClassification = ToBeClassified; }
        field(36; "Residency Time at loadingpoint"; Decimal)
        {
            Caption = 'Residency Time at loading point';
            DataClassification = ToBeClassified;
        }
        field(37; "ArrivalTime at OffloadingPoint"; Decimal)
        {
            Caption = 'Arrival Time at Offloading Point';
            DataClassification = ToBeClassified;
        }
        field(38; "DepartureTimefromOfloadinPoint"; Decimal)
        {
            Caption = 'Departure Time from Offloading Point';
            DataClassification = ToBeClassified;
        }
        field(39; "ResidencyTime at ofloadinpoint"; Decimal)
        {
            Caption = 'Residency Time at off-loading point';
            DataClassification = ToBeClassified;
        }
        field(40; "Arrival Time at Loading point1"; Decimal)
        { DataClassification = ToBeClassified; }
        field(41; "PZCN Loading & Unloading Delay"; Decimal)
        { DataClassification = ToBeClassified; }
        field(42; "PZCNLoadnUnloadnDlaySundyAdjtd"; Decimal)
        {
            Caption = 'PZCN Loading & Unloading Delay (Sunday Adjusted)';
            DataClassification = ToBeClassified;
        }
        field(43; "Travel Time"; Decimal)
        { DataClassification = ToBeClassified; }
        field(44; "Return Time"; Decimal)
        { DataClassification = ToBeClassified; }
        field(45; "Actual Journey Time"; Decimal)
        { DataClassification = ToBeClassified; }
        field(46; "Expected  JT"; Decimal)
        { DataClassification = ToBeClassified; }
        field(47; "Variance (Joruney Time)"; Decimal)
        { DataClassification = ToBeClassified; }
        field(48; "Agreed Adjusted KM"; Decimal)
        { DataClassification = ToBeClassified; }
        field(49; "Rate per loading delay"; Decimal)
        { DataClassification = ToBeClassified; }
        field(50; "Rate per fixed cost"; Decimal)
        { DataClassification = ToBeClassified; }
        field(51; "Variable rate"; Decimal)
        { DataClassification = ToBeClassified; }
        field(52; "Loading delay cost"; Decimal)
        { DataClassification = ToBeClassified; }
        field(53; "Fixed cost"; Decimal)
        { DataClassification = ToBeClassified; }
        field(54; "variable cost"; Decimal)
        { DataClassification = ToBeClassified; }
        field(55; "No of Trips"; Decimal)
        { DataClassification = ToBeClassified; }
        field(56; "Fixed Freight per trip"; Decimal)
        { DataClassification = ToBeClassified; }
        field(57; "Delivery cost per location"; Decimal)
        { DataClassification = ToBeClassified; }
        field(58; "QTY LOADED (Net Weight/KG)"; Decimal)
        { DataClassification = ToBeClassified; }
        field(59; "QTY  OFFLOADED(KG)"; Decimal)
        { DataClassification = ToBeClassified; }
        field(60; "GROSS VARIANCE"; Decimal)
        { DataClassification = ToBeClassified; }
        field(61; "TOLERANCE(KG)"; Decimal)
        { DataClassification = ToBeClassified; }
        field(62; "SHORTAGES"; Decimal)
        { DataClassification = ToBeClassified; }
        field(63; "RATE PER SHORTAGE"; Decimal)
        { DataClassification = ToBeClassified; }
        field(64; "SHORTAGES (AMT)"; Decimal)
        { DataClassification = ToBeClassified; }


    }
    keys
    {
        key(PK; "Client Code")
        {
            Clustered = true;
        }
    }

}
