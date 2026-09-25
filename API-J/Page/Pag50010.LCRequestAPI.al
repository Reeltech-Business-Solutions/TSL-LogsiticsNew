page 50010 "LC Request API"
{
    APIGroup = 'lcrequest';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'lcRequestAPI';
    DelayedInsert = true;
    EntityName = 'lcrequest';
    EntitySetName = 'lcrequests';
    PageType = API;
    SourceTable = "Payments Header";
    SourceTableView = where(Posted = const(false), "Payment Type" = const(LC), "PV Created" = const(false));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(SystemId; Rec.SystemId)
                {

                }
                field(no; Rec."No.")
                {

                }
                field(Date; Rec.Date)
                {

                }
                field(costCenterCode; Rec."Global Dimension 1 Code")
                {

                }
                field("responsibilityCenter"; Rec."Responsibility Center")
                {

                }
                field(Status; Rec.Status)
                {

                }
                field("DatePVCreated"; Rec."Date PV Created")
                {

                }
                field("PVCreatedBy"; Rec."PV Created By")
                {

                }

                part(lines; "LC line API")
                {
                    EntityName = 'line';
                    EntitySetName = 'lines';
                    SubPageLink = "Header Id" = field(SystemId);
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Posted := false;
        Rec."PV Created" := false;
        Rec."Payment Type" := Rec."Payment Type"::LC;
        Rec.Status := Rec.Status::Approved;
    end;
}
