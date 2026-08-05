table 90000 "Tyre Control"
{
//Table50015
    fields
    {
        field(1; "Job No."; Code[20])
        {
            TableRelation = Job;
        }
        field(5; "Vehicle Reg No."; Code[20])
        {
            Description = 'Link to Service Item  .... uPDATE kEY LATER WITH..  vehicle/serial no/aCTIVE';
            TableRelation = "Service Item"."No.";
        }
        field(6;"Code";Integer)
        {
            AutoIncrement = true;
        }
        field(10;"NEW Tyre Serial No.";Code[40])
        {

            trigger OnLookup()
            begin
                IF "NEW Tyre Serial No." = '' THEN
                  EXIT;



                //Job.TESTFIELD("Bill-to Customer No.");
                //Cust.GET(Job."Bill-to Customer No.");
                //"Job Posting Group" := Job."Job Posting Group";
                //VALIDATE("Shortcut Dimension 3 Code" , Job."Shortcut Dimension 3 Code");
                //VALIDATE("Shortcut Dimension 4 Code" , Job."Shortcut Dimension 4 Code");
            end;

            trigger OnValidate()
            begin
                //"Old Tyre Serial No" := xRec."NEW Tyre Serial No.";



                IF Job.GET("Job No.")  THEN
                  "KM Fitted" :=  Job."KM Reading";
                   MODIFY;
                //TyreRec.SETRANGE(,);
                //TyreRec.SETRANGE(TyreRec."NEW Tyre Serial No.","NEW Tyre Serial No.")
                //IF TyreRec.FINDFIRST  THEN
                //ERROR('This tyre Serial no Already Exist in the system on job %1 for truck %2',"Job No.","Vehicle Reg No.");


                "Store Personel Update By":= USERID;
                "SP Date Time Updated":=TODAY;
            end;
        }
        field(20;"New Tyre Size";Option)
        {
            Description = 'LATER ADD CONTROL OF OLD TYRE BEFORE NEW TIRE SERIES';
            OptionCaption = ' ,8'',9'',11 R 22.5,12 R 22.5,315/80R22.5,295/80R22.5';
            OptionMembers = " ","8'","9'","11 R 22.5","12 R 22.5","315/80R22.5","295/80R22.5";
        }
        field(25;"CORRECT SIZE OF TYRES";Code[20])
        {
        }
        field(30;"New Tyre Brand";Code[30])
        {
            TableRelation = "Tyre Setup".Code;

            trigger OnValidate()
            begin
                //"Old Tyre Brand":= xRec."New Tyre Brand";
                TESTFIELD("Old Tyre Serial No");
                TESTFIELD("Old Tyre Brand");
                TESTFIELD("KM Fitted");
                TESTFIELD("Date Removed");
                TESTFIELD("DataClerk/ Service Advisor");



                "Store Personel Update By":= USERID;
                 "SP Date Time Updated":=TODAY;
            end;
        }
        field(40;"Tyre Wheel Location";Option)
        {
            OptionCaption = ''' '',FRONTL,FRONTR,BACKL1,BACKL2,BACKR1,BACKR2,TRO1,TRO2,TRO3,TRO4,TRO5,TRO6,TRI1,TRI2,TRI3,TRI4,TRI5,TRI6';
            OptionMembers = " ",FRONTL,FRONTR,BACKL1,BACKL2,BACKR1,BACKR2,TRO1,TRO2,TRO3,TRO4,TRO5,TRO6,TRI1,TRI2,TRI3,TRI4,TRI5,TRI6;
        }
        field(45;"Position of Tyre Removed";Code[50])
        {
            TableRelation = "TYRE POSITION SETUP";
        }
        field(50;"KM Fitted";Decimal)
        {
            BlankZero = true;
        }
        field(52;"DATE ISSUED(RETURN TO KM FIT.)";Date)
        {
        }
        field(54;"Date Fitted";Date)
        {

            trigger OnValidate()
            begin
                ///Active:= TRUE;
                //"User-Fixed":=USERID;
            end;
        }
        field(60;"Location Fitted";Text[40])
        {
            TableRelation = Location WHERE (Code=FILTER(<>'CV-*'));
        }
        field(70;"Odometer Reading / KM Removed";Decimal)
        {
            BlankZero = true;
        }
        field(75;"Date Removed";Date)
        {

            trigger OnValidate()
            begin
                //Active:= FALSE;
                //"User-Removed":=USERID;
            end;
        }
        field(80;"Location Removed";Text[30])
        {
            TableRelation = Location WHERE (Code=FILTER(<>'CV-*'));
        }
        field(90;"Reason For Replacement";Option)
        {
            NotBlank = true;
            OptionCaption = ' ,Busted,Circumferential Cut,Driver Damage,Inner Cut,Loss in transit, Side Wall Cut, Swollen, Worn Out, Others';
            OptionMembers = " ",Busted,"Circumferential Cut","Driver Damage","Inner Cut","Loss in transit"," Side Wall Cut"," Swollen"," Worn Out"," Others";
        }
        field(100;"Store Officer's Name";Code[70])
        {
            TableRelation = "User Setup";
        }
        field(110;"Driver's Name";Code[70])
        {
        }
        field(111;"Shortcut Dimension 4 Code";Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
                //UpdateReqLine(FIELDNO("Shortcut Dimension 4 Code"));
            end;
        }
        field(112;"Workshop Manager Name";Code[70])
        {
        }
        field(113;x;Code[70])
        {
            TableRelation = User."User Name";
        }
        field(114;"User-Removed";Boolean)
        {

            trigger OnValidate()
            begin
                //"DataClerk/ Service Advisor":= USERID;
                //"DC Date Updated":=TODAY;
            end;
        }
        field(115;xx;Code[70])
        {
        }
        field(116;"Old Tyre Serial No";Code[40])
        {

            trigger OnValidate()
            begin

                "DataClerk/ Service Advisor":= USERID;
                "DC Date Updated":=TODAY;
            end;
        }
        field(117;"Old Tyre Brand";Code[30])
        {
            Description = 'OLD';
            TableRelation = "Tyre Setup".Code;

            trigger OnValidate()
            begin
                "DataClerk/ Service Advisor":= USERID;
                "DC Date Updated":=TODAY;
            end;
        }
        field(118;"Tyre Issue Voucher";Code[20])
        {
        }
        field(119;"Old Tyre Size";Option)
        {
            OptionCaption = ' ,8'',9'',11 R 22.5,12 R 22.5,315/80R22.5,295/80R22.5';
            OptionMembers = " ","8'","9'","11 R 22.5","12 R 22.5","315/80R22.5","295/80R22.5";
        }
        field(121;"Position of Tyres";Text[40])
        {
        }
        field(122;"Store Personel Update By";Code[30])
        {
        }
        field(123;"SP Date Time Updated";Date)
        {
        }
        field(124;Remarks;Text[250])
        {
        }
        field(125;"DataClerk/ Service Advisor";Code[70])
        {
            TableRelation = "User Setup";
        }
        field(126;"DC Date Updated";Date)
        {
        }
        field(127;"User-Fixed";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Job No.","Vehicle Reg No.","Code")
        {
            Clustered = true;
        }
        key(Key2;"Vehicle Reg No.")
        {
        }
        key(Key3;"Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        LOCKTABLE;
        Job.GET("Job No.");
        IF Job.Blocked = Job.Blocked::All THEN
          Job.TestBlocked;
        Job.TESTFIELD("Bill-to Customer No.");
        //Cust.GET(Job."Bill-to Customer No.");
    end;

    var
        Job: Record Job;
        TyreRec: Record "Tyre Control";
}

