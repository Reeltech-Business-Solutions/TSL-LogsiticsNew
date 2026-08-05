table 90002 "Tyre Setup"
{
//table50013
    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; "Tyre Name"; Code[70])
        {
        }
        field(3; "Warranty Period (Mnths)"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

