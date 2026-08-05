table 80006 "Job Type Code"
{
    LookupPageID = "Job Type Code";

    fields
    {
        field(1; "Customer Job Type"; Code[20])
        {
            TableRelation = "Customer Job Type".Code;
        }
        field(2; "Job Type Code"; Code[20])
        {
        }
        field(3; Description; Text[50])
        {
        }
        field(4; "Customer Code"; Code[20])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                IF CustRec.GET("Customer Code") THEN
                    "Customer Name" := CustRec.Name
                ELSE
                    "Customer Name" := '';
            end;
        }
        field(5; "Customer Name"; Text[50])
        {
            Editable = false;
        }
        field(6; "Job Posting Group"; Code[20])
        {
            TableRelation = "Job Posting Group";
        }
        field(7; "Business Type"; Option)
        {
            OptionCaption = '  ,FBO,FLEET-MAINT,EXTERNAL,REFURBISHED,MOVEABLE,MARKETING,COT,NON-MOVEABLE';
            OptionMembers = "  ",FBO,"FLEET-MAINT",EXTERNAL,REFURBISHED,MOVEABLE,MARKETING,COT,"NON-MOVEABLE";
        }
    }

    keys
    {
        key(Key1; "Customer Job Type", "Job Type Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        CustRec: Record Customer;
}

