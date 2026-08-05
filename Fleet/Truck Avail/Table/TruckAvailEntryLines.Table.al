table 50027 "Truck Avail. Entry Lines"
{
    DrillDownPageID = 50111;
    LookupPageID = 50111;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Description = 'Document No.,Line No.';
        }
        field(2; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(3; "Customer Operation"; Code[20])
        {
            // TableRelation = "FS Setup Table";

            trigger OnValidate()
            begin
                // IF TruckNonAvail.GET("Document No.") THEN
                //   Date := TruckNonAvail.Date;
            end;
        }
        field(4; "Contract No."; Code[20])
        {
            //TableRelation = "FS Setup Table"."LOT NOs." WHERE(CUSTOMER OPERATION=FIELD(Customer Operation));
            TableRelation = "Contract Agreement"."No." where("Customer Code" = field("Customer No."));
            //TableRelation = "Contract Agreement"."No.";
        }
        field(5; Date; Date)
        {
        }
        field(6; Quantity; Decimal)
        {
        }
        field(7; "Leasing Truck No"; Code[20])
        {
            Description = '"Leasing Fixed Asset" WHERE (CUSTOMER OPERATION=FIELD(Customer Operation),LOT NOs.=FIELD(Customer Lot No.))';
            TableRelation = "Fixed Asset";
            /*  // TableRelation = "Leasing Fixed Asset" WHERE("CUSTOMER OPERATION" = FIELD("Customer Operation"),
             //                                            "LOT NOs." = FIELD("Customer Lot No."));
             TableRelation = "Contract Line" where("Document No." = Field("Contract No."));//;, "Contract Code" = field("Contract No."));

             trigger OnValidate()
             begin

                 IF fA.GET("Leasing Truck No") THEN BEGIN
                     //"Customer Operation":= fA."CUSTOMER OPERATION";
                     "Contract No." := fA."Contract Code";
                     "Vehicle Reg. No." := FA."Registration No.";
                     //ddada
                     "Fleet No." := fA."Asset Type No.";
                     //"Customer Operation":= fA."CUSTOMER OPERATION";
                     Quantity := 1;
                     Unavailable := TRUE;


                 END ELSE BEGIN
                     "Vehicle Reg. No." := '';
                     "Fleet No." := '';
                     "Fleet No." := '';
                     "Customer Operation" := '';
                     "Contract No." := '';
                     "Customer No." := '';
                     Quantity := 0;
                     Unavailable := FALSE;
                 END;

                 TruckAvailLines.SETCURRENTKEY("Leasing Truck No", Date);
                 TruckAvailLines.SETRANGE(TruckAvailLines."Leasing Truck No", "Leasing Truck No");
                 TruckAvailLines.SETRANGE(TruckAvailLines.Date, Date);
                 IF TruckAvailLines.FINDFIRST THEN
                     ERROR(Text000, TruckAvailLines."Vehicle Reg. No.", TruckAvailLines.Date);

                 "User ID" := USERID;
                 "Date Updated" := TODAY;

             end; */
        }
        field(8; "Vehicle Name"; Text[30])
        {
        }
        field(9; Unavailable; Boolean)
        {
        }
        field(10; "Entry No."; Code[20])
        {
        }
        field(11; "Document No."; Code[20])
        {
        }
        field(12; "Vehicle Reg. No."; Code[20])
        {
            Editable = false;
        }
        field(13; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(14; "Fleet No."; Code[30])
        {
            Editable = true;
            // TableRelation = "Leasing Fixed Asset".No. WHERE (CUSTOMER OPERATION=FIELD(Customer Operation));
            //TableRelation = "Fixed Asset"."No.";
            trigger OnValidate()
            begin
                /*     IF LeaseFA.GET("Fleet No.") THEN
                     BEGIN
                       "Fleet No." := LeaseFA."Fleet No.";
                 LeaseFA.CALCFIELDS(LeaseFA."MIS-VEHICLE CODE");
                 "Vehicle Reg. No.":= LeaseFA."MIS-VEHICLE CODE";
                 "Customer Operation":= LeaseFA."CUSTOMER OPERATION";
                 "Contract No." := LeaseFA."LOT NOs.";
                 "Leasing Truck No" := LeaseFA."No.";
                 "Customer No." := LeaseFA."Customer No.";
                 Quantity:= 1;
                 Unavailable:= TRUE;
                 //"NovaTrack ID" := LeaseFA."Serial No.(NOVATRACK)";
                 "User ID":=USERID;
                 "Date Updated":=TODAY;
                     END ELSE BEGIN
                       "Vehicle Reg. No." := '';
                       "Fleet No." := '';
                       "Customer Operation":='';
                       "Contract No.":='';
                       "Customer No." :='';
                        Quantity:=0;
                       Unavailable:= FALSE;
                     END;



                     TruckAvailLines.SETCURRENTKEY("Leasing Truck No",Date);
                     TruckAvailLines.SETRANGE(TruckAvailLines."Leasing Truck No","Leasing Truck No");
                     TruckAvailLines.SETRANGE(TruckAvailLines.Date,Date);
                     IF TruckAvailLines.FINDFIRST THEN
                       ERROR(Text000,TruckAvailLines."Vehicle Reg. No.",TruckAvailLines.Date);

                      "User ID":=USERID;
                      "Date Updated":=TODAY;
                      */
            end;
        }
        field(15; "User ID"; Code[50])
        {
        }
        field(16; "Date Updated"; Date)
        {
        }
        field(17; "Vehicle Make"; Code[20])
        {
            TableRelation = "Vehicle Make";
        }
        field(18; "Vehicle Model"; Code[20])
        {
            TableRelation = "Vehicle Model" where("Vehicle Make" = field("Vehicle Make"));
        }

        field(19; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = ToBeClassified;
        }
        field(20; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Fleet No.")
        {
        }
        key(Key3; "Leasing Truck No", Date)
        {
        }
         key(Key4;"Leasing Truck No","Contract No.")
        {
        }

    }

    fieldgroups
    {
    }

    var
        fA: Record "Fixed Asset";
        TruckNonAvail: Record "Truck Availability Entry";
        TruckAvailLines: Record "Truck Avail. Entry Lines";
        Text000: Label 'Truck %1 already marked unavailable for %2, Please check the lines';
        LeaseFA: Record "Fixed Asset";
}

