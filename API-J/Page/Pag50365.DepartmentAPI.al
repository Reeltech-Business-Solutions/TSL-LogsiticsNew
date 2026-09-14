page 50365 DepartmentAPI
{
    APIGroup = 'dept';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'departmentAPI';
    DelayedInsert = true;
    EntityName = 'dept';
    EntitySetName = 'depts';
    PageType = API;
    SourceTable = "Dimension Value";
    SourceTableView = where("Global Dimension No." = const(6), "Dimension Value Type" = const(Standard));

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
