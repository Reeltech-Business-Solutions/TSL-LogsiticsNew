tableextension 50027 "Service Item Line Ext" extends "Service Item Line"
{
    fields
    {
        field(50001; "Fault Description"; Text[150])
        {

        }
        field(50002; Hour; Decimal)
        {

        }
        field(50003; "User ID"; Code[30])
        {

        }
        field(50004; "Service Item No.2"; Code[30])
        {
            //TableRelation = "Service Header"."No." WHERE("Document Type" = FIELD("Document Type"));

            trigger OnValidate()
            begin
                //Lateef
                IF "Document Type" = "Document Type"::Quote THEN BEGIN
                    IF ServiceHeaderRec.GET("Document Type", "Document No.") THEN BEGIN
                        IF ServiceHeaderRec."Job Type" = ServiceHeaderRec."Job Type"::PrevMaint THEN BEGIN
                            IF ServiceItemRec.GET("Service Item No.") THEN BEGIN
                                NextSerStage := 0;
                                IF ServiceItemRec."Preventive Maintenace Cycle" = 4 THEN
                                    NextSerStage := 1
                                ELSE
                                    NextSerStage := ServiceItemRec."Preventive Maintenace Cycle" + 1;
                                FaultyMaterialsetupHeader.RESET;
                                FaultyMaterialsetupHeader.SETFILTER("Service Item Make", ServiceItemRec.Make);
                                FaultyMaterialsetupHeader.SETFILTER("Service Item Model", ServiceItemRec.Model);
                                FaultyMaterialsetupHeader.SETFILTER("Preventive Maintenace Cycle", '%1', NextSerStage);
                                IF FaultyMaterialsetupHeader.FINDFIRST THEN BEGIN
                                    FaultyMaterialsetupLine.RESET;
                                    FaultyMaterialsetupLine.SETFILTER("Operation code", FaultyMaterialsetupHeader."Operation Code");
                                    FaultyMaterialsetupLine.SETFILTER(Make, FaultyMaterialsetupHeader."Service Item Make");
                                    FaultyMaterialsetupLine.SETFILTER("Service Item Model", FaultyMaterialsetupHeader."Service Item Model");
                                    IF FaultyMaterialsetupLine.FINDFIRST THEN BEGIN
                                        ServiceLineRec.RESET;
                                        ServiceLineRec.SETFILTER("Document Type", '%1', "Document Type"::Quote);
                                        ServiceLineRec.SETFILTER("Document No.", "Document No.");
                                        IF ServiceLineRec.FINDFIRST THEN
                                            ServiceLineRec.DELETEALL;
                                        RecLineNo := 0;
                                        REPEAT
                                            RecLineNo += 1000;
                                            ServiceLineRec.INIT;
                                            ServiceLineRec."Document Type" := "Document Type";
                                            ServiceLineRec."Document No." := "Document No.";
                                            ServiceLineRec."Line No." := RecLineNo;
                                            ServiceLineRec."Service Item No." := "Service Item No.";
                                            ServiceLineRec.INSERT(TRUE);
                                            IF ServiceLineRec2.GET("Document Type", "Document No.", RecLineNo) THEN BEGIN
                                                ServiceLineRec2.VALIDATE(Type, FaultyMaterialsetupLine.Type);
                                                ServiceLineRec2.VALIDATE("No.", FaultyMaterialsetupLine."No.");
                                                ServiceLineRec2.VALIDATE(Quantity, FaultyMaterialsetupLine.Quantity);
                                                ServiceLineRec2.VALIDATE("Unit Price", FaultyMaterialsetupLine."Unit Price");
                                                ServiceLineRec2."Service Item No." := "Service Item No.";
                                                ServiceLineRec2.MODIFY;
                                            END;
                                        UNTIL FaultyMaterialsetupLine.NEXT = 0;
                                    END;
                                END;

                            END;
                        END;
                    END;
                END;
                Validate("Service Item No.", "Service Item No.2");
                //Lateef

            end;
        }
    }
    var
        ServiceLineRec: Record "Service Line";
        RecLineNo: Integer;
        ServiceLineRec2: Record "Service Line";
        ServiceHeaderRec: Record "Service Header";
        ServiceItemRec: Record "Service Item";
        FaultyMaterialsetupHeader: Record "Faulty Material setup Header";
        FaultyMaterialsetupLine: Record "Faulty Material setup Line";
        NextSerStage: Integer;
}