pageextension 50068 JobTaskLineEx extends "Job Task Lines"
{
    actions
    {
        modify("Create &Sales Invoice")
        {
            trigger OnBeforeAction()
            var
                Job: Record Job;
            begin

                if Job.Get(Rec."Job No.") then begin
                    if Job."Workshop Status" <> Job."Workshop Status"::Completed then
                        Error('Workshop Status on Job card must be completed');
                end

            end;
        }
    }
}
