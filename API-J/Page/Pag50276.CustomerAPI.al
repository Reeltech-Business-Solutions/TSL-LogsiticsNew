page 50276 CustomerAPI
{
    APIGroup = 'customer';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'customerAPI';
    DelayedInsert = true;
    EntityName = 'customer';
    EntitySetName = 'customers';
    PageType = API;
    SourceTable = Customer;

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

                }

                field(name; Rec.Name)
                {

                }
                field("customer_type"; Rec."Customer Type")
                {

                }

            }
        }
    }
}
