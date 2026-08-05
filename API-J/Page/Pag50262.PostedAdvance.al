page 50262 "Posted Advance"
{
    APIGroup = 'StaffAdv';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'postedAdvance';
    DelayedInsert = true;
    EntityName = 'postedAdvance';
    EntitySetName = 'postedAdvances';
    PageType = API;
    SourceTable = "Staff Advance Header";
    SourceTableView = where(Status = const(Posted));
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                   
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }
                field("date"; Rec."Date")
                {
                    Caption = 'Date';
                    ApplicationArea = All;
                }
               

                field(department_name; Rec."Function Name")
                {

                    ApplicationArea = All;
                }

                field(responsibility_center; Rec."Responsibility Center")
                {

                    ApplicationArea = All;
                }
                field(employee_email; Rec."employee email")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        Employee: Record Employee;
                    begin
                        Employee.Reset();
                        Employee.setRange("Company E-Mail", LowerCase(Rec."employee email"));
                        if Employee.FindFirst() then
                            Rec.Validate("Account No.", Employee."No.")
                        else
                            Error('No employee found with email %1', Rec."employee email");
                    end;
                }
                 field(department_code; Rec."Shortcut Dimension 1 Code")
                {

                    ApplicationArea = All;
                }

                // field(system_employee_no; getEmployeeEmail(Rec."employee email"))
                // {

                //     ApplicationArea = All;
                // }
                field(payee; Rec.Payee)
                {
                    Caption = 'Payee';
                    ApplicationArea = All;
                }
                field(area_code; Rec."Shortcut Dimension 3 Code")
                {

                    ApplicationArea = All;
                }
                field(job_no; Rec."job no")
                {
                    Caption = 'Job';
                    ApplicationArea = all;
                }

                field(purpose; Rec.Purpose)
                {
                    Caption = 'Purpose';
                    ApplicationArea = All;
                }
                field(cashier; Rec.Cashier)
                {
                    Caption = 'Cashier';
                    ApplicationArea = All;
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                    ApplicationArea = All;
                }
                field(total_net_amount; Rec."Total Net Amount")
                {
                    Caption = 'Total Net Amount';
                    ApplicationArea = All;
                }

                field(cheque_no; Rec."Cheque No.")
                {
                    Caption = 'Cheque No.';
                    ApplicationArea = All;
                }
                field(system_id; Rec.SystemId)
                {
                    Caption = 'SystemId';
                    ApplicationArea = All;
                }


                part(lines; StaffAdvanceLines)
                {
                    EntitySetName = 'lines';
                    EntityName = 'line';
                    //   SubPageLink = "No." = field("No.");
                    SubPageLink = "Header Id" = field(systemId);
                }

            }

            }
        }
    }

