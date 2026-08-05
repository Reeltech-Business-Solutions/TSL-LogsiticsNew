table 90004 "Tyre Swap Header"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
            Editable = false;
        }
        field(2; Date; Date)
        {
        }
        field(3; "Tyre Card Updated?"; Boolean)
        {

        }
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(110; "Driver's Name"; Code[70])
        {
            TableRelation = Employee WHERE(Driver = CONST(true));
        }
        field(112; "Workshop Manager"; Code[70])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                "DataClerk/ Service Advisor" := USERID;
                "DataClerk/ Service Adv Date" := TODAY;
            end;
        }
        field(125; "DataClerk/ Service Advisor"; Code[70])
        {
            TableRelation = "User Setup";
        }
        field(126; "Manager Approved"; Option)
        {
            OptionCaption = ' ,Send,Re-Send';
            OptionMembers = " ",Send,"Re-Send";

            trigger OnLookup()
            begin
                //"Date Manager Approved":=
                //"Time Manager Approved":=
            end;

            trigger OnValidate()
            begin
                TESTFIELD("Send for Approval");
                TESTFIELD("Workshop Manager");

                "Date Manager Approved" := TODAY;
                "Time Manager Approved" := TIME;
            end;
        }
        field(127; "Send for Approval"; Boolean)
        {

            trigger OnValidate()
            begin
                /*IF UserSetup.GET("Workshop Manager") THEN
                BEGIN
                   TESTFIELD("Workshop Manager");
                   //TESTFIELD("Reason For Approval");
                   "DataClerk/ Service Advisor" := USERID;
                   "DataClerk/ Service Adv Date"  :=DATE;
                   Subject:=STRSUBSTNO(Text101,Code);
                   Body:= STRSUBSTNO(Text107,Code);
                   Mailsender.NewMessage(UserSetup."E-Mail",Subject,Body,attachement,FALSE);
                END;
                  */




                /*      IF (UserSetup.GET("Send To")) AND ("Gen. Prod. Posting Group" = 'BATTERY') THEN  //OR ("Gen. Prod. Posting Group" = 'LUBRICANT') THEN
                        BEGIN
                          TESTFIELD("Send To");
                          TESTFIELD("Reason For Approval");
                          Sender := USERID;
                          "Sent Date"  := CURRENTDATETIME;
                          Subject:=STRSUBSTNO(text101,"Document No.","Service Item No.");
                          Body:= STRSUBSTNO(Text107,"Document No.","No.","Service Item No.",ServiceLine."Quantity Requesting For approv","Reason For Approval");
                         // Mailsender.NewMessage('ddada@agleventis.com',JobSetup."Email to copy 4 Tyres/Battery",Subject,Body,attachement,FALSE);
                          Mailsender.NewMessage(UserSetup."E-Mail",JobSetup."Email to copy 4 Tyres/Battery",Subject,Body,attachement,FALSE);
                          TESTFIELD("Approve/Reject",0);
                 */

            end;
        }
        field(128; "Date Manager Approved"; Date)
        {

            trigger OnValidate()
            begin
                TESTFIELD("Send for Approval");
                TESTFIELD("Workshop Manager");
            end;
        }
        field(129; "Time Manager Approved"; Time)
        {
        }
        field(130; "Approval Sequence"; Option)
        {
            OptionCaption = ' ,Approved,Rejected';
            OptionMembers = " ",Approved,Rejected;
        }
        field(131; "DataClerk/ Service Adv Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        InvSetup.GET;

        IF Code = '' THEN BEGIN
            TestNoSeries;
            "No. Series" := GetNoSeriesCode();
            if NoSeriesMgt.AreRelated(GetNoSeriesCode(), xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            Code := NoSeriesMgt.GetNextNo("No. Series", Date);
            //  NoSeriesMgt.InitSeries(GetNoSeriesCode, xRec."No. Series", Date, Code, "No. Series");
        END;
    end;

    var
        PurchSetup: Record "Purchases & Payables Setup";
        //  NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeriesMgt: Codeunit "No. Series";
        InvSetup: Record "Inventory Setup";
        Mailsender: Codeunit Mail;
        Text101: Label 'Tyre Swap Document  ''%1''  requires your approv.';
        Text107: Label 'Tyre Swap Document  ''%1''  requires your approv .Requiresires your permission to perform a tyre swap. Please check ERP page to see the Trucks and tyres to swap.';
        UserSetup: Record "User Setup";
        ToName: Text[80];
        CCName: Text[80];
        Subject: Text[50];
        Body: Text[260];
        attachement: Text[260];

    [Scope('Cloud')]
    procedure AssistEdit(OldTyreSwapHeader: Record "Tyre Swap Header"): Boolean
    begin
        InvSetup.GET;
        TestNoSeries;
        IF NoSeriesMgt.LookupRelatedNoSeries(GetNoSeriesCode, OldTyreSwapHeader."No. Series", "No. Series") THEN BEGIN
            InvSetup.GET;
            ;
            TestNoSeries;
            ;
            NoSeriesMgt.GetNextNo(Code);
            EXIT(TRUE);
        END;
    end;

    local procedure TestNoSeries(): Boolean
    begin
        InvSetup.GET;
        InvSetup.TESTFIELD(InvSetup."Swap Card Nos");
    end;

    local procedure GetNoSeriesCode(): Code[20]
    begin
        InvSetup.GET;
        EXIT(InvSetup."Swap Card Nos");
    end;
}

