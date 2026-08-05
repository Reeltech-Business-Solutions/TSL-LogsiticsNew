page 50253 DepartmentcodeAPI
{
    APIGroup = 'department';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'departmentCodeAPI';
    DelayedInsert = true;
    EntityName = 'department';
    EntitySetName = 'departments';
    PageType = API;
    SourceTable = "Dimension Value";
    SourceTableView = where("Global Dimension No." = const(1));


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(SystemId; Rec.SystemId)
                {
                   
                }
                field(code; Rec.Code)
                {

                }
                field(name; Rec.Name)
                {

                }
            }
        }
    }
}
