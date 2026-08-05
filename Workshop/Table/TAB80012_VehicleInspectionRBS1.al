table 80012 "Vehicle Inspection RBS1"
{

    fields
    {
        field(10; "No."; Code[30])
        {
        }
        field(15; "Vehicle Registration ID"; Code[50])
        {

            trigger OnValidate()
            begin
                /*   IF VehicleReg.GET("Vehicle Registration ID")  THEN
                    //  "Vehicle Type" :=
                    Model := VehicleReg."Vehicle/Equipment Model";
                    "Chasis No." := VehicleReg."Chassis No.";
                    "Engine No." := VehicleReg."Engine Serial Number" ;
                    //Location :=
                   */

            end;
        }
        field(20; "Vehicle Make"; Code[50])
        {
            TableRelation = OEM;

            trigger OnValidate()
            var
                VehicleReg: Record "Vehicle Registration";
                VEH: Record OEM;
            begin

                IF VEH.GET("Vehicle Make") THEN
                    "Vehicle Make Description" := VEH.Name;
            end;
        }
        field(25; "Vehicle Make Description"; Text[50])
        {
        }
        field(30; "Vehicle Model"; Code[50])
        {
            TableRelation = "Vehicle Model" where("Vehicle Make" = field("Vehicle Make"));
        }
        field(40; "Vehicle Chasis No."; Text[100])
        {
        }
        field(50; "Vehicle Engine No."; Text[50])
        {
        }
        field(60; Location; Code[50])
        {
            TableRelation = Location.Code;
        }
        field(70; "Inspected By"; Code[50])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                IF Employee.GET("Inspected By") THEN
                    "Inspected By Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
            end;
        }
        field(75; "Inspected By Name"; Text[100])
        {
        }
        field(80; "Date Inspected"; Date)
        {
        }
        field(180; Remarks; Text[250])
        {
        }
        field(190; "No Series"; Code[20])
        {
        }
        field(200; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved;
        }
        field(210; "Responsility Center"; Code[30])
        {
            ///TableRelation = "Responsibility Center BR";
        }
        field(230; "Customer No."; Code[50])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                IF Cust.GET("Customer No.") THEN
                    "Customer Name" := Cust.Name;
            end;
        }
        field(250; "Customer Name"; Text[100])
        {
            Editable = false;
        }
        field(251; "Light and Wiper Operation"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(252; "Tires and Spare Tyre"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(253; "Engine Oil Level"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(254; "Engine(Start it)"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(255; "Tool Box"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(256; "Delivery of User Manual"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(257; "Inform Customer on Warranty Te"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(258; "Manintainance and Warranty"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(259; "The Truck is Clean"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(260; "Check Data of truck/License"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(261; "Present Assesories of truck"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(262; "Physical Condition"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(263; "Owner's Manual"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(264; Jack; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(265; "Spanner Set"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(266; "Wheel Spanner"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(267; "keys"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(268; "Fire Extinguisher"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(269; "C-Caution"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(270; "Side Mirror"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(271; "Inform Cust On Maintainance"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(272; "Operations and Accessories"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(273; "Check data of Truck VS Licence"; Option)
        {
            OptionCaption = ' ,No,Yes';
            OptionMembers = " ",No,Yes;
        }
        field(274; "Customer's Contact Person"; Text[100])
        {
        }
        field(275; Approved; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
    //NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        IF "No." = '' THEN BEGIN
            Sales.GET;
            Sales.TESTFIELD(Sales."Vehicle Inspection No.");
            "No Series" := Sales."Vehicle Inspection No.";
            if NoSeriesMgt.AreRelated(Sales."Vehicle Inspection No.", xRec."No Series") then
                "No Series" := xRec."No Series";
            "No." := NoSeriesMgt.GetNextNo("No Series", 0D);
            //  NoSeriesMgt.InitSeries(Sales."Vehicle Inspection No.", xRec."No Series", 0D, "No.", "No Series");
        END;
    end;

    var
        Sales: Record "Sales & Receivables Setup";
        //  NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeriesMgt: Codeunit "No. Series";
        VehicleReg: Record "Vehicle Registration";
        Cust: Record Customer;
        Employee: Record Employee;
}

