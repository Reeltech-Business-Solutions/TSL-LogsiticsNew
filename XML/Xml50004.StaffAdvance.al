xmlport 50004 StaffAdvance
{
    Caption = 'StaffAdvance';
    Direction = Import;
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Staff Advance Header"; "Staff Advance Header")
            {
                XmlName = 'StaffAdvance';
                fieldelement(No; "Staff Advance Header"."No.")
                { }
                fieldelement(Date; "Staff Advance Header".Date)
                { }
                fieldelement(Payee; "Staff Advance Header".Payee)
                { }
                fieldelement(PayingBank; "Staff Advance Header"."Paying Bank Account")
                { }
                fieldelement(ShortcutDim1; "Staff Advance Header"."Shortcut Dimension 1 Code")
                { }
                fieldelement(ShortcutDim2; "Staff Advance Header"."Shortcut Dimension 2 Code")
                { }
                fieldelement(ShortcutDim3; "Staff Advance Header"."Shortcut Dimension 3 Code")
                { MinOccurs = Zero; }
                fieldelement(BankName; "Staff Advance Header"."Bank Name")
                { }
                fieldelement(Paymode; "Staff Advance Header"."Pay Mode")
                { }
                fieldelement(RespCenter; "Staff Advance Header"."Responsibility Center")
                { }
                fieldelement(Accounttype; "Staff Advance Header"."Account Type")
                { }
                fieldelement(AccountNo; "Staff Advance Header"."Account No.")
                { }
                fieldelement(Purpose; "Staff Advance Header".Purpose)
                { }
                fieldelement(Status; "Staff Advance Header".Status)
                { }

                trigger OnBeforeInsertRecord()
                begin
                    "Staff Advance Header".Validate("Shortcut Dimension 1 Code");
                end;

            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

}
