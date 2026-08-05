table 90001 "TYRE POSITION SETUP"
{
    //table50055

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; "Tyre Position Desc"; Code[80])
        {
        }
    }

    keys
    {
        key(Key1; "Code", "Tyre Position Desc")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup("Code"; "Code", "Tyre Position Desc")
        {
        }
    }
}

