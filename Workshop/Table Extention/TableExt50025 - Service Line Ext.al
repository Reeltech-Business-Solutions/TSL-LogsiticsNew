tableextension 50025 "Service Line Ext" extends "Service Line"
{
    fields
    {
        field(50001; "Suggested Qty"; Decimal)
        {

        }
        field(50002; Status; Option)
        {
            OptionMembers = Open,"In Process",Finished,"On Hold";

        }
        field(50003; "Creation Date"; Date)
        {

        }
        field(50004; ".x"; Decimal)
        {

        }
        field(50005; "Quantity Issued"; Decimal)
        {

        }
        field(50006; "Inventory at Branch"; Decimal)
        {

        }
        field(50007; "..xx"; Decimal)
        {

        }
        field(50008; "Unblock Usage"; Boolean)
        {

        }
        field(50012; "Customer Job Type"; Code[20])
        {

        }
        field(50013; "Job Type Code"; Code[20])
        {

        }
        field(50016; "Total Cost Amount"; Decimal)
        {

        }
        field(50017; "Allow Approved Usage"; Boolean)
        {

        }
        field(50018; "User ID- BLocked Item Removed"; Code[50])
        {

        }
        field(50019; "BLocking Notification"; Boolean)
        {

        }
        field(50020; "Last Inv Doc"; Code[30])
        {

        }
        field(50021; "Last Inv Date"; Date)
        {

        }
        field(50022; "Unblock-Approver"; Code[50])
        {

        }
        field(50082; "Cost Amount"; Decimal)
        {

        }
        field(50083; "Send To"; Code[50])
        {

        }
        field(50084; Sender; Code[50])
        {

        }
        field(50085; "Send For Approval"; Option)
        {
            OptionMembers = ,Send,"Re-Send";
        }
        field(50086; "Sent Date"; DateTime)
        {

        }
        field(50087; "Approve/Reject"; Option)
        {
            OptionMembers = ,Approved,Reject;
        }
        field(50088; "Approved By"; Code[50])
        {

        }
        field(50089; "Approval Date"; DateTime)
        {

        }
        field(50090; "Reasons for Rejecting Part"; Text[250])
        {

        }
        field(50091; "Quantity CONSM Per Year"; Decimal)
        {

        }
        field(50092; "Reason For Approval"; Option)
        {
            OptionMembers = ,"SparePart Requesting is More Than Yearly Def. Qty","SparePart Issued + Qty Requesting is More than Yearly Def. Qty","SparePart Requested has already Exceeded the Yearly Def. Qty","SparePart Requesting has been Collected within the Last 6M/1Yr";

        }
        field(50093; "Quantity Requesting For approv"; Decimal)
        {

        }
        field(90000; "Invoiced Lines"; Code[20])
        {

        }
        field(89014; "Inventory Dynamic"; Decimal)
        {

        }
        field(89013; "User ID"; Code[30])
        {

        }
        field(89012; "Item Type"; Option)
        {
            OptionMembers = ,Spares,Lubricant,Tyres,Battery,Fuel,Others,Labour,Tyres_Accesories;
        }
        field(89011; "Header Status"; Text[30])
        {

        }
        field(89010; "Retails markup"; Decimal)
        {

        }
        field(89009; "Return to Store"; Boolean)
        {

        }
        field(89008; DifferenceWIP; Decimal)
        {

        }
        field(89007; "WIP Total Cost"; Decimal)
        {

        }
        field(89006; "39004253"; Decimal)
        {

        }
        field(89005; "Posted Service Inv Qty."; Decimal)
        {

        }
        field(89004; Code; Code[20])
        {

        }
        field(89015; "Usage period (Warranty)"; DateFormula)
        {
            Editable = false;
        }

        field(89016; "Remaining Days"; Integer)
        {
            caption = 'Warranty Remaining Days';
        }
        field(89017; "Warranty Start D"; Date)
        {
            Caption = 'Warranty Start Date';
            Editable = false;
        }

        field(89019; "Warranty End D"; Date)
        {
            Caption = 'Warranty End Date';
            Editable = false;
        }


        field(89018; "Has Warranty"; Boolean)
        {
            Caption = 'Has Warranty';
            Editable = false;
        }

        field(89020; "Warranty Confirmed"; Boolean)
        {
            Caption = 'Warranty Confirmed';
            // Editable = false;
            trigger OnValidate()
            var
                UserSet: Record "User Setup";
            begin
                if UserSet.Get(UserId) then begin
                    if UserSet."Confirm warranty" = false then
                        Error('You are not permitted to perform this action. Kindly contact your system administration');
                end;
            end;
        }

    }




}