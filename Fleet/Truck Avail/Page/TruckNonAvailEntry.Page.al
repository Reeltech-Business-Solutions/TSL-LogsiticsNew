page 50062 "Truck Non-Avail Entry"
{
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Truck Availability Entry";
    UsageCategory = Documents;
    ApplicationArea = All;



    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        IF Rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;

                    trigger OnValidate()
                    begin
                        IF Rec."No." = '' THEN BEGIN
                            TruckAvailSetup.GET;
                            TruckAvailSetup.TESTFIELD(TruckAvailSetup."Truck Avail No.");
                            //    NoSeriesMgt.InitSeries(TruckAvailSetup."Truck Avail No.", xRec."No. Series", 0D, Rec."No.", Rec."No. Series");
                        END
                    end;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Rec."User ID" := USERID;
                        Rec."User Date" := TODAY;
                    end;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("User Date"; Rec."User Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            part(Line; "Truck Avail. Entry Subform")
            {
                SubPageLink = "Document No." = FIELD("No.");
                ApplicationArea = All;
            }
        }

    }

    actions
    {
    }

    trigger OnModifyRecord(): Boolean
    begin
        //"User ID":= USERID;
        //"User Date":= TODAY;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"User ID":= USERID;
        //"User Date":= TODAY;
    end;

    trigger OnOpenPage()

    begin
        //  rec.SetFilter("Created By", UserId);
    end;




    var
        TruckAvailSetup: Record "Service Mgt. Setup";
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeriesMgt: Codeunit "No. Series";
}

