pageextension 50067 JobPlanningLineExt extends "Job Planning Lines"
{
    layout
    {
        addbefore("Unit Cost")
        {
            field("Consumed Quantity"; Rec."Consumed Quantity")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Consumed Quantity Usage"; Rec."Consumed Quantity Usage")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("LocationCode"; Rec."Location Code")
            {
                ApplicationArea = all;
            }
        }
        addbefore(Quantity)
        {
            field("1Unit of Measure Code"; Rec."Unit of Measure Code")
            {
                ApplicationArea = All;
            }
        }




    }
    actions
    {
        modify("Create &Sales Invoice")
        {
            trigger OnBeforeAction()
            var
                Job: Record Job;
            begin

                if Job.Get(Rec."Document No.") then begin
                    if Job."Workshop Status" <> Job."Workshop Status"::Completed then
                        Error('Workshop Status on Job card must be completed');
                end

            end;
        }
    }

}
