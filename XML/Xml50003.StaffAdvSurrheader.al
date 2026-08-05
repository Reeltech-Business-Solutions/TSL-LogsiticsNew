xmlport 50003 StaffAdvSurrheader
{
    Caption = 'StaffAdvSurrheader';
    Direction = Import;
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Staff Advanc Surrender Header"; "Staff Advanc Surrender Header")
            {
                XmlName = 'StaffsurrHeader';

                fieldelement(No; "Staff Advanc Surrender Header"."No.")
                { }
                fieldelement(SurrenderDate; "Staff Advanc Surrender Header"."Surrender Date")
                { }
                fieldelement(BankCode; "Staff Advanc Surrender Header"."Bank Code")
                { }

                fieldelement(AccountType; "Staff Advanc Surrender Header"."Account Type")
                { }
                fieldelement(StaffNo; "Staff Advanc Surrender Header"."Account No.")
                { }
                fieldelement(StaffName; "Staff Advanc Surrender Header"."Account Name")
                { }
                fieldelement(Amount; "Staff Advanc Surrender Header".Amount)
                { MinOccurs = Zero; }
                fieldelement(Remarks; "Staff Advanc Surrender Header".Remarks)
                { }
                fieldelement(PayingBnakAcct; "Staff Advanc Surrender Header"."Paying Bank Account")
                { MinOccurs = Zero; }
                fieldelement(Payee; "Staff Advanc Surrender Header".Payee)
                { }
                fieldelement(GlobalDim1; "Staff Advanc Surrender Header"."Global Dimension 1 Code")
                { }
                fieldelement(GlobalDim2; "Staff Advanc Surrender Header"."Shortcut Dimension 2 Code")
                { }
                fieldelement(RespCenter; "Staff Advanc Surrender Header"."Responsibility Center")
                { }
                fieldelement(SUrrenderPostingDate; "Staff Advanc Surrender Header"."Surrender Posting Date")
                { }
                fieldelement(Status; "Staff Advanc Surrender Header".Status)
                { }
                fieldelement(SurrenderDocNo; "Staff Advanc Surrender Header"."Imprest Issue Doc. No")
                { MinOccurs = Zero; }
                fieldelement(TruckNo; "Staff Advanc Surrender Header"."Shortcut Dimension 3 Code")
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
