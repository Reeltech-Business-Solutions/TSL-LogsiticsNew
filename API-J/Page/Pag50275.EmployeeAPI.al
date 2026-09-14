page 50275 "Employee API"
{
    APIGroup = 'employee';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'employeeAPI';
    DelayedInsert = true;
    EntityName = 'employee';
    EntitySetName = 'employees';
    PageType = API;
    SourceTable = Employee;
    ODataKeyFields = SystemId;
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

                }
                field(no; Rec."No.")
                {

                }
                field(first_name; Rec."First Name")
                {

                }
                field(middle_name; Rec."Middle Name")
                {

                }
                field(last_name; Rec."Last Name")
                {

                }
                field(job_title; Rec."Job Title")
                {

                }
                field(email; Rec."E-Mail")
                {

                }
            }
        }
    }
}
