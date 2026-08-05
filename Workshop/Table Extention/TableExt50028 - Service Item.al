tableextension 50028 "Service Item Ext" extends "Service Item"
{
    fields
    {
        field(50000; "Lot No."; Option)
        {
            OptionMembers = ,"Lot 1","Lot 2","Lot 3","Lot 4","Lot 5","Lot 6","Lot 7","Lot 8","Lot 9","Lot 10","Lot 11","Lot 12","3 Unit Lot","22 Unit Lot","Old Lot 13","New Lot 20","KT-20Pallet","KT-24Pallet","OT-10pallet","OT-20pallet","OT-22pallet";

        }
        field(50001; Plant; Code[20])
        {

        }
        field(50002; Depot; Code[20])
        {

        }
        field(50003; Make; Code[20])
        {
            Caption = 'Vehicle Make';
            TableRelation = "Vehicle Make".code;

            trigger OnValidate()
            var
                VehcM: Record "Vehicle Make";
            begin
                if make = '' then
                    Model := '';
                if VehcM.Get(Make) then
                    Model := '';

            end;
        }
        field(50004; Model; Code[20])
        {
            TableRelation = "Vehicle Model" where("Vehicle Make" = field(Make));

        }
        field(50005; "Chasis No."; Code[50])
        {
            trigger OnValidate()
            var
                Servc: Record "Service Item";
            begin
                Servc.SetRange(Servc."Chasis No.", "Chasis No.");
                if Servc.FindFirst() then
                    Error('Chasis No. already exist');
            end;
        }
        field(50006; "Engine No."; Code[20])
        {
            trigger OnValidate()
            var
                Servc: Record "Service Item";
            begin
                Servc.SetRange(Servc."Engine No.", "Engine No.");
                if Servc.FindFirst() then
                    Error('Engine No. already exist');
            end;
        }
        field(50007; "Vehicle Type"; Code[20])
        {
            TableRelation = "Vehicle Make";

        }
        field(50008; "Vehicle Reg. No."; Code[20])
        {
            trigger OnValidate()
            var
                Servc: Record "Service Item";

            begin
                Servc.SetRange(Servc."Vehicle Reg. No.", "Vehicle Reg. No.");
                if Servc.FindFirst() then
                    Error('Vehicle Reg. No. already exist');
            end;

        }
        field(50009; "Flee Veht No."; Code[15])
        {
            // TableRelation = Service LookUp.Code WHERE (Type=CONST("Fleet No"))
            trigger OnValidate()
            var
                Servc: Record "Service Item";
            begin
                Servc.SetRange(Servc."Flee Veht No.", "Flee Veht No.");
                if Servc.FindFirst() then
                    Error('Asset No. already exist');
            end;

        }
        field(50010; "Customer Name"; Text[50])
        {

        }
        field(50011; "Navatrack ID (VEH)"; Code[15])
        {

        }
        field(50012; "FA Asset TRUCK No."; Code[15])
        {
            TableRelation = "Fixed Asset"."No.";

        }
        field(50013; "Blocked By MIS"; Boolean)
        {

        }
        field(50014; "MACHINE TYPE"; Option)
        {
            OptionMembers = ,Trailer,Truck,"Semi-Trailer",Rigid,Tractor,Bus,Coach,"Other Vehicle";

        }
        field(50015; "MIS-DEPT"; Code[20])
        {

        }
        field(50016; "MIS-P-LOCATION"; Code[20])
        {

        }
        field(50017; "MIS-PRODUCT GROUP"; Code[20])
        {

        }
        field(50018; "MIS-VEHICLE CODE"; Code[20])
        {

        }
        field(50019; "Buisness Type"; Option)
        {
            OptionMembers = ,FBO,"RT_FLEET-MAINT",EXTERNAL,REFURBISHED_ENGPARTs,MOVEABLE,MARKETING,COT,NON_MOVEABLE,"PM_FLEET-MAINT";

        }
        field(50020; "User Email"; Text[80])
        {

        }
        field(50021; "User Person"; Code[30])
        {

        }
        field(50022; "Repeat Repair"; Boolean)
        {

        }
        field(50023; "Reason For Repeat Repair"; Text[250])
        {

        }
        field(50024; "Reason For Repeat Repair Contd"; Text[250])
        {

        }
        field(50025; "Dept Taking Responsibility"; Option)
        {
            OptionMembers = ,FS,LM,AFS,SP,MACHINESHOP,FM;

        }
        field(50026; "Acquistion Date"; Date)
        {
            /*   TableRelation = Lookup("FA Ledger Entry"."Posting Date" WHERE (Vehicle Diension=FIELD("No."),FA Posting Type=CONST(Depreciation))) */

        }
        field(50027; "Age Group"; Option)
        {
            OptionMembers = "1 Yr","2 YRS","3YRS","4YRS","5YRS","6YRS";

        }
        field(50028; ODO; Boolean)
        {

        }
        field(50029; "Old Chasis No."; Code[50])
        {

        }
        field(50030; "Old Engine No."; Code[20])
        {

        }
        field(50031; "Base Location"; Code[30])
        {
            TableRelation = Location;
        }
        field(50032; "Fleet Mgr Code"; Code[20])
        {
            /*
            TableRelation = Employee;
            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                if Emp.Get("Fleet Mgr Code") then
                    Emp.SetRange("No.", "Fleet Mgr Code");
                if Emp.find('-') then
                   "Fleet Manager Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
            end;
           */
        }
        field(50033; "Fleet Manager Name"; Text[100])
        {

        }
        field(50034; Operation; Option)
        {
            OptionMembers = ,NBC,PZ,FRIGOGLASS,"NIGERIA BREWERIES",CHIVITA;

        }
        field(50035; "Fleet Mgr  Phone No."; Code[20])
        {

        }
        field(50036; "Fleet Manager Email"; Text[70])
        {

        }
        field(50037; "UPDATE leasing fleet"; Code[20])
        {

        }
        field(50038; "FM Location"; Code[20])
        {

        }
        field(50039; "Date In Service"; Date)
        {

        }
        field(50099; PGC; Code[20])
        {

        }
        field(50040; "Customer Type"; Option)
        {
            OptionMembers = ,Internal,External,Warranty,Contract,"Lease Operation";

        }
        field(50041; "Tyre Balance"; Decimal)
        {

        }
        field(50042; "Lubricant Balance"; Decimal)
        {

        }
        field(50043; "Fuel Balance"; Decimal)
        {

        }
        field(50044; "Battery Balance"; Decimal)
        {

        }
        field(50045; "Others Balance"; Decimal)
        {
            CalcFormula = Sum("Service Ledger Entry"."Amount (LCY)" WHERE("Service Item No. (Serviced)" = FIELD("No."), "Item Type" = FILTER(Others)));
            FieldClass = FlowField;
        }
        field(50046; "KM Reading"; Decimal)
        {

        }
        field(50047; "Customer Type MIS"; Option)
        {
            OptionMembers = ,Internal,External,Warranty,Contract,"Lease Operation",Insurance,GroupHead;

        }
        field(50048; "Life Span"; Integer)
        {

        }
        field(50049; Age; Integer)
        {

        }
        field(60000; "Contract Code"; Code[20])
        {

        }
        field(60001; "Preventive Maintenace Cycle"; integer)
        {

        }
        field(60002; "Vehicle Picture"; Blob)
        {
            Caption = 'Vehicle Picture Front';
            Subtype = Bitmap;
            DataClassification = ToBeClassified;
        }
        field(60003; "Vehicle PicS"; Blob)
        {
            Caption = 'Vehicle Picture Side';
            Subtype = Bitmap;
            DataClassification = ToBeClassified;
        }
        field(60004; "Vehicle PicB"; Blob)
        {
            Caption = 'Vehicle Picture Back';
            Subtype = Bitmap;
            DataClassification = ToBeClassified;
        }
        field(60005; "Machine Type2"; Text[50])
        {
            Caption = 'Trailer';
            TableRelation = "Service Item" where("MACHINE TYPE" = filter('Trailer'));
        }
        modify("Location of Service Item")
        {
            TableRelation = Location;
        }
    }
    fieldgroups
    {
        addlast(DropDown; "Flee Veht No.")
        {

        }
    }
}