page 50254 VendorAPI
{
    APIGroup = 'vendor';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'vendorAPI';
    DelayedInsert = true;
    EntityName = 'vendor';
    EntitySetName = 'vendors';
    PageType = API;
    SourceTable = Vendor;
    insertallowed = false;
    deleteallowed = false;
    ModifyAllowed = false;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                
                field(SystemId;Rec.SystemId)
                {
                    
                }
                
                field(no; Rec."No.")
                {

                }

                field(Name; Delchr(Rec.Name, '<>', ' '))
                {

                }
                field("VendorType"; Rec."Vendor Type")
                {

                }
                field(Address; Rec.Address)
                {

                }
                field("CountryRegionCode"; Rec."Country/Region Code")
                {

                }
                field(City; Rec.City)
                {

                }
                field("MobilePhoneNo"; Rec."Mobile Phone No.")
                {

                }
                field("EMail"; Rec."E-Mail")
                {

                }
                field("OurAccountNo"; Rec."Our Account No.")
                {

                }
                field("CurrencyCode"; Rec."Currency Code")
                {

                }
                

            }
        }
    }
}
