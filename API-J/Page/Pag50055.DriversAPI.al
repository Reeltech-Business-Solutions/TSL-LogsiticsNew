page 50055 "Drivers API"
{
    APIGroup = 'Fleet';
    APIPublisher = 'CapitalCore';
    APIVersion = 'v1.0';
    Caption = 'driversAPI';
    DelayedInsert = true;
    EntityName = 'Drivers';
    EntitySetName = 'DriversDetails';
    PageType = API;
    SourceTable = Employee;
    SourceTableView = where(Driver = filter(true));
    Editable = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(firstName; Rec."First Name")
                {
                    Caption = 'First Name';
                }
                field(middleName; Rec."Middle Name")
                {
                    Caption = 'Middle Name';
                }
                field(lastName; Rec."Last Name")
                {
                    Caption = 'Last Name';
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
            }
        }
    }
}
