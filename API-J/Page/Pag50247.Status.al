page 50247 Status
{
    APIGroup = 'Status';
    APIPublisher = 'CapitalCore';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'status';
    DelayedInsert = true;
    EntityName = 'Status';
    EntitySetName = 'StatusAPI';
    PageType = API;
    SourceTable = "Vehicle Registration";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(fLeetNo; Rec."FLeet No.")
                {
                    Caption = 'FLeet No.';
                }
                field(jobCardNo; Rec."Job Card No")
                {
                    Caption = 'Job Card No';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(registrationID; Rec."Registration ID")
                {
                    Caption = 'Registration ID';
                }


            }
        }
    }
}
