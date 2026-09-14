page 52346 DriversAPI
{
    APIGroup = 'driver';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'driversAPI';
    DelayedInsert = true;
    EntityName = 'driver';
    EntitySetName = 'drivers';
    PageType = API;
    SourceTable = Employee;
    SourceTableView = where(Driver = filter(true));
    Editable = false;
    InsertAllowed = false;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                }
                field(No; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(FirstName; Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field(MiddleName; Rec."Middle Name")
                {
                    ApplicationArea = All;
                }
                field(LastName; Rec."Last Name")
                {
                    ApplicationArea = All;
                }
                field("Phone_No";Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                field("email";Rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                
            }
        }
    }
}
