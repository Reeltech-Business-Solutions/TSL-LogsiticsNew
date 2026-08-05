page 50150 "Issue Journal API"
{
    APIGroup = 'Itemjournal';
    APIPublisher = 'CapitalCore';
    APIVersion = 'v1.0';
    Caption = 'issueJournalAPI';
    DelayedInsert = true;
    EntityName = 'issuejournal';
    EntitySetName = 'IssueJournalAPI';
    PageType = API;
    SourceTable = "Item Journal Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                }
                field(entryType; Rec."Entry Type")
                {
                    Caption = 'Entry Type';
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                }
                field(truckNo; Rec."Truck No.")
                {
                    Caption = 'Truck No.';
                }
                field(driverNo; Rec."Driver No.")
                {
                    Caption = 'Driver No.';
                }
                field(driverName; Rec."Driver Name")
                {
                    Caption = 'Driver Name';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
            }
        }
    }
}
