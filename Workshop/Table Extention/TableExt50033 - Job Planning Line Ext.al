tableextension 50033 "Job Planning Line Ext" extends "Job Planning Line"
{
    fields
    {
        field(50000; "Shortcut Dimension 3 Code"; Code[20]) { }
        field(50001; "Consumed Quantity Usage"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Job Ledger Entry".Quantity WHERE("Job No." = FIELD("Job No."), "Job Task No." = FIELD("Job Task No."), Type = FILTER(Item), "No." = FIELD("No."), "Entry Type" = CONST(Usage)));
        }
        field(50017; "Allow Approved Usage"; Boolean) { }
        field(50018; "User ID- BLocked Item Removed"; Code[50]) { }
        field(50019; "BLocking Notification"; Boolean) { }
        field(50020; "Last Inv Doc"; Code[30]) { }
        field(50021; "Last Inv Date"; Date) { }
        field(50022; "Unblock-Approver"; Code[50]) { }
        field(50082; "Cost Amount"; Decimal) { }
        field(50083; "Send To"; Code[50]) { }
        field(50084; "Sender"; Code[50]) { }
        field(50085; "Send For Approval"; Option)
        {
            OptionMembers = ,Send,"Re-Send";
        }
        field(50086; "Sent Date"; DateTime) { }
        field(50087; "Approve/Reject"; Option)
        {
            OptionMembers = ,Approved,Reject;
        }
        field(50088; "Approved By"; Code[50]) { }
        field(50089; "Approval Date"; DateTime) { }
        field(50092; "Reason For Approval"; Option)
        {
            OptionMembers = ,"SparePart Requesting is More Than Yearly Def. Qty","SparePart Issued + Qty Requesting is More than Yearly Def. Qty","SparePart Requested has already Exceeded the Yearly Def. Qty","SparePart Requesting has been Collected within the Last 6M/1Yr";
        }
        field(50102; "Quo. Gen. Bus. Pst Gr"; Code[20]) { }
        field(50103; "Customer Job Type"; Code[20]) { TableRelation = "Customer Job Type"; }
        field(50104; "Job Type Code"; Code[20])
        {
            TableRelation = "Job Type Code"."Job Type Code" WHERE("Customer Job Type" = FIELD("Customer Job Type"));
        }
        field(50105; "Quotation No."; Code[20]) { }
        field(50108; "Item Type"; Option)
        {
            OptionMembers = ,Spares,Lubricant,Tyres,Battery,Fuel,Others,Labour,Tyres_Accesories,Batt_Accesories;
        }
        field(50109; "Location Inv"; Decimal) { }
        field(50110; "Consumed Quantity"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Job Ledger Entry".Quantity WHERE("Job No." = FIELD("Job No."), Type = FILTER(Item), "No." = FIELD("No.")));
        }
        field(50111; "GPG on Quote"; Code[30]) { }
        field(50112; "Quantity CONSM Per Year"; Decimal) { }
        field(50113; "Service Item No."; Code[20]) { }

    }

}