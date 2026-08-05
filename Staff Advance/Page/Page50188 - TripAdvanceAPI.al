page 50188 "Trip Advance API"
{
    APIGroup = 'Advances';
    APIPublisher = 'CapitalCore';
    APIVersion = 'v1.0';
    Caption = 'tripAdvanceAPI';
    DelayedInsert = true;
    EntityName = 'StaffAdvance';
    EntitySetName = 'TripAdvcanceAPI';
    PageType = API;
    SourceTable = "Staff Advance Header";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field("date"; Rec."Date")
                {
                    Caption = 'Date';
                }
                field(accountType; Rec."Account Type")
                {
                    Caption = 'Account Type';
                }
                field(accountNo; Rec."Account No.")
                {
                    Caption = 'Account No.';
                }
                field(payee; Rec.Payee)
                {
                    Caption = 'Payee';
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(payingBankAccount; Rec."Paying Bank Account")
                {
                    Caption = 'Paying Bank Account';
                }
                field(bankName; Rec."Bank Name")
                {
                    Caption = 'Bank Name';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(totalNetAmount; Rec."Total Net Amount")
                {
                    Caption = 'Total Net Amount';
                }
                field(totalNetAmountLCY; Rec."Total Net Amount LCY")
                {
                    Caption = 'Total Net Amount LCY';
                }
                field(responsibilityCenter; Rec."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
            }
        }
    }
}
