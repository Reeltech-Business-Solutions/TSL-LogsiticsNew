report 50037 DeleteStaffAdv
{
    Caption = 'DeleteStaffAdv';
    ProcessingOnly = true;

    dataset
    {
        dataitem("Staff Advance Header"; "Staff Advance Header")
        {
            // trigger OnAfterGetRecord()
            // var
            //     Stfadv: Record "Staff Advance Header";
            // begin
            //     Stfadv.Reset();
            //     Stfadv.SetFilter("No.", '%1', 'OSA_240564');
            //     Stfadv.SetFilter("Account No.", '%1', 'STF11739');
            //     if Stfadv.FindFirst() then
            //         Stfadv.Delete();
            //     Message('Document has been deleted');


            // end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
