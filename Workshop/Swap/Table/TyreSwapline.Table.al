table 90003 "Tyre Swap line"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; "Donor Vehicle Code"; Code[15])
        {
            TableRelation = "Service Item"."No.";
        }
        field(3; "Donor Vehicle Tyre Pos. Left"; Code[20])
        {
        }
        field(4; "Donor Vehicle Tyre Pos. Right"; Code[20])
        {
        }
        field(5; "Receiver Vehicle Code"; Code[15])
        {
            TableRelation = "Service Item"."No.";
        }
        field(6; "RecieverTyrePos.n Old-New Left"; Code[20])
        {
        }
        field(7; "RecieverTyrePos. Old-New Right"; Code[20])
        {
        }
        field(8; "Tyre KM Covered"; Decimal)
        {
        }
        field(9; "Thread Depth"; Decimal)
        {
        }
        field(10; Date; Date)
        {
        }
        field(45; "Position of Truck Tyre OLD"; Code[20])
        {
            TableRelation = "TYRE POSITION SETUP";
        }
        field(46; "Position of ST Tyre OLD"; Code[20])
        {
            TableRelation = "TYRE POSITION SETUP";
        }
        field(47; "Reciever Vehicle Code"; Code[15])
        {
            TableRelation = "Service Item"."No.";
        }
        field(48; "line No."; Integer)
        {
        }

    }

    keys
    {
        key(Key1; "line No.", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

