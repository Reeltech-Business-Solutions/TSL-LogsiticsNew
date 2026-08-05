report 50013 "Axella Report"
{
    ApplicationArea = All;
    Caption = 'Axella Report';
    DefaultLayout = RDLC;
    RDLCLayout = './Axella.rdl';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(ContractAgreement; "Contract Agreement")
        {
            RequestFilterFields = "No.";
            column(BillingQty1; Format(BillingQty[1]))
            {

            }
            column(BillingQty2; Format(BillingQty[2]))
            {

            }
            column(BillingQty3; Format(BillingQty[3]))
            {

            }
            column(BillingQty4; Format(BillingQty[4]))
            {

            }
            column(BillingQty5; Format(BillingQty[5]))
            {

            }
            column(BillingQty6; Format(BillingQty[6]))
            {

            }
            column(BillingQty7; Format(BillingQty[7]))
            {

            }
            column(frq1; Format(frq[1]))
            {

            }
            column(frq2; Format(frq[2]))
            {

            }
            column(frq3; Format(frq[3]))
            {

            }
            column(frq4; Format(frq[4]))
            {

            }
            column(frq5; Format(frq[5]))
            {

            }
            column(frq6; Format(frq[6]))
            {

            }
            column(frq7; Format(frq[7]))
            {

            }
            column(MilageCon1; Format(MilageCon[1]))
            {

            }
            column(MilageCon2; Format(MilageCon[2]))
            {

            }
            column(MilageCon3; Format(MilageCon[3]))
            {

            }
            column(MilageCon4; Format(MilageCon[4]))
            {

            }
            column(MilageCon5; Format(MilageCon[5]))
            {

            }
            column(MilageCon6; Format(MilageCon[6]))
            {

            }
            column(BillingAmt1; Format(BillingAmt[1]))
            {

            }
            column(BillingAmt2; Format(BillingAmt[2]))
            {

            }
            column(BillingAmt3; Format(BillingAmt[3]))
            {

            }
            column(BillingAmt4; Format(BillingAmt[4]))
            {

            }
            column(BillingAmt5; Format(BillingAmt[5]))
            {

            }
            column(BillingAmt6; Format(BillingAmt[6]))
            {

            }
            column(BillingAmt7; Format(BillingAmt[7]))
            {

            }
            column(FixedAssetNo1; FixedAssetNo[1])
            {

            }
            column(FixedAssetNo2; FixedAssetNo[2])
            {

            }
            column(FixedAssetNo3; FixedAssetNo[3])
            {

            }
            column(FixedAssetNo4; FixedAssetNo[4])
            {

            }
            column(FixedAssetNo5; FixedAssetNo[5])
            {

            }
            column(FixedAssetNo6; FixedAssetNo[6])
            {

            }
            column(FixedAssetNo7; FixedAssetNo[7])
            {

            }
            column(Daysworked1; Daysworked[1])
            {

            }
            column(Daysworked2; Daysworked[2])
            {

            }
            column(Daysworked3; Daysworked[3])
            {

            }
            column(Daysworked4; Daysworked[4])
            {

            }
            column(Daysworked5; Daysworked[5])
            {

            }
            column(Daysworked6; Daysworked[6])
            {

            }
            column(Daysworked7; Daysworked[7])
            {

            }
            column(nonworkingdays1; nonworkingdays[1])
            {

            }
            column(nonworkingdays2; nonworkingdays[2])
            {

            }
            column(nonworkingdays3; nonworkingdays[3])
            {

            }
            column(nonworkingdays4; nonworkingdays[4])
            {

            }
            column(nonworkingdays5; nonworkingdays[5])
            {

            }
            column(nonworkingdays6; nonworkingdays[6])
            {

            }
            column(nonworkingdays7; nonworkingdays[7])
            {

            }
            column(GMIcharges1; GMIcharges[1])
            {

            }
            column(GMIcharges2; GMIcharges[2])
            {

            }
            column(GMIcharges3; GMIcharges[3])
            {

            }
            column(GMIcharges4; GMIcharges[4])
            {

            }
            column(GMIcharges5; GMIcharges[5])
            {

            }
            column(GMIcharges6; GMIcharges[6])
            {

            }
            column(GMIcharges7; GMIcharges[7])
            {

            }
            column(GMIrate1; GMIrate[1])
            {

            }
            column(GMIrate2; GMIrate[2])
            {

            }
            column(GMIrate3; GMIrate[3])
            {

            }
            column(GMIrate4; GMIrate[4])
            {

            }
            column(GMIrate5; GMIrate[5])
            {

            }
            column(GMIrate6; GMIrate[6])
            {
                //Amountfx
            }
            column(GMIrate7; GMIrate[7])
            {
                //Amountfx
            }
            column(Amountfx1; Amountfx[1])
            {

            }
            column(Amountfx2; Amountfx[2])
            {

            }
            column(Amountfx3; Amountfx[3])
            {

            }
            column(Amountfx4; Amountfx[4])
            {

            }
            column(Amountfx5; Amountfx[5])
            {

            }
            column(Amountfx6; Amountfx[6])
            {

            }
            column(Amountfx7; Amountfx[7])
            {

            }

            trigger OnPreDataItem()
            var

                DateFilter2: date;
            begin
                ContractNo := GetFilter("No.");
                // Evaluate(DateFilter2,DateFilter);
                // DateFilter2 := GetRangeMin(DateFilter2);
                //DateFilter2 := 

            end;


            trigger OnAfterGetRecord()
            var
                // BillingQty: Array[10] of Decimal;
                //  BillingAmt: Array[10] of Decimal;
                //  MilageCon: Array[10] of Code[20];
                BillingAmti: Decimal;
                BillingAmtBuffer: Decimal;
                i: Integer;
                //  frq: Array[10] of integer;
                t: Integer;
            begin
                Clear(frq);
                Clear(BillingAmt);
                Clear(MilageCon);
                Clear(FixedAssetNo);
                Clear(Daysworked);
                Clear(nonworkingdays);
                Clear(GMIrate);
                Clear(Amountfx);
                Clear(BillingAmt);
                Clear(MilageCon);

                i := 0;
                // ContractAgreementFreq.SetRange("No.",ContractAgreement."No.");
                // if ContractAgreementFreq.Get(ContractNo) then
                //     MillageControl.SetRange("Contract No.", ContractAgreementFreq."No.");
                //     MillageControl.SetFilter("Truck Type",'AXELLA');
                // if MillageControl.FindFirst() then
                //     repeat

                i := i + 1;
                t := 0;
                frq[1] := 0;
                BillingAmt[1] := 0;
                MilageCon[1] := '';
                frq[2] := 0;
                BillingAmt[2] := 0;
                MilageCon[2] := '';
                frq[3] := 0;
                BillingAmt[3] := 0;
                MilageCon[3] := '';
                frq[4] := 0;
                BillingAmt[4] := 0;
                MilageCon[4] := '';
                frq[5] := 0;
                BillingAmt[5] := 0;
                MilageCon[5] := '';
                frq[6] := 0;
                BillingAmt[6] := 0;
                MilageCon[6] := '';
                frq[7] := 0;
                BillingAmt[7] := 0;
                MilageCon[7] := '';

                ContractLine.SetRange("Document No.", ContractNo);
                if ContractLine.FindFirst() then
                    repeat
                         t := 0;
                         i := 0;

                        MillageControl.SetCurrentKey("Contract No.","Truck Type");
                        
                        MillageControl.SetRange("Contract No.", ContractLine."Document No.");
                        MillageControl.SetFilter("Truck Type", 'AXELLA');
                        if MillageControl.FindFirst() then
                            repeat
                                t := t + 1;
                                MilageCon[t] := MillageControl."Standard Millage Code";
                                BillingAmtBuffer := 0;
                                BillingLineSum.SetRange("Contract Id", MillageControl."Contract No.");
                                BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                                BillingLineSum.SetRange("Truck Type", MillageControl."Truck Type");
                                BillingLineSum.SetRange("Transaction Date", GetRangeMin("Date Filter"), GetRangeMax("Date Filter"));
                                if BillingLineSum.FindFirst() then
                                    repeat

                                        if (BillingLineSum.Quantity <= MillageControl.Maximum) and (BillingLineSum.Quantity >= MillageControl.Minimum) then begin
                                            i := i + 1;
                                            //BillingAmti := BillingAmti + BillingLineSum."Fixed Cost" + BillingLineSum."Variable Cost";
                                            BillingAmt[t] := MillageControl.Rate;
                                            frq[t] := i;
                                            // MilageCon[i] := MillageControl."Standard Millage Code";
                                        end;


                                    until BillingLineSum.Next = 0;
                            until MillageControlFixed.Next = 0;
                    until ContractLine.Next = 0;

                //      until MillageControl.Next = 0;



                //  if ContractAgreementFreqFixed.Get(ContractAgreement."No.") then

                //    repeat


                // t := 0;
                // frq[i] := 0;
                // BillingAmt[i] := 0;
                // MilageCon[i] := '';
                // FixedAssetNo[i] := '';
                // Daysworked[i] := 0;
                // nonworkingdays[i] := 0;
                // GMIrate[i] := 0;
                // Amountfx[i] := 0;



                // ContractLine.SetRange("Document No.", ContractAgreementFreqFixed."No.");
                // if ContractLine.FindFirst() then
                //     repeat
                //         BillingAmtBuffer := 0;
                //         BillingLineSumFixed.SetRange("Contract Id", ContractLine."Document No.");
                //         BillingLineSumFixed.SetRange("Truck No.", ContractLine."Truck Code");
                //         BillingLineSumFixed.SetRange("Truck Type", ContractLine."Truck Type");
                //         BillingLineSumFixed.SetRange("Transaction Date", GetRangeMin("Date Filter"), GetRangeMax("Date Filter"));
                //         if BillingLineSumFixed.FindFirst() then begin

                //             i := i + 1;

                //             MillageControlFixed.SetRange("Contract No.", ContractAgreementFreqFixed."No.");
                //             MillageControlFixed.SetRange("Truck Type", ContractLine."Truck Type");
                //             if MillageControlFixed.FindFirst() then
                //                 GMIcharges[i] := MillageControlFixed."Fixed Rate";



                //             FixedAssetNo[i] := BillingLineSumFixed."Truck No.";
                //             Daysworked[i] := BillingLineSumFixed."Avaialability Per TruckNo.Days";
                //             nonworkingdays[i] := ContractAgreementFreqFixed."Target Availability" - Daysworked[i];
                //             GMIrate[i] := GMIcharges[i] / ContractAgreementFreqFixed."Target Availability";
                //             Amountfx[i] := GMIrate[i] * Daysworked[i];



                //             // repeat

                //             // if (BillingLineSumFixed.Quantity < MillageControl.Maximum) and (BillingLineSumFixed.Quantity > MillageControlFixed.Minimum) then begin
                //             //  t := t + 1;
                //             // BillingAmti := BillingAmti + BillingLineSum."Fixed Cost" + BillingLineSum."Variable Cost";
                //             // BillingAmt[i] := BillingAmti;
                //             // frq[i] := t;
                //             // MilageCon[i] := MillageControl."Standard Millage Code";
                //             // end;
                //             ///   until BillingLineSum.Next = 0;
                //         end;
                //     until ContractLine.Next = 0;

                //  until MillageControl.Next = 0;






            end;









        }


    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    trigger OnPreReport()
    begin


    end;

    var
        MillageControl: Record "Millage Range Controls";
        BillingLineSum: Record "Billing Line";
        ContractAgreementFreq: Record "Contract Agreement";
        BillingQty: Array[10] of Decimal;
        frq: Array[10] of integer;
        MilageCon: Array[10] of Code[20];
        BillingAmt: Array[10] of Decimal;
        ContractLine: Record "Contract Line";
        MillageControlFixed: Record "Millage Range Controls";
        BillingLineSumFixed: Record "Billing Line";
        ContractAgreementFreqFixed: Record "Contract Agreement";
        FixedAssetNo: Array[10] of Code[20];
        Daysworked: Array[10] of Decimal;
        nonworkingdays: Array[10] of Decimal;
        GMIcharges: Array[10] of Decimal;
        GMIrate: Array[10] of Decimal;
        Amountfx: Array[1000] of Decimal;
        ContractNo: Code[20];


}
