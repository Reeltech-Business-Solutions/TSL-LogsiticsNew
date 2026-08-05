xmlport 50006 "Staff Claims Header XML"
{
    Caption = 'Staff Claims Header XML';
    Direction = Import;
    Format = VariableText;
    schema
    {
        textelement(Root)
        {
            tableelement("Staff Claims Header"; "Staff Claims Header")
            {
                XmlName = 'StaffClaims';
                fieldelement(No; "Staff Claims Header"."No.")
                { }
                fieldelement(Date; "Staff Claims Header".Date)
                { }
                fieldelement(StaffNo; "Staff Claims Header"."Account No.")
                {
                }
                fieldelement(Payee; "Staff Claims Header".Payee)
                { }
                fieldelement(GlobalDim1; "Staff Claims Header"."Global Dimension 1 Code")
                {
                }
                fieldelement(ShortDim2; "Staff Claims Header"."Shortcut Dimension 2 Code")
                {
                }
                fieldelement(Dim3; "Staff Claims Header"."Shortcut Dimension 3 Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Reimbursement; "Staff Claims Header".Purpose)
                { }
                fieldelement(Status; "Staff Claims Header".Status)
                { }
                fieldelement(RespCenter; "Staff Claims Header"."Responsibility Center")
                { }


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
