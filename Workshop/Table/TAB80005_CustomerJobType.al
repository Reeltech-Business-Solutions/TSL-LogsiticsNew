table 80005 "Customer Job Type"
{
    LookupPageID = "Customer Job Type";

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        JobTypeCode.SETRANGE("Customer Job Type", Code);
        JobTypeCode.DELETEALL;
    end;

    var
        JobTypeCode: Record "Job Type Code";
}

