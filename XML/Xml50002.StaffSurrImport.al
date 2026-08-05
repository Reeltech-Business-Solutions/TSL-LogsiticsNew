xmlport 50002 "StaffSurrLines. Import "
{
    Caption = 'StaffSurrender Lines';
    Direction = Import;
    Format = VariableText;
    FieldSeparator = ',';
    schema
    {
        textelement(Root)
        {
            tableelement("Staff Advan Surrender Details"; "Staff Advan Surrender Details")
            {
                XmlName = 'StaffadvSurrDetails';
                fieldelement(SurrenderDocNo; "Staff Advan Surrender Details"."Surrender Doc No.")
                { }
                fieldelement(LineNo; "Staff Advan Surrender Details"."Line No.")
                { }
                fieldelement(AccountNo; "Staff Advan Surrender Details"."Account No:")
                { }
                fieldelement(AccountName; "Staff Advan Surrender Details"."Account Name")
                { }
                fieldelement(Amount; "Staff Advan Surrender Details".Amount)
                { }
                fieldelement(Duedate; "Staff Advan Surrender Details"."Due Date")
                { }
                fieldelement(AdvanceHolder; "Staff Advan Surrender Details"."Advance Holder")
                { }
                fieldelement(Actualspent; "Staff Advan Surrender Details"."Actual Spent")
                { }
                fieldelement(ShortcutDim1; "Staff Advan Surrender Details"."Shortcut Dimension 1 Code")
                { }
                fieldelement(ShortcutDim2; "Staff Advan Surrender Details"."Shortcut Dimension 2 Code")
                { }
                fieldelement(ImprestType; "Staff Advan Surrender Details"."Imprest Type")
                { }           

                fieldelement(StaffAdvDoc; "Staff Advan Surrender Details"."Staff Advance Doc No")
                { MinOccurs = Zero; }

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
