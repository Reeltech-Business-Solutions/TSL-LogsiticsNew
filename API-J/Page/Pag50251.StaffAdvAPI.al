page 50251 StaffAdvAPI
{
    APIGroup = 'StaffAdv';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    Caption = 'staffAdvanceAPI';
    DelayedInsert = true;
    EntityName = 'StaffAdv';
    EntitySetName = 'StaffAdvAPI';
    PageType = API;
    SourceTable = "Staff Advance Header";
    ODataKeyFields = SystemId;
    //Editable = false;
    // InsertAllowed = false;
    // SourceTableView = where(status = const(Open));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    ApplicationArea = All;
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

                // part(Staffadvancelines; "Staff Advance Lines API")
                // {
                //     Caption = 'staff advance';
                //     EntityName = 'Staffadvanceline';
                //     EntitySetName = 'Staffadvancelines';
                //     SubPageLink = "Header Id" = field(SystemId);
                //     // SubPageLink = "No." = field("No.");
                // }

            }



        }




    }

    [ServiceEnabled]
    procedure SendStaffAdvanceApprovalRequest(var actionContext: WebServiceActionContext)
    var
        StaffAdv: Record "Staff Advance Header";
        CreateWorkflowAPI: codeunit CreateWorkflowAPI;
    begin
        CreateWorkflowAPI.SendStaffAdvanceApprovalRequest(Rec."No.");
        actionContext.SetResultCode(WebServiceActionResultCode::Created);
    end;

    [ServiceEnabled]
    procedure CancelStaffAdvanceApprovalRequest(var actionContext: WebServiceActionContext)
    var
        StaffAdv: Record "Staff Advance Header";
        CreateWorkflowAPI: codeunit CreateWorkflowAPI;
    begin
        CreateWorkflowAPI.CancelStaffAdvanceApprovalRequest(Rec."No.");
        actionContext.SetResultCode(WebServiceActionResultCode::Created);
    end;

    [ServiceEnabled]
    procedure RejectStaffAdvanceApprovalRequest(var actionContext: WebServiceActionContext)
    var
        StaffAdv: Record "Staff Advance Header";
        CreateWorkflowAPI: codeunit CreateWorkflowAPI;
    begin
        CreateWorkflowAPI.RejectStaffAdvanceApprovalRequest(Rec."No.");
        actionContext.SetResultCode(WebServiceActionResultCode::Created);
    end;

    [ServiceEnabled]
    procedure DelegateStaffAdvanceApprovalRequest(var actionContext: WebServiceActionContext)
    var
        StaffAdv: Record "Staff Advance Header";
        CreateWorkflowAPI: codeunit CreateWorkflowAPI;
    begin
        CreateWorkflowAPI.DelegateStaffAdvanceApprovalRequest(Rec."No.");
        actionContext.SetResultCode(WebServiceActionResultCode::Created);
    end;

    var
        ApprovalMgt: Codeunit "Approval Mgmt. ExtCal";
        StaffAdv: Record "Staff Advance Header";
        Retirement: Record "Staff Advanc Surrender Header";
        Claim: Record "Staff Claims Header";
        ApprovalsMgt: Codeunit "Approvals Mgmt.";

        UserMgt: Codeunit "User Setup Management BR1";

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Payment Type" := Rec."Payment Type"::Imprest;
        Rec."Account Type" := REc."Account Type"::"Employee";
        Rec.Status := Rec.Status::Approved;
        //   Rec."Account No." := getEmployeeEmail(Rec."employee email");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Account Type" := Rec."Account Type"::"Employee";
        // Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();
        //    Rec."Account No." := getEmployeeEmail(Rec."employee email");
    end;

    procedure getEmployeeEmail(email: code[50]): code[20]
    var
        Employee: Record Employee;
    begin
        Employee.setRange("Company E-Mail", email);
        if employee.findfirst() then begin
            exit(employee."No.");
        end;

    end;
}
