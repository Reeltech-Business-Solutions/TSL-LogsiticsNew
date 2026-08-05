xmlport 50005 StaffAdvanceLine
{
    Caption = 'StaffAdvanceLine';
    Direction = Import;
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Staff Advance Lines"; "Staff Advance Lines")
            {
                XmlName = 'StaffAdvanceLines';
                fieldelement(LineNo; "Staff Advance Lines"."Line No.")
                { }
                fieldelement(No; "Staff Advance Lines"."No.")
                { }
                fieldelement(AccountNo; "Staff Advance Lines"."Account No.")
                { }
                fieldelement(AccountName; "Staff Advance Lines"."Account Name")
                { }
                fieldelement(Amount; "Staff Advance Lines".Amount)
                { }
                fieldelement(DueDate; "Staff Advance Lines"."Due Date")
                { }
                fieldelement(GlobalDim1; "Staff Advance Lines"."Global Dimension 1 Code")
                { }
                fieldelement(Purpose; "Staff Advance Lines".Purpose)
                { }
                fieldelement(ShortcutDim2; "Staff Advance Lines"."Shortcut Dimension 2 Code")
                { }
                fieldelement(ShortcutDim3; "Staff Advance Lines"."Shortcut Dimension 3 Code")
                { MinOccurs = Zero;  }






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
