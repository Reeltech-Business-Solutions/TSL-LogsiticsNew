pageextension 50064 ITManagerRoleExt extends "Administrator Role Center"
{
    actions
    {
        addafter(Workflow)
        {
            group(Setup)
            {
                Caption = 'Set Up';
                action("Job Type Code")
                {
                    Caption = 'Job Type Code Set up';
                    ApplicationArea = All;
                    RunObject = page "Job Type CodeAdmin";
                }
            }
        }
    }
}
