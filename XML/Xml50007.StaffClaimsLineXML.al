xmlport 50007 "Staff Claims Line XML"
{
    Caption = 'Staff Claims Line XML';
    Direction = Import;
    Format = VariableText;
    schema
    {
        textelement(Root)
        {
            tableelement("Staff Claim Lines"; "Staff Claim Lines")
            {
                XmlName = 'StaffClaimLines';
                fieldelement(No; "Staff Claim Lines".No)
                { }
                fieldelement(LineNo; "Staff Claim Lines"."Line No.")
                { }

                fieldelement(Typ; "Staff Claim Lines"."Account type")
                { }
                fieldelement(AcctNo; "Staff Claim Lines"."Account No:")
                { }
                fieldelement(AcctName; "Staff Claim Lines"."Account Name")
                { }
                fieldelement(Amount; "Staff Claim Lines".Amount)
                { }
                fieldelement(ExpDate; "Staff Claim Lines"."Expenditure Date")
                { MinOccurs = Zero; }
                fieldelement(ExpDesc; "Staff Claim Lines".Purpose)
                { }
                fieldelement(GlobalDim1; "Staff Claim Lines"."Global Dimension 1 Code")
                { }
                fieldelement(ShortDim2; "Staff Claim Lines"."Shortcut Dimension 2 Code")
                { }
                fieldelement(ShortDim3; "Staff Claim Lines"."Shortcut Dimension 3 Code")
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
