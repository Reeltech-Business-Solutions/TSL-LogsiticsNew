pageextension 50056 ServiceItemSubformExt extends "Service Item Worksheet Subform"
{
    layout
    {
        addafter(Quantity)
        {



            field("Usage period (Warranty)"; Rec."Usage period (Warranty)")
            {
                ApplicationArea = All;
                StyleExpr = StyleExp;
            }

            field("Has Warranty"; Rec."Has Warranty")
            {
                ApplicationArea = All;
            }

            field("Warranty Confirmed"; Rec."Warranty Confirmed")
            {
                ApplicationArea = All;
            }



            field("Warranty Start D"; Rec."Warranty Start D")
            {
                ApplicationArea = All;
            }

            field("Warranty End D"; Rec."Warranty End D")
            {
                ApplicationArea = All;
            }





        }
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                Item: Record Item;
                Resource: Record Resource;
                JobLedger: Record "Job Ledger Entry";
                ServiceQuoteHeader: Record "Service Header";

            begin
                if Item.Get(Rec."No.") then begin
                    if rec.Type = rec.Type::Item then begin
                        //   rec.Validate("Usage period (Warranty)", Item."Usage period (Warranty)");
                        ServiceQuoteHeader.setRange("No.", Rec."Document No.");
                        if ServiceQuoteHeader.FindFirst() then begin
                            rec."Service Item No." := ServiceQuoteHeader."Service Vehicle";
                            rec.Validate("Service Item No.");
                        end;

                        JobLedger.Reset();
                        JobLedger.SetRange("Service Item No.", rec."Service Item No.");
                        JobLedger.SetRange("Entry Type", JobLedger."Entry Type"::Usage);
                        JobLedger.SetRange(Description, rec.Description);
                        if JobLedger.FindSet() then
                            repeat
                                rec."Warranty Start D" := JobLedger."Warranty Start Date";
                                rec."Warranty End D" := JobLedger."Warranty End Date";
                                if rec."Warranty End D" > Today then
                                    rec."Has Warranty" := true;

                            // if rec."Has Warranty" = true then
                            //     NotificationCodeUnit.ShowNotification();



                            // Message('job ledger %1', JobLedger."Warranty Start Date");
                            until JobLedger.Next() = 0;
                    end
                end
                else if Resource.Get(Rec."No.") then begin
                    if rec.Type = rec.Type::Resource then begin
                        ServiceQuoteHeader.setRange("No.", Rec."Document No.");
                        if ServiceQuoteHeader.FindFirst() then begin
                            rec."Service Item No." := ServiceQuoteHeader."Service Vehicle";
                            rec.Validate("Service Item No.");
                        end;

                    end;
                end;


            end;
        }
    }

    var
        StyleExp: Text;
        NotificationCodeUnit: Codeunit Notification;

    trigger OnAfterGetRecord()
    begin
        StyleExp := 'Bold';
    end;





}
