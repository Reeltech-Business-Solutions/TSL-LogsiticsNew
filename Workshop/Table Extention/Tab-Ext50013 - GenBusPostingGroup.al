tableextension 50013 "Gen.Bus.PostingGroup" extends "Gen. Business Posting Group"
{
    fields
    {
        field(50000; "Lubricant"; Boolean) { }
        field(50001; "Service Only"; Boolean) { }
        field(50103; "Customer Job Type"; Code[20]) { }
        field(50104; "Job Type Code"; Code[20]) { }
        field(50105; "Job Purchases"; Boolean) { }
        field(50106; "Non-Location Transfer Usage"; Boolean) { }
        field(50107; "Blocked"; Boolean) { }

    }
}
