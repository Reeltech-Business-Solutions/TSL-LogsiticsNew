codeunit 50006 "Posting Check FP1"
{
    SingleInstance = true;

    trigger OnRun()
    begin
    end;

    var
        Post: Boolean;
        blnState: Boolean;
        blnJrnlState: Boolean;
        FromNo: Code[20];
        ToNo: Code[20];

    procedure SetCheck(var blnPost: Boolean)
    begin
        Post := blnPost;
    end;

    procedure GetCheck() blnPost: Boolean
    begin
        blnPost := Post;
    end;

    procedure ResetState()
    begin
        blnState := false;
        FromNo := '';
        ToNo := '';
    end;

    procedure SetState(Post: Boolean)
    begin
        blnState := Post;
    end;

    procedure GetState() ActState: Boolean
    begin
        ActState := blnState;
        exit(ActState);
    end;

    procedure FromEntryNo(var FromNoReg: Code[20])
    begin
        FromNo := FromNoReg;
    end;

    procedure ToEntryNo(var ToNoReg: Code[20])
    begin
        ToNo := ToNoReg;
    end;

    procedure GetFromRegNo() FromRegisterNo: Code[20]
    begin
        FromRegisterNo := FromNo;
    end;

    procedure GetToRegNo() ToRegisterNo: Code[20]
    begin
        ToRegisterNo := ToNo;
    end;

    procedure GetCustName(No: Code[20]) Name: Text[100]
    var
        Cust: Record Employee;
    begin
        Name := '';
        if Cust.Get(No) then
            Name := Cust."First Name" + ' ' + Cust."Middle Name" + ' ' + CUst."Last Name";
        exit(Name);
    end;


    procedure GetDimensionName(var "Code": Code[20]; DimNo: Integer) Name: Text[60]
    var
        GLSetup: Record "General Ledger Setup";
        DimVal: Record "Dimension Value";
    begin
        /*Get the global dimension 1 and 2 from the database*/
        Name := '';

        GLSetup.Reset;
        GLSetup.Get();

        DimVal.Reset;
        DimVal.SetRange(DimVal.Code, Code);

        if DimNo = 1 then begin
            DimVal.SetRange(DimVal."Dimension Code", GLSetup."Global Dimension 1 Code");
        end
        else
            if DimNo = 2 then begin
                DimVal.SetRange(DimVal."Dimension Code", GLSetup."Global Dimension 2 Code");
            end;
        if DimVal.Find('-') then begin
            Name := DimVal.Name;
        end;

    end;

    procedure UpdateforNoActualSpent(var StaffAdvancSurrenderHeader: Record "Staff Advanc Surrender Header")
    var
        ImprestReq: Record "Staff Advance Header";
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance,StaffSurrender;
    begin
        StaffAdvancSurrenderHeader.Posted := true;
        StaffAdvancSurrenderHeader.Status := StaffAdvancSurrenderHeader.Status::Posted;
        StaffAdvancSurrenderHeader."Date Posted" := Today;
        StaffAdvancSurrenderHeader."Time Posted" := Time;
        StaffAdvancSurrenderHeader."Posted By" := UserId;
        StaffAdvancSurrenderHeader.Modify;
        //Tag the Source Imprest Requisition as Surrendered
        ImprestReq.Reset;
        ImprestReq.SetRange(ImprestReq."No.", StaffAdvancSurrenderHeader."Imprest Issue Doc. No");
        if ImprestReq.Find('-') then begin
            ImprestReq."Surrender Status" := ImprestReq."Surrender Status"::Full;
            ImprestReq.Modify;
        end;
        //End Tag
        //Post Committment Reversals
        Doc_Type := Doc_Type::StaffSurrender;
    end;


    procedure InsertBank(StaffAdvancSurrenderHeaderBk: Record "Staff Advanc Surrender Header"; ImprestDetails: Record "Staff Advan Surrender Details"; SurrTemplate: Code[20]; SurrBatch: Code[20])
    var
        LineNo: Integer;
        GenJnlLine: Record "Gen. Journal Line";
    begin

        LineNo := LineNo + 1000;
        GenJnlLine.Init;
        GenJnlLine."Journal Template Name" := SurrTemplate;
        GenJnlLine."Journal Batch Name" := SurrBatch;
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Source Code" := 'PAYMENTJNL';
        GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
        CheckBank(StaffAdvancSurrenderHeaderBk."Bank Code");
        GenJnlLine."Account No." := StaffAdvancSurrenderHeaderBk."Bank Code";
        GenJnlLine.Validate(GenJnlLine."Account No.");
        //Set these fields to blanks
        GenJnlLine."Posting Date" := StaffAdvancSurrenderHeaderBk."Surrender Posting Date";
        GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
        GenJnlLine.Validate("Gen. Posting Type");
        GenJnlLine."Gen. Bus. Posting Group" := '';
        GenJnlLine.Validate("Gen. Bus. Posting Group");
        GenJnlLine."Gen. Prod. Posting Group" := '';
        GenJnlLine.Validate("Gen. Prod. Posting Group");
        GenJnlLine."VAT Bus. Posting Group" := '';
        GenJnlLine.Validate("VAT Bus. Posting Group");
        GenJnlLine."VAT Prod. Posting Group" := '';
        GenJnlLine.Validate("VAT Prod. Posting Group");
        GenJnlLine."Document No." := StaffAdvancSurrenderHeaderBk."No.";
        StaffAdvancSurrenderHeaderBk.CalcFields(StaffAdvancSurrenderHeaderBk.Difference);
        StaffAdvancSurrenderHeaderBk.CalcFields(StaffAdvancSurrenderHeaderBk."Actual Spent");
        if StaffAdvancSurrenderHeaderBk."Actual Spent" > StaffAdvancSurrenderHeaderBk.Amount then
            GenJnlLine.Amount := StaffAdvancSurrenderHeaderBk.Difference;
        if StaffAdvancSurrenderHeaderBk."Actual Spent" < StaffAdvancSurrenderHeaderBk.Amount then
            GenJnlLine.Amount := StaffAdvancSurrenderHeaderBk.Difference;
        if StaffAdvancSurrenderHeaderBk."Actual Spent" = 0 then
            GenJnlLine.Amount := StaffAdvancSurrenderHeaderBk.Amount;
        GenJnlLine.Validate(GenJnlLine.Amount);
        GenJnlLine.Description := 'Advance' + StaffAdvancSurrenderHeaderBk."No." + ' Retired by staff' + StaffAdvancSurrenderHeaderBk."Account No.";
        GenJnlLine."Currency Code" := StaffAdvancSurrenderHeaderBk."Currency Code";
        GenJnlLine.Validate("Currency Code");
        //Take care of Currency Factor
        GenJnlLine."Currency Factor" := StaffAdvancSurrenderHeaderBk."Currency Factor";
        GenJnlLine.Validate("Currency Factor");

        GenJnlLine."Shortcut Dimension 1 Code" := StaffAdvancSurrenderHeaderBk."Global Dimension 1 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine."Shortcut Dimension 2 Code" := StaffAdvancSurrenderHeaderBk."Shortcut Dimension 2 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
        GenJnlLine.ValidateShortcutDimCode(3, StaffAdvancSurrenderHeaderBk."Shortcut Dimension 3 Code");
        GenJnlLine.ValidateShortcutDimCode(4, StaffAdvancSurrenderHeaderBk."Shortcut Dimension 4 Code");
        GenJnlLine."External Document No." := ImprestDetails."Cash Receipt No";
        /*
        //Application of Surrender entries
        IF GenJnlLine."Bal. Account Type"=GenJnlLine."Bal. Account Type"::Customer THEN BEGIN
        GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
        GenJnlLine."Applies-to Doc. No.":="Imprest Issue Doc. No";
        GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
        GenJnlLine."Applies-to ID":="Apply to ID";
        END;
        */
        if GenJnlLine.Amount <> 0 then
            GenJnlLine.Insert;

    end;

    procedure InsertBalancing(StaffAdvancSurrenderHeaderBk: Record "Staff Advanc Surrender Header"; AdvanceSurrLines: Record "Staff Advan Surrender Details"; SurrTemplate: Code[20]; SurrBatch: Code[20])
    var
        LineNo: integer;
        GenJnlLine: Record "Gen. Journal Line";
        TravAccHeader: Record "Staff Advanc Surrender Header";
    begin
        //insert customer balancing
        LineNo := LineNo + 1000;
        GenJnlLine.Init;
        GenJnlLine."Journal Template Name" := SurrTemplate;
        GenJnlLine."Journal Batch Name" := SurrBatch;
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Source Code" := 'PAYMENTJNL';
        GenJnlLine."Account Type" := GenJnlLine."Account Type"::Employee;
        GenJnlLine."Account No." := StaffAdvancSurrenderHeaderBk."Account No.";
        GenJnlLine.Validate(GenJnlLine."Account No.");
        //Set these fields to blanks
        GenJnlLine."Posting Date" := StaffAdvancSurrenderHeaderBk."Surrender Posting Date";
        GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
        GenJnlLine.Validate("Gen. Posting Type");
        GenJnlLine."Gen. Bus. Posting Group" := '';
        GenJnlLine.Validate("Gen. Bus. Posting Group");
        GenJnlLine."Gen. Prod. Posting Group" := '';
        GenJnlLine.Validate("Gen. Prod. Posting Group");
        GenJnlLine."VAT Bus. Posting Group" := '';
        GenJnlLine.Validate("VAT Bus. Posting Group");
        GenJnlLine."VAT Prod. Posting Group" := '';
        GenJnlLine.Validate("VAT Prod. Posting Group");
        GenJnlLine."Document No." := StaffAdvancSurrenderHeaderBk."No.";
        GenJnlLine.Amount := -AdvanceSurrLines.Amount;//AdvanceSurrLines."Actual Spent";
        GenJnlLine.Validate(GenJnlLine.Amount);
        GenJnlLine.Description := CopyStr('Advance Retired for ' + AdvanceSurrLines."Account Name", 1, 50);
        GenJnlLine."Currency Code" := AdvanceSurrLines."Currency Code";
        GenJnlLine.Validate("Currency Code");
        //Take care of Currency Factor
        GenJnlLine."Currency Factor" := AdvanceSurrLines."Currency Factor";
        GenJnlLine.Validate("Currency Factor");

        GenJnlLine."Shortcut Dimension 1 Code" := StaffAdvancSurrenderHeaderBk."Global Dimension 1 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine."Shortcut Dimension 2 Code" := StaffAdvancSurrenderHeaderBk."Shortcut Dimension 2 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
        GenJnlLine.ValidateShortcutDimCode(3, StaffAdvancSurrenderHeaderBk."Shortcut Dimension 3 Code");
        GenJnlLine.ValidateShortcutDimCode(4, StaffAdvancSurrenderHeaderBk."Shortcut Dimension 4 Code");

        //Application of Surrender entries
        if GenJnlLine."Account Type" = GenJnlLine."Account Type"::Employee then begin
            Evaluate(GenJnlLine."Applies-to Doc. Type", Format(GenJnlLine."Applies-to Doc. Type"::Payment));
            GenJnlLine.Validate(GenJnlLine."Applies-to Doc. Type");
            //GenJnlLine."Applies-to Doc. No.":="Imprest Issue Doc. No";
            TravAccHeader.Reset;
            TravAccHeader.SetRange(TravAccHeader."Imprest Issue Doc. No", StaffAdvancSurrenderHeaderBk."Imprest Issue Doc. No");
            if TravAccHeader.FindLast then
                GenJnlLine."Applies-to Doc. No." := TravAccHeader."Imprest Issue Doc. No";
            GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
            GenJnlLine."Applies-to ID" := StaffAdvancSurrenderHeaderBk."Apply to ID";
        end;

        if GenJnlLine.Amount <> 0 then
            GenJnlLine.Insert;
    end;

    local procedure CheckBank(BankCode: Code[20])
    begin
        if BankCode = '' then
            Error('Procedure TestField not implemented.');
    end;

    procedure LinesCommitmentStatusExist()
    begin
        Error('The field need to be fill');
    end;

    [EventSubscriber(ObjectType::Table, 39, 'OnAfterValidateEvent', 'Expense No.', false, false)]
    local procedure OnValidateCurrentField(VAR Rec: Record "Purchase Line"; VAR xRec: Record "Purchase Line"; CurrFieldNo: Integer)
    var
        ExpenseList: record "Receipts and Payment Types";
    begin
        IF Rec."Expense No." <> '' THEN
            IF ExpenseList.GET(Rec."Expense No.") then begin
                Rec.VALIDATE(Type, Rec.Type::"G/L Account");
                Rec.VALIDATE("No.", ExpenseList."Account No.");
                Rec."Expense No." := ExpenseList.code;
            END;
    end;

    [EventSubscriber(ObjectType::Table, 39, 'OnAfterValidateEvent', 'Direct Unit Cost', false, false)]
    LOCAL procedure GetDirectUnitCost(VAR Rec: Record "Purchase Line"; VAR xRec: Record "Purchase Line"; CurrFieldNo: Integer)
    var
    begin
        IF (Rec."Expense No." <> '') THEN BEGIN
            Rec."Direct Unit Cost Buffer" := Rec."Direct Unit Cost";
            Rec.VALIDATE("Direct Unit Cost Buffer");
        END;

    end;

    [EventSubscriber(ObjectType::Table, 39, 'OnAfterValidateEvent', 'No.', false, false)]
    local Procedure UpdateDirectUnitCostPO(VAR Rec: Record "Purchase Line"; VAR xRec: Record "Purchase Line"; CurrFieldNo: Integer)

    Begin
        IF (Rec."Expense No." <> '') AND (Rec.Type = Rec.Type::"G/L Account") THEN BEGIN
            Rec."Direct Unit Cost" := Rec."Direct Unit Cost Buffer";
            Rec.VALIDATE("Direct Unit Cost");

            //Rec."Expense Description" := Rec.Description;

        END;
    End;

    [EventSubscriber(ObjectType::Codeunit, 96, 'OnBeforeInsertPurchOrderLine', '', false, false)]
    local Procedure OnBeforeInsertPurchOrderLine(VAR PurchOrderLine: Record "Purchase Line"; PurchOrderHeader: Record "Purchase Header"; PurchQuoteLine: Record "Purchase Line"; PurchQuoteHeader: Record "Purchase Header")
    begin
        PurchOrderLine."Expense No." := PurchQuoteLine."Expense No.";
        PurchOrderLine."Direct Unit Cost Buffer" := PurchQuoteLine."Direct Unit Cost Buffer";
    end;

    [EventSubscriber(ObjectType::Table, 39, 'OnValidateNoOnAfterAssignQtyFromXRec', '', false, false)]
    local procedure OnValidateNoOnAfterAssignQtyFromXRec2(VAR PurchaseLine: Record "Purchase Line"; TempPurchaseLine: Record "Purchase Line")
    begin
        IF (PurchaseLine.Type = PurchaseLine.Type::"G/L Account") AND (PurchaseLine."Expense No." = '') THEN
            PurchaseLine."Direct Unit Cost Buffer" := TempPurchaseLine."Direct Unit Cost Buffer";
        PurchaseLine."Expense No." := TempPurchaseLine."Expense No.";
    end;

    procedure ActualBudgetGenGL(var GenJournalLine: record "Gen. Journal Line")
    var

        GLSetupRead: Boolean;
        dimrec: Code[20];
        i: Integer;
        Dimension2: Record "Dimension Value";
        Dimension3: Record "Dimension Value";
        GenJournalLineRec: Record "Gen. Journal Line";
        GlEntry: Record "G/L Entry";
        "G/LBudgetEntry": Record "G/L Budget Entry";
        Daterec: Date;
        StartDate: Date;
        EndDate: Date;
        PayLineAmount: Decimal;
        GlEntryAmount: Decimal;
        "G/LBudgetEntryAmount": Decimal;
        Totalamountexceed: Decimal;
        StartYear: Date;
        EndYear: Date;
        t: Integer;
        StartDate2: Text;
        EndDate2: Text;
        Totalamount: Decimal;
        GenJournalLine3: Record "Gen. Journal Line";
        GlEntryAccountAmount: Decimal;
        PayLineAmountActual: Decimal;
        "G/LBudgetAccountAmount": Decimal;
        Totalamountglaccount: Decimal;
        GlaccBudgetAmountDiff: Decimal;
        GLAcc: Record "G/L Account";
        Dimension: Record "Dimension Value";
        FAPostingGroup: Record "FA Posting Group";
        FixedAsset: Record "Fixed Asset";
        fixsedassetcode: Code[20];
        Glaccount: Code[20];
        GenJournalLineNew: Record "Gen. Journal Line";
        GenJournalLineNewJ5: Record "Gen. Journal Line";
        BatchName: Code[20];
        TemplateBatch: Code[20];
        Text0055: Label 'The   Cost Center budgeted amount is  %1  for %2 and the cost center G/l entry  amount is  %3 the G/L account   Amount budgeted  is %4 for the G/L account %5  and the G/L entry amount is  %6 for the Month you cannot proceed';
        Text0056: Label 'The   Cost Center budgeted amount is  %1  for %2 and the cost center G/l entry  amount is  %3 the G/L account   Amount budgeted  is %4 for the G/L account %5  and the G/L entry amount is  %6 for the YEAR you cannot proceed';
    begin
        //i := 0;
        // to pick the number of cos center to itertate
        Daterec := GenJournalLine."Posting Date";
        //dimrec :='';
        StartDate := CALCDATE('<-CM>', Daterec);
        EndDate := CALCDATE('<CM>', Daterec);
        StartYear := CALCDATE('<-CY>', Daterec);
        EndYear := CALCDATE('<CY>', Daterec);

        //MESSAGE(FORMAT(i));
        PayLineAmount := 0;
        GlEntryAmount := 0;
        "G/LBudgetEntryAmount" := 0;
        "G/LBudgetAccountAmount" := 0;
        PayLineAmountActual := 0;
        Totalamountglaccount := 0;
        GlaccBudgetAmountDiff := 0;
        Totalamount := 0;

        //GenJournalLineNew.RESET;
        //GenJournalLineRec.SETCURRENTKEY("Journal Template Name","Journal Batch Name","Line No.");
        // GenJournalLineNewJ5.SETFILTER("Journal Batch Name","Journal Batch Name");
        //GenJournalLineNewJ5.SETFILTER("Journal Template Name","Journal Template Name");
        //GenJournalLineRec.SETRANGE("Journal Template Name","Journal Template Name");
        //GenJournalLineRec.SETRANGE("Line No.","Line No.");
        //GenJournalLineNew.SETCURRENTKEY("Document No.");
        GenJournalLineNew.SETRANGE("Document No.", GenJournalLine."Document No.");
        IF GenJournalLineNew.FIND('-') THEN BEGIN
            BatchName := GenJournalLineNew."Journal Batch Name";
            TemplateBatch := GenJournalLineNew."Journal Template Name";
        END;

        GenJournalLineRec.RESET;
        GenJournalLineRec.SETCURRENTKEY("Journal Template Name", "Journal Batch Name");
        // GenJournalLineRec.SETCURRENTKEY("Document No.");
        GenJournalLineRec.SETRANGE("Journal Batch Name", BatchName);
        GenJournalLineRec.SETFILTER("Journal Template Name", TemplateBatch);
        //GenJournalLineRec.SETRANGE("Line No.","Line No.");
        //GenJournalLineRec.SETRANGE("Document No.",GenJournalLineNew."Document No.");
        IF GenJournalLineRec.FIND('-') THEN BEGIN
            REPEAT

                IF (GenJournalLineRec."Account Type" = GenJournalLineRec."Account Type"::"Fixed Asset") AND ((GenJournalLineRec."FA Posting Type" = GenJournalLineRec."FA Posting Type"::"Acquisition Cost") OR
                            (GenJournalLineRec."FA Posting Type" = GenJournalLineRec."FA Posting Type"::Appreciation)) THEN
                    ActualBudgetGenjMothYearFixedasset(GenJournalLineRec)
                ELSE BEGIN


                    GLAcc.RESET;
                    GLAcc.SETRANGE(GLAcc."No.", GenJournalLineRec."Account No.");
                    GLAcc.SETRANGE(GLAcc."Budget Controlled", TRUE);
                    IF GLAcc.FINDFIRST THEN BEGIN

                        Dimension.SETFILTER(Dimension."Dimension Code", '%1', 'DEPARTMENT');
                        Dimension.SETRANGE(Dimension.Code, GenJournalLineRec."Shortcut Dimension 1 Code");
                        IF Dimension.FINDFIRST THEN
                            dimrec := GenJournalLineRec."Shortcut Dimension 1 Code";
                        // MESSAGE(FORMAT(dimrec[i]));
                        //  MESSAGE(dimrec);


                        //To take care of the monthly budget

                        //IF (Daterec > StartDate) AND (Daterec < EndDate) THEN BEGIN
                        BEGIN
                            //Total sum of the the particular cost center on the payment line
                            GenJournalLine3.RESET;
                            GenJournalLine3.SETCURRENTKEY("Shortcut Dimension 1 Code", "Journal Batch Name", "Journal Template Name");
                            GenJournalLine3.SETRANGE("Journal Batch Name", GenJournalLineRec."Journal Batch Name");
                            GenJournalLine3.SETFILTER("Shortcut Dimension 1 Code", dimrec);
                            GenJournalLine3.SETRANGE("Journal Template Name", GenJournalLineRec."Journal Template Name");
                            //GenJournalLine3.SETRANGE("Posting Date",StartDate,EndDate);
                            GenJournalLine3.CALCSUMS(GenJournalLine3.Amount);
                            PayLineAmount := GenJournalLine3.Amount;
                        END;

                        BEGIN
                            //total sum of a particular G/l account on the payment line
                            GenJournalLine3.RESET;
                            GenJournalLine3.SETCURRENTKEY("Journal Batch Name", "Journal Template Name", "Account No.");
                            GenJournalLine3.SETRANGE("Journal Batch Name", GenJournalLineRec."Journal Batch Name");
                            GenJournalLine3.SETFILTER("Journal Template Name", GenJournalLineRec."Journal Template Name");
                            GenJournalLine3.SETFILTER("Account No.", GenJournalLineRec."Account No.");
                            GenJournalLine3.CALCSUMS(GenJournalLine3.Amount);
                            PayLineAmountActual := GenJournalLine3.Amount;
                        END;

                        BEGIN
                            //Total sum of the particular cost center in the g/l entry
                            GlEntry.RESET;
                            GlEntry.SETFILTER("Global Dimension 1 Code", dimrec);
                            GlEntry.SETRANGE("Posting Date", StartDate, EndDate);
                            GlEntry.CALCSUMS(Amount);
                            GlEntryAmount := GlEntry.Amount;
                            //MESSAGE(FORMAT(GlEntryAmount));
                        END;

                        BEGIN
                            //Total sum of the particular g/l account  in the g/l entry
                            GlEntry.RESET;
                            GlEntry.SETRANGE("G/L Account No.", GenJournalLineRec."Account No.");
                            GlEntry.SETFILTER("Posting Date", '%1..%2', StartDate, EndDate);
                            GlEntry.CALCSUMS(Amount);
                            GlEntryAccountAmount := GlEntry.Amount;
                        END;


                        BEGIN
                            //Total sum  value of a particular cost center in the budget entry
                            "G/LBudgetEntry".RESET;
                            "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."Global Dimension 1 Code", dimrec);
                            "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartDate, EndDate);
                            "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                            "G/LBudgetEntryAmount" := "G/LBudgetEntry".Amount;
                            //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                        END;


                        BEGIN
                            //Total sum of of particular g/l account in the budget entry
                            "G/LBudgetEntry".RESET;
                            "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."G/L Account No.", GenJournalLineRec."Account No.");
                            "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartDate, EndDate);
                            "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                            "G/LBudgetAccountAmount" := "G/LBudgetEntry".Amount;
                            //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                        END;


                        //total sum for the G/L account in the g/l entry and payment line
                        Totalamountglaccount := PayLineAmountActual + GlEntryAccountAmount;

                        //Difference btw the actual gl account and budgeted amount
                        GlaccBudgetAmountDiff := "G/LBudgetAccountAmount" - Totalamountglaccount;

                        //total sum for the costcenter in the g/l entry and payment line
                        Totalamountexceed := PayLineAmount + GlEntryAmount;

                        //Difference btw the actual cost center and budgeted amount
                        Totalamount := "G/LBudgetEntryAmount" - Totalamountexceed;

                        IF ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                        ((Totalamountexceed < "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                        ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) THEN
                            MESSAGE(Text0055, "G/LBudgetEntryAmount", dimrec, Totalamountexceed, "G/LBudgetAccountAmount", GenJournalLineRec."Account No.", Totalamountglaccount);

                        //END;

                        //to take care of the yearly budget

                        //IF (Daterec > StartYear) AND (Daterec < EndYear) THEN BEGIN
                        BEGIN
                            //Total sum of the the particular cost center on the payment line
                            GenJournalLine3.RESET;
                            GenJournalLine3.SETCURRENTKEY("Shortcut Dimension 1 Code", "Journal Batch Name", "Journal Template Name");
                            GenJournalLine3.SETRANGE("Journal Batch Name", GenJournalLineRec."Journal Batch Name");
                            GenJournalLine3.SETFILTER("Shortcut Dimension 1 Code", dimrec);
                            GenJournalLine3.SETRANGE("Journal Template Name", GenJournalLineRec."Journal Template Name");
                            //GenJournalLine3.SETRANGE("Posting Date",StartDate,EndDate);
                            GenJournalLine3.CALCSUMS(GenJournalLine3.Amount);
                            PayLineAmount := GenJournalLine3.Amount;
                        END;

                        BEGIN
                            //total sum of a particular G/l account on the payment line
                            GenJournalLine3.RESET;
                            GenJournalLine3.SETCURRENTKEY("Journal Batch Name", "Journal Template Name", "Account No.");
                            GenJournalLine3.SETRANGE("Journal Batch Name", GenJournalLineRec."Journal Batch Name");
                            GenJournalLine3.SETFILTER("Journal Template Name", GenJournalLineRec."Journal Template Name");
                            GenJournalLine3.SETFILTER("Account No.", GenJournalLineRec."Account No.");
                            GenJournalLine3.CALCSUMS(GenJournalLine3.Amount);
                            PayLineAmountActual := GenJournalLine3.Amount;
                        END;

                        BEGIN
                            //Total sum of the particular cost center in the g/l entry
                            GlEntry.RESET;
                            GlEntry.SETFILTER("Global Dimension 1 Code", dimrec);
                            GlEntry.SETRANGE("Posting Date", StartYear, EndYear);
                            GlEntry.CALCSUMS(Amount);
                            GlEntryAmount := GlEntry.Amount;
                            //MESSAGE(FORMAT(GlEntryAmount));
                        END;


                        BEGIN
                            //Total sum of the particular g/l account  in the g/l entry
                            GlEntry.RESET;
                            GlEntry.SETRANGE("G/L Account No.", GenJournalLineRec."Account No.");
                            GlEntry.SETRANGE("Posting Date", StartYear, EndYear);
                            GlEntry.CALCSUMS(Amount);
                            GlEntryAccountAmount := GlEntry.Amount;
                        END;
                        BEGIN
                            //Total sum  value of a particular cost center in the budget entry
                            "G/LBudgetEntry".RESET;
                            "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."Global Dimension 1 Code", dimrec);
                            "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartYear, EndYear);
                            "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                            "G/LBudgetEntryAmount" := "G/LBudgetEntry".Amount;
                            //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                        END;

                        BEGIN
                            //Total sum  value of a particular cost center in the budget entry
                            "G/LBudgetEntry".RESET;
                            "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."Global Dimension 1 Code", dimrec);
                            "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartYear, EndYear);
                            "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                            "G/LBudgetEntryAmount" := "G/LBudgetEntry".Amount;
                            //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                        END;

                        BEGIN
                            //Total sum of of particular g/l account in the budget entry
                            "G/LBudgetEntry".RESET;
                            "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."G/L Account No.", GenJournalLineRec."Account No.");
                            "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartYear, EndYear);
                            "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                            "G/LBudgetAccountAmount" := "G/LBudgetEntry".Amount;
                            //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                        END;

                        //total sum for the G/L account in the g/l entry and payment line
                        Totalamountglaccount := PayLineAmountActual + GlEntryAccountAmount;

                        //Difference btw the actual gl account and budgeted amount
                        GlaccBudgetAmountDiff := "G/LBudgetAccountAmount" - Totalamountglaccount;

                        //total sum for the costcenter in the g/l entry and payment line
                        Totalamountexceed := PayLineAmount + GlEntryAmount;

                        //Difference btw the actual cost center and budgeted amount
                        Totalamount := "G/LBudgetEntryAmount" - Totalamountexceed;

                        //MESSAGE(Text005,"G/LBudgetEntryAmount",dimrec,Totalamountexceed,"G/LBudgetAccountAmount",PayLinebudget2."Account No.",Totalamountglaccount);
                        IF ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                        ((Totalamountexceed < "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                        ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) THEN
                            MESSAGE(Text0056, "G/LBudgetEntryAmount", dimrec, Totalamountexceed, "G/LBudgetAccountAmount", GenJournalLineRec."Account No.", Totalamountglaccount);
                        //END;
                    END;

                END;

            UNTIL GenJournalLineRec.NEXT = 0;
        END;
    end;

    procedure ActualBudgetGenjMothYearFixedasset(VAR GenjournaBudgetfixedasse: Record "Gen. Journal Line")
    var

        GLSetupRead: Boolean;
        dimrec: Code[20];
        i: Integer;
        Dimension2: Record "Dimension Value";
        Dimension3: Record "Dimension Value";
        GenJournalLineRec: Record "Gen. Journal Line";
        GlEntry: Record "G/L Entry";
        "G/LBudgetEntry": Record "G/L Budget Entry";
        Daterec: Date;
        StartDate: Date;
        EndDate: Date;
        PayLineAmount: Decimal;
        GlEntryAmount: Decimal;
        "G/LBudgetEntryAmount": Decimal;
        Totalamountexceed: Decimal;
        StartYear: Date;
        EndYear: Date;
        t: Integer;
        StartDate2: Text;
        EndDate2: Text;
        Totalamount: Decimal;
        GenJournalLine3: Record "Gen. Journal Line";
        GlEntryAccountAmount: Decimal;
        PayLineAmountActual: Decimal;
        "G/LBudgetAccountAmount": Decimal;
        Totalamountglaccount: Decimal;
        GlaccBudgetAmountDiff: Decimal;
        GLAcc: Record "G/L Account";
        Dimension: Record "Dimension Value";
        FAPostingGroup: Record "FA Posting Group";
        FixedAsset: Record "Fixed Asset";
        fixsedassetcode: Code[20];
        Glaccount: Code[20];
        GenJournalLineNew: Record "Gen. Journal Line";
        GenJournalLineNewJ5: Record "Gen. Journal Line";
        BatchName: Code[20];
        TemplateBatch: Code[20];
        Text0055: Label 'The   Cost Center budgeted amount is  %1  for %2 and the cost center G/l entry  amount is  %3 the G/L account   Amount budgeted  is %4 for the G/L account %5  and the G/L entry amount is  %6 for the Month you cannot proceed';
        Text0056: Label 'The   Cost Center budgeted amount is  %1  for %2 and the cost center G/l entry  amount is  %3 the G/L account   Amount budgeted  is %4 for the G/L account %5  and the G/L entry amount is  %6 for the YEAR you cannot proceed';
    begin
        IF FixedAsset.GET(GenjournaBudgetfixedasse."Account No.") THEN
            fixsedassetcode := FixedAsset."FA Posting Group";
        IF FAPostingGroup.GET(fixsedassetcode) THEN
            Glaccount := FAPostingGroup."Acquisition Cost Account";

        GLAcc.RESET;
        GLAcc.SETRANGE(GLAcc."No.", Glaccount);
        GLAcc.SETRANGE(GLAcc."Budget Controlled", TRUE);
        IF GLAcc.FINDFIRST THEN BEGIN

            Dimension.SETFILTER(Dimension."Dimension Code", '%1', 'DEPARTMENT');
            Dimension.SETRANGE(Dimension.Code, GenjournaBudgetfixedasse."Shortcut Dimension 1 Code");
            IF Dimension.FINDFIRST THEN
                dimrec := GenjournaBudgetfixedasse."Shortcut Dimension 1 Code";





            BEGIN
                //Total sum of the the particular cost center on the payment line
                GenJournalLine3.RESET;
                GenJournalLine3.SETCURRENTKEY("Shortcut Dimension 1 Code", "Journal Batch Name", "Journal Template Name");
                GenJournalLine3.SETRANGE("Journal Batch Name", GenjournaBudgetfixedasse."Journal Batch Name");
                GenJournalLine3.SETFILTER("Shortcut Dimension 1 Code", dimrec);
                GenJournalLine3.SETRANGE("Journal Template Name", GenjournaBudgetfixedasse."Journal Template Name");
                //GenJournalLine3.SETRANGE("Posting Date",StartDate,EndDate);
                GenJournalLine3.CALCSUMS(GenJournalLine3.Amount);
                PayLineAmount := GenJournalLine3.Amount;
            END;

            BEGIN
                //total sum of a particular G/l account on the payment line for group of fixed asset
                GenJournalLine3.RESET;
                GenJournalLine3.SETCURRENTKEY("Journal Batch Name", "Journal Template Name", "Posting Group");
                GenJournalLine3.SETRANGE("Journal Batch Name", GenjournaBudgetfixedasse."Journal Batch Name");
                GenJournalLine3.SETRANGE("Journal Batch Name", GenjournaBudgetfixedasse."Journal Batch Name");
                GenJournalLine3.SETFILTER("Posting Group", GenjournaBudgetfixedasse."Posting Group");
                GenJournalLine3.CALCSUMS(GenJournalLine3.Amount);
                PayLineAmountActual := GenJournalLine3.Amount;
            END;

            BEGIN
                //Total sum of the particular g/l account  in the g/l entry
                GlEntry.RESET;
                GlEntry.SETRANGE("G/L Account No.", Glaccount);
                GlEntry.SETFILTER("Posting Date", '%1..%2', StartDate, EndDate);
                GlEntry.CALCSUMS(Amount);
                GlEntryAccountAmount := GlEntry.Amount;
            END;


            BEGIN
                //Total sum of the particular cost center in the g/l entry
                GlEntry.RESET;
                GlEntry.SETFILTER("Global Dimension 1 Code", dimrec);
                GlEntry.SETRANGE("Posting Date", StartDate, EndDate);
                GlEntry.CALCSUMS(Amount);
                GlEntryAmount := GlEntry.Amount;
                //MESSAGE(FORMAT(GlEntryAmount));
            END;

            BEGIN
                //Total sum  value of a particular cost center in the budget entry
                "G/LBudgetEntry".RESET;
                "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."Global Dimension 1 Code", dimrec);
                "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartDate, EndDate);
                "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                "G/LBudgetEntryAmount" := "G/LBudgetEntry".Amount;
                //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
            END;

            BEGIN
                //Total sum of of particular g/l account in the budget entry
                "G/LBudgetEntry".RESET;
                "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."G/L Account No.", Glaccount);
                "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartDate, EndDate);
                "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                "G/LBudgetAccountAmount" := "G/LBudgetEntry".Amount;
                //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
            END;


            //total sum for the G/L account in the g/l entry and payment line
            Totalamountglaccount := PayLineAmountActual + GlEntryAccountAmount;

            //Difference btw the actual gl account and budgeted amount
            GlaccBudgetAmountDiff := "G/LBudgetAccountAmount" - Totalamountglaccount;

            //total sum for the costcenter in the g/l entry and payment line
            Totalamountexceed := PayLineAmount + GlEntryAmount;

            //Difference btw the actual cost center and budgeted amount
            Totalamount := "G/LBudgetEntryAmount" - Totalamountexceed;

            IF ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
               ((Totalamountexceed < "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
              ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) THEN
                MESSAGE(Text0055, "G/LBudgetEntryAmount", dimrec, Totalamountexceed, "G/LBudgetAccountAmount", Glaccount, Totalamountglaccount);



            //END;


            BEGIN
                //Total sum of the the particular cost center on the journal line line
                GenJournalLine3.RESET;
                GenJournalLine3.SETCURRENTKEY("Shortcut Dimension 1 Code", "Journal Batch Name", "Journal Template Name");
                GenJournalLine3.SETRANGE("Journal Batch Name", GenjournaBudgetfixedasse."Journal Batch Name");
                GenJournalLine3.SETFILTER("Shortcut Dimension 1 Code", dimrec);
                GenJournalLine3.SETRANGE("Journal Template Name", GenjournaBudgetfixedasse."Journal Template Name");
                //GenJournalLine3.SETRANGE("Posting Date",StartDate,EndDate);
                GenJournalLine3.CALCSUMS(GenJournalLine3.Amount);
                PayLineAmount := GenJournalLine3.Amount;
            END;

            BEGIN
                //total sum of a particular G/l account on the journal line line for group of fixed asset
                GenJournalLine3.RESET;
                GenJournalLine3.SETCURRENTKEY("Journal Batch Name", "Journal Template Name", "Posting Group");
                GenJournalLine3.SETRANGE("Journal Batch Name", GenjournaBudgetfixedasse."Journal Batch Name");
                GenJournalLine3.SETRANGE("Journal Batch Name", GenjournaBudgetfixedasse."Journal Batch Name");
                GenJournalLine3.SETFILTER("Posting Group", GenjournaBudgetfixedasse."Posting Group");
                GenJournalLine3.CALCSUMS(GenJournalLine3.Amount);
                PayLineAmountActual := GenJournalLine3.Amount;
            END;

            BEGIN
                //Total sum of the particular g/l account  in the g/l entry
                GlEntry.RESET;
                GlEntry.SETRANGE("G/L Account No.", Glaccount);
                GlEntry.SETFILTER("Posting Date", '%1..%2', StartYear, EndYear);
                GlEntry.CALCSUMS(Amount);
                GlEntryAccountAmount := GlEntry.Amount;
            END;


            BEGIN
                //Total sum of the particular cost center in the g/l entry
                GlEntry.RESET;
                GlEntry.SETFILTER("Global Dimension 1 Code", dimrec);
                GlEntry.SETRANGE("Posting Date", StartYear, EndYear);
                GlEntry.CALCSUMS(Amount);
                GlEntryAmount := GlEntry.Amount;
                //MESSAGE(FORMAT(GlEntryAmount));
            END;

            BEGIN
                //Total sum  value of a particular cost center in the budget entry
                "G/LBudgetEntry".RESET;
                "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."Global Dimension 1 Code", dimrec);
                "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartYear, EndYear);
                "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                "G/LBudgetEntryAmount" := "G/LBudgetEntry".Amount;
                //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
            END;

            BEGIN
                //Total sum of of particular g/l account in the budget entry
                "G/LBudgetEntry".RESET;
                "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."G/L Account No.", Glaccount);
                "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartYear, EndYear);
                "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                "G/LBudgetAccountAmount" := "G/LBudgetEntry".Amount;
                //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
            END;


            //total sum for the G/L account in the g/l entry and payment line
            Totalamountglaccount := PayLineAmountActual + GlEntryAccountAmount;

            //Difference btw the actual gl account and budgeted amount
            GlaccBudgetAmountDiff := "G/LBudgetAccountAmount" - Totalamountglaccount;

            //total sum for the costcenter in the g/l entry and payment line
            Totalamountexceed := PayLineAmount + GlEntryAmount;

            //Difference btw the actual cost center and budgeted amount
            Totalamount := "G/LBudgetEntryAmount" - Totalamountexceed;

            IF ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
               ((Totalamountexceed < "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
              ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) THEN
                MESSAGE(Text0056, "G/LBudgetEntryAmount", dimrec, Totalamountexceed, "G/LBudgetAccountAmount", Glaccount, Totalamountglaccount);

        END;

    end;



    procedure ActualBudgetPayment(Var PaymentHeader: record "Voucher Header")
    var
        dimrec: Code[20];
        i: Integer;
        Dimension2: Record "Dimension Value";
        Dimension3: Record "Dimension Value";
        Dimension: Record "Dimension Value";
        PayLinebudget: Record "Voucher Line";
        GlEntry: Record "G/L Entry";
        "G/LBudgetEntry": Record "G/L Budget Entry";
        Daterec: Date;
        StartDate: Date;
        EndDate: Date;
        PayLineAmount: Decimal;
        GlEntryAmount: Decimal;
        "G/LBudgetEntryAmount": Decimal;
        Totalamountexceed: Decimal;
        StartYear: Date;
        EndYear: Date;
        t: Integer;
        StartDate2: Text;
        EndDate2: Text;
        Totalamount: Decimal;
        PayLinebudget2: Record "Voucher Line";
        GlEntryAccountAmount: Decimal;
        PayLineAmountActual: Decimal;
        "G/LBudgetAccountAmount": Decimal;
        Totalamountglaccount: Decimal;
        GlaccBudgetAmountDiff: Decimal;
        GLAcc: Record "G/L Account";
        Text005: Label 'The   Cost Center budgeted amount is  %1  for %2 and the cost center G/l entry  amount is  %3 the G/L account   Amount budgeted  is %4 for the G/L account %5  and the G/L entry amount is  %6 for the Month you cannot proceed';
        Text006: Label 'The   Cost Center budgeted amount is  %1  for %2 and the cost center G/l entry  amount is  %3 the G/L account   Amount budgeted  is %4 for the G/L account %5  and the G/L entry amount is  %6 for the YEAR you cannot proceed';
    begin
        //i := 0;
        // to pick the number of cos center to itertate
        Daterec := PaymentHeader."Document Date";
        //dimrec :='';
        StartDate := CALCDATE('<-CM>', Daterec);
        EndDate := CALCDATE('<CM>', Daterec);
        StartYear := CALCDATE('<-CY>', Daterec);
        EndYear := CALCDATE('<CY>', Daterec);

        //MESSAGE(FORMAT(i));
        PayLineAmount := 0;
        GlEntryAmount := 0;
        "G/LBudgetEntryAmount" := 0;
        "G/LBudgetAccountAmount" := 0;
        PayLineAmountActual := 0;
        Totalamountglaccount := 0;
        GlaccBudgetAmountDiff := 0;
        Totalamount := 0;



        PayLinebudget2.RESET;
        PayLinebudget2.SETCURRENTKEY("ShortCut Dimension 1 Code", "Document No.", "Account No.");
        PayLinebudget2.SETRANGE(PayLinebudget2."Document No.", PaymentHeader."No.");
        PayLinebudget2.SETRANGE("ShortCut Dimension 1 Code");
        PayLinebudget2.SETRANGE("Account No.");
        IF PayLinebudget2.FINDFIRST THEN BEGIN

            REPEAT


                GLAcc.RESET;
                GLAcc.SETRANGE(GLAcc."No.", PayLinebudget2."Account No.");
                GLAcc.SETRANGE(GLAcc."Budget Controlled", TRUE);
                IF GLAcc.FINDFIRST THEN BEGIN

                    Dimension.SETFILTER(Dimension."Dimension Code", '%1', 'DEPARTMENT');
                    Dimension.SETRANGE(Dimension.Code, PayLinebudget2."ShortCut Dimension 1 Code");
                    IF Dimension.FINDFIRST THEN
                        dimrec := PayLinebudget2."ShortCut Dimension 1 Code";
                    // MESSAGE(FORMAT(dimrec[i]));


                    //  MESSAGE(dimrec);





                    //To take care of the monthly budget

                    //IF (Daterec > StartDate) AND (Daterec < EndDate) THEN BEGIN
                    /*
                BEGIN
                    //Total sum of the the particular cost center on the payment line
                    PayLinebudget.RESET;
                    PayLinebudget.SETCURRENTKEY("Global Dimension 1 Code", "No.");
                    PayLinebudget.SETRANGE(PayLinebudget."No.", PaymentHeader."No.");
                    PayLinebudget.SETFILTER("Global Dimension 1 Code", dimrec);
                    //PayLinebudget.SETRANGE(Date,StartDate,EndDate);
                    PayLinebudget.CALCSUMS(PayLinebudget.Amount);
                    PayLineAmount := PayLinebudget.Amount;
                END;

*/
                    BEGIN
                        //Total sum of the the particular cost center on the payment line
                        PayLinebudget.RESET;
                        PayLinebudget.SETCURRENTKEY("Shortcut Dimension 1 Code", "Document No.");
                        PayLinebudget.SETRANGE(PayLinebudget."Document No.", PaymentHeader."No.");
                        PayLinebudget.SETFILTER("Shortcut Dimension 1 Code", dimrec);
                        //PayLinebudget.SETRANGE(Date,StartDate,EndDate);
                        PayLinebudget.CALCSUMS(PayLinebudget.Amount);
                        PayLineAmount := PayLinebudget.Amount;
                    END;


                    BEGIN
                        //total sum of a particular G/l account on the payment line
                        PayLinebudget.RESET;
                        PayLinebudget.SETCURRENTKEY("Document No.", "Account No.");
                        PayLinebudget.SETRANGE(PayLinebudget."Document No.", PaymentHeader."No.");
                        PayLinebudget.SETFILTER("Account No.", PayLinebudget2."Account No.");
                        PayLinebudget.CALCSUMS(PayLinebudget.Amount);
                        PayLineAmountActual := PayLinebudget.Amount;
                    END;

                    BEGIN
                        //Total sum of the particular cost center in the g/l entry
                        GlEntry.RESET;
                        GlEntry.SETFILTER("Global Dimension 1 Code", dimrec);
                        GlEntry.SETRANGE("Posting Date", StartDate, EndDate);
                        GlEntry.CALCSUMS(Amount);
                        GlEntryAmount := GlEntry.Amount;
                        //MESSAGE(FORMAT(GlEntryAmount));
                    END;

                    BEGIN
                        //Total sum of the particular g/l account  in the g/l entry
                        GlEntry.RESET;
                        GlEntry.SETRANGE("G/L Account No.", PayLinebudget2."Account No.");
                        GlEntry.SETFILTER("Posting Date", '%1..%2', StartDate, EndDate);
                        GlEntry.CALCSUMS(Amount);
                        GlEntryAccountAmount := GlEntry.Amount;
                    END;


                    BEGIN
                        //Total sum  value of a particular cost center in the budget entry
                        "G/LBudgetEntry".RESET;
                        "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."Global Dimension 1 Code", dimrec);
                        "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartDate, EndDate);
                        "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                        "G/LBudgetEntryAmount" := "G/LBudgetEntry".Amount;
                        //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                    END;


                    BEGIN
                        //Total sum of of particular g/l account in the budget entry
                        "G/LBudgetEntry".RESET;
                        "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."G/L Account No.", PayLinebudget2."Account No.");
                        "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartDate, EndDate);
                        "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                        "G/LBudgetAccountAmount" := "G/LBudgetEntry".Amount;
                        //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                    END;


                    //total sum for the G/L account in the g/l entry and payment line
                    Totalamountglaccount := PayLineAmountActual + GlEntryAccountAmount;

                    //Difference btw the actual gl account and budgeted amount
                    GlaccBudgetAmountDiff := "G/LBudgetAccountAmount" - Totalamountglaccount;

                    //total sum for the costcenter in the g/l entry and payment line
                    Totalamountexceed := PayLineAmount + GlEntryAmount;

                    //Difference btw the actual cost center and budgeted amount
                    Totalamount := "G/LBudgetEntryAmount" - Totalamountexceed;

                    IF ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                       ((Totalamountexceed < "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                      ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) THEN
                        MESSAGE(Text005, "G/LBudgetEntryAmount", dimrec, Totalamountexceed, "G/LBudgetAccountAmount", PayLinebudget2."Account No.", Totalamountglaccount);

                    //END;

                    //to take care of the yearly budget

                    //IF (Daterec > StartYear) AND (Daterec < EndYear) THEN BEGIN
                    BEGIN
                        //Total sum of the the particular cost center on the payment line
                        PayLinebudget.RESET;
                        PayLinebudget.SETCURRENTKEY("Shortcut Dimension 1 Code", "Document No.");
                        PayLinebudget.SETRANGE(PayLinebudget."Document No.", PaymentHeader."No.");
                        PayLinebudget.SETFILTER("Shortcut Dimension 1 Code", dimrec);
                        //PayLinebudget.SETRANGE(Date,StartYear,EndYear);
                        PayLinebudget.CALCSUMS(PayLinebudget.Amount);
                        PayLineAmount := PayLinebudget.Amount;
                    END;

                    BEGIN
                        //total sum of a particular G/l account on the payment line
                        PayLinebudget.RESET;
                        PayLinebudget.SETCURRENTKEY("Document No.", "Account No.");
                        PayLinebudget.SETRANGE(PayLinebudget."Document No.", PaymentHeader."No.");
                        PayLinebudget.SETFILTER("Account No.", PayLinebudget2."Account No.");
                        PayLinebudget.CALCSUMS(PayLinebudget.Amount);
                        PayLineAmountActual := PayLinebudget.Amount;
                    END;

                    BEGIN
                        //Total sum of the particular cost center in the g/l entry
                        GlEntry.RESET;
                        GlEntry.SETFILTER("Global Dimension 1 Code", dimrec);
                        GlEntry.SETRANGE("Posting Date", StartYear, EndYear);
                        GlEntry.CALCSUMS(Amount);
                        GlEntryAmount := GlEntry.Amount;
                        //MESSAGE(FORMAT(GlEntryAmount));
                    END;


                    BEGIN
                        //Total sum of the particular g/l account  in the g/l entry
                        GlEntry.RESET;
                        GlEntry.SETRANGE("G/L Account No.", PayLinebudget2."Account No.");
                        GlEntry.SETRANGE("Posting Date", StartYear, EndYear);
                        GlEntry.CALCSUMS(Amount);
                        GlEntryAccountAmount := GlEntry.Amount;
                    END;
                    BEGIN
                        //Total sum  value of a particular cost center in the budget entry
                        "G/LBudgetEntry".RESET;
                        "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."Global Dimension 1 Code", dimrec);
                        "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartYear, EndYear);
                        "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                        "G/LBudgetEntryAmount" := "G/LBudgetEntry".Amount;
                        //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                    END;

                    BEGIN
                        //Total sum  value of a particular cost center in the budget entry
                        "G/LBudgetEntry".RESET;
                        "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."Global Dimension 1 Code", dimrec);
                        "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartYear, EndYear);
                        "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                        "G/LBudgetEntryAmount" := "G/LBudgetEntry".Amount;
                        //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                    END;

                    BEGIN
                        //Total sum of of particular g/l account in the budget entry
                        "G/LBudgetEntry".RESET;
                        "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."G/L Account No.", PayLinebudget2."Account No.");
                        "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartYear, EndYear);
                        "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                        "G/LBudgetAccountAmount" := "G/LBudgetEntry".Amount;
                        //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                    END;

                    //total sum for the G/L account in the g/l entry and payment line
                    Totalamountglaccount := PayLineAmountActual + GlEntryAccountAmount;

                    //Difference btw the actual gl account and budgeted amount
                    GlaccBudgetAmountDiff := "G/LBudgetAccountAmount" - Totalamountglaccount;

                    //total sum for the costcenter in the g/l entry and payment line
                    Totalamountexceed := PayLineAmount + GlEntryAmount;

                    //Difference btw the actual cost center and budgeted amount
                    Totalamount := "G/LBudgetEntryAmount" - Totalamountexceed;

                    //MESSAGE(Text005,"G/LBudgetEntryAmount",dimrec,Totalamountexceed,"G/LBudgetAccountAmount",PayLinebudget2."Account No.",Totalamountglaccount);
                    IF ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                       ((Totalamountexceed < "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                      ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) THEN
                        MESSAGE(Text006, "G/LBudgetEntryAmount", dimrec, Totalamountexceed, "G/LBudgetAccountAmount", PayLinebudget2."Account No.", Totalamountglaccount);
                    //END;
                END
            UNTIL PayLinebudget2.NEXT = 0;
        END;
    end;





    procedure ActualBudgetstaffAdvance(var StaffAdvanceHeader: record "Staff Advance Header")
    var
        dimrec: Code[20];
        i: Integer;
        Dimension2: Record "Dimension Value";
        Dimension3: Record "Dimension Value";
        StaffAdvanceLinesBudget: Record "Staff Advance Lines";
        GlEntry: Record "G/L Entry";
        "G/LBudgetEntry": Record "G/L Budget Entry";
        Daterec: Date;
        StartDate: Date;
        EndDate: Date;
        PayLineAmount: Decimal;
        GlEntryAmount: Decimal;
        "G/LBudgetEntryAmount": Decimal;
        Totalamountexceed: Decimal;
        StartYear: Date;
        EndYear: Date;
        t: Integer;
        StartDate2: Text;
        EndDate2: Text;
        Totalamount: Decimal;
        StaffAdvanceLinesBudget2: Record "Staff Advance Lines";
        GlEntryAccountAmount: Decimal;
        PayLineAmountActual: Decimal;
        "G/LBudgetAccountAmount": Decimal;
        Totalamountglaccount: Decimal;
        GlaccBudgetAmountDiff: Decimal;
        GLAcc: Record "G/L Account";
        Dimension: Record "Dimension Value";
        Text005: Label 'The   Cost Center budgeted amount is  %1  for %2 and the cost center G/l entry  amount is  %3 the G/L account   Amount budgeted  is %4 for the G/L account %5  and the G/L entry amount is  %6 for the Month you cannot proceed';
        Text006: Label 'The   Cost Center budgeted amount is  %1  for %2 and the cost center G/l entry  amount is  %3 the G/L account   Amount budgeted  is %4 for the G/L account %5  and the G/L entry amount is  %6 for the YEAR you cannot proceed';
    begin
        Daterec := StaffAdvanceHeader.Date;
        StartDate := CALCDATE('<-CM>', Daterec);
        EndDate := CALCDATE('<CM>', Daterec);
        StartYear := CALCDATE('<-CY>', Daterec);
        EndYear := CALCDATE('<CY>', Daterec);


        PayLineAmount := 0;
        GlEntryAmount := 0;
        "G/LBudgetEntryAmount" := 0;
        "G/LBudgetAccountAmount" := 0;
        PayLineAmountActual := 0;
        Totalamountglaccount := 0;
        GlaccBudgetAmountDiff := 0;
        Totalamount := 0;

        // to pick the number of cos center to itertate

        Daterec := StaffAdvanceHeader.Date;
        StartDate := CALCDATE('<-CM>', Daterec);
        EndDate := CALCDATE('<CM>', Daterec);
        StartYear := CALCDATE('<-CY>', Daterec);
        EndYear := CALCDATE('<CY>', Daterec);


        StaffAdvanceLinesBudget.SETCURRENTKEY("No.", "Global Dimension 1 Code", "Account No.");
        StaffAdvanceLinesBudget.SETRANGE(StaffAdvanceLinesBudget."No.", StaffAdvanceHeader."No.");
        StaffAdvanceLinesBudget.SETRANGE("Global Dimension 1 Code");
        StaffAdvanceLinesBudget.SETRANGE(StaffAdvanceLinesBudget."Account No.");
        IF StaffAdvanceLinesBudget.FINDFIRST THEN BEGIN
            REPEAT
                GLAcc.RESET;
                GLAcc.SETRANGE(GLAcc."No.", StaffAdvanceLinesBudget."Account No.");
                GLAcc.SETRANGE(GLAcc."Budget Controlled", TRUE);
                IF GLAcc.FINDFIRST THEN BEGIN



                    Dimension.SETFILTER(Dimension."Dimension Code", '%1', 'DEPARTMENT');
                    Dimension.SETRANGE(Dimension.Code, StaffAdvanceLinesBudget."Global Dimension 1 Code");
                    IF Dimension.FINDFIRST THEN
                        dimrec := StaffAdvanceLinesBudget."Global Dimension 1 Code";

                    MESSAGE(dimrec);
                    //To take care of the monthly budget
                    //IF (Daterec > StartDate) AND (Daterec < EndDate) THEN BEGIN
                    BEGIN
                        StaffAdvanceLinesBudget2.RESET;
                        StaffAdvanceLinesBudget2.SETCURRENTKEY("Global Dimension 1 Code", "No.");
                        StaffAdvanceLinesBudget2.SETRANGE(StaffAdvanceLinesBudget2."No.", StaffAdvanceHeader."No.");
                        StaffAdvanceLinesBudget2.SETFILTER("Global Dimension 1 Code", dimrec);
                        //PayLinebudget.SETRANGE(Date,StartDate,EndDate);
                        StaffAdvanceLinesBudget2.CALCSUMS(StaffAdvanceLinesBudget2.Amount);
                        PayLineAmount := StaffAdvanceLinesBudget2.Amount;
                    END;



                    BEGIN
                        //total sum of a particular G/l account on the payment line
                        StaffAdvanceLinesBudget2.RESET;
                        StaffAdvanceLinesBudget2.SETCURRENTKEY("No.", "Account No.");
                        StaffAdvanceLinesBudget2.SETRANGE(StaffAdvanceLinesBudget2."No.", StaffAdvanceHeader."No.");
                        StaffAdvanceLinesBudget2.SETFILTER("Account No.", StaffAdvanceLinesBudget."Account No.");
                        StaffAdvanceLinesBudget2.CALCSUMS(StaffAdvanceLinesBudget2.Amount);
                        PayLineAmountActual := StaffAdvanceLinesBudget2.Amount;
                    END;


                    BEGIN
                        GlEntry.RESET;
                        GlEntry.SETFILTER("Global Dimension 2 Code", dimrec);
                        GlEntry.SETRANGE("Posting Date", StartDate, EndDate);
                        GlEntry.CALCSUMS(Amount);
                        GlEntryAmount := GlEntry.Amount;
                        //MESSAGE(FORMAT(GlEntryAmount));
                    END;


                    BEGIN
                        //Total sum of the particular g/l account  in the g/l entry
                        GlEntry.RESET;
                        GlEntry.SETRANGE("G/L Account No.", StaffAdvanceLinesBudget."Account No.");
                        GlEntry.SETFILTER("Posting Date", '%1..%2', StartDate, EndDate);
                        GlEntry.CALCSUMS(Amount);
                        GlEntryAccountAmount := GlEntry.Amount;
                    END;

                    BEGIN
                        "G/LBudgetEntry".RESET;
                        "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."Global Dimension 1 Code", dimrec);
                        "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartDate, EndDate);
                        "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                        "G/LBudgetEntryAmount" := "G/LBudgetEntry".Amount;
                        //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                    END;


                    BEGIN
                        //Total sum of of particular g/l account in the budget entry
                        "G/LBudgetEntry".RESET;
                        "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."G/L Account No.", StaffAdvanceLinesBudget."Account No.");
                        "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartDate, EndDate);
                        "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                        "G/LBudgetAccountAmount" := "G/LBudgetEntry".Amount;
                        //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                    END;

                    //total sum for the G/L account in the g/l entry and payment line
                    Totalamountglaccount := PayLineAmountActual + GlEntryAccountAmount;

                    //Difference btw the actual gl account and budgeted amount
                    GlaccBudgetAmountDiff := "G/LBudgetAccountAmount" - Totalamountglaccount;

                    //total sum for the costcenter in the g/l entry and payment line
                    Totalamountexceed := PayLineAmount + GlEntryAmount;

                    //Difference btw the actual cost center and budgeted amount
                    Totalamount := "G/LBudgetEntryAmount" - Totalamountexceed;

                    IF ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                       ((Totalamountexceed < "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                      ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) THEN
                        MESSAGE(Text005, "G/LBudgetEntryAmount", dimrec, Totalamountexceed, "G/LBudgetAccountAmount", StaffAdvanceLinesBudget."Account No.", Totalamountglaccount);





                    //to take care of the yearly budget

                    //IF (Daterec > StartYear) AND (Daterec < EndYear) THEN BEGIN
                    //F (Daterec > StartDate) AND (Daterec < EndDate) THEN BEGIN
                    BEGIN
                        StaffAdvanceLinesBudget2.RESET;
                        StaffAdvanceLinesBudget2.SETCURRENTKEY("Global Dimension 1 Code", "No.");
                        StaffAdvanceLinesBudget2.SETRANGE(StaffAdvanceLinesBudget2."No.", StaffAdvanceHeader."No.");
                        StaffAdvanceLinesBudget2.SETFILTER("Global Dimension 1 Code", dimrec);
                        //PayLinebudget.SETRANGE(Date,StartDate,EndDate);
                        StaffAdvanceLinesBudget2.CALCSUMS(StaffAdvanceLinesBudget2.Amount);
                        PayLineAmount := StaffAdvanceLinesBudget2.Amount;
                    END;



                    BEGIN
                        //total sum of a particular G/l account on the payment line
                        StaffAdvanceLinesBudget2.RESET;
                        StaffAdvanceLinesBudget2.SETCURRENTKEY("No.", "Account No.");
                        StaffAdvanceLinesBudget2.SETRANGE(StaffAdvanceLinesBudget2."No.", StaffAdvanceHeader."No.");
                        StaffAdvanceLinesBudget2.SETFILTER("Account No.", StaffAdvanceLinesBudget."Account No.");
                        StaffAdvanceLinesBudget2.CALCSUMS(StaffAdvanceLinesBudget2.Amount);
                        PayLineAmountActual := StaffAdvanceLinesBudget2.Amount;
                    END;


                    BEGIN
                        GlEntry.RESET;
                        GlEntry.SETFILTER("Global Dimension 1 Code", dimrec);
                        GlEntry.SETRANGE("Posting Date", StartYear, EndYear);
                        GlEntry.CALCSUMS(Amount);
                        GlEntryAmount := GlEntry.Amount;
                        //MESSAGE(FORMAT(GlEntryAmount));
                    END;


                    BEGIN
                        //Total sum of the particular g/l account  in the g/l entry
                        GlEntry.RESET;
                        GlEntry.SETRANGE("G/L Account No.", StaffAdvanceLinesBudget."Account No.");
                        GlEntry.SETFILTER("Posting Date", '%1..%2', StartYear, EndYear);
                        GlEntry.CALCSUMS(Amount);
                        GlEntryAccountAmount := GlEntry.Amount;
                    END;

                    BEGIN
                        "G/LBudgetEntry".RESET;
                        "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."Global Dimension 1 Code", dimrec);
                        "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartYear, EndYear);
                        "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                        "G/LBudgetEntryAmount" := "G/LBudgetEntry".Amount;
                        //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                    END;


                    BEGIN
                        //Total sum of of particular g/l account in the budget entry
                        "G/LBudgetEntry".RESET;
                        "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."G/L Account No.", StaffAdvanceLinesBudget."Account No.");
                        "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartYear, EndYear);
                        "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                        "G/LBudgetAccountAmount" := "G/LBudgetEntry".Amount;
                        //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                    END;

                    //total sum for the G/L account in the g/l entry and payment line
                    Totalamountglaccount := PayLineAmountActual + GlEntryAccountAmount;

                    //Difference btw the actual gl account and budgeted amount
                    GlaccBudgetAmountDiff := "G/LBudgetAccountAmount" - Totalamountglaccount;

                    //total sum for the costcenter in the g/l entry and payment line
                    Totalamountexceed := PayLineAmount + GlEntryAmount;

                    //Difference btw the actual cost center and budgeted amount
                    Totalamount := "G/LBudgetEntryAmount" - Totalamountexceed;

                    IF ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                       ((Totalamountexceed < "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                      ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) THEN
                        MESSAGE(Text006, "G/LBudgetEntryAmount", dimrec, Totalamountexceed, "G/LBudgetAccountAmount", StaffAdvanceLinesBudget."Account No.", Totalamountglaccount);
                END;
            UNTIL StaffAdvanceLinesBudget.NEXT = 0;

        END;
    end;

    procedure ActualBudgetMothYearPurchase(var PurchaseHeader: record "Purchase Header")
    var

        Dimension: Record "Dimension Value";
        dimrec: Code[20];
        i: Integer;
        Dimension2: Record "Dimension Value";
        Dimension3: Record "Dimension Value";
        PurchaseLineBudget2: Record "Purchase Line";
        GlEntry: Record "G/L Entry";
        "G/LBudgetEntry": Record "G/L Budget Entry";
        Daterec: Date;
        StartDate: Date;
        EndDate: Date;
        PayLineAmount: Decimal;
        GlEntryAmount: Decimal;
        "G/LBudgetEntryAmount": Decimal;
        Totalamountexceed: Decimal;
        StartYear: Date;
        EndYear: Date;
        t: Integer;
        StartDate2: Text;
        EndDate2: Text;
        Totalamount: Decimal;
        PurchaseLineBudget: Record "Purchase Line";
        GlEntryAccountAmount: Decimal;
        PayLineAmountActual: Decimal;
        "G/LBudgetAccountAmount": Decimal;
        Totalamountglaccount: Decimal;
        GlaccBudgetAmountDiff: Decimal;
        FAPostingGroup: Record "FA Posting Group";
        FixedAsset: Record "Fixed Asset";
        fixsedassetcode: Code[20];
        Glaccount: Code[20];
        GLAcc: Record "G/L Account";
        Text0055: Label 'The   Cost Center budgeted amount is  %1  for %2 and the cost center G/l entry  amount is  %3 the G/L account   Amount budgeted  is %4 for the G/L account %5  and the G/L entry amount is  %6 for the Month you cannot proceed';
        Text0056: Label 'The   Cost Center budgeted amount is  %1  for %2 and the cost center G/l entry  amount is  %3 the G/L account   Amount budgeted  is %4 for the G/L account %5  and the G/L entry amount is  %6 for the YEAR you cannot proceed';
    begin
        Daterec := PurchaseHeader."Order Date";
        //dimrec :='';
        StartDate := CALCDATE('<-CM>', Daterec);
        EndDate := CALCDATE('<CM>', Daterec);
        StartYear := CALCDATE('<-CY>', Daterec);
        EndYear := CALCDATE('<CY>', Daterec);

        //MESSAGE(FORMAT(i));
        PayLineAmount := 0;
        GlEntryAmount := 0;
        "G/LBudgetEntryAmount" := 0;
        "G/LBudgetAccountAmount" := 0;
        PayLineAmountActual := 0;
        Totalamountglaccount := 0;
        GlaccBudgetAmountDiff := 0;
        Totalamount := 0;



        PurchaseLineBudget.SETCURRENTKEY("Shortcut Dimension 1 Code", "Document No.", "No.");
        PurchaseLineBudget.SETRANGE("Document No.", PurchaseHeader."No.");
        PurchaseLineBudget.SETRANGE("Shortcut Dimension 1 Code");
        PurchaseLineBudget.SETRANGE("No.");
        IF PurchaseLineBudget.FINDFIRST THEN BEGIN

            REPEAT

                IF PurchaseLineBudget.Type = PurchaseLineBudget.Type::"Fixed Asset" THEN
                    ActualBudgetMothYearFixedassPurchase(PurchaseHeader, PurchaseLineBudget)
                ELSE BEGIN

                    GLAcc.RESET;
                    GLAcc.SETRANGE(GLAcc."No.", PurchaseLineBudget."No.");
                    GLAcc.SETRANGE(GLAcc."Budget Controlled", TRUE);
                    IF GLAcc.FINDFIRST THEN BEGIN

                        Dimension.SETFILTER(Dimension."Dimension Code", '%1', 'DEPARTMENT');
                        Dimension.SETRANGE(Dimension.Code, PurchaseLineBudget."Shortcut Dimension 1 Code");
                        IF Dimension.FINDFIRST THEN
                            dimrec := PurchaseLineBudget."Shortcut Dimension 1 Code";

                        MESSAGE(dimrec);


                        BEGIN
                            //Total sum of the the particular cost center on the payment line
                            PurchaseLineBudget2.RESET;
                            PurchaseLineBudget2.SETCURRENTKEY("Shortcut Dimension 1 Code", "Document No.");
                            PurchaseLineBudget2.SETRANGE("Document No.", PurchaseHeader."No.");
                            PurchaseLineBudget2.SETFILTER("Shortcut Dimension 2 Code", dimrec);
                            //PurchaseLineBudget2.SETRANGE(Date,StartDate,EndDate);
                            PurchaseLineBudget2.CALCSUMS(PurchaseLineBudget2."Amount Including VAT");
                            PayLineAmount := PurchaseLineBudget2."Amount Including VAT";
                        END;


                        BEGIN
                            //total sum of a particular G/l account on the payment line
                            PurchaseLineBudget2.RESET;
                            PurchaseLineBudget2.SETCURRENTKEY("Document No.", "No.");
                            PurchaseLineBudget2.SETRANGE(PurchaseLineBudget2."Document No.", PurchaseHeader."No.");
                            PurchaseLineBudget2.SETFILTER("No.", PurchaseLineBudget."No.");
                            PurchaseLineBudget2.CALCSUMS(PurchaseLineBudget2."Amount Including VAT");
                            PayLineAmountActual := PurchaseLineBudget2."Amount Including VAT";
                        END;

                        BEGIN
                            //Total sum of the particular g/l account  in the g/l entry
                            GlEntry.RESET;
                            GlEntry.SETRANGE("G/L Account No.", PurchaseLineBudget."No.");
                            GlEntry.SETFILTER("Posting Date", '%1..%2', StartDate, EndDate);
                            GlEntry.CALCSUMS(Amount);
                            GlEntryAccountAmount := GlEntry.Amount;
                        END;


                        BEGIN
                            //Total sum of the particular cost center in the g/l entry
                            GlEntry.RESET;
                            GlEntry.SETFILTER("Global Dimension 1 Code", dimrec);
                            GlEntry.SETRANGE("Posting Date", StartDate, EndDate);
                            GlEntry.CALCSUMS(Amount);
                            GlEntryAmount := GlEntry.Amount;
                            //MESSAGE(FORMAT(GlEntryAmount));
                        END;

                        BEGIN
                            //Total sum  value of a particular cost center in the budget entry
                            "G/LBudgetEntry".RESET;
                            "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."Global Dimension 1 Code", dimrec);
                            "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartDate, EndDate);
                            "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                            "G/LBudgetEntryAmount" := "G/LBudgetEntry".Amount;
                            //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                        END;

                        BEGIN
                            //Total sum of of particular g/l account in the budget entry
                            "G/LBudgetEntry".RESET;
                            "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."G/L Account No.", PurchaseLineBudget."No.");
                            "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartDate, EndDate);
                            "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                            "G/LBudgetAccountAmount" := "G/LBudgetEntry".Amount;
                            //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                        END;


                        //total sum for the G/L account in the g/l entry and payment line
                        Totalamountglaccount := PayLineAmountActual + GlEntryAccountAmount;

                        //Difference btw the actual gl account and budgeted amount
                        GlaccBudgetAmountDiff := "G/LBudgetAccountAmount" - Totalamountglaccount;

                        //total sum for the costcenter in the g/l entry and payment line
                        Totalamountexceed := PayLineAmount + GlEntryAmount;

                        //Difference btw the actual cost center and budgeted amount
                        Totalamount := "G/LBudgetEntryAmount" - Totalamountexceed;

                        IF ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                           ((Totalamountexceed < "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                          ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) THEN
                            MESSAGE(Text0055, "G/LBudgetEntryAmount", dimrec, Totalamountexceed, "G/LBudgetAccountAmount", PurchaseLineBudget."No.", Totalamountglaccount);



                        //END;


                        BEGIN
                            //Total sum of the the particular cost center on the payment line
                            PurchaseLineBudget2.RESET;
                            PurchaseLineBudget2.SETCURRENTKEY("Shortcut Dimension 1 Code", "Document No.");
                            PurchaseLineBudget2.SETRANGE("Document No.", PurchaseHeader."No.");
                            PurchaseLineBudget2.SETFILTER("Shortcut Dimension 1 Code", dimrec);
                            //PurchaseLineBudget2.SETRANGE(Date,StartDate,EndDate);
                            PurchaseLineBudget2.CALCSUMS(PurchaseLineBudget2."Amount Including VAT");
                            PayLineAmount := PurchaseLineBudget2."Amount Including VAT";
                        END;


                        BEGIN
                            //total sum of a particular G/l account on the payment line
                            PurchaseLineBudget2.RESET;
                            PurchaseLineBudget2.SETCURRENTKEY("Document No.", "No.");
                            PurchaseLineBudget2.SETRANGE(PurchaseLineBudget2."Document No.", PurchaseHeader."No.");
                            PurchaseLineBudget2.SETFILTER("No.", PurchaseLineBudget."No.");
                            PurchaseLineBudget2.CALCSUMS(PurchaseLineBudget2."Amount Including VAT");
                            PayLineAmountActual := PurchaseLineBudget2."Amount Including VAT";
                        END;

                        BEGIN
                            //Total sum of the particular g/l account  in the g/l entry
                            GlEntry.RESET;
                            GlEntry.SETRANGE("G/L Account No.", PurchaseLineBudget."No.");
                            GlEntry.SETFILTER("Posting Date", '%1..%2', StartYear, EndYear);
                            GlEntry.CALCSUMS(Amount);
                            GlEntryAccountAmount := GlEntry.Amount;
                        END;


                        BEGIN
                            //Total sum of the particular cost center in the g/l entry
                            GlEntry.RESET;
                            GlEntry.SETFILTER("Global Dimension 1 Code", dimrec);
                            GlEntry.SETRANGE("Posting Date", StartYear, EndYear);
                            GlEntry.CALCSUMS(Amount);
                            GlEntryAmount := GlEntry.Amount;
                            //MESSAGE(FORMAT(GlEntryAmount));
                        END;

                        BEGIN
                            //Total sum  value of a particular cost center in the budget entry
                            "G/LBudgetEntry".RESET;
                            "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."Global Dimension 1 Code", dimrec);
                            "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartYear, EndYear);
                            "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                            "G/LBudgetEntryAmount" := "G/LBudgetEntry".Amount;
                            //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                        END;

                        BEGIN
                            //Total sum of of particular g/l account in the budget entry
                            "G/LBudgetEntry".RESET;
                            "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."G/L Account No.", PurchaseLineBudget."No.");
                            "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartYear, EndYear);
                            "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                            "G/LBudgetAccountAmount" := "G/LBudgetEntry".Amount;
                            //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                        END;


                        //total sum for the G/L account in the g/l entry and payment line
                        Totalamountglaccount := PayLineAmountActual + GlEntryAccountAmount;

                        //Difference btw the actual gl account and budgeted amount
                        GlaccBudgetAmountDiff := "G/LBudgetAccountAmount" - Totalamountglaccount;

                        //total sum for the costcenter in the g/l entry and payment line
                        Totalamountexceed := PayLineAmount + GlEntryAmount;

                        //Difference btw the actual cost center and budgeted amount
                        Totalamount := "G/LBudgetEntryAmount" - Totalamountexceed;

                        IF ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                           ((Totalamountexceed < "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                          ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) THEN
                            MESSAGE(Text0056, "G/LBudgetEntryAmount", dimrec, Totalamountexceed, "G/LBudgetAccountAmount", PurchaseLineBudget."No.", Totalamountglaccount);
                    END
                END;
            UNTIL PurchaseLineBudget.NEXT = 0;
        END;

    end;

    procedure ActualBudgetMothYearFixedassPurchase(PurchaseHeader: record "Purchase Header"; VAR PurchaseLineBudgetfixedasse: Record "Purchase Line")
    var
        Dimension: Record "Dimension Value";
        dimrec: Code[20];
        i: Integer;
        Dimension2: Record "Dimension Value";
        Dimension3: Record "Dimension Value";
        PurchaseLineBudget2: Record "Purchase Line";
        GlEntry: Record "G/L Entry";
        "G/LBudgetEntry": Record "G/L Budget Entry";
        Daterec: Date;
        StartDate: Date;
        EndDate: Date;
        PayLineAmount: Decimal;
        GlEntryAmount: Decimal;
        "G/LBudgetEntryAmount": Decimal;
        Totalamountexceed: Decimal;
        StartYear: Date;
        EndYear: Date;
        t: Integer;
        StartDate2: Text;
        EndDate2: Text;
        Totalamount: Decimal;
        PurchaseLineBudget: Record "Purchase Line";
        GlEntryAccountAmount: Decimal;
        PayLineAmountActual: Decimal;
        "G/LBudgetAccountAmount": Decimal;
        Totalamountglaccount: Decimal;
        GlaccBudgetAmountDiff: Decimal;
        FAPostingGroup: Record "FA Posting Group";
        FixedAsset: Record "Fixed Asset";
        fixsedassetcode: Code[20];
        Glaccount: Code[20];
        GLAcc: Record "G/L Account";
        Text0055: Label 'The   Cost Center budgeted amount is  %1  for %2 and the cost center G/l entry  amount is  %3 the G/L account   Amount budgeted  is %4 for the G/L account %5  and the G/L entry amount is  %6 for the Month you cannot proceed';
        Text0056: Label 'The   Cost Center budgeted amount is  %1  for %2 and the cost center G/l entry  amount is  %3 the G/L account   Amount budgeted  is %4 for the G/L account %5  and the G/L entry amount is  %6 for the YEAR you cannot proceed';
    begin
        Daterec := PurchaseHeader."Order Date";
        //dimrec :='';
        StartDate := CALCDATE('<-CM>', Daterec);
        EndDate := CALCDATE('<CM>', Daterec);
        StartYear := CALCDATE('<-CY>', Daterec);
        EndYear := CALCDATE('<CY>', Daterec);

        //MESSAGE(FORMAT(i));
        PayLineAmount := 0;
        GlEntryAmount := 0;
        "G/LBudgetEntryAmount" := 0;
        "G/LBudgetAccountAmount" := 0;
        PayLineAmountActual := 0;
        Totalamountglaccount := 0;
        GlaccBudgetAmountDiff := 0;
        Totalamount := 0;


        IF FixedAsset.GET(PurchaseLineBudgetfixedasse."No.") THEN
            fixsedassetcode := FixedAsset."FA Posting Group";
        IF FAPostingGroup.GET(fixsedassetcode) THEN
            Glaccount := FAPostingGroup."Acquisition Cost Account";

        GLAcc.RESET;
        GLAcc.SETRANGE(GLAcc."No.", Glaccount);
        GLAcc.SETRANGE(GLAcc."Budget Controlled", TRUE);
        IF GLAcc.FINDFIRST THEN BEGIN

            Dimension.SETFILTER(Dimension."Dimension Code", '%1', 'DEPARTMENT');
            Dimension.SETRANGE(Dimension.Code, PurchaseLineBudgetfixedasse."Shortcut Dimension 1 Code");
            IF Dimension.FINDFIRST THEN
                dimrec := PurchaseLineBudgetfixedasse."Shortcut Dimension 1 Code";





            BEGIN
                //Total sum of the the particular cost center on the payment line
                PurchaseLineBudget2.RESET;
                PurchaseLineBudget2.SETCURRENTKEY("Shortcut Dimension 1 Code", "Document No.");
                PurchaseLineBudget2.SETRANGE("Document No.", PurchaseHeader."No.");
                PurchaseLineBudget2.SETFILTER("Shortcut Dimension 1 Code", dimrec);
                //PurchaseLineBudget2.SETRANGE(Date,StartDate,EndDate);
                PurchaseLineBudget2.CALCSUMS(PurchaseLineBudget2."Amount Including VAT");
                PayLineAmount := PurchaseLineBudget2."Amount Including VAT";
            END;


            BEGIN
                //total sum of a particular G/l account on the payment line
                PurchaseLineBudget2.RESET;
                PurchaseLineBudget2.SETCURRENTKEY("Document No.", "Posting Group");
                PurchaseLineBudget2.SETRANGE(PurchaseLineBudget2."Document No.", PurchaseHeader."No.");
                PurchaseLineBudget2.SETFILTER("Posting Group", PurchaseLineBudgetfixedasse."Posting Group");
                PurchaseLineBudget2.CALCSUMS(PurchaseLineBudget2."Amount Including VAT");
                PayLineAmountActual := PurchaseLineBudget2."Amount Including VAT";
            END;

            BEGIN
                //Total sum of the particular g/l account  in the g/l entry
                GlEntry.RESET;
                GlEntry.SETRANGE("G/L Account No.", Glaccount);
                GlEntry.SETFILTER("Posting Date", '%1..%2', StartDate, EndDate);
                GlEntry.CALCSUMS(Amount);
                GlEntryAccountAmount := GlEntry.Amount;
            END;


            BEGIN
                //Total sum of the particular cost center in the g/l entry
                GlEntry.RESET;
                GlEntry.SETFILTER("Global Dimension 1 Code", dimrec);
                GlEntry.SETRANGE("Posting Date", StartDate, EndDate);
                GlEntry.CALCSUMS(Amount);
                GlEntryAmount := GlEntry.Amount;
                //MESSAGE(FORMAT(GlEntryAmount));
            END;

            BEGIN
                //Total sum  value of a particular cost center in the budget entry
                "G/LBudgetEntry".RESET;
                "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."Global Dimension 2 Code", dimrec);
                "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartDate, EndDate);
                "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                "G/LBudgetEntryAmount" := "G/LBudgetEntry".Amount;
                //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
            END;

            BEGIN
                //Total sum of of particular g/l account in the budget entry
                "G/LBudgetEntry".RESET;
                "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."G/L Account No.", Glaccount);
                "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartDate, EndDate);
                "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                "G/LBudgetAccountAmount" := "G/LBudgetEntry".Amount;
                //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
            END;


            //total sum for the G/L account in the g/l entry and payment line
            Totalamountglaccount := PayLineAmountActual + GlEntryAccountAmount;

            //Difference btw the actual gl account and budgeted amount
            GlaccBudgetAmountDiff := "G/LBudgetAccountAmount" - Totalamountglaccount;

            //total sum for the costcenter in the g/l entry and payment line
            Totalamountexceed := PayLineAmount + GlEntryAmount;

            //Difference btw the actual cost center and budgeted amount
            Totalamount := "G/LBudgetEntryAmount" - Totalamountexceed;

            IF ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
               ((Totalamountexceed < "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
              ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) THEN
                MESSAGE(Text0055, "G/LBudgetEntryAmount", dimrec, Totalamountexceed, "G/LBudgetAccountAmount", Glaccount, Totalamountglaccount);



            //END;


            BEGIN
                //Total sum of the the particular cost center on the payment line
                PurchaseLineBudget2.RESET;
                PurchaseLineBudget2.SETCURRENTKEY("Shortcut Dimension 1 Code", "Document No.");
                PurchaseLineBudget2.SETRANGE("Document No.", PurchaseHeader."No.");
                PurchaseLineBudget2.SETFILTER("Shortcut Dimension 1 Code", dimrec);
                //PurchaseLineBudget2.SETRANGE(Date,StartDate,EndDate);
                PurchaseLineBudget2.CALCSUMS(PurchaseLineBudget2."Amount Including VAT");
                PayLineAmount := PurchaseLineBudget2."Amount Including VAT";
            END;


            BEGIN
                //total sum of a particular G/l account on the payment line
                PurchaseLineBudget2.RESET;
                PurchaseLineBudget2.SETCURRENTKEY("Document No.", "Posting Group");
                PurchaseLineBudget2.SETRANGE(PurchaseLineBudget2."Document No.", PurchaseHeader."No.");
                PurchaseLineBudget2.SETFILTER("Posting Group", PurchaseLineBudgetfixedasse."Posting Group");
                PurchaseLineBudget2.CALCSUMS(PurchaseLineBudget2."Amount Including VAT");
                PayLineAmountActual := PurchaseLineBudget2."Amount Including VAT";
            END;

            BEGIN
                //Total sum of the particular g/l account  in the g/l entry
                GlEntry.RESET;
                GlEntry.SETRANGE("G/L Account No.", Glaccount);
                GlEntry.SETFILTER("Posting Date", '%1..%2', StartYear, EndYear);
                GlEntry.CALCSUMS(Amount);
                GlEntryAccountAmount := GlEntry.Amount;
            END;


            BEGIN
                //Total sum of the particular cost center in the g/l entry
                GlEntry.RESET;
                GlEntry.SETFILTER("Global Dimension 2 Code", dimrec);
                GlEntry.SETRANGE("Posting Date", StartYear, EndYear);
                GlEntry.CALCSUMS(Amount);
                GlEntryAmount := GlEntry.Amount;
                //MESSAGE(FORMAT(GlEntryAmount));
            END;

            BEGIN
                //Total sum  value of a particular cost center in the budget entry
                "G/LBudgetEntry".RESET;
                "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."Global Dimension 2 Code", dimrec);
                "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartYear, EndYear);
                "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                "G/LBudgetEntryAmount" := "G/LBudgetEntry".Amount;
                //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
            END;

            BEGIN
                //Total sum of of particular g/l account in the budget entry
                "G/LBudgetEntry".RESET;
                "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."G/L Account No.", Glaccount);
                "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartYear, EndYear);
                "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                "G/LBudgetAccountAmount" := "G/LBudgetEntry".Amount;
                //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
            END;


            //total sum for the G/L account in the g/l entry and payment line
            Totalamountglaccount := PayLineAmountActual + GlEntryAccountAmount;

            //Difference btw the actual gl account and budgeted amount
            GlaccBudgetAmountDiff := "G/LBudgetAccountAmount" - Totalamountglaccount;

            //total sum for the costcenter in the g/l entry and payment line
            Totalamountexceed := PayLineAmount + GlEntryAmount;

            //Difference btw the actual cost center and budgeted amount
            Totalamount := "G/LBudgetEntryAmount" - Totalamountexceed;

            IF ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
               ((Totalamountexceed < "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
              ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) THEN
                MESSAGE(Text0056, "G/LBudgetEntryAmount", dimrec, Totalamountexceed, "G/LBudgetAccountAmount", Glaccount, Totalamountglaccount);

        END;
    end;


    procedure ActualBudgetClaimpayment(Var StaffClaimsHeader: record "Staff Claims Header")
    var
        dimrec: Code[20];
        i: Integer;
        Dimension2: Record "Dimension Value";
        Dimension3: Record "Dimension Value";
        Dimension: Record "Dimension Value";
        PayLinebudget: Record "Staff Claim Lines";
        GlEntry: Record "G/L Entry";
        "G/LBudgetEntry": Record "G/L Budget Entry";
        Daterec: Date;
        StartDate: Date;
        EndDate: Date;
        PayLineAmount: Decimal;
        GlEntryAmount: Decimal;
        "G/LBudgetEntryAmount": Decimal;
        Totalamountexceed: Decimal;
        StartYear: Date;
        EndYear: Date;
        t: Integer;
        StartDate2: Text;
        EndDate2: Text;
        Totalamount: Decimal;
        PayLinebudget2: Record "Staff Claim Lines";
        GlEntryAccountAmount: Decimal;
        PayLineAmountActual: Decimal;
        "G/LBudgetAccountAmount": Decimal;
        Totalamountglaccount: Decimal;
        GlaccBudgetAmountDiff: Decimal;
        GLAcc: Record "G/L Account";
        Text005: Label 'The   Cost Center budgeted amount is  %1  for %2 and the cost center G/l entry  amount is  %3 the G/L account   Amount budgeted  is %4 for the G/L account %5  and the G/L entry amount is  %6 for the Month you cannot proceed';
        Text006: Label 'The   Cost Center budgeted amount is  %1  for %2 and the cost center G/l entry  amount is  %3 the G/L account   Amount budgeted  is %4 for the G/L account %5  and the G/L entry amount is  %6 for the YEAR you cannot proceed';
    begin
        //i := 0;
        // to pick the number of cos center to itertate
        Daterec := StaffClaimsHeader.Date;
        //dimrec :='';
        StartDate := CALCDATE('<-CM>', Daterec);
        EndDate := CALCDATE('<CM>', Daterec);
        StartYear := CALCDATE('<-CY>', Daterec);
        EndYear := CALCDATE('<CY>', Daterec);

        //MESSAGE(FORMAT(i));
        PayLineAmount := 0;
        GlEntryAmount := 0;
        "G/LBudgetEntryAmount" := 0;
        "G/LBudgetAccountAmount" := 0;
        PayLineAmountActual := 0;
        Totalamountglaccount := 0;
        GlaccBudgetAmountDiff := 0;
        Totalamount := 0;



        PayLinebudget2.RESET;
        PayLinebudget2.SETCURRENTKEY("Global Dimension 1 Code", No, "Account No:");
        PayLinebudget2.SETRANGE(PayLinebudget2.No, StaffClaimsHeader."No.");
        PayLinebudget2.SETRANGE("Global Dimension 1 Code");
        PayLinebudget2.SETRANGE("Account No:");
        IF PayLinebudget2.FINDFIRST THEN BEGIN

            REPEAT


                GLAcc.RESET;
                GLAcc.SETRANGE(GLAcc."No.", PayLinebudget2."Account No:");
                GLAcc.SETRANGE(GLAcc."Budget Controlled", TRUE);
                IF GLAcc.FINDFIRST THEN BEGIN

                    Dimension.SETFILTER(Dimension."Dimension Code", '%1', 'DEPARTMENT');
                    Dimension.SETRANGE(Dimension.Code, PayLinebudget2."Global Dimension 1 Code");
                    IF Dimension.FINDFIRST THEN
                        dimrec := PayLinebudget2."Global Dimension 1 Code";
                    // MESSAGE(FORMAT(dimrec[i]));


                    //  MESSAGE(dimrec);





                    //To take care of the monthly budget

                    //IF (Daterec > StartDate) AND (Daterec < EndDate) THEN BEGIN
                    BEGIN
                        //Total sum of the the particular cost center on the payment line
                        PayLinebudget.RESET;
                        PayLinebudget.SETCURRENTKEY("Global Dimension 1 Code", No);
                        PayLinebudget.SETRANGE(PayLinebudget.No, StaffClaimsHeader."No.");
                        PayLinebudget.SETFILTER("Global Dimension 1 Code", dimrec);
                        //PayLinebudget.SETRANGE(Date,StartDate,EndDate);
                        PayLinebudget.CALCSUMS(PayLinebudget.Amount);
                        PayLineAmount := PayLinebudget.Amount;
                    END;


                    BEGIN
                        //total sum of a particular G/l account on the payment line
                        PayLinebudget.RESET;
                        PayLinebudget.SETCURRENTKEY(No, "Account No:");
                        PayLinebudget.SETRANGE(PayLinebudget.No, StaffClaimsHeader."No.");
                        PayLinebudget.SETFILTER("Account No:", PayLinebudget2."Account No:");
                        PayLinebudget.CALCSUMS(PayLinebudget.Amount);
                        PayLineAmountActual := PayLinebudget.Amount;
                    END;

                    BEGIN
                        //Total sum of the particular cost center in the g/l entry
                        GlEntry.RESET;
                        GlEntry.SETFILTER("Global Dimension 2 Code", dimrec);
                        GlEntry.SETRANGE("Posting Date", StartDate, EndDate);
                        GlEntry.CALCSUMS(Amount);
                        GlEntryAmount := GlEntry.Amount;
                        //MESSAGE(FORMAT(GlEntryAmount));
                    END;

                    BEGIN
                        //Total sum of the particular g/l account  in the g/l entry
                        GlEntry.RESET;
                        GlEntry.SETRANGE("G/L Account No.", PayLinebudget2."Account No:");
                        GlEntry.SETFILTER("Posting Date", '%1..%2', StartDate, EndDate);
                        GlEntry.CALCSUMS(Amount);
                        GlEntryAccountAmount := GlEntry.Amount;
                    END;


                    BEGIN
                        //Total sum  value of a particular cost center in the budget entry
                        "G/LBudgetEntry".RESET;
                        "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."Global Dimension 2 Code", dimrec);
                        "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartDate, EndDate);
                        "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                        "G/LBudgetEntryAmount" := "G/LBudgetEntry".Amount;
                        //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                    END;


                    BEGIN
                        //Total sum of of particular g/l account in the budget entry
                        "G/LBudgetEntry".RESET;
                        "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."G/L Account No.", PayLinebudget2."Account No:");
                        "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartDate, EndDate);
                        "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                        "G/LBudgetAccountAmount" := "G/LBudgetEntry".Amount;
                        //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                    END;


                    //total sum for the G/L account in the g/l entry and payment line
                    Totalamountglaccount := PayLineAmountActual + GlEntryAccountAmount;

                    //Difference btw the actual gl account and budgeted amount
                    GlaccBudgetAmountDiff := "G/LBudgetAccountAmount" - Totalamountglaccount;

                    //total sum for the costcenter in the g/l entry and payment line
                    Totalamountexceed := PayLineAmount + GlEntryAmount;

                    //Difference btw the actual cost center and budgeted amount
                    Totalamount := "G/LBudgetEntryAmount" - Totalamountexceed;

                    IF ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                       ((Totalamountexceed < "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                      ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) THEN
                        MESSAGE(Text005, "G/LBudgetEntryAmount", dimrec, Totalamountexceed, "G/LBudgetAccountAmount", PayLinebudget2."Account No:", Totalamountglaccount);

                    //END;

                    //to take care of the yearly budget

                    //IF (Daterec > StartYear) AND (Daterec < EndYear) THEN BEGIN
                    BEGIN
                        //Total sum of the the particular cost center on the payment line
                        PayLinebudget.RESET;
                        PayLinebudget.SETCURRENTKEY("Global Dimension 1 Code", No);
                        PayLinebudget.SETRANGE(PayLinebudget.No, StaffClaimsHeader."No.");
                        PayLinebudget.SETFILTER("Global Dimension 1 Code", dimrec);
                        //PayLinebudget.SETRANGE(Date,StartYear,EndYear);
                        PayLinebudget.CALCSUMS(PayLinebudget.Amount);
                        PayLineAmount := PayLinebudget.Amount;
                    END;

                    BEGIN
                        //total sum of a particular G/l account on the payment line
                        PayLinebudget.RESET;
                        PayLinebudget.SETCURRENTKEY(No, "Account No:");
                        PayLinebudget.SETRANGE(PayLinebudget.No, StaffClaimsHeader."No.");
                        PayLinebudget.SETFILTER("Account No:", PayLinebudget2."Account No:");
                        PayLinebudget.CALCSUMS(PayLinebudget.Amount);
                        PayLineAmountActual := PayLinebudget.Amount;
                    END;

                    BEGIN
                        //Total sum of the particular cost center in the g/l entry
                        GlEntry.RESET;
                        GlEntry.SETFILTER("Global Dimension 2 Code", dimrec);
                        GlEntry.SETRANGE("Posting Date", StartYear, EndYear);
                        GlEntry.CALCSUMS(Amount);
                        GlEntryAmount := GlEntry.Amount;
                        //MESSAGE(FORMAT(GlEntryAmount));
                    END;


                    BEGIN
                        //Total sum of the particular g/l account  in the g/l entry
                        GlEntry.RESET;
                        GlEntry.SETRANGE("G/L Account No.", PayLinebudget2."Account No:");
                        GlEntry.SETRANGE("Posting Date", StartYear, EndYear);
                        GlEntry.CALCSUMS(Amount);
                        GlEntryAccountAmount := GlEntry.Amount;
                    END;
                    BEGIN
                        //Total sum  value of a particular cost center in the budget entry
                        "G/LBudgetEntry".RESET;
                        "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."Global Dimension 2 Code", dimrec);
                        "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartYear, EndYear);
                        "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                        "G/LBudgetEntryAmount" := "G/LBudgetEntry".Amount;
                        //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                    END;

                    BEGIN
                        //Total sum  value of a particular cost center in the budget entry
                        "G/LBudgetEntry".RESET;
                        "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."Global Dimension 2 Code", dimrec);
                        "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartYear, EndYear);
                        "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                        "G/LBudgetEntryAmount" := "G/LBudgetEntry".Amount;
                        //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                    END;

                    BEGIN
                        //Total sum of of particular g/l account in the budget entry
                        "G/LBudgetEntry".RESET;
                        "G/LBudgetEntry".SETFILTER("G/LBudgetEntry"."G/L Account No.", PayLinebudget2."Account No:");
                        "G/LBudgetEntry".SETRANGE("G/LBudgetEntry".Date, StartYear, EndYear);
                        "G/LBudgetEntry".CALCSUMS("G/LBudgetEntry".Amount);
                        "G/LBudgetAccountAmount" := "G/LBudgetEntry".Amount;
                        //MESSAGE(FORMAT("G/LBudgetEntryAmount"));
                    END;

                    //total sum for the G/L account in the g/l entry and payment line
                    Totalamountglaccount := PayLineAmountActual + GlEntryAccountAmount;

                    //Difference btw the actual gl account and budgeted amount
                    GlaccBudgetAmountDiff := "G/LBudgetAccountAmount" - Totalamountglaccount;

                    //total sum for the costcenter in the g/l entry and payment line
                    Totalamountexceed := PayLineAmount + GlEntryAmount;

                    //Difference btw the actual cost center and budgeted amount
                    Totalamount := "G/LBudgetEntryAmount" - Totalamountexceed;

                    //MESSAGE(Text005,"G/LBudgetEntryAmount",dimrec,Totalamountexceed,"G/LBudgetAccountAmount",PayLinebudget2."Account No.",Totalamountglaccount);
                    IF ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                       ((Totalamountexceed < "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) OR
                      ((Totalamountexceed > "G/LBudgetEntryAmount") AND (Totalamountglaccount > "G/LBudgetAccountAmount")) THEN
                        MESSAGE(Text006, "G/LBudgetEntryAmount", dimrec, Totalamountexceed, "G/LBudgetAccountAmount", PayLinebudget2."Account No:", Totalamountglaccount);
                    //END;
                END;









            UNTIL PayLinebudget2.NEXT = 0;
        END;
    end;

    procedure BillingCalculation(var ContractID: Code[20]; var StartDate: Date; Var EndDate: Date; var SaleDocumentNo: Code[20])
    var
        MillageRange: Record "Millage Range Controls";
        BillingLine: Record "Billing Line";
        ContractLine: Record "Contract Line";
        BillingLineSum: Record "Billing Line";
        transactionBuffer: Record "Transaction Buffer";
        transactionBuffSum: Record "Transaction Buffer";
        ContractAgreement: Record "Contract Agreement";
        NoDayWork: Record "No. Days Work";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        QtyLoaded: Decimal;
        NoOfBagsOfCement: Decimal;
        DistanceCoveredKm: Decimal;
        QuantityLoadedNetWgtKg: Decimal;
        QuantityOffloadedKg: Decimal;
        CountSum: Integer;
        DateRec: Date;
        StartDateRec: Date;
        EndDateRec: Date;
        StartDateDay: Date;
        EndDateDay: Date;
        TotalDays: integer;
        AvailaableDate: Date;
        NodaysAvailable: integer;
        TotalNoDay: integer;
        recDate: Date;
        i: Integer;
        DirectDispatch: Code[20];
        OffloadingDepot: Code[20];
        TruckNo: Code[20];
        TotalContractSum: Decimal;
        LineNo: integer;
        TruckType: Code[20];
        TruckAvailEntryLines: Record "Truck Avail. Entry Lines";
        TruckAvaiCount: Decimal;
        TotalTruckAvail: Decimal;
        TotalTruckAvailValue: Decimal;

    begin
        NoDayWork.DeleteAll();
        TotalNoDay := 0;
        BillingLine.SetFilter("Contract Id", ContractID);
        BillingLine.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
        if BillingLine.FindFirst() then begin
            repeat
                // transactionBuffer.Setcurrentkey("Contract ID","Truck Type","Truck No");
                transactionBuffer.SetRange("Contract ID", BillingLine."Contract Id");
                transactionBuffer.SetRange("Truck Type", BillingLine."Truck Type");
                transactionBuffer.SetRange("Direct Dispatch", BillingLine."Direct Dispatch");
                transactionBuffer.SetRange("Offloading Depot", BillingLine."Off Load Depot");
                transactionBuffer.SetRange("Truck No", BillingLine."Truck No.");
                if not transactionBuffer.FindFirst() then begin
                    transactionBuffer.Init();
                    transactionBuffer."Contract ID" := BillingLine."Contract Id";
                    transactionBuffer."Truck Type" := BillingLine."Truck Type";
                    transactionBuffer."Direct Dispatch" := BillingLine."Direct Dispatch";
                    transactionBuffer."Offloading Depot" := BillingLine."Off Load Depot";
                    transactionBuffer."Truck No" := BillingLine."Truck No.";
                    transactionBuffer.Insert();
                end;

                NoDayWork.SetRange("Trans Date", BillingLine."Transaction Date");
                NoDayWork.SetRange("Contract ID", BillingLine."Contract ID");
                NoDayWork.SetRange("Truck No", BillingLine."Truck No.");
                NoDayWork.SetRange("Truck Type", BillingLine."Truck Type");
                NoDayWork.SetRange("OffLoading Depot", BillingLine."Customer No.");
                NoDayWork.SetRange("Direct Dispatch", BillingLine."Direct Dispatch");
                if not NoDayWork.FindFirst() then begin
                    TotalNoDay := TotalNoDay + 1;
                    NoDayWork.init;
                    NoDayWork."Trans Date" := BillingLine."Transaction Date";
                    NoDayWork."Truck No" := BillingLine."Truck No.";
                    NoDayWork."Truck Type" := BillingLine."Truck Type";
                    NoDayWork."Contract ID" := BillingLine."Contract Id";
                    NoDayWork."Direct Dispatch" := BillingLine."Direct Dispatch";
                    NoDayWork."OffLoading Depot" := BillingLine."Customer No.";

                    NoDayWork.insert(true);

                end;

            until BillingLine.Next = 0;
        end;



        QtyLoaded := 0;
        NoOfBagsOfCement := 0;
        DistanceCoveredKm := 0;
        QuantityLoadedNetWgtKg := 0;
        QuantityOffloadedKg := 0;
        CountSum := 0;
        StartDateRec := 0D;
        EndDateRec := 0D;
        StartDateDay := 0D;
        EndDateDay := 0D;
        TotalDays := 0;
        //TotalNoDay := 0;
        NodaysAvailable := 0;
        DirectDispatch := '';
        OffloadingDepot := '';
        TruckType := '';
        TruckNo := '';
        i := 0;
        AvailaableDate := 0D;
        TotalContractSum := 0;



        ContractAgreement.Reset();
        ContractAgreement.SetRange("No.", ContractID);
        if ContractAgreement.FindFirst() then begin


            if ContractAgreement."Formular Type" = '(NOBAGS*DD)+(NOBAGS*' then
                NoBagsDispatch(ContractAgreement."No.", transactionBuffSum."Truck Type", QtyLoaded, NoOfBagsOfCement, DistanceCoveredKm, QuantityLoadedNetWgtKg, QuantityOffloadedKg, CountSum, NodaysAvailable, DirectDispatch, offloadingDepot, TruckNo);

            if ContractAgreement."Formular Type" = 'FP/TRUCK + VRATE/KM' then
                DistanceKMPrice2(ContractAgreement."No.", SaleDocumentNo, StartDate, EndDate, TotalNoDay);
            //  DistanceKMPrice(ContractAgreement."No.", TruckType, QtyLoaded, NoOfBagsOfCement, DistanceCoveredKm, QuantityLoadedNetWgtKg, QuantityOffloadedKg, CountSum, NodaysAvailable, DirectDispatch, offloadingDepot, TruckNo);

            if ContractAgreement."Formular Type" = '(NODAYS*FR)+(DISTANC' then
                NodaysKMPrice3(ContractAgreement."No.", SaleDocumentNo, StartDate, EndDate, TotalNoDay);

            /////  NodaysKMPrice(ContractAgreement."No.", transactionBuffSum."Truck Type", QtyLoaded, NoOfBagsOfCement, DistanceCoveredKm, QuantityLoadedNetWgtKg, QuantityOffloadedKg, CountSum, NodaysAvailable, DirectDispatch, offloadingDepot, TruckNo);

            if ContractAgreement."Formular Type" = 'NO TRIP DCL' then
                NoTripCostLoc(ContractAgreement."No.", SaleDocumentNo, StartDate, EndDate);
            //EnyoTrip

            if ContractAgreement."Formular Type" = 'ENYO' then  //need t work on it
                EnyoTrip(ContractAgreement."No.", SaleDocumentNo, StartDate, EndDate);



            if ContractAgreement."Formular Type" = 'NBL' then  //need t work on it
                NBL(ContractAgreement."No.", SaleDocumentNo, StartDate, EndDate);



            if ContractAgreement."Formular Type" = 'FMN' then
                NodaysKMPriceFMN(ContractAgreement."No.", SaleDocumentNo, StartDate, EndDate, TotalNoDay);

            // if ContractAgreement."Formular Type" = 'NO TRIP FFT' then
            //     NoTripFreight(ContractAgreement."No.", TruckType, QtyLoaded, NoOfBagsOfCement, DistanceCoveredKm, QuantityLoadedNetWgtKg, QuantityOffloadedKg, CountSum, NodaysAvailable, DirectDispatch, offloadingDepot, TruckNo);



            // if ContractAgreement."Formular Type" = 'QTY PEF DIS' then
            //     QtyFreightDisc(ContractAgreement."No.", TruckType, QtyLoaded, NoOfBagsOfCement, DistanceCoveredKm, QuantityLoadedNetWgtKg, QuantityOffloadedKg, CountSum, NodaysAvailable, DirectDispatch, offloadingDepot, TruckNo);

            // if ContractAgreement."Formular Type" = 'HIGHER OF FP QTY FE' then  //need t work on it
            //     QtyFEPDisc(ContractAgreement."No.", SaleDocumentNo, StartDate, EndDate);

            if ContractAgreement."Formular Type" = 'HIGHER OF FP QTY F' then  //need t work on it
                QtyFEPD(ContractAgreement."No.", SaleDocumentNo, StartDate, EndDate);


            if ContractAgreement."Formular Type" = 'PZCUSSON' then  //need t work on it
                PZCusson(ContractAgreement."No.", SaleDocumentNo, StartDate, EndDate);

            if ContractAgreement."Formular Type" = 'PLADISKMPRICE' then  //need t work on it
                PladisKMPrice(ContractAgreement."No.", SaleDocumentNo, StartDate, EndDate);

            //SportHire   
            if ContractAgreement."Formular Type" = 'SPORTSHIRE' then  //need t work on it
                SportHire(ContractAgreement."No.", SaleDocumentNo, StartDate, EndDate);

            //if ContractAgreement."Formular Type" = 'FMN' then  //need t work on it
            //  PladisKMPrice(ContractAgreement."No.", SaleDocumentNo, StartDate, EndDate);     

            if ContractAgreement."Formular Type" = 'FP-SHORTAGES AMT' then;


        end;

    end;

    local procedure NoBagsDispatch(Var Contractid: Code[20]; var TruckType: Code[20]; var QtyLoaded: Decimal; Var NoOfBagsOfCement: Decimal; var DistanceCoveredKm: Decimal; var QuantityLoadedNetWgtKg: Decimal; var QuantityOffloadedKg: Decimal; var CountSum: integer; var NodaysAvailable: Integer; Var DirectDispatch: Code[20]; var offloadingDepot: Code[20]; Var TruckNo: Code[20])
    var
        FixedPricePeLoca: Record "Fixed Price Per Location";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        NoDayWork: Record "No. Days Work";
    begin
        PricePeLocaDire := 0;
        PricePeLocaDepot := 0;
        ContractAmunt := 0;


        FixedPricePeLoca.Reset();
        FixedPricePeLoca.SetRange("Contract ID", Contractid);
        FixedPricePeLoca.SetRange("Truck Type", TruckType);
        FixedPricePeLoca.SetRange(Location, DirectDispatch);
        if FixedPricePeLoca.FindFirst() then begin
            if FixedPricePeLoca."Fixed Price" <> 0 then
                PricePeLocaDire := FixedPricePeLoca."Fixed Price";
        end;

        FixedPricePeLoca.Reset();
        FixedPricePeLoca.SetRange("Contract ID", Contractid);
        FixedPricePeLoca.SetRange("Truck Type", TruckType);
        FixedPricePeLoca.SetRange(Location, offloadingDepot);
        if FixedPricePeLoca.FindFirst() then begin
            if FixedPricePeLoca."Fixed Price" <> 0 then
                PricePeLocaDepot := FixedPricePeLoca."Fixed Price";
        end;

        ContractAmunt := (NoOfBagsOfCement * PricePeLocaDire) + (NoOfBagsOfCement * PricePeLocaDepot);

    end;

    local procedure DistanceKMPrice(Var Contractid: Code[20]; var TruckType: Code[20]; var QtyLoaded: Decimal; Var NoOfBagsOfCement: Decimal; var DistanceCoveredKm: Decimal; var QuantityLoadedNetWgtKg: Decimal; var QuantityOffloadedKg: Decimal; var CountSum: integer; var NodaysAvailable: Integer; Var DirectDispatch: Code[20]; var offloadingDepot: Code[20]; Var TruckNo: Code[20])
    var
        FixedPricePeLoca: Record "Fixed Price Per Location";
        FixedPricePerKm: Record "Millage Range Controls";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        FixedRate: Decimal;
        NoDayWork: Record "No. Days Work";
        DistanceStandardKM: Decimal;
        transactionBuffSum: Record "Transaction Buffer";
    begin
        PricePeLocaDire := 0;
        PricePeLocaDepot := 0;
        ContractAmunt := 0;
        FixedRate := 0;
        DistanceStandardKM := 100;
        PricePerKm := 0;



        FixedPricePeLoca.Reset();
        FixedPricePeLoca.SetRange("Contract ID", Contractid);
        FixedPricePeLoca.SetRange("Truck Type", TruckType);
        FixedPricePeLoca.SetRange(Location, DirectDispatch);
        if FixedPricePeLoca.FindFirst() then begin
            if FixedPricePeLoca."Fixed Price" <> 0 then
                PricePeLocaDire := FixedPricePeLoca."Fixed Price";
        end;

        FixedPricePeLoca.Reset();
        FixedPricePeLoca.SetRange("Contract ID", Contractid);
        FixedPricePeLoca.SetRange("Truck Type", TruckType);
        FixedPricePeLoca.SetRange(Location, offloadingDepot);
        if FixedPricePeLoca.FindFirst() then begin
            if FixedPricePeLoca."Fixed Price" <> 0 then
                PricePeLocaDepot := FixedPricePeLoca."Fixed Price";
        end;

        FixedPricePerKm.Reset();
        FixedPricePerKm.SetRange("Contract No.", Contractid);
        FixedPricePerKm.SetRange("Truck Type", TruckType);
        FixedPricePerKm.SetRange("Standard Millage Code");
        if FixedPricePerKm.FindFirst() then begin
            repeat
                // if (FixedPricePerKm.Minimum > DistanceCoveredKm) AND (FixedPricePerKm.Maximum <= DistanceCoveredKm) then begin
                PricePerKm += FixedPricePerKm.Rate;
                FixedRate += FixedPricePerKm."Fixed Rate";

            //end;
            Until FixedPricePerKm.Next = 0;

        end;

        ContractAmunt := (FixedRate * NodaysAvailable) + (DistanceCoveredKm * PricePerKm);


    end;


    local procedure NodaysKMPrice(Var Contractid: Code[20]; var TruckType: Code[20]; var QtyLoaded: Decimal; Var NoOfBagsOfCement: Decimal; var DistanceCoveredKm: Decimal; var QuantityLoadedNetWgtKg: Decimal; var QuantityOffloadedKg: Decimal; var CountSum: integer; var NodaysAvailable: Integer; Var DirectDispatch: Code[20]; var offloadingDepot: Code[20]; Var TruckNo: Code[20])
    var
        FixedPricePeLoca: Record "Fixed Price Per Location";
        FixedPricePerKm: Record "Millage Range Controls";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        FixedRate: Decimal;
        FreightCharge: Decimal;
        NoDayWork: Record "No. Days Work";
        DistanceStandardKM: Decimal;
        transactionBuffSum: Record "Transaction Buffer";
        ContractAmunt100: Decimal;
        ContractAmuntLess: Decimal;
    begin
        PricePeLocaDire := 0;
        PricePeLocaDepot := 0;
        ContractAmunt := 0;
        FixedRate := 0;
        FreightCharge := 0;
        PricePerKm := 0;
        DistanceStandardKM := 100;
        ContractAmunt100 := 0;
        ContractAmuntLess := 0;


        FixedPricePeLoca.Reset();
        FixedPricePeLoca.SetRange("Contract ID", Contractid);
        FixedPricePeLoca.SetRange("Truck Type", TruckType);
        FixedPricePeLoca.SetRange(Location, DirectDispatch);
        if FixedPricePeLoca.FindFirst() then begin
            if FixedPricePeLoca."Fixed Price" <> 0 then
                PricePeLocaDire := FixedPricePeLoca."Fixed Price";
        end;

        FixedPricePeLoca.Reset();
        FixedPricePeLoca.SetRange("Contract ID", Contractid);
        FixedPricePeLoca.SetRange("Truck Type", TruckType);
        FixedPricePeLoca.SetRange(Location, offloadingDepot);
        if FixedPricePeLoca.FindFirst() then begin
            if FixedPricePeLoca."Fixed Price" <> 0 then
                PricePeLocaDepot := FixedPricePeLoca."Fixed Price";
        end;

        if DistanceCoveredKm > DistanceStandardKM then begin

            FixedPricePerKm.Reset();
            FixedPricePerKm.SetRange("Contract No.", Contractid);
            FixedPricePerKm.SetRange("Truck Type", TruckType);
            FixedPricePerKm.SetRange("Standard Millage Code");
            if FixedPricePerKm.FindFirst() then
                repeat

                    if (FixedPricePerKm.Minimum > DistanceStandardKM) AND (FixedPricePerKm.Maximum <= DistanceStandardKM) then begin
                        while DistanceCoveredKm >= DistanceStandardKM DO BEGIN
                            DistanceCoveredKm := DistanceCoveredKm - DistanceStandardKM;
                            PricePerKm += FixedPricePerKm.Rate;
                            FixedRate += FixedPricePerKm."Fixed Rate";

                        end;
                        ContractAmunt100 := (NodaysAvailable * FreightCharge) + (DistanceCoveredKm * PricePerKm);
                        FixedPricePerKm.Reset();
                        FixedPricePerKm.SetRange("Contract No.", Contractid);
                        FixedPricePerKm.SetRange("Truck Type", TruckType);
                        FixedPricePerKm.SetRange("Standard Millage Code");
                        if FixedPricePerKm.FindFirst() then begin
                            repeat
                                if (FixedPricePerKm.Minimum > DistanceCoveredKm) AND (FixedPricePerKm.Maximum <= DistanceCoveredKm) then begin
                                    PricePerKm += FixedPricePerKm.Rate;
                                    FixedRate += FixedPricePerKm."Fixed Rate";

                                    // Message(Format(PricePerKm));
                                end;
                            Until FixedPricePerKm.Next = 0;
                            ContractAmuntLess := (NodaysAvailable * FreightCharge) + (DistanceCoveredKm * PricePerKm);
                        end

                    end;
                Until FixedPricePerKm.Next = 0;


        END
        else begin

            FixedPricePerKm.Reset();
            FixedPricePerKm.SetRange("Contract No.", Contractid);
            FixedPricePerKm.SetRange("Truck Type", TruckType);
            FixedPricePerKm.SetRange("Standard Millage Code");
            if FixedPricePerKm.FindFirst() then begin
                repeat
                    if (FixedPricePerKm.Minimum > DistanceCoveredKm) AND (FixedPricePerKm.Maximum <= DistanceCoveredKm) then begin
                        PricePerKm := FixedPricePerKm.Rate;
                        FreightCharge := FixedPricePerKm."Freight Charge";

                    end;
                Until FixedPricePerKm.Next = 0;


            end;
            ContractAmunt := (NodaysAvailable * FreightCharge) + (DistanceCoveredKm * PricePerKm);

        end;
        ContractAmunt := ContractAmunt100 + ContractAmuntLess + ContractAmunt;


    end;

    local procedure NoTripCostLoc(Var Contractid: Code[20]; var DocumentNo: Code[20]; var StartDate: Date; Var EndDate: Date)

    var
        ContractAgreement: Record "Contract Agreement";
        ContractLine: Record "Contract Line";
        TruckAvaiCount: Decimal;
        NodaysAvailable: Decimal;
        TotalTruckAvail: Decimal;
        TotalTruckAvailValue: Decimal;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        MillageRange: Record "Millage Range Controls";
        BillingLine: Record "Billing Line";
        BillingLineSum: Record "Billing Line";
        BillingLineUpdate: Record "Billing Line";
        transactionBuffer: Record "Transaction Buffer";
        transactionBuffSum: Record "Transaction Buffer";
        NoDayWork: Record "No. Days Work";
        BillingTruckCount: Integer;
        TruckAvailEntryLines: Record "Truck Avail. Entry Lines";
        FixedPricePeLoca: Record "Fixed Price Per Location";
        FixedPricePerKm: Record "Millage Range Controls";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        FixedRate: Decimal;
        FreightCharge: Decimal;
        FixedCalc: Decimal;
        VariableCalc: Decimal;
        SalesHeaderType: Record "Sales Header";
        TotalAvailAmount2: Decimal;
        ContractTransacHist: Record "Contract Transaction History";
        ContractAmuntTotal: Decimal;
        PricePerLoc: Decimal;
        TotalAvailAmount: Decimal;
        ContractAmuntHigher: Decimal;
        ContractAmuntHighe2r: Decimal;
        QtyLoaded: Decimal;
        TruckTypeCalculation: record "Vehicle Make";
        TotalFixedAmount: Decimal;
        TotalVariableAmount: Decimal;
        QuantityLoaded: Decimal;
        QuantityShortaga: decimal;
        ShortageRate: Decimal;
        ShortageTolernce: Decimal;
        BillingFXPriceLoc: Decimal;
        "Rate per Setup": Decimal;
        FXRate: decimal;
        ShortageTotal: decimal;
        BillingVariableAmt: Decimal;
        BillingShortageAmt: Decimal;
        SalesLineShortageAmt: Decimal;
        BillingShortageQty: Decimal;
        ShortageQty: Decimal;
        BillingShortageTolernce: Decimal;
        FixedAsset: Record "Fixed Asset";
        ProcessedBillingLine: Record "Processed Billing Line";




    begin

        ///  TOTAL  TSL 5 FLEET, TSL 25 FLEET, TSL YTL FLEET There are currently 3 subcontracts running here now namely TSL 5 FLEET, TSL 25 FLEET, TSL YTL FLEET

        ///PMS  ATK,enyo,boxbody

        SalesHeaderType.SetRange("No.", DocumentNo);
        SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
        SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Full Month");
        if SalesHeaderType.FindFirst() then begin
            ContractAgreement.Reset();
            ContractAgreement.SetRange("No.", Contractid);
            if ContractAgreement.FindFirst() then
                ContractLine.SetCurrentKey("Document No.");
            ContractLine.SetRange("Document No.", ContractAgreement."No.");
            if ContractLine.FindFirst() then begin
                repeat
                    if ContractLine."Truck Code" <> '' then begin

                        TruckAvaiCount := 0;
                        NodaysAvailable := 0;
                        TotalTruckAvail := 0;
                        TotalTruckAvailValue := 0;
                        BillingTruckCount := 0;
                        ContractAmunt := 0;
                        FixedCalc := 0;
                        VariableCalc := 0;
                        ContractAmuntTotal := 0;
                        PricePerLoc := 0;
                        TotalAvailAmount := 0;
                        ContractAmuntHigher := 0;
                        TotalFixedAmount := 0;
                        TotalVariableAmount := 0;
                        QuantityLoaded := 0;
                        ShortageRate := 0;
                        ShortageTolernce := 0;
                        //  F=0c := 
                        BillingFXPriceLoc := 0;
                        "Rate per Setup" := 0;
                        FXRate := 0;
                        ShortageTotal := 0;
                        BillingVariableAmt := 0;
                        BillingShortageAmt := 0;
                        SalesLineShortageAmt := 0;
                        BillingShortageQty := 0;
                        ShortageQty := 0;


                        NoDayWork.Setfilter("Contract ID", ContractID);
                        NoDayWork.Setfilter("Truck No", ContractLine."Truck Code");
                        NoDayWork.SetFilter("Truck Type", ContractLine."Truck Type");
                        BillingTruckCount := NoDayWork.Count;

                        // BillingLine.SetFilter("Contract Id", ContractID);
                        //  BillingLine.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                        //  BillingLine.SetFilter("Truck No.", ContractLine."Truck Code");
                        //  BillingLine.SetFilter("Truck Type", ContractLine."Truck Type");
                        //   BillingTruckCount := BillingLine.Count;




                        //  FixedPricePeLoca.SetRange();
                        FixedPricePerKm.Reset();
                        FixedPricePerKm.SetRange("Contract No.", ContractLine."Document No.");
                        FixedPricePerKm.SetRange("Truck Type", ContractLine."Truck Type");
                        //  FixedPricePerKm.SetRange("Standard Millage Code");
                        if FixedPricePerKm.FindFirst() then begin

                            if ContractAgreement."Target Availability" <> 0 then
                                FixedRate := FixedPricePerKm."Fixed Rate" / ContractAgreement."Target Availability";
                            TotalAvailAmount := FixedRate * NodaysAvailable;
                        end;


                        TotalFixedAmount := TotalAvailAmount;

                        if BillingTruckCount <> 0 then begin
                            BillingLineSum.Reset();
                            BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                            BillingLineSum.SetRange("Contract Id", ContractLine."Document No.");
                            BillingLineSum.SetRange("Truck Type", ContractLine."Truck Type");
                            BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                            BillingLineSum.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                            if BillingLineSum.FindFirst() then begin
                                repeat
                                    ShortageRate := 0;
                                    BillingFXPriceLoc := 0;
                                    BillingVariableAmt := 0;
                                    BillingShortageAmt := 0;
                                    BillingShortageQty := 0;
                                    BillingShortageTolernce := 0;







                                    //  Quantity 
                                    FixedPricePeLoca.Reset();
                                    FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                                    FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                                    FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
                                    FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");
                                    ///// FixedPricePerKm.SetRange("Standard Millage Code");
                                    if FixedPricePeLoca.FindFirst() then begin
                                        repeat
                                            // BillingShortageQty := BillingLineSum."Qty Loaded" - BillingLineSum.
                                            BillingVariableAmt := (BillingLineSum.Quantity * FixedPricePeLoca."Fixed Price");
                                            // BillingShortageAmt := (BillingShortageQty * ShortageRate);
                                            //  SalesLineShortageAmt += BillingShortageQty * ShortageRate;
                                            BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                                            PricePerLoc := (BillingLineSum.Quantity * FixedPricePeLoca."Fixed Price");
                                            VariableCalc += PricePerLoc;

                                        Until FixedPricePeLoca.Next = 0;

                                    end;
                                    QuantityLoaded += BillingLineSum.Quantity;
                                    //          Calc += PricePerLoc;
                                    //   end;

                                    IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin
                                        BillingLineUpdate.Shortages := BillingShortageQty;
                                        BillingLineUpdate."Shortages Amount" := BillingShortageAmt;
                                        BillingLineUpdate."Variable Cost" := BillingVariableAmt;
                                        BillingLineUpdate."Fixed Cost" := BillingFXPriceLoc;
                                        BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                        BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                        //  BillingLineUpdate."Fixed Rate" :=
                                        BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                        BillingLineUpdate."Sales Document No." := DocumentNo;
                                        BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                        BillingLineUpdate."Tolerance KG" := BillingShortageTolernce;
                                        IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                            BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                            BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                            BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                        end;
                                        BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                        BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";
                                        BillingLineUpdate.Modify(true);
                                    end;


                                    InitBillingNextEntryNo();
                                    ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                    ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                    ProcessedBillingLine.Insert();

                                until BillingLineSum.Next = 0;
                            end;
                        end;
                        TotalVariableAmount := VariableCalc;
                        //   Message(format(VariableCalc));







                        SalesHeader.SetRange("No.", DocumentNo);
                        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                        SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
                        if SalesHeader.FindFirst() then begin
                            InitNextEntryNo(DocumentNo);
                            // LineNo := LineNo + 10000;
                            // LineNo := LineNo + 10000;
                            SalesLine.Init();
                            SalesLine."Document No." := DocumentNo;
                            SalesLine."Line No." := NextEntryNo;
                            SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                            SalesLine.Type := SalesLine.Type::"G/L Account";
                            if Customer.get(SalesHeader."Sell-to Customer No.") then
                                SalesLine."No." := Customer."G/L Account No.";
                            SalesLine.Validate("No.");
                            SalesLine.Quantity := 1;
                            SalesLine.Validate(Quantity);
                            // SalesLine."Half Month  Amt" := BillingFXPriceLoc;
                            SalesLine."Unit Price" := TotalVariableAmount;
                            SalesLine.Validate("Unit Price");
                            SalesLine."Varible Amount" := TotalVariableAmount;
                            SalesLine."Fixed Amount" := TotalFixedAmount;
                            SalesLine."Total Days Available" := NodaysAvailable;
                            SalesLine."Half Month  Amt" := BillingFXPriceLoc;
                            SalesLine."Shortage Rate" := ShortageRate;
                            SalesLine."Quantity Shortage" := ShortageTotal;
                            SalesLine."Quantity Loaded" := QuantityLoaded;
                            SalesLine."Total Shortage Amount" := SalesLineShortageAmt;
                            SalesLine."Truck No." := ContractLine."Truck Code";
                            SalesLine."Truck Type" := ContractLine."Truck Type";

                            //   SalesLine."Truck No." := truc
                            SalesLine.Insert(True);
                            //  end
                        end;
                    end;
                Until ContractLine.Next = 0;
            end;

        end;
        //     Until ContractLine.Next = 0;
        // end;
        Message('The sales invoice No %1 is successfully generated', DocumentNo);
    end;


    local procedure QtyFEPD(Var Contractid: Code[20]; var DocumentNo: Code[20]; var StartDate: Date; Var EndDate: Date)

    var
        ContractAgreement: Record "Contract Agreement";
        ContractLine: Record "Contract Line";
        TruckAvaiCount: Decimal;
        NodaysAvailable: Decimal;
        TotalTruckAvail: Decimal;
        TotalTruckAvailValue: Decimal;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        MillageRange: Record "Millage Range Controls";
        BillingLine: Record "Billing Line";
        BillingLineSum: Record "Billing Line";
        BillingLineUpdate: Record "Billing Line";
        transactionBuffer: Record "Transaction Buffer";
        transactionBuffSum: Record "Transaction Buffer";
        NoDayWork: Record "No. Days Work";
        BillingTruckCount: Integer;
        TruckAvailEntryLines: Record "Truck Avail. Entry Lines";
        FixedPricePeLoca: Record "Fixed Price Per Location";
        FixedPricePerKm: Record "Millage Range Controls";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        FixedRate: Decimal;
        FreightCharge: Decimal;
        FixedCalc: Decimal;
        VariableCalc: Decimal;
        SalesHeaderType: Record "Sales Header";
        TotalAvailAmount2: Decimal;
        ContractTransacHist: Record "Contract Transaction History";
        ContractAmuntTotal: Decimal;
        PricePerLoc: Decimal;
        TotalAvailAmount: Decimal;
        ContractAmuntHigher: Decimal;
        ContractAmuntHighe2r: Decimal;
        QtyLoaded: Decimal;
        TruckTypeCalculation: record "Vehicle Make";
        TotalFixedAmount: Decimal;
        TotalVariableAmount: Decimal;
        QuantityLoaded: Decimal;
        QuantityShortaga: decimal;
        ShortageRate: Decimal;
        ShortageTolernce: Decimal;
        BillingFXPriceLoc: Decimal;
        "Rate per Setup": Decimal;
        FXRate: decimal;
        ShortageTotal: decimal;
        BillingVariableAmt: Decimal;
        BillingShortageAmt: Decimal;
        SalesLineShortageAmt: Decimal;
        BillingShortageQty: Decimal;
        ShortageQty: Decimal;
        BillingShortageTolernce: Decimal;
        FixedAsset: Record "Fixed Asset";
        ProcessedBillingLine: Record "Processed Billing Line";
        ProcessedBillingLineFixed: Record "Processed Billing Line";
        BillingFixedRate: Decimal;
        EmployeeRec: Record Employee;
        BillingTruckCountAvai: Integer;






    begin

        ///  OANDO  There are currently 4 subcontracts running here now namely PMS ATK OVH 50 LPG



        SalesHeaderType.SetRange("No.", DocumentNo);
        SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
        SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Full Month");
        if SalesHeaderType.FindFirst() then begin
            ContractAgreement.Reset();
            ContractAgreement.SetRange("No.", Contractid);
            if ContractAgreement.FindFirst() then
                ContractLine.SetCurrentKey("Document No.");
            ContractLine.SetRange("Document No.", ContractAgreement."No.");
            if ContractLine.FindFirst() then begin
                repeat
                    if ContractLine."Truck Code" <> '' then begin

                        TruckAvaiCount := 0;
                        NodaysAvailable := 0;
                        TotalTruckAvail := 0;
                        TotalTruckAvailValue := 0;
                        BillingTruckCount := 0;
                        ContractAmunt := 0;
                        FixedCalc := 0;
                        VariableCalc := 0;
                        ContractAmuntTotal := 0;
                        PricePerLoc := 0;
                        TotalAvailAmount := 0;
                        ContractAmuntHigher := 0;
                        TotalFixedAmount := 0;
                        TotalVariableAmount := 0;
                        QuantityLoaded := 0;
                        ShortageRate := 0;
                        ShortageTolernce := 0;
                        //  F=0c := 
                        BillingFXPriceLoc := 0;
                        "Rate per Setup" := 0;
                        FXRate := 0;
                        ShortageTotal := 0;
                        BillingVariableAmt := 0;
                        BillingShortageAmt := 0;
                        SalesLineShortageAmt := 0;
                        BillingShortageQty := 0;
                        ShortageQty := 0;
                        BillingTruckCountAvai := 0;



                        NoDayWork.Setfilter("Contract ID", ContractID);
                        NoDayWork.Setfilter("Truck No", ContractLine."Truck Code");
                        NoDayWork.SetFilter("Truck Type", ContractLine."Truck Type");
                        BillingTruckCount := NoDayWork.Count;


                        BillingLine.Reset();
                        BillingLine.Setcurrentkey("Contract Id", "Transaction Date", "Truck No.", "Truck Type");
                        BillingLine.SetFilter("Contract Id", ContractID);
                        BillingLine.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                        BillingLine.SetFilter("Truck No.", ContractLine."Truck Code");
                        BillingLine.SetFilter("Truck Type", ContractLine."Truck Type");
                        BillingTruckCountAvai := BillingLine.Count;
                        BillingLine.CalcSums(BillingLine.Quantity);
                        QuantityLoaded := BillingLine.Quantity;
                        BillingLine.CalcSums(BillingLine.Shortages);
                        //ShortageTotal := BillingLine.Shortages;

                        Message(Format(BillingTruckCountAvai));



                        TruckAvailEntryLines.Reset();
                        TruckAvailEntryLines.SetRange("Leasing Truck No", ContractLine."Truck Code");
                        TruckAvailEntryLines.Setrange("Vehicle Make", ContractLine."Truck Type");
                        TruckAvailEntryLines.Setrange("Contract No.", ContractID);
                        if TruckAvailEntryLines.FindFirst() then
                            repeat
                                if (TruckAvailEntryLines."Start Date" >= StartDate) and (TruckAvailEntryLines."End Date" <= EndDate) then begin
                                    TruckAvaiCount := TruckAvaiCount + ((TruckAvailEntryLines."End Date" - TruckAvailEntryLines."Start Date") + 1)
                                end;
                            until TruckAvailEntryLines.Next = 0;

                        //  message(format(TruckAvaiCount));

                        // TruckAvailEntryLines.SetRange(Date, StartDate, EndDate);

                        //TruckAvaiCount := TruckAvailEntryLines.Count;


                        TotalTruckAvail := ContractAgreement."Target Availability";
                        NodaysAvailable := ContractAgreement."Target Availability" - (BillingTruckCount + TruckAvaiCount);


                        //  FixedPricePeLoca.SetRange();
                        FixedPricePerKm.Reset();
                        FixedPricePerKm.SetRange("Contract No.", ContractLine."Document No.");
                        FixedPricePerKm.SetRange("Truck Type", ContractLine."Truck Type");
                        //  FixedPricePerKm.SetRange("Standard Millage Code");
                        if FixedPricePerKm.FindFirst() then begin
                            //   repeat
                            //  if (FixedPricePerKm.Minimum > DistanceCoveredKm) AND (FixedPricePerKm.Maximum <= DistanceCoveredKm) then begin
                            // PricePerKm += FixedPricePerKm.Rate;
                            //  FixedRate := FixedPricePerKm."Fixed Rate";

                            //  end;
                            //      Until FixedPricePerKm.Next = 0;
                            if ContractAgreement."Target Availability" <> 0 then
                                FixedRate := FixedPricePerKm."Fixed Rate" / ContractAgreement."Target Availability";
                            TotalAvailAmount := FixedRate * NodaysAvailable;
                        end;
                        TruckTypeCalculation.Get(ContractLine."Truck Type");

                        TotalFixedAmount := TotalAvailAmount;

                        if BillingTruckCountAvai <> 0 then begin
                            BillingLineSum.Reset();
                            BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                            BillingLineSum.SetRange("Contract Id", ContractLine."Document No.");
                            BillingLineSum.SetRange("Truck Type", ContractLine."Truck Type");
                            BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                            BillingLineSum.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                            if BillingLineSum.FindFirst() then begin
                                repeat
                                    ShortageRate := 0;
                                    BillingFXPriceLoc := 0;
                                    BillingVariableAmt := 0;
                                    BillingShortageAmt := 0;
                                    BillingShortageQty := 0;
                                    BillingShortageTolernce := 0;


                                    FixedPricePerKm.Reset();
                                    FixedPricePerKm.SetCurrentKey("Contract No.", "Truck Type");
                                    FixedPricePerKm.SetRange("Contract No.", BillingLineSum."Contract Id");
                                    FixedPricePerKm.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    // FixedPricePerKm.SetRange("Standard Millage Code");
                                    if FixedPricePerKm.FindFirst() then begin
                                        BillingShortageQty := BillingLineSum.Quantity - BillingLineSum."Quantity Offloaded Kg";

                                        if FixedPricePerKm."Shortage Tolerance" <= BillingShortageQty then begin
                                            ShortageQty := BillingLineSum.Quantity - BillingLineSum."Quantity Offloaded Kg";
                                            ShortageRate := FixedPricePerKm."Shortage Rate";

                                            ShortageTotal += ShortageQty;
                                            BillingShortageTolernce := FixedPricePerKm."Shortage Tolerance";
                                        end
                                        else
                                            BillingShortageQty := 0;

                                    end;
                                    //  QuantityLoaded += BillingLineSum."Qty Loaded";

                                    ///
                                    /* FixedPricePeLoca.Reset();
                                    FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                                    FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                                    FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
                                    FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");
                                    ///// FixedPricePerKm.SetRange("Standard Millage Code");
                                    if FixedPricePeLoca.FindFirst() then begin
                                        repeat
                                            // BillingShortageQty := BillingLineSum."Qty Loaded" - BillingLineSum.
                                            BillingVariableAmt := (BillingLineSum.Quantity * FixedPricePeLoca."Fixed Price");
                                            BillingShortageAmt := (BillingShortageQty * ShortageRate);
                                            SalesLineShortageAmt += BillingShortageQty * ShortageRate;
                                            BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                                            PricePerLoc := (BillingLineSum.Quantity * FixedPricePeLoca."Fixed Price");
                                            VariableCalc += PricePerLoc;

                                        Until FixedPricePeLoca.Next = 0;
                                         end;  */
                                    ///



                                    //  Quantity 
                                    FixedPricePeLoca.Reset();
                                    FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                                    FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                                    FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
                                    FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");
                                    ///// FixedPricePerKm.SetRange("Standard Millage Code");
                                    if FixedPricePeLoca.FindFirst() then begin
                                        repeat
                                            // BillingShortageQty := BillingLineSum."Qty Loaded" - BillingLineSum.
                                            BillingVariableAmt := (BillingLineSum.Quantity * FixedPricePeLoca."Fixed Price");
                                            //   BillingShortageAmt := (BillingShortageQty * ShortageRate);
                                            //   SalesLineShortageAmt += BillingShortageQty * ShortageRate;
                                            BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                                            PricePerLoc := (BillingLineSum.Quantity * FixedPricePeLoca."Fixed Price");
                                            VariableCalc += PricePerLoc;

                                        Until FixedPricePeLoca.Next = 0;

                                    end;

                                    //          Calc += PricePerLoc;
                                    //   end;
                                    if BillingFXPriceLoc = 0 then begin
                                        IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin
                                            BillingLineUpdate.Shortages := BillingShortageQty;
                                            BillingLineUpdate."Shortages Amount" := BillingShortageAmt;
                                            BillingLineUpdate."Variable Cost" := BillingVariableAmt;


                                            /*  if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::Fixed then begin
                                                    BillingLineUpdate."Fixed Cost" := 0
                                                else */
                                            BillingLineUpdate."Fixed Cost" := TotalFixedAmount;
                                            BillingLineUpdate."Fixed Rate" := BillingFXPriceLoc;

                                            //   BillingLineUpdate."Fixed Cost" := BillingFXPriceLoc;

                                            BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                            BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                            BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                            //  BillingLineUpdate."Fixed Rate" :=
                                            BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                            BillingLineUpdate."Sales Document No." := DocumentNo;
                                            BillingLineUpdate."Tolerance KG" := BillingShortageTolernce;
                                            IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                                BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                                BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                                BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                            end;
                                            BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                            BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";
                                            BillingLineUpdate.Modify(true);
                                        end;

                                        //  ProcessedBillingLine.Init();
                                        InitBillingNextEntryNo();
                                        ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                        ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                        ProcessedBillingLine.Insert();
                                    end;
                                    /// for location based entry
                                    if BillingFXPriceLoc <> 0 then begin
                                        IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin
                                            BillingLineUpdate.Shortages := BillingShortageQty;
                                            BillingLineUpdate."Shortages Amount" := BillingShortageAmt;
                                            BillingLineUpdate."Variable Cost" := VariableCalc;


                                            /*  if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::Fixed then begin
                                                    BillingLineUpdate."Fixed Cost" := 0
                                                else */
                                            BillingLineUpdate."Fixed Cost" := TotalFixedAmount;
                                            BillingLineUpdate."Variable Rate" := BillingFXPriceLoc;


                                            //   BillingLineUpdate."Fixed Cost" := BillingFXPriceLoc;

                                            BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                            BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                            BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                            //  BillingLineUpdate."Fixed Rate" :=
                                            BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                            BillingLineUpdate."Sales Document No." := DocumentNo;
                                            BillingLineUpdate."Tolerance KG" := BillingShortageTolernce;
                                            IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                                BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                                BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                                BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                            end;
                                            BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                            BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";
                                            BillingLineUpdate.Modify(true);
                                        end;

                                        //  ProcessedBillingLine.Init();
                                        InitBillingNextEntryNo();
                                        ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                        ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                        ProcessedBillingLine.Insert();
                                    end;



                                until BillingLineSum.Next = 0;
                            end;

                            TotalVariableAmount := VariableCalc;
                            //   Message(format(VariableCalc));

                            If TruckTypeCalculation.Get(ContractLine."Truck Type") then
                                if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::"Highest btw Fixed and Variable" then
                                    if TotalAvailAmount < VariableCalc then
                                        ContractAmunt := VariableCalc
                                    else
                                        if TotalAvailAmount > VariableCalc then
                                            ContractAmunt := TotalAvailAmount;


                            If TruckTypeCalculation.Get(ContractLine."Truck Type") then
                                if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::Variable then
                                    ContractAmunt := TotalVariableAmount;

                            If TruckTypeCalculation.Get(ContractLine."Truck Type") then
                                if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::Fixed then
                                    ContractAmunt := TotalAvailAmount;

                            If TruckTypeCalculation.Get(ContractLine."Truck Type") then
                                if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::"Fixed Variable Rate" then
                                    ContractAmunt := VariableCalc + TotalAvailAmount;



                            // ContractAmuntHighe2r := NodaysAvailable * FixedRate;

                            //   if ContractAmuntHighe2r > ContractAmuntHigher then
                            //     ContractAmunt := ContractAmuntHighe2r
                            // else
                            //     ContractAmunt := ContractAmuntHigher;

                            // 




                            SalesHeader.SetRange("No.", DocumentNo);
                            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                            SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
                            if SalesHeader.FindFirst() then begin
                                InitNextEntryNo(DocumentNo);
                                // LineNo := LineNo + 10000;
                                // LineNo := LineNo + 10000;
                                SalesLine.Init();
                                SalesLine."Document No." := DocumentNo;
                                SalesLine."Line No." := NextEntryNo;
                                SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                                SalesLine.Type := SalesLine.Type::"G/L Account";
                                if Customer.get(SalesHeader."Sell-to Customer No.") then
                                    SalesLine."No." := Customer."G/L Account No.";
                                SalesLine.Validate("No.");
                                SalesLine.Quantity := 1;
                                SalesLine.Validate(Quantity);
                                SalesLine."Unit Price" := ContractAmunt;
                                SalesLine.Validate("Unit Price");
                                SalesLine."Varible Amount" := TotalVariableAmount;
                                SalesLine."Fixed Amount" := TotalFixedAmount;
                                SalesLine."Total Days Available" := NodaysAvailable;
                                SalesLine."Half Month  Amt" := TotalAvailAmount2;
                                SalesLine."Shortage Rate" := ShortageRate;
                                SalesLine."Quantity Shortage" := ShortageTotal;
                                SalesLine."Quantity Loaded" := QuantityLoaded;
                                SalesLine."Total Shortage Amount" := SalesLineShortageAmt;
                                SalesLine."Truck No." := ContractLine."Truck Code";
                                SalesLine."Truck Type" := ContractLine."Truck Type";

                                //   SalesLine."Truck No." := truc
                                SalesLine.Insert(True);
                            end;
                        end
                        //    end
                        /// added
                        else begin
                            //  If TruckTypeCalculation.Get(ContractLine."Truck Type") then
                            //  if TruckTypeCalculation."Calculate Type" <> TruckTypeCalculation."Calculate Type"::Variable then begin
                            FixedRate := 0;
                            FixedPricePerKm.Reset();
                            FixedPricePerKm.SetRange("Contract No.", Contractid);
                            FixedPricePerKm.SetRange("Truck Type", ContractLine."Truck Type");
                            //  FixedPricePerKm.SetRange("Standard Millage Code");
                            if FixedPricePerKm.FindFirst() then begin
                                Repeat

                                    PricePerKm := FixedPricePerKm.Rate;
                                    FixedRate := FixedPricePerKm."Fixed Rate";
                                until FixedPricePerKm.Next = 0;
                                //  TotalTruckAvailValue := CalcAvailabilityAmount(NodaysAvailable, ContractID, ContractLine."Truck Type", ContractAgreement."Target Availability");
                            end;
                            FixedRate := FixedPricePerKm."Fixed Rate";
                            //  // FixedCalc := TotalTruckAvailValue;
                            FixedCalc := FixedRate * NodaysAvailable;
                            //   VariableCalc := 0;
                            BillingFixedRate := 0;

                            If ((NodaysAvailable <> 0) and (FixedRate <> 0)) then
                                BillingFixedRate := FixedRate / NodaysAvailable;


                            // message(Format(FixedCalc));
                            ContractAmunt := FixedRate + VariableCalc;

                            InitBillingNextEntryNo();
                            ProcessedBillingLineFixed."Batch Entry No." := NextEntryNo2;
                            // ProcessedBillingLine.TransferFields(BillingLineU;
                            ProcessedBillingLineFixed."Truck No." := ContractLine."Truck Code";
                            ProcessedBillingLineFixed."Fixed Cost" := FixedRate;
                            ProcessedBillingLineFixed."Fixed Rate" := FixedRate;
                            ProcessedBillingLineFixed."Truck Type" := ContractLine."Truck Type";
                            ProcessedBillingLineFixed."Contract Id" := ContractAgreement."No.";
                            ProcessedBillingLineFixed."AvaialabilityPer Truck No.Days" := NodaysAvailable;
                            ProcessedBillingLineFixed."Sales Document No." := DocumentNo;
                            // ProcessedBillingLineFixed."Fixed Rate" := BillingFixedRate;
                            ProcessedBillingLineFixed."Transaction Date" := EndDate;
                            // BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                            ProcessedBillingLineFixed."Customer No." := ContractAgreement."Customer Code";
                            ProcessedBillingLineFixed."Customer Name" := ContractAgreement."Customer Name";
                            ProcessedBillingLineFixed."No of Days" := ContractAgreement."Target Availability";
                            IF FixedAsset.get(ContractLine."Truck Code") then begin
                                IF EmployeeRec.GET(FixedAsset."Responsible Employee") THEN
                                    ProcessedBillingLineFixed."Drivers Name" := EmployeeRec.FullName();
                                ProcessedBillingLineFixed."Truck Id" := FixedAsset."Registration No.";
                                ProcessedBillingLineFixed."Drivers Code" := FixedAsset."Driver Code";
                            end;
                            ProcessedBillingLineFixed."Product Type" := ContractLine."Product Type";
                            ProcessedBillingLineFixed."Unit Of Measure" := ContractAgreement."Unit Of Measure";
                            ProcessedBillingLineFixed.Insert();


                            SalesHeader.SetRange("No.", DocumentNo);
                            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                            SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
                            if SalesHeader.FindFirst() then begin

                                InitNextEntryNo(DocumentNo);
                                NextEntryNo := NextEntryNo + 10000;
                                SalesLine.Init();
                                SalesLine."Document No." := DocumentNo;
                                SalesLine."Line No." := NextEntryNo + 10000;
                                SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                                SalesLine.Type := SalesLine.Type::"G/L Account";
                                if Customer.get(SalesHeader."Sell-to Customer No.") then
                                    SalesLine."No." := Customer."G/L Account No.";
                                SalesLine.Validate("No.");

                                SalesLine.Quantity := 1;
                                SalesLine.Validate(Quantity);
                                SalesLine."Unit Price" := FixedRate; //  ContractAmunt;
                                SalesLine.Validate("Unit Price");
                                SalesLine."Varible Amount" := VariableCalc;
                                SalesLine."Fixed Amount" := FixedRate;
                                SalesLine."Total Days Available" := NodaysAvailable;
                                SalesLine."Half Month  Amt" := TotalTruckAvailValue;
                                SalesLine."Truck No." := ContractLine."Truck Code";
                                SalesLine."Truck Type" := ContractLine."Truck Type";
                                SalesLine.Description := 'The Total contract sum is ' + '' + Format(ContractAmunt) + ' ' + ContractLine."Truck Code";
                                SalesLine.Insert(true);
                            end

                        end;
                    end;
                Until ContractLine.Next = 0;
            end;

        end;
        //     Until ContractLine.Next = 0;
        // end;                                                              
        Message('The sales invoice No %1 is successfully generated', DocumentNo);
    end;
    //   
    //  end;


    local procedure EnyoTrip(Var Contractid: Code[20]; var DocumentNo: Code[20]; var StartDate: Date; Var EndDate: Date)

    var
        ContractAgreement: Record "Contract Agreement";
        ContractLine: Record "Contract Line";
        TruckAvaiCount: Decimal;
        NodaysAvailable: Decimal;
        TotalTruckAvail: Decimal;
        TotalTruckAvailValue: Decimal;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        MillageRange: Record "Millage Range Controls";
        BillingLine: Record "Billing Line";
        BillingLineSum: Record "Billing Line";
        BillingLineUpdate: Record "Billing Line";
        transactionBuffer: Record "Transaction Buffer";
        transactionBuffSum: Record "Transaction Buffer";
        NoDayWork: Record "No. Days Work";
        BillingTruckCount: Integer;
        TruckAvailEntryLines: Record "Truck Avail. Entry Lines";
        FixedPricePeLoca: Record "Fixed Price Per Location";
        FixedPricePerKm: Record "Millage Range Controls";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        FixedRate: Decimal;
        FreightCharge: Decimal;
        FixedCalc: Decimal;
        VariableCalc: Decimal;
        SalesHeaderType: Record "Sales Header";
        TotalAvailAmount2: Decimal;
        ContractTransacHist: Record "Contract Transaction History";
        ContractAmuntTotal: Decimal;
        PricePerLoc: Decimal;
        TotalAvailAmount: Decimal;
        ContractAmuntHigher: Decimal;
        ContractAmuntHighe2r: Decimal;
        QtyLoaded: Decimal;
        TruckTypeCalculation: record "Vehicle Make";
        TotalFixedAmount: Decimal;
        TotalVariableAmount: Decimal;
        QuantityLoaded: Decimal;
        QuantityShortaga: decimal;
        ShortageRate: Decimal;
        ShortageTolernce: Decimal;
        BillingFXPriceLoc: Decimal;
        "Rate per Setup": Decimal;
        FXRate: decimal;
        ShortageTotal: decimal;
        BillingVariableAmt: Decimal;
        BillingShortageAmt: Decimal;
        SalesLineShortageAmt: Decimal;
        BillingShortageQty: Decimal;
        ShortageQty: Decimal;
        BillingShortageTolernce: Decimal;
        FixedAsset: Record "Fixed Asset";
        ProcessedBillingLine: Record "Processed Billing Line";
        ProcessedBillingLineFixed: Record "Processed Billing Line";
        BillingFixedRate: Decimal;
        EmployeeRec: Record Employee;
        BillingTruckCountAvai: Integer;






    begin

        ///  OANDO  There are currently 4 subcontracts running here now namely PMS ATK OVH 50 LPG



        SalesHeaderType.SetRange("No.", DocumentNo);
        SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
        SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Full Month");
        if SalesHeaderType.FindFirst() then begin
            ContractAgreement.Reset();
            ContractAgreement.SetRange("No.", Contractid);
            if ContractAgreement.FindFirst() then
                ContractLine.SetCurrentKey("Document No.");
            ContractLine.SetRange("Document No.", ContractAgreement."No.");
            if ContractLine.FindFirst() then begin
                repeat
                    if ContractLine."Truck Code" <> '' then begin

                        TruckAvaiCount := 0;
                        NodaysAvailable := 0;
                        TotalTruckAvail := 0;
                        TotalTruckAvailValue := 0;
                        BillingTruckCount := 0;
                        ContractAmunt := 0;
                        FixedCalc := 0;
                        VariableCalc := 0;
                        ContractAmuntTotal := 0;
                        PricePerLoc := 0;
                        TotalAvailAmount := 0;
                        ContractAmuntHigher := 0;
                        TotalFixedAmount := 0;
                        TotalVariableAmount := 0;
                        QuantityLoaded := 0;
                        ShortageRate := 0;
                        ShortageTolernce := 0;
                        //  F=0c := 
                        BillingFXPriceLoc := 0;
                        "Rate per Setup" := 0;
                        FXRate := 0;
                        ShortageTotal := 0;
                        BillingVariableAmt := 0;
                        BillingShortageAmt := 0;
                        SalesLineShortageAmt := 0;
                        BillingShortageQty := 0;
                        ShortageQty := 0;
                        BillingTruckCountAvai := 0;



                        NoDayWork.Setfilter("Contract ID", ContractID);
                        NoDayWork.Setfilter("Truck No", ContractLine."Truck Code");
                        NoDayWork.SetFilter("Truck Type", ContractLine."Truck Type");
                        BillingTruckCount := NoDayWork.Count;


                        BillingLine.Reset();
                        BillingLine.Setcurrentkey("Contract Id", "Transaction Date", "Truck No.", "Truck Type");
                        BillingLine.SetFilter("Contract Id", ContractID);
                        BillingLine.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                        BillingLine.SetFilter("Truck No.", ContractLine."Truck Code");
                        BillingLine.SetFilter("Truck Type", ContractLine."Truck Type");
                        BillingTruckCountAvai := BillingLine.Count;
                        BillingLine.CalcSums(BillingLine.Quantity);
                        QuantityLoaded := BillingLine.Quantity;
                        BillingLine.CalcSums(BillingLine.Shortages);
                        //ShortageTotal := BillingLine.Shortages;

                        Message(Format(BillingTruckCountAvai));



                        TruckAvailEntryLines.Reset();
                        TruckAvailEntryLines.SetRange("Leasing Truck No", ContractLine."Truck Code");
                        TruckAvailEntryLines.Setrange("Vehicle Make", ContractLine."Truck Type");
                        TruckAvailEntryLines.Setrange("Contract No.", ContractID);
                        if TruckAvailEntryLines.FindFirst() then
                            repeat
                                if (TruckAvailEntryLines."Start Date" >= StartDate) and (TruckAvailEntryLines."End Date" <= EndDate) then begin
                                    TruckAvaiCount := TruckAvaiCount + ((TruckAvailEntryLines."End Date" - TruckAvailEntryLines."Start Date") + 1)
                                end;
                            until TruckAvailEntryLines.Next = 0;

                        //  message(format(TruckAvaiCount));

                        // TruckAvailEntryLines.SetRange(Date, StartDate, EndDate);

                        //TruckAvaiCount := TruckAvailEntryLines.Count;


                        TotalTruckAvail := ContractAgreement."Target Availability";
                        NodaysAvailable := ContractAgreement."Target Availability" - (BillingTruckCount + TruckAvaiCount);


                        //  FixedPricePeLoca.SetRange();
                        FixedPricePerKm.Reset();
                        FixedPricePerKm.SetRange("Contract No.", ContractLine."Document No.");
                        FixedPricePerKm.SetRange("Truck Type", ContractLine."Truck Type");
                        //  FixedPricePerKm.SetRange("Standard Millage Code");
                        if FixedPricePerKm.FindFirst() then begin
                            //   repeat
                            //  if (FixedPricePerKm.Minimum > DistanceCoveredKm) AND (FixedPricePerKm.Maximum <= DistanceCoveredKm) then begin
                            // PricePerKm += FixedPricePerKm.Rate;
                            //  FixedRate := FixedPricePerKm."Fixed Rate";

                            //  end;
                            //      Until FixedPricePerKm.Next = 0;
                            if ContractAgreement."Target Availability" <> 0 then
                                FixedRate := FixedPricePerKm."Fixed Rate" / ContractAgreement."Target Availability";
                            TotalAvailAmount := FixedRate * NodaysAvailable;
                        end;
                        TruckTypeCalculation.Get(ContractLine."Truck Type");

                        TotalFixedAmount := TotalAvailAmount;

                        if BillingTruckCountAvai <> 0 then begin
                            BillingLineSum.Reset();
                            BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                            BillingLineSum.SetRange("Contract Id", ContractLine."Document No.");
                            BillingLineSum.SetRange("Truck Type", ContractLine."Truck Type");
                            BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                            BillingLineSum.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                            if BillingLineSum.FindFirst() then begin
                                repeat
                                    ShortageRate := 0;
                                    BillingFXPriceLoc := 0;
                                    BillingVariableAmt := 0;
                                    BillingShortageAmt := 0;
                                    BillingShortageQty := 0;
                                    BillingShortageTolernce := 0;


                                    FixedPricePerKm.Reset();
                                    FixedPricePerKm.SetCurrentKey("Contract No.", "Truck Type");
                                    FixedPricePerKm.SetRange("Contract No.", BillingLineSum."Contract Id");
                                    FixedPricePerKm.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    // FixedPricePerKm.SetRange("Standard Millage Code");
                                    if FixedPricePerKm.FindFirst() then begin
                                        BillingShortageQty := BillingLineSum.Quantity - BillingLineSum."Quantity Offloaded Kg";

                                        if FixedPricePerKm."Shortage Tolerance" <= BillingShortageQty then begin
                                            ShortageQty := BillingLineSum.Quantity - BillingLineSum."Quantity Offloaded Kg";
                                            ShortageRate := FixedPricePerKm."Shortage Rate";

                                            ShortageTotal += ShortageQty;
                                            BillingShortageTolernce := FixedPricePerKm."Shortage Tolerance";
                                        end
                                        else
                                            BillingShortageQty := 0;

                                    end;
                                    //  QuantityLoaded += BillingLineSum."Qty Loaded";

                                    ///
                                    /* FixedPricePeLoca.Reset();
                                    FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                                    FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                                    FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
                                    FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");
                                    ///// FixedPricePerKm.SetRange("Standard Millage Code");
                                    if FixedPricePeLoca.FindFirst() then begin
                                        repeat
                                            // BillingShortageQty := BillingLineSum."Qty Loaded" - BillingLineSum.
                                            BillingVariableAmt := (BillingLineSum.Quantity * FixedPricePeLoca."Fixed Price");
                                            BillingShortageAmt := (BillingShortageQty * ShortageRate);
                                            SalesLineShortageAmt += BillingShortageQty * ShortageRate;
                                            BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                                            PricePerLoc := (BillingLineSum.Quantity * FixedPricePeLoca."Fixed Price");
                                            VariableCalc += PricePerLoc;

                                        Until FixedPricePeLoca.Next = 0;
                                         end;  */
                                    ///



                                    //  Quantity 
                                    FixedPricePeLoca.Reset();
                                    FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                                    FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                                    FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
                                    FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");
                                    ///// FixedPricePerKm.SetRange("Standard Millage Code");
                                    if FixedPricePeLoca.FindFirst() then begin
                                        repeat
                                            // BillingShortageQty := BillingLineSum."Qty Loaded" - BillingLineSum.
                                            BillingVariableAmt := (BillingLineSum.Quantity * FixedPricePeLoca."Fixed Price");
                                            //   BillingShortageAmt := (BillingShortageQty * ShortageRate);
                                            //   SalesLineShortageAmt += BillingShortageQty * ShortageRate;
                                            BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                                            PricePerLoc := (BillingLineSum.Quantity * FixedPricePeLoca."Fixed Price");
                                            VariableCalc += PricePerLoc;

                                        Until FixedPricePeLoca.Next = 0;

                                    end;

                                    //          Calc += PricePerLoc;
                                    //   end;

                                    IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin
                                        BillingLineUpdate.Shortages := BillingShortageQty;
                                        BillingLineUpdate."Shortages Amount" := BillingShortageAmt;
                                        BillingLineUpdate."Variable Cost" := BillingVariableAmt;


                                        /*  if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::Fixed then begin
                                                BillingLineUpdate."Fixed Cost" := 0
                                            else */
                                        BillingLineUpdate."Fixed Cost" := TotalFixedAmount;
                                        BillingLineUpdate."Fixed Rate" := BillingFXPriceLoc;

                                        //   BillingLineUpdate."Fixed Cost" := BillingFXPriceLoc;

                                        BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                        BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                        BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                        //  BillingLineUpdate."Fixed Rate" :=
                                        BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                        BillingLineUpdate."Sales Document No." := DocumentNo;
                                        BillingLineUpdate."Tolerance KG" := BillingShortageTolernce;
                                        IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                            BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                            BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                            BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                        end;
                                        BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                        BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";
                                        BillingLineUpdate.Modify(true);
                                    end;

                                    //  ProcessedBillingLine.Init();
                                    InitBillingNextEntryNo();
                                    ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                    ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                    ProcessedBillingLine.Insert();


                                until BillingLineSum.Next = 0;
                            end;

                            TotalVariableAmount := VariableCalc;
                            //   Message(format(VariableCalc));

                            If TruckTypeCalculation.Get(ContractLine."Truck Type") then
                                if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::"Highest btw Fixed and Variable" then
                                    if TotalAvailAmount < VariableCalc then
                                        ContractAmunt := VariableCalc
                                    else
                                        if TotalAvailAmount > VariableCalc then
                                            ContractAmunt := TotalAvailAmount;


                            If TruckTypeCalculation.Get(ContractLine."Truck Type") then
                                if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::Variable then
                                    ContractAmunt := TotalVariableAmount;

                            If TruckTypeCalculation.Get(ContractLine."Truck Type") then
                                if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::Fixed then
                                    ContractAmunt := TotalAvailAmount;

                            If TruckTypeCalculation.Get(ContractLine."Truck Type") then
                                if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::"Fixed Variable Rate" then
                                    ContractAmunt := VariableCalc + TotalAvailAmount;



                            // ContractAmuntHighe2r := NodaysAvailable * FixedRate;

                            //   if ContractAmuntHighe2r > ContractAmuntHigher then
                            //     ContractAmunt := ContractAmuntHighe2r
                            // else
                            //     ContractAmunt := ContractAmuntHigher;

                            // 




                            SalesHeader.SetRange("No.", DocumentNo);
                            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                            SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
                            if SalesHeader.FindFirst() then begin
                                InitNextEntryNo(DocumentNo);
                                // LineNo := LineNo + 10000;
                                // LineNo := LineNo + 10000;
                                SalesLine.Init();
                                SalesLine."Document No." := DocumentNo;
                                SalesLine."Line No." := NextEntryNo;
                                SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                                SalesLine.Type := SalesLine.Type::"G/L Account";
                                if Customer.get(SalesHeader."Sell-to Customer No.") then
                                    SalesLine."No." := Customer."G/L Account No.";
                                SalesLine.Validate("No.");
                                SalesLine.Quantity := 1;
                                SalesLine.Validate(Quantity);
                                SalesLine."Unit Price" := ContractAmunt;
                                SalesLine.Validate("Unit Price");
                                SalesLine."Varible Amount" := TotalVariableAmount;
                                SalesLine."Fixed Amount" := TotalFixedAmount;
                                SalesLine."Total Days Available" := NodaysAvailable;
                                SalesLine."Half Month  Amt" := TotalAvailAmount2;
                                SalesLine."Shortage Rate" := ShortageRate;
                                SalesLine."Quantity Shortage" := ShortageTotal;
                                SalesLine."Quantity Loaded" := QuantityLoaded;
                                SalesLine."Total Shortage Amount" := SalesLineShortageAmt;
                                SalesLine."Truck No." := ContractLine."Truck Code";
                                SalesLine."Truck Type" := ContractLine."Truck Type";

                                //   SalesLine."Truck No." := truc
                                SalesLine.Insert(True);
                            end;
                        end
                        //    end
                        /// added
                        else begin
                            //  If TruckTypeCalculation.Get(ContractLine."Truck Type") then
                            //  if TruckTypeCalculation."Calculate Type" <> TruckTypeCalculation."Calculate Type"::Variable then begin
                            FixedRate := 0;
                            FixedPricePerKm.Reset();
                            FixedPricePerKm.SetRange("Contract No.", Contractid);
                            FixedPricePerKm.SetRange("Truck Type", ContractLine."Truck Type");
                            //  FixedPricePerKm.SetRange("Standard Millage Code");
                            if FixedPricePerKm.FindFirst() then begin
                                Repeat

                                    PricePerKm := FixedPricePerKm.Rate;
                                    FixedRate := FixedPricePerKm."Fixed Rate";
                                until FixedPricePerKm.Next = 0;
                                //  TotalTruckAvailValue := CalcAvailabilityAmount(NodaysAvailable, ContractID, ContractLine."Truck Type", ContractAgreement."Target Availability");
                            end;
                            FixedRate := FixedPricePerKm."Fixed Rate";
                            //  // FixedCalc := TotalTruckAvailValue;
                            FixedCalc := FixedRate * NodaysAvailable;
                            //   VariableCalc := 0;
                            BillingFixedRate := 0;

                            If ((NodaysAvailable <> 0) and (FixedRate <> 0)) then
                                BillingFixedRate := FixedRate / NodaysAvailable;


                            // message(Format(FixedCalc));
                            ContractAmunt := FixedRate + VariableCalc;

                            InitBillingNextEntryNo();
                            ProcessedBillingLineFixed."Batch Entry No." := NextEntryNo2;
                            // ProcessedBillingLine.TransferFields(BillingLineU;
                            ProcessedBillingLineFixed."Truck No." := ContractLine."Truck Code";
                            ProcessedBillingLineFixed."Fixed Cost" := FixedRate;
                            ProcessedBillingLineFixed."Fixed Rate" := FixedRate;
                            ProcessedBillingLineFixed."Truck Type" := ContractLine."Truck Type";
                            ProcessedBillingLineFixed."Contract Id" := ContractAgreement."No.";
                            ProcessedBillingLineFixed."AvaialabilityPer Truck No.Days" := NodaysAvailable;
                            ProcessedBillingLineFixed."Sales Document No." := DocumentNo;
                            // ProcessedBillingLineFixed."Fixed Rate" := BillingFixedRate;
                            ProcessedBillingLineFixed."Transaction Date" := EndDate;
                            // BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                            ProcessedBillingLineFixed."Customer No." := ContractAgreement."Customer Code";
                            ProcessedBillingLineFixed."Customer Name" := ContractAgreement."Customer Name";
                            ProcessedBillingLineFixed."No of Days" := ContractAgreement."Target Availability";
                            IF FixedAsset.get(ContractLine."Truck Code") then begin
                                IF EmployeeRec.GET(FixedAsset."Responsible Employee") THEN
                                    ProcessedBillingLineFixed."Drivers Name" := EmployeeRec.FullName();
                                ProcessedBillingLineFixed."Truck Id" := FixedAsset."Registration No.";
                                ProcessedBillingLineFixed."Drivers Code" := FixedAsset."Driver Code";
                            end;
                            ProcessedBillingLineFixed."Product Type" := ContractLine."Product Type";
                            ProcessedBillingLineFixed."Unit Of Measure" := ContractAgreement."Unit Of Measure";
                            ProcessedBillingLineFixed.Insert();


                            SalesHeader.SetRange("No.", DocumentNo);
                            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                            SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
                            if SalesHeader.FindFirst() then begin

                                InitNextEntryNo(DocumentNo);
                                NextEntryNo := NextEntryNo + 10000;
                                SalesLine.Init();
                                SalesLine."Document No." := DocumentNo;
                                SalesLine."Line No." := NextEntryNo + 10000;
                                SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                                SalesLine.Type := SalesLine.Type::"G/L Account";
                                if Customer.get(SalesHeader."Sell-to Customer No.") then
                                    SalesLine."No." := Customer."G/L Account No.";
                                SalesLine.Validate("No.");

                                SalesLine.Quantity := 1;
                                SalesLine.Validate(Quantity);
                                SalesLine."Unit Price" := FixedRate; //  ContractAmunt;
                                SalesLine.Validate("Unit Price");
                                SalesLine."Varible Amount" := VariableCalc;
                                SalesLine."Fixed Amount" := FixedRate;
                                SalesLine."Total Days Available" := NodaysAvailable;
                                SalesLine."Half Month  Amt" := TotalTruckAvailValue;
                                SalesLine."Truck No." := ContractLine."Truck Code";
                                SalesLine."Truck Type" := ContractLine."Truck Type";
                                SalesLine.Description := 'The Total contract sum is ' + '' + Format(ContractAmunt) + ' ' + ContractLine."Truck Code";
                                SalesLine.Insert(true);
                            end

                        end;
                    end;
                Until ContractLine.Next = 0;
            end;

        end;
        //     Until ContractLine.Next = 0;
        // end;                                                              
        Message('The sales invoice No %1 is successfully generated', DocumentNo);
    end;
    //   
    //  end;


    local procedure FPShortagesAmt(Var Contractid: Code[20]; var TruckType: Code[20]; var QtyLoaded: Decimal; Var NoOfBagsOfCement: Decimal; var DistanceCoveredKm: Decimal; var QuantityLoadedNetWgtKg: Decimal; var QuantityOffloadedKg: Decimal; var NoofTrip: integer; var NodaysAvailable: Integer; Var DirectDispatch: Code[20]; var offloadingDepot: Code[20]; Var TruckNo: Code[20])
    var
        FixedPricePeLoca: Record "Fixed Price Per Location";
        FixedPricePerKm: Record "Millage Range Controls";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        FixedRate: Decimal;
        FreightCharge: Decimal;
        Discount: Decimal;
        ContractAmuntHigher: Decimal;
        ContractAmuntHighe2r: Decimal;
        GrossVariance: Decimal;
        ShortagesAmount: Decimal;
        NoDayWork: Record "No. Days Work";
    begin
        PricePeLocaDire := 0;
        PricePeLocaDepot := 0;
        ContractAmunt := 0;
        FixedRate := 0;
        FreightCharge := 0;
        Discount := 0;
        ContractAmuntHigher := 0;
        ContractAmuntHighe2r := 0;

        FixedPricePeLoca.Reset();
        FixedPricePeLoca.SetRange("Contract ID", Contractid);
        FixedPricePeLoca.SetRange("Truck Type", TruckType);
        FixedPricePeLoca.SetRange(Location, DirectDispatch);
        //FixedPricePeLoca.SetFilter(Location, "Location Destination");

        if FixedPricePeLoca.FindFirst() then begin
            if FixedPricePeLoca."Fixed Price" <> 0 then
                PricePeLocaDire := FixedPricePeLoca."Fixed Price";
        end;

        FixedPricePeLoca.Reset();
        FixedPricePeLoca.SetRange("Contract ID", Contractid);
        FixedPricePeLoca.SetRange("Truck Type", TruckType);
        FixedPricePeLoca.SetRange(Location, offloadingDepot);
        if FixedPricePeLoca.FindFirst() then begin
            if FixedPricePeLoca."Fixed Price" <> 0 then
                PricePeLocaDepot := FixedPricePeLoca."Fixed Price";
        end;

        FixedPricePerKm.SetRange("Contract No.", Contractid);
        FixedPricePerKm.SetRange("Truck Type", TruckType);
        FixedPricePerKm.SetRange("Standard Millage Code");
        if FixedPricePerKm.FindFirst() then begin
            // repeat
            //    if (FixedPricePerKm.Minimum > DistanceCoveredKm) AND (FixedPricePerKm.Maximum <= DistanceCoveredKm) then begin
            PricePerKm := FixedPricePerKm.Rate;
            FreightCharge := FixedPricePerKm."Freight Charge";
            Discount := FixedPricePerKm."Discount Rate";
            FixedRate := FixedPricePerKm."Fixed Rate";
            //   end;
            //  Until FixedPricePerKm.Next = 0;

        end;



        GrossVariance := (FreightCharge * NoofTrip) - PricePeLocaDepot;
        ShortagesAmount := QuantityOffloadedKg * GrossVariance;

        ContractAmunt := (FixedRate * NodaysAvailable) - ShortagesAmount;

        UpdateTransBufferAmt(Contractid, TruckType, DirectDispatch, offloadingDepot, ContractAmunt, TruckNo);

        // NoDayWork.DeleteAll(true);
    end;

    local procedure UpdateTransBufferAmt(Var Contractid: Code[20]; var TruckType: Code[20]; Var DirectDispatch: Code[20]; var offloadingDepot: Code[20]; ContractAmunt: Decimal; TruckNo: Code[20])
    var
        transactionBuffSum: Record "Transaction Buffer";
    begin
        transactionBuffSum.Reset();
        transactionBuffSum.SetRange("Contract ID", Contractid);
        transactionBuffSum.SetRange("Truck Type", TruckType);
        transactionBuffSum.SetRange("Direct Dispatch", DirectDispatch);
        transactionBuffSum.SetRange("Offloading Depot", offloadingDepot);
        transactionBuffSum.SetRange("Truck No", TruckNo);
        if transactionBuffSum.FindFirst() then begin
            transactionBuffSum."Contract Sum" := ContractAmunt;
            transactionBuffSum.Modify(true)
        end;

        //if transactionBuffSum.FindFirst() then begin  

    end;

    local procedure CalcAvailabilityAmount(var NodaysAvailable: Decimal; var Contractid: Code[20]; var TruckType: Code[20]; var TargetAvailability: Decimal) TotalAvailAmount: Decimal
    var
        FixedPricePeLoca: Record "Fixed Price Per Location";
        FixedPricePerKm: Record "Millage Range Controls";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        FixedRate: Decimal;
        FreightCharge: Decimal;
        NoDayWork: Record "No. Days Work";
    begin
        PricePeLocaDire := 0;
        PricePeLocaDepot := 0;
        ContractAmunt := 0;
        FixedRate := 0;
        FreightCharge := 0;

        FixedPricePerKm.Reset();
        FixedPricePerKm.SetRange("Contract No.", Contractid);
        FixedPricePerKm.SetRange("Truck Type", TruckType);
        FixedPricePerKm.SetRange("Standard Millage Code");
        if FixedPricePerKm.FindFirst() then begin
            repeat
                //  if (FixedPricePerKm.Minimum > DistanceCoveredKm) AND (FixedPricePerKm.Maximum <= DistanceCoveredKm) then begin
                // PricePerKm += FixedPricePerKm.Rate;
                FixedRate := FixedPricePerKm."Fixed Rate" / TargetAvailability;

            //  end;
            Until FixedPricePerKm.Next = 0;

        end;

        TotalAvailAmount := (FixedRate * NodaysAvailable);
    end;

    local procedure CalcAvailabilityHalfMonth(var TargetAvailability: Decimal; var Contractid: Code[20]; var TruckType: Code[20]; var NodaysAvailable: Decimal; var NodaysAvailable2: Decimal) TotalAvailAmount2: Decimal
    var
        FixedPricePeLoca: Record "Fixed Price Per Location";
        FixedPricePerKm: Record "Millage Range Controls";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        FixedRate: Decimal;
        FreightCharge: Decimal;
        NoDayWork: Record "No. Days Work";
    begin
        PricePeLocaDire := 0;
        PricePeLocaDepot := 0;
        ContractAmunt := 0;
        FixedRate := 0;
        FreightCharge := 0;

        FixedPricePerKm.Reset();
        FixedPricePerKm.SetRange("Contract No.", Contractid);
        FixedPricePerKm.SetRange("Truck Type", TruckType);
        FixedPricePerKm.SetRange("Standard Millage Code");
        if FixedPricePerKm.FindFirst() then begin
            repeat
                //  if (FixedPricePerKm.Minimum > DistanceCoveredKm) AND (FixedPricePerKm.Maximum <= DistanceCoveredKm) then begin
                // PricePerKm += FixedPricePerKm.Rate;
                FixedRate := FixedPricePerKm."Fixed Rate" / TargetAvailability;

            //  end;
            Until FixedPricePerKm.Next = 0;

        end;

        TotalAvailAmount2 := (FixedRate * NodaysAvailable2);
    end;


    procedure HalfMonth(var ContractId: Code[20]; var DocumentNo: Code[20]; var MonthlyStatus: Option; Var StartDate: Date; var EndDate: Date)
    var
        ContractAgreement: Record "Contract Agreement";
        ContractLine: Record "Contract Line";
        TruckAvaiCount: Decimal;
        NodaysAvailable: Decimal;
        TotalTruckAvail: Decimal;
        TotalTruckAvailValue: Decimal;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";


    begin
        // calculate for truck availability with no transaction line 
        ContractAgreement.Reset();
        ContractAgreement.SetRange("No.", ContractID);
        if ContractAgreement.FindFirst() then
            ContractLine.SetCurrentKey("Document No.");
        ContractLine.SetRange("Document No.", ContractAgreement."No.");
        if ContractLine.FindFirst() then begin
            repeat
                TruckAvaiCount := 0;
                NodaysAvailable := 0;
                TotalTruckAvail := 0;
                TotalTruckAvailValue := 0;



                /*  TruckAvailEntryLines.Reset();
                 TruckAvailEntryLines.SetRange("Leasing Truck No", ContractLine."Truck Code");
                 TruckAvailEntryLines.SetRange(Date, StartDate, EndDate);
                 TruckAvaiCount := TruckAvailEntryLines.Count; */


                /*  NoDayWork.Reset();
                 NoDayWork.SetCurrentKey("Truck No");
                 //NoDayWork.SetRange("Contract ID", transactionBuffSum."Contract ID");
                 NoDayWork.SetRange("Truck No", ContractLine."Truck Code");
                 NodaysAvailable := NoDayWork.Count; */

                TotalTruckAvail := ContractAgreement."Target Availability";
                NodaysAvailable := ContractAgreement."Target Availability" / 2;
                TotalTruckAvailValue := CalcAvailabilityHalfMonth(TotalTruckAvail, ContractID, ContractLine."Truck Type", ContractAgreement."Target Availability", NodaysAvailable);

                SalesHeader.SetRange("No.", DocumentNo);
                SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                if SalesHeader.FindFirst() then begin

                    InitNextEntryNo(DocumentNo);
                    // LineNo := LineNo + 10000;
                    SalesLine.Init();
                    SalesLine."Document No." := DocumentNo;
                    SalesLine."Line No." := NextEntryNo;
                    SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                    SalesLine.Type := SalesLine.Type::"G/L Account";
                    if Customer.get(SalesHeader."Sell-to Customer No.") then
                        SalesLine."No." := Customer."G/L Account No.";
                    SalesLine.Validate("No.");

                    SalesLine.Quantity := 1;
                    SalesLine."Unit Price" := TotalTruckAvailValue;
                    SalesLine.Validate("Unit Price");
                    SalesLine."Half Month  Amt" := TotalTruckAvailValue;
                    SalesLine."Truck No." := ContractLine."Truck Code";
                    SalesLine."Truck Type" := ContractLine."Truck Type";
                    SalesLine.Description := 'The Total contract sum is ' + '' + Format(TotalTruckAvailValue) + ' ' + ContractLine."Truck Code";
                    SalesLine.Insert(true);


                end;








            until ContractLine.Next = 0;

        end;
        // calculate for truck availability with no billing transaction line and availability lline

        /* 
                 Caption = 'Monthly Status';
                    OptionMembers = "Half Month","Full Month";
                    OptionCaption = 'Half Month,Full Month';
                    DataClassification = ToBeClassified; */
    end;

    procedure DistanceKMPrice2(var ContractId: Code[20]; var DocumentNo: Code[20]; Var StartDate: Date; var EndDate: Date; Var TotalNoDay: integer)
    var
        ContractAgreement: Record "Contract Agreement";
        ContractLine: Record "Contract Line";
        TruckAvaiCount: Decimal;
        NodaysAvailable: Decimal;
        TotalTruckAvail: Decimal;
        TotalTruckAvailValue: Decimal;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        MillageRange: Record "Millage Range Controls";
        BillingLine: Record "Billing Line";
        BillingLineSum: Record "Billing Line";
        BillingLineUpdate: Record "Billing Line";
        transactionBuffer: Record "Transaction Buffer";
        transactionBuffSum: Record "Transaction Buffer";
        NoDayWork: Record "No. Days Work";
        BillingTruckCount: Integer;
        TruckAvailEntryLines: Record "Truck Avail. Entry Lines";
        FixedPricePeLoca: Record "Fixed Price Per Location";
        FixedPricePerKm: Record "Millage Range Controls";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        FixedRate: Decimal;
        FreightCharge: Decimal;
        FixedCalc: Decimal;
        VariableCalc: Decimal;
        SalesHeaderType: Record "Sales Header";
        TotalAvailAmount2: Decimal;
        ContractTransacHist: Record "Contract Transaction History";
        ContractAmuntTotal: Decimal;
        QuantityLoaded: Decimal;
        BillingPricePerKm: Decimal;
        BillingFixedRate: Decimal;
        BillingVariableCalc: Decimal;
        BillingFixedPriceKm: Decimal;
        TotalDistance: Decimal;
        FixedAsset: Record "Fixed Asset";
        ProcessedBillingLine: Record "Processed Billing Line";
        ProcessedBillingLineFixed: Record "Processed Billing Line";
        EmployeeRec: Record Employee;



    begin
        // calculate for truck availability with no transaction line 
        //  AXELLA (CNG) Components that make up Revenue –	Fixed Amount Variable Amount


        SalesHeaderType.SetRange("No.", DocumentNo);
        SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
        SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Full Month");
        if SalesHeaderType.FindFirst() then begin
            ContractAgreement.Reset();
            ContractAgreement.SetRange("No.", ContractID);
            if ContractAgreement.FindFirst() then
                ContractLine.SetCurrentKey("Document No.");
            ContractLine.SetRange("Document No.", ContractAgreement."No.");
            if ContractLine.FindFirst() then begin
                repeat
                    if ContractLine."Truck Code" <> '' then begin
                        TruckAvaiCount := 0;
                        NodaysAvailable := 0;
                        TotalTruckAvail := 0;
                        TotalTruckAvailValue := 0;
                        BillingTruckCount := 0;
                        ContractAmunt := 0;
                        FixedCalc := 0;
                        VariableCalc := 0;
                        ContractAmuntTotal := 0;
                        TotalAvailAmount2 := 0;
                        QuantityLoaded := 0;
                        TotalDistance := 0;


                        //  NoDayWork.SetRange("Trans Date", BillingLine."Transaction Date");
                        //   NoDayWork.reset();
                        //  NoDayWork.setCurrentKey("Contract ID","Truck No","Truck Type");
                        NoDayWork.Setfilter("Contract ID", ContractID);
                        NoDayWork.Setfilter("Truck No", ContractLine."Truck Code");
                        NoDayWork.Setfilter("Truck Type", ContractLine."Truck Type");
                        BillingTruckCount := NoDayWork.count;
                        // NoDayWork.SetRange("OffLoading Depot", BillingLine."Customer No.");
                        // NoDayWork.SetRange("Direct Dispatch", BillingLine."Direct Dispatch");
                        // if not NoDayWork.FindFirst() then begin
                        //     TotalNoDay := TotalNoDay + 1;
                        //     NoDayWork.init;
                        //     NoDayWork."Trans Date" := BillingLine."Transaction Date";
                        //     NoDayWork."Truck No" := BillingLine."Truck No.";
                        //     NoDayWork."Truck Type" := BillingLine."Truck Type";
                        //     NoDayWork."Contract ID" := BillingLine."Contract Id";
                        //     NoDayWork."Direct Dispatch" := BillingLine."Direct Dispatch";
                        //     NoDayWork."OffLoading Depot" := BillingLine."Customer No.";

                        //     NoDayWork.insert(true);

                        // end;

                        BillingLine.SetFilter("Contract Id", ContractID);
                        BillingLine.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                        BillingLine.SetFilter("Truck No.", ContractLine."Truck Code");
                        BillingLine.SetFilter("Truck Type", ContractLine."Truck Type");
                        //  BillingTruckCount := BillingLine.Count;
                        BillingLine.CalcSums(BillingLine.Quantity);
                        QuantityLoaded := BillingLine.Quantity;

                        //TruckAvailEntryLines.Reset();
                        //  TruckAvailEntryLines.SetRange("Leasing Truck No", ContractLine."Truck Code");

                        // TruckAvailEntryLines.Reset();
                        // TruckAvailEntryLines.Setrange("Vehicle Make", ContractLine."Truck Type");
                        // TruckAvailEntryLines.Setrange("Contract No.", ContractID);
                        // TruckAvailEntryLines.SetRange("Leasing Truck No", ContractLine."Truck Code");
                        // TruckAvailEntryLines.SetRange(Date, StartDate, EndDate);
                        // TruckAvaiCount := TruckAvailEntryLines.Count;

                        TruckAvailEntryLines.Reset();
                        TruckAvailEntryLines.SetRange("Leasing Truck No", ContractLine."Truck Code");
                        TruckAvailEntryLines.Setrange("Vehicle Make", ContractLine."Truck Type");
                        TruckAvailEntryLines.Setrange("Contract No.", ContractID);
                        if TruckAvailEntryLines.FindFirst() then
                            repeat
                                if (TruckAvailEntryLines."Start Date" >= StartDate) and (TruckAvailEntryLines."End Date" <= EndDate) then begin
                                    TruckAvaiCount := TruckAvaiCount + ((TruckAvailEntryLines."End Date" - TruckAvailEntryLines."Start Date") + 1)
                                end;
                            until TruckAvailEntryLines.Next = 0;

                        //
                        TotalTruckAvail := ContractAgreement."Target Availability";

                        NodaysAvailable := ContractAgreement."Target Availability" - (BillingTruckCount + TruckAvaiCount);
                        //NodaysAvailable := ContractAgreement."Target Availability" - (TotalNoDay + TruckAvaiCount);


                        if BillingTruckCount <> 0 then begin
                            BillingLineSum.Reset();
                            BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                            BillingLineSum.SetRange("Contract Id", ContractLine."Document No.");
                            BillingLineSum.SetRange("Truck Type", ContractLine."Truck Type");
                            BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                            BillingLineSum.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                            if BillingLineSum.FindFirst() then begin
                                repeat

                                    BillingPricePerKm := 0;
                                    BillingFixedRate := 0;
                                    BillingVariableCalc := 0;
                                    BillingFixedPriceKm := 0;
                                    PricePerKm := 0;



                                    FixedPricePerKm.Reset();
                                    FixedPricePerKm.SetCurrentKey("Contract No.", "Truck Type");
                                    FixedPricePerKm.SetRange("Contract No.", BillingLineSum."Contract Id");
                                    FixedPricePerKm.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    ///// FixedPricePerKm.SetRange("Standard Millage Code");
                                    if FixedPricePerKm.FindSet() then begin
                                        repeat
                                            if (FixedPricePerKm.Minimum < BillingLineSum.Quantity) AND (FixedPricePerKm.Maximum >= BillingLineSum.Quantity) then begin
                                                PricePerKm += FixedPricePerKm.Rate;
                                                BillingFixedPriceKm := FixedPricePerKm.Rate;
                                                TotalDistance += BillingLineSum.Quantity;
                                                ///    FixedRate := FixedPricePerKm."Fixed Rate";
                                                //   Message(Format(PricePerKm));
                                                VariableCalc += PricePerKm;
                                            end;
                                        Until FixedPricePerKm.Next = 0;
                                        if ContractAgreement."Target Availability" <> 0 then
                                            FixedRate := FixedPricePerKm."Fixed Rate" / ContractAgreement."Target Availability";
                                    end;



                                    IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin

                                        BillingLineUpdate."Variable Cost" := BillingFixedPriceKm;
                                        BillingLineUpdate."Fixed Cost" := FixedRate;
                                        BillingLineUpdate."Fixed Rate" := FixedRate;
                                        BillingLineUpdate."Variable Rate" := BillingFixedPriceKm;
                                        BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                        BillingLineUpdate."Sales Document No." := DocumentNo;
                                        BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                        BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                        BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                        IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                            IF EmployeeRec.GET(FixedAsset."Responsible Employee") THEN
                                                BillingLineUpdate."Drivers Name" := EmployeeRec.FullName();
                                            BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                            BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                        end;
                                        BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                        BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";
                                        // BillingLineUpdate. := BillingShortageTolernce;
                                        BillingLineUpdate.Modify(true);
                                    end;


                                    InitBillingNextEntryNo();
                                    ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                    ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                    ProcessedBillingLine.Insert();

                                until BillingLineSum.Next = 0;


                                FixedCalc := FixedRate * NodaysAvailable;
                                // VariableCalc += PricePerKm;

                                ContractAmunt := FixedCalc + VariableCalc;


                                SalesHeader.SetRange("No.", DocumentNo);
                                SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                                SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
                                if SalesHeader.FindFirst() then begin

                                    InitNextEntryNo(DocumentNo);
                                    NextEntryNo := NextEntryNo + 10000;
                                    SalesLine.Init();
                                    SalesLine."Document No." := DocumentNo;
                                    SalesLine."Line No." := NextEntryNo + 10000;
                                    SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                                    SalesLine.Type := SalesLine.Type::"G/L Account";
                                    if Customer.get(SalesHeader."Sell-to Customer No.") then
                                        SalesLine."No." := Customer."G/L Account No.";
                                    SalesLine.Validate("No.");

                                    SalesLine.Quantity := 1;
                                    SalesLine.Validate(Quantity);
                                    SalesLine."Unit Price" := ContractAmunt;
                                    SalesLine.Validate("Unit Price");
                                    SalesLine."Varible Amount" := VariableCalc;
                                    SalesLine."Fixed Amount" := FixedCalc;
                                    SalesLine."Total Days Available" := NodaysAvailable;
                                    SalesLine."Half Month  Amt" := TotalTruckAvailValue;
                                    SalesLine."Truck No." := ContractLine."Truck Code";
                                    SalesLine."Truck Type" := ContractLine."Truck Type";
                                    SalesLine."Total Distance Cover" := TotalDistance;
                                    SalesLine.Description := 'The Total contract sum is ' + '' + Format(ContractAmunt) + ' ' + ContractLine."Truck Code";
                                    SalesLine.Insert(true);


                                end







                            end


                        end
                        else begin

                            NodaysAvailable := ContractAgreement."Target Availability" - (BillingTruckCount + TruckAvaiCount);
                            FixedPricePerKm.Reset();
                            FixedPricePerKm.SetRange("Contract No.", Contractid);
                            FixedPricePerKm.SetRange("Truck Type", ContractLine."Truck Type");
                            FixedPricePerKm.SetRange("Standard Millage Code");
                            if FixedPricePerKm.FindFirst() then begin

                                PricePerKm := FixedPricePerKm.Rate;
                                FixedRate := FixedPricePerKm."Fixed Rate";
                                //  TotalTruckAvailValue := CalcAvailabilityAmount(NodaysAvailable, ContractID, ContractLine."Truck Type", ContractAgreement."Target Availability");
                            end;
                            FixedRate := FixedPricePerKm."Fixed Rate";
                            // FixedCalc := TotalTruckAvailValue;
                            FixedCalc := FixedRate * NodaysAvailable;
                            //   VariableCalc := 0;
                            BillingFixedRate := 0;

                            If NodaysAvailable <> 0 then
                                BillingFixedRate := FixedRate / NodaysAvailable;



                            ContractAmunt := FixedRate + VariableCalc;

                            InitBillingNextEntryNo();
                            ProcessedBillingLineFixed."Batch Entry No." := NextEntryNo2;
                            // ProcessedBillingLine.TransferFields(BillingLineU;
                            ProcessedBillingLineFixed."Truck No." := ContractLine."Truck Code";
                            ProcessedBillingLineFixed."Fixed Cost" := FixedRate;
                            ProcessedBillingLineFixed."Truck Type" := ContractLine."Truck Type";
                            ProcessedBillingLineFixed."Contract Id" := ContractAgreement."No.";
                            ProcessedBillingLineFixed."AvaialabilityPer Truck No.Days" := NodaysAvailable;
                            ProcessedBillingLineFixed."Sales Document No." := DocumentNo;
                            ProcessedBillingLineFixed."Fixed Rate" := BillingFixedRate;
                            ProcessedBillingLineFixed."Transaction Date" := EndDate;
                            ProcessedBillingLineFixed."No of Days" := ContractAgreement."Target Availability";
                            // BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                            ProcessedBillingLineFixed."Customer No." := ContractAgreement."Customer Code";
                            ProcessedBillingLineFixed."Customer Name" := ContractAgreement."Customer Name";
                            IF FixedAsset.get(ContractLine."Truck Code") then begin
                                IF EmployeeRec.GET(FixedAsset."Responsible Employee") THEN
                                    ProcessedBillingLineFixed."Drivers Name" := EmployeeRec.FullName();
                                ProcessedBillingLineFixed."Truck Id" := FixedAsset."Registration No.";
                                ProcessedBillingLineFixed."Drivers Code" := FixedAsset."Driver Code";
                            end;
                            ProcessedBillingLineFixed."Product Type" := ContractLine."Product Type";
                            ProcessedBillingLineFixed."Unit Of Measure" := ContractAgreement."Unit Of Measure";
                            ProcessedBillingLineFixed.Insert();

                            // ContractTransacHist.SetCurrentKey("Contract No.", "Truck No.", "Transaction Date", "Monthly Status", "Truck Type");
                            // ContractTransacHist.SetRange("Contract No.", ContractId);
                            // ContractTransacHist.SetRange("Truck No.", ContractLine."Truck Code");
                            // ContractTransacHist.SetRange("Truck Type", ContractLine."Truck Type");
                            // ContractTransacHist.SetRange("Transaction Date", StartDate, EndDate);
                            // ContractTransacHist.Setfilter("Monthly Status", 'Half Month');
                            // if ContractTransacHist.FindLast() then
                            //     TotalAvailAmount2 := ContractTransacHist.Amount;

                            // ContractAmuntTotal := ContractAmunt - TotalAvailAmount2;
                            // message(Format(ContractAmunt));
                            // end;
                            //  Until FixedPricePerKm.Next = 0;
                            //  FixedRate := FixedPricePerKm.Rate;
                            //    end;

                            SalesHeader.SetRange("No.", DocumentNo);
                            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                            SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
                            if SalesHeader.FindFirst() then begin

                                InitNextEntryNo(DocumentNo);
                                NextEntryNo := NextEntryNo + 10000;
                                SalesLine.Init();
                                SalesLine."Document No." := DocumentNo;
                                SalesLine."Line No." := NextEntryNo + 10000;
                                SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                                SalesLine.Type := SalesLine.Type::"G/L Account";
                                if Customer.get(SalesHeader."Sell-to Customer No.") then
                                    SalesLine."No." := Customer."G/L Account No.";
                                SalesLine.Validate("No.");

                                SalesLine.Quantity := 1;
                                SalesLine.Validate(Quantity);
                                SalesLine."Unit Price" := ContractAmunt; //  ContractAmunt;
                                SalesLine.Validate("Unit Price");
                                SalesLine."Varible Amount" := VariableCalc;
                                SalesLine."Fixed Amount" := FixedRate;
                                SalesLine."Total Days Available" := NodaysAvailable;
                                SalesLine."Half Month  Amt" := TotalTruckAvailValue;
                                SalesLine."Truck No." := ContractLine."Truck Code";
                                SalesLine."Truck Type" := ContractLine."Truck Type";
                                SalesLine.Description := 'The Total contract sum is ' + '' + Format(ContractAmunt) + ' ' + ContractLine."Truck Code";
                                SalesLine.Insert(true);
                            end

                        end;
                    end;
                Until ContractLine.Next = 0;
            end;
        end;

        SalesHeaderType.Reset();
        SalesHeaderType.SetRange("No.", DocumentNo);
        SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
        SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Half Month");
        if SalesHeaderType.FindFirst() then begin
            ContractAgreement.Reset();
            ContractAgreement.SetRange("No.", ContractID);
            if ContractAgreement.FindFirst() then
                ContractLine.SetCurrentKey("Document No.");
            ContractLine.SetRange("Document No.", ContractAgreement."No.");
            if ContractLine.FindFirst() then begin
                repeat
                    if ContractLine."Truck Code" <> '' then begin
                        TruckAvaiCount := 0;
                        NodaysAvailable := 0;
                        TotalTruckAvail := 0;
                        TotalTruckAvailValue := 0;
                        BillingTruckCount := 0;
                        ContractAmunt := 0;
                        FixedCalc := 0;
                        VariableCalc := 0;
                        TotalAvailAmount2 := 0;


                        TotalTruckAvail := ContractAgreement."Target Availability";

                        if ContractAgreement."Target Availability" <> 0 then
                            NodaysAvailable := ContractAgreement."Target Availability" / 2;



                        FixedPricePerKm.Reset();
                        FixedPricePerKm.SetRange("Contract No.", Contractid);
                        FixedPricePerKm.SetRange("Truck Type", ContractLine."Truck Type");
                        // FixedPricePerKm.SetRange("Standard Millage Code");
                        if FixedPricePerKm.FindFirst() then begin
                            //  repeat
                            //  if (FixedPricePerKm.Minimum > DistanceCoveredKm) AND (FixedPricePerKm.Maximum <= DistanceCoveredKm) then begin
                            // PricePerKm += FixedPricePerKm.Rate;
                            FixedRate := FixedPricePerKm."Fixed Rate" / TotalTruckAvail;

                            //  end;
                            // Until FixedPricePerKm.Next = 0;

                        end;

                        TotalAvailAmount2 := (FixedRate * NodaysAvailable);


                        SalesHeader.SetRange("No.", DocumentNo);
                        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                        SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Half Month");
                        if SalesHeader.FindFirst() then begin

                            InitNextEntryNo(DocumentNo);
                            // LineNo := LineNo + 10000;
                            SalesLine.Init();
                            SalesLine."Document No." := DocumentNo;
                            SalesLine."Line No." := NextEntryNo;
                            SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                            SalesLine.Type := SalesLine.Type::"G/L Account";
                            if Customer.get(SalesHeader."Sell-to Customer No.") then
                                SalesLine."No." := Customer."G/L Account No.";
                            SalesLine.Validate("No.");
                            SalesLine.Quantity := 1;
                            SalesLine.Validate(Quantity);
                            SalesLine."Unit Price" := TotalAvailAmount2;
                            SalesLine.Validate("Unit Price");
                            SalesLine."Varible Amount" := VariableCalc;
                            SalesLine."Fixed Amount" := TotalAvailAmount2;
                            SalesLine."Total Days Available" := NodaysAvailable;
                            SalesLine."Half Month  Amt" := TotalAvailAmount2;
                            SalesLine."Truck No." := ContractLine."Truck Code";
                            SalesLine."Truck Type" := ContractLine."Truck Type";
                            SalesLine.Description := 'The Total contract sum is ' + '' + Format(TotalAvailAmount2) + ' ' + ContractLine."Truck Code";
                            SalesLine.Insert(true);
                        end




                    end;


                Until ContractLine.Next = 0;
            end;
        end;

        ///     // calculate for truck availability with no billing transaction line and availability lline

        /* 
                 Caption = 'Monthly Status';
                    OptionMembers = "Half Month","Full Month";
        OptionCaption = 'Half Month,Full Month';
                    DataClassification = ToBeClassified; */
        MESSAGE('The Sales Invoice No %1 successfully Updated', DocumentNo);
    end;

    procedure NBL(var ContractId: Code[20]; var DocumentNo: Code[20]; Var StartDate: Date; var EndDate: Date)
    var
        ContractAgreement: Record "Contract Agreement";
        ContractLine: Record "Contract Line";
        TruckAvaiCount: Decimal;
        NodaysAvailable: Decimal;
        TotalTruckAvail: Decimal;
        TotalTruckAvailValue: Decimal;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        MillageRange: Record "Millage Range Controls";
        BillingLine: Record "Billing Line";
        BillingLineSum: Record "Billing Line";
        BillingLineUpdate: Record "Billing Line";
        transactionBuffer: Record "Transaction Buffer";
        transactionBuffSum: Record "Transaction Buffer";
        NoDayWork: Record "No. Days Work";
        BillingTruckCount: Integer;
        TruckAvailEntryLines: Record "Truck Avail. Entry Lines";
        FixedPricePeLoca: Record "Fixed Price Per Location";
        FixedPricePerKm: Record "Millage Range Controls";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        FixedRate: Decimal;
        FreightCharge: Decimal;
        FixedCalc: Decimal;
        VariableCalc: Decimal;
        SalesHeaderType: Record "Sales Header";
        TotalAvailAmount2: Decimal;
        ContractTransacHist: Record "Contract Transaction History";
        ContractAmuntTotal: Decimal;
        QuantityLoaded: Decimal;
        BillingPricePerKm: Decimal;
        BillingFixedRate: Decimal;
        BillingVariableCalc: Decimal;
        BillingFixedPriceKm: Decimal;
        TotalDistance: Decimal;
        FixedAsset: Record "Fixed Asset";
        ProcessedBillingLine: Record "Processed Billing Line";
        ProcessedBillingLineFixed: Record "Processed Billing Line";
        EmployeeRec: Record Employee;



    begin
        // calculate for truck availability with no transaction line 
        //  AXELLA (CNG) Components that make up Revenue –	Fixed Amount Variable Amount


        SalesHeaderType.SetRange("No.", DocumentNo);
        SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
        SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Full Month");
        if SalesHeaderType.FindFirst() then begin
            ContractAgreement.Reset();
            ContractAgreement.SetRange("No.", ContractID);
            if ContractAgreement.FindFirst() then
                ContractLine.SetCurrentKey("Document No.");
            ContractLine.SetRange("Document No.", ContractAgreement."No.");
            if ContractLine.FindFirst() then begin
                repeat
                    if ContractLine."Truck Code" <> '' then begin
                        TruckAvaiCount := 0;
                        NodaysAvailable := 0;
                        TotalTruckAvail := 0;
                        TotalTruckAvailValue := 0;
                        BillingTruckCount := 0;
                        ContractAmunt := 0;
                        FixedCalc := 0;
                        VariableCalc := 0;
                        ContractAmuntTotal := 0;
                        TotalAvailAmount2 := 0;
                        QuantityLoaded := 0;
                        TotalDistance := 0;


                        //  NoDayWork.SetRange("Trans Date", BillingLine."Transaction Date");
                        //   NoDayWork.reset();
                        //  NoDayWork.setCurrentKey("Contract ID","Truck No","Truck Type");
                        NoDayWork.Setfilter("Contract ID", ContractID);
                        NoDayWork.Setfilter("Truck No", ContractLine."Truck Code");
                        NoDayWork.Setfilter("Truck Type", ContractLine."Truck Type");
                        BillingTruckCount := NoDayWork.count;
                        // NoDayWork.SetRange("OffLoading Depot", BillingLine."Customer No.");
                        // NoDayWork.SetRange("Direct Dispatch", BillingLine."Direct Dispatch");
                        // if not NoDayWork.FindFirst() then begin
                        //     TotalNoDay := TotalNoDay + 1;
                        //     NoDayWork.init;
                        //     NoDayWork."Trans Date" := BillingLine."Transaction Date";
                        //     NoDayWork."Truck No" := BillingLine."Truck No.";
                        //     NoDayWork."Truck Type" := BillingLine."Truck Type";
                        //     NoDayWork."Contract ID" := BillingLine."Contract Id";
                        //     NoDayWork."Direct Dispatch" := BillingLine."Direct Dispatch";
                        //     NoDayWork."OffLoading Depot" := BillingLine."Customer No.";

                        //     NoDayWork.insert(true);

                        // end;

                        BillingLine.SetFilter("Contract Id", ContractID);
                        BillingLine.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                        BillingLine.SetFilter("Truck No.", ContractLine."Truck Code");
                        BillingLine.SetFilter("Truck Type", ContractLine."Truck Type");
                        //  BillingTruckCount := BillingLine.Count;
                        BillingLine.CalcSums(BillingLine.Quantity);
                        QuantityLoaded := BillingLine.Quantity;

                        //TruckAvailEntryLines.Reset();
                        //  TruckAvailEntryLines.SetRange("Leasing Truck No", ContractLine."Truck Code");

                        // TruckAvailEntryLines.Reset();
                        // TruckAvailEntryLines.Setrange("Vehicle Make", ContractLine."Truck Type");
                        // TruckAvailEntryLines.Setrange("Contract No.", ContractID);
                        // TruckAvailEntryLines.SetRange("Leasing Truck No", ContractLine."Truck Code");
                        // TruckAvailEntryLines.SetRange(Date, StartDate, EndDate);
                        // TruckAvaiCount := TruckAvailEntryLines.Count;

                        TruckAvailEntryLines.Reset();
                        TruckAvailEntryLines.SetRange("Leasing Truck No", ContractLine."Truck Code");
                        TruckAvailEntryLines.Setrange("Vehicle Make", ContractLine."Truck Type");
                        TruckAvailEntryLines.Setrange("Contract No.", ContractID);
                        if TruckAvailEntryLines.FindFirst() then
                            repeat
                                if (TruckAvailEntryLines."Start Date" >= StartDate) and (TruckAvailEntryLines."End Date" <= EndDate) then begin
                                    TruckAvaiCount := TruckAvaiCount + ((TruckAvailEntryLines."End Date" - TruckAvailEntryLines."Start Date") + 1)
                                end;
                            until TruckAvailEntryLines.Next = 0;

                        //
                        TotalTruckAvail := ContractAgreement."Target Availability";

                        NodaysAvailable := ContractAgreement."Target Availability" - (BillingTruckCount + TruckAvaiCount);
                        //NodaysAvailable := ContractAgreement."Target Availability" - (TotalNoDay + TruckAvaiCount);


                        if BillingTruckCount <> 0 then begin
                            BillingLineSum.Reset();
                            BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                            BillingLineSum.SetRange("Contract Id", ContractLine."Document No.");
                            BillingLineSum.SetRange("Truck Type", ContractLine."Truck Type");
                            BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                            BillingLineSum.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                            if BillingLineSum.FindFirst() then begin
                                repeat

                                    BillingPricePerKm := 0;
                                    BillingFixedRate := 0;
                                    BillingVariableCalc := 0;
                                    BillingFixedPriceKm := 0;
                                    PricePerKm := 0;



                                    FixedPricePerKm.Reset();
                                    FixedPricePerKm.SetCurrentKey("Contract No.", "Truck Type");
                                    FixedPricePerKm.SetRange("Contract No.", BillingLineSum."Contract Id");
                                    FixedPricePerKm.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    ///// FixedPricePerKm.SetRange("Standard Millage Code");
                                    if FixedPricePerKm.FindSet() then begin
                                        repeat
                                            // if (FixedPricePerKm.Minimum < BillingLineSum.Quantity) AND (FixedPricePerKm.Maximum >= BillingLineSum.Quantity) then begin
                                            PricePerKm := FixedPricePerKm.Rate;
                                            BillingFixedPriceKm := FixedPricePerKm.Rate;
                                            TotalDistance := PricePerKm * BillingLineSum.Quantity;
                                            ///    FixedRate := FixedPricePerKm."Fixed Rate";
                                            //   Message(Format(PricePerKm));
                                            VariableCalc := PricePerKm;
                                        //   end;
                                        Until FixedPricePerKm.Next = 0;
                                        if ContractAgreement."Target Availability" <> 0 then
                                            FixedRate := FixedPricePerKm."Fixed Rate" / ContractAgreement."Target Availability";
                                        VariableCalc := NodaysAvailable * FixedRate
                                    end;



                                    IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin

                                        BillingLineUpdate."Variable Cost" := TotalDistance;
                                        BillingLineUpdate."Fixed Cost" := VariableCalc;
                                        BillingLineUpdate."Fixed Rate" := FixedRate;
                                        BillingLineUpdate."Variable Rate" := BillingFixedPriceKm;
                                        BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                        BillingLineUpdate."Sales Document No." := DocumentNo;
                                        BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                        BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                        BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                        IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                            IF EmployeeRec.GET(FixedAsset."Responsible Employee") THEN
                                                BillingLineUpdate."Drivers Name" := EmployeeRec.FullName();
                                            BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                            BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                        end;
                                        BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                        BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";
                                        // BillingLineUpdate. := BillingShortageTolernce;
                                        BillingLineUpdate.Modify(true);
                                    end;


                                    InitBillingNextEntryNo();
                                    ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                    ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                    ProcessedBillingLine.Insert();

                                until BillingLineSum.Next = 0;


                                FixedCalc := FixedRate * NodaysAvailable;
                                // VariableCalc += PricePerKm;

                                ContractAmunt := FixedCalc + VariableCalc;


                                SalesHeader.SetRange("No.", DocumentNo);
                                SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                                SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
                                if SalesHeader.FindFirst() then begin

                                    InitNextEntryNo(DocumentNo);
                                    NextEntryNo := NextEntryNo + 10000;
                                    SalesLine.Init();
                                    SalesLine."Document No." := DocumentNo;
                                    SalesLine."Line No." := NextEntryNo + 10000;
                                    SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                                    SalesLine.Type := SalesLine.Type::"G/L Account";
                                    if Customer.get(SalesHeader."Sell-to Customer No.") then
                                        SalesLine."No." := Customer."G/L Account No.";
                                    SalesLine.Validate("No.");

                                    SalesLine.Quantity := 1;
                                    SalesLine.Validate(Quantity);
                                    SalesLine."Unit Price" := ContractAmunt;
                                    SalesLine.Validate("Unit Price");
                                    SalesLine."Varible Amount" := TotalDistance;
                                    SalesLine."Fixed Amount" := FixedCalc;
                                    SalesLine."Total Days Available" := NodaysAvailable;
                                    SalesLine."Half Month  Amt" := TotalTruckAvailValue;
                                    SalesLine."Truck No." := ContractLine."Truck Code";
                                    SalesLine."Truck Type" := ContractLine."Truck Type";
                                    SalesLine."Total Distance Cover" := TotalDistance;
                                    SalesLine.Description := 'The Total contract sum is ' + '' + Format(ContractAmunt) + ' ' + ContractLine."Truck Code";
                                    SalesLine.Insert(true);


                                end







                            end


                        end
                        else begin

                            NodaysAvailable := ContractAgreement."Target Availability" - (BillingTruckCount + TruckAvaiCount);
                            FixedPricePerKm.Reset();
                            FixedPricePerKm.SetRange("Contract No.", Contractid);
                            FixedPricePerKm.SetRange("Truck Type", ContractLine."Truck Type");
                            //  FixedPricePerKm.SetRange("Standard Millage Code");
                            if FixedPricePerKm.FindFirst() then begin

                                PricePerKm := FixedPricePerKm.Rate;
                                FixedRate := FixedPricePerKm."Fixed Rate";
                                //  TotalTruckAvailValue := CalcAvailabilityAmount(NodaysAvailable, ContractID, ContractLine."Truck Type", ContractAgreement."Target Availability");
                            end;
                            FixedRate := FixedPricePerKm."Fixed Rate";
                            // FixedCalc := TotalTruckAvailValue;
                            FixedCalc := FixedRate * NodaysAvailable;
                            //   VariableCalc := 0;
                            BillingFixedRate := 0;

                            If NodaysAvailable <> 0 then
                                BillingFixedRate := FixedRate / NodaysAvailable;



                            ContractAmunt := FixedRate + VariableCalc;

                            InitBillingNextEntryNo();
                            ProcessedBillingLineFixed."Batch Entry No." := NextEntryNo2;
                            // ProcessedBillingLine.TransferFields(BillingLineU;
                            ProcessedBillingLineFixed."Truck No." := ContractLine."Truck Code";
                            ProcessedBillingLineFixed."Fixed Cost" := FixedRate;
                            ProcessedBillingLineFixed."Truck Type" := ContractLine."Truck Type";
                            ProcessedBillingLineFixed."Contract Id" := ContractAgreement."No.";
                            ProcessedBillingLineFixed."AvaialabilityPer Truck No.Days" := NodaysAvailable;
                            ProcessedBillingLineFixed."Sales Document No." := DocumentNo;
                            ProcessedBillingLineFixed."Fixed Rate" := BillingFixedRate;
                            ProcessedBillingLineFixed."Transaction Date" := EndDate;
                            ProcessedBillingLineFixed."No of Days" := ContractAgreement."Target Availability";
                            // BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                            ProcessedBillingLineFixed."Customer No." := ContractAgreement."Customer Code";
                            ProcessedBillingLineFixed."Customer Name" := ContractAgreement."Customer Name";
                            IF FixedAsset.get(ContractLine."Truck Code") then begin
                                IF EmployeeRec.GET(FixedAsset."Responsible Employee") THEN
                                    ProcessedBillingLineFixed."Drivers Name" := EmployeeRec.FullName();
                                ProcessedBillingLineFixed."Truck Id" := FixedAsset."Registration No.";
                                ProcessedBillingLineFixed."Drivers Code" := FixedAsset."Driver Code";
                            end;
                            ProcessedBillingLineFixed."Product Type" := ContractLine."Product Type";
                            ProcessedBillingLineFixed."Unit Of Measure" := ContractAgreement."Unit Of Measure";
                            ProcessedBillingLineFixed.Insert();

                            // ContractTransacHist.SetCurrentKey("Contract No.", "Truck No.", "Transaction Date", "Monthly Status", "Truck Type");
                            // ContractTransacHist.SetRange("Contract No.", ContractId);
                            // ContractTransacHist.SetRange("Truck No.", ContractLine."Truck Code");
                            // ContractTransacHist.SetRange("Truck Type", ContractLine."Truck Type");
                            // ContractTransacHist.SetRange("Transaction Date", StartDate, EndDate);
                            // ContractTransacHist.Setfilter("Monthly Status", 'Half Month');
                            // if ContractTransacHist.FindLast() then
                            //     TotalAvailAmount2 := ContractTransacHist.Amount;

                            // ContractAmuntTotal := ContractAmunt - TotalAvailAmount2;
                            // message(Format(ContractAmunt));
                            // end;
                            //  Until FixedPricePerKm.Next = 0;
                            //  FixedRate := FixedPricePerKm.Rate;
                            //    end;

                            SalesHeader.SetRange("No.", DocumentNo);
                            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                            SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
                            if SalesHeader.FindFirst() then begin

                                InitNextEntryNo(DocumentNo);
                                NextEntryNo := NextEntryNo + 10000;
                                SalesLine.Init();
                                SalesLine."Document No." := DocumentNo;
                                SalesLine."Line No." := NextEntryNo + 10000;
                                SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                                SalesLine.Type := SalesLine.Type::"G/L Account";
                                if Customer.get(SalesHeader."Sell-to Customer No.") then
                                    SalesLine."No." := Customer."G/L Account No.";
                                SalesLine.Validate("No.");

                                SalesLine.Quantity := 1;
                                SalesLine.Validate(Quantity);
                                SalesLine."Unit Price" := ContractAmunt; //  ContractAmunt;
                                SalesLine.Validate("Unit Price");
                                SalesLine."Varible Amount" := VariableCalc;
                                SalesLine."Fixed Amount" := FixedRate;
                                SalesLine."Total Days Available" := NodaysAvailable;
                                SalesLine."Half Month  Amt" := TotalTruckAvailValue;
                                SalesLine."Truck No." := ContractLine."Truck Code";
                                SalesLine."Truck Type" := ContractLine."Truck Type";
                                SalesLine.Description := 'The Total contract sum is ' + '' + Format(ContractAmunt) + ' ' + ContractLine."Truck Code";
                                SalesLine.Insert(true);
                            end

                        end;
                    end;
                Until ContractLine.Next = 0;
            end;
        end;

        SalesHeaderType.Reset();
        SalesHeaderType.SetRange("No.", DocumentNo);
        SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
        SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Half Month");
        if SalesHeaderType.FindFirst() then begin
            ContractAgreement.Reset();
            ContractAgreement.SetRange("No.", ContractID);
            if ContractAgreement.FindFirst() then
                ContractLine.SetCurrentKey("Document No.");
            ContractLine.SetRange("Document No.", ContractAgreement."No.");
            if ContractLine.FindFirst() then begin
                repeat
                    if ContractLine."Truck Code" <> '' then begin
                        TruckAvaiCount := 0;
                        NodaysAvailable := 0;
                        TotalTruckAvail := 0;
                        TotalTruckAvailValue := 0;
                        BillingTruckCount := 0;
                        ContractAmunt := 0;
                        FixedCalc := 0;
                        VariableCalc := 0;
                        TotalAvailAmount2 := 0;


                        TotalTruckAvail := ContractAgreement."Target Availability";

                        if ContractAgreement."Target Availability" <> 0 then
                            NodaysAvailable := ContractAgreement."Target Availability" / 2;



                        FixedPricePerKm.Reset();
                        FixedPricePerKm.SetRange("Contract No.", Contractid);
                        FixedPricePerKm.SetRange("Truck Type", ContractLine."Truck Type");
                        // FixedPricePerKm.SetRange("Standard Millage Code");
                        if FixedPricePerKm.FindFirst() then begin
                            //  repeat
                            //  if (FixedPricePerKm.Minimum > DistanceCoveredKm) AND (FixedPricePerKm.Maximum <= DistanceCoveredKm) then begin
                            // PricePerKm += FixedPricePerKm.Rate;
                            FixedRate := FixedPricePerKm."Fixed Rate" / TotalTruckAvail;

                            //  end;
                            // Until FixedPricePerKm.Next = 0;

                        end;

                        TotalAvailAmount2 := (FixedRate * NodaysAvailable);


                        SalesHeader.SetRange("No.", DocumentNo);
                        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                        SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Half Month");
                        if SalesHeader.FindFirst() then begin

                            InitNextEntryNo(DocumentNo);
                            // LineNo := LineNo + 10000;
                            SalesLine.Init();
                            SalesLine."Document No." := DocumentNo;
                            SalesLine."Line No." := NextEntryNo;
                            SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                            SalesLine.Type := SalesLine.Type::"G/L Account";
                            if Customer.get(SalesHeader."Sell-to Customer No.") then
                                SalesLine."No." := Customer."G/L Account No.";
                            SalesLine.Validate("No.");
                            SalesLine.Quantity := 1;
                            SalesLine.Validate(Quantity);
                            SalesLine."Unit Price" := TotalAvailAmount2;
                            SalesLine.Validate("Unit Price");
                            SalesLine."Varible Amount" := VariableCalc;
                            SalesLine."Fixed Amount" := TotalAvailAmount2;
                            SalesLine."Total Days Available" := NodaysAvailable;
                            SalesLine."Half Month  Amt" := TotalAvailAmount2;
                            SalesLine."Truck No." := ContractLine."Truck Code";
                            SalesLine."Truck Type" := ContractLine."Truck Type";
                            SalesLine.Description := 'The Total contract sum is ' + '' + Format(TotalAvailAmount2) + ' ' + ContractLine."Truck Code";
                            SalesLine.Insert(true);
                        end




                    end;


                Until ContractLine.Next = 0;
            end;
        end;

        ///     // calculate for truck availability with no billing transaction line and availability lline

        /* 
                 Caption = 'Monthly Status';
                    OptionMembers = "Half Month","Full Month";
        OptionCaption = 'Half Month,Full Month';
                    DataClassification = ToBeClassified; */
        MESSAGE('The Sales Invoice No %1 successfully Updated', DocumentNo);
    end;

    procedure NodaysKMPrice3(var ContractId: Code[20]; var DocumentNo: Code[20]; Var StartDate: Date; var EndDate: Date; var TotalNoDay: integer)
    var
        ContractAgreement: Record "Contract Agreement";
        ContractLine: Record "Contract Line";
        TruckAvaiCount: Decimal;
        NodaysAvailable: Decimal;
        TotalTruckAvail: Decimal;
        TotalTruckAvailValue: Decimal;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        MillageRange: Record "Millage Range Controls";
        BillingLine: Record "Billing Line";
        BillingLineSum: Record "Billing Line";
        BillingLineUpdate: Record "Billing Line";
        transactionBuffer: Record "Transaction Buffer";
        transactionBuffSum: Record "Transaction Buffer";
        NoDayWork: Record "No. Days Work";
        BillingTruckCount: Integer;
        TruckAvailEntryLines: Record "Truck Avail. Entry Lines";
        FixedPricePeLoca: Record "Fixed Price Per Location";
        FixedPricePerKm: Record "Millage Range Controls";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        FixedRate: Decimal;
        FreightCharge: Decimal;
        FixedCalc: Decimal;
        VariableCalc: Decimal;
        SalesHeaderType: Record "Sales Header";
        TotalAvailAmount2: Decimal;
        ContractTransacHist: Record "Contract Transaction History";
        ContractAmuntTotal: Decimal;
        QuantityLoaded: Decimal;
        BillingPricePerKm: Decimal;
        BillingFixedRate: Decimal;
        BillingVariableCalc: Decimal;
        BillingFixedPriceKm: Decimal;
        TotalDistance: Decimal;
        FixedAsset: Record "Fixed Asset";
        ProcessedBillingLine: Record "Processed Billing Line";
        ProcessedBillingLineFixed: Record "Processed Billing Line";
        EmployeeRec: Record Employee;
        FixedCalc2: decimal;
        VariableCalc2: decimal;
        FixedCalc3: decimal;
        FixedCalc4: decimal;
        VariableCalc3: decimal;
        TotalFixedCalc: decimal;
        TotalVariableCalc: decimal;
        BillingVariableAmt: Decimal;
        BillingFXPriceLoc: Decimal;
        PricePerLoc: Decimal;

    begin
        // calculate for truck availability with no transaction line 

        ///LARFARGE (CNG)Components that make up Revenue –	Fixed Amount Variable Amount

        VariableCalc2 := 0;
        FixedCalc2 := 0;
        VariableCalc3 := 0;
        FixedCalc3 := 0;
        FixedCalc4 := 0;
        TotalFixedCalc := 0;
        TotalVariableCalc := 0;
        BillingVariableAmt := 0;
        BillingFXPriceLoc := 0;
        PricePerLoc := 0;
        SalesHeaderType.Reset();
        SalesHeaderType.SetRange("No.", DocumentNo);
        SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
        SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Full Month");
        if SalesHeaderType.FindFirst() then begin

            ContractAgreement.Reset();
            ContractAgreement.SetRange("No.", ContractID);
            if ContractAgreement.FindFirst() then
                ContractLine.SetCurrentKey("Document No.");
            ContractLine.Reset();
            ContractLine.SetRange("Document No.", ContractAgreement."No.");
            if ContractLine.FindFirst() then begin
                repeat
                    if ContractLine."Truck Code" <> '' then begin
                        TruckAvaiCount := 0;
                        NodaysAvailable := 0;
                        TotalTruckAvail := 0;
                        TotalTruckAvailValue := 0;
                        BillingTruckCount := 0;
                        ContractAmunt := 0;
                        //  FixedCalc := 0;
                        //VariableCalc := 0;
                        ContractAmuntTotal := 0;
                        //  FixedCalc2 := 0;


                        //NoDayWork.reset();
                        //NoDayWork.setCurrentKey("Contract ID","Truck No","Truck Type");
                        NoDayWork.Setfilter("Contract ID", ContractID);
                        NoDayWork.Setfilter("Truck No", ContractLine."Truck Code");
                        NoDayWork.SetFilter("Truck Type", ContractLine."Truck Type");
                        BillingTruckCount := NoDayWork.Count;


                        BillingLine.SetFilter("Contract Id", ContractID);
                        BillingLine.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                        BillingLine.SetFilter("Truck No.", ContractLine."Truck Code");
                        BillingLine.SetFilter("Truck Type", ContractLine."Truck Type");
                        //  BillingTruckCount := BillingLine.Count;
                        //BillingLine.CalcSums(BillingLine.Quantity);
                        //  QuantityLoaded := BillingLine.Quantity;

                        // TruckAvailEntryLines.Reset();
                        // TruckAvailEntryLines.SetRange("Leasing Truck No", ContractLine."Truck Code");
                        // TruckAvailEntryLines.Setrange("Vehicle Make", ContractLine."Truck Type");
                        // TruckAvailEntryLines.Setrange("Contract No.", ContractID);
                        // TruckAvailEntryLines.SetRange(Date, StartDate, EndDate);
                        // TruckAvaiCount := TruckAvailEntryLines.Count;

                        TruckAvailEntryLines.Reset();
                        TruckAvailEntryLines.SetRange("Leasing Truck No", ContractLine."Truck Code");
                        TruckAvailEntryLines.Setrange("Vehicle Make", ContractLine."Truck Type");
                        TruckAvailEntryLines.Setrange("Contract No.", ContractID);
                        if TruckAvailEntryLines.FindFirst() then
                            repeat
                                if (TruckAvailEntryLines."Start Date" >= StartDate) and (TruckAvailEntryLines."End Date" <= EndDate) then begin
                                    TruckAvaiCount := TruckAvaiCount + ((TruckAvailEntryLines."End Date" - TruckAvailEntryLines."Start Date") + 1)
                                end;
                            until TruckAvailEntryLines.Next = 0;


                        TotalTruckAvail := ContractAgreement."Target Availability";

                        NodaysAvailable := ContractAgreement."Target Availability" - (BillingTruckCount + TruckAvaiCount);

                        if (BillingTruckCount <> 0) and (NodaysAvailable < ContractAgreement."Target Availability") then begin

                            BillingLineSum.Reset();
                            BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                            BillingLineSum.SetRange("Contract Id", ContractLine."Document No.");
                            BillingLineSum.SetRange("Truck Type", ContractLine."Truck Type");
                            BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                            BillingLineSum.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                            if BillingLineSum.FindFirst() then begin
                                repeat

                                    BillingPricePerKm := 0;
                                    BillingFixedRate := 0;
                                    BillingVariableCalc := 0;
                                    BillingFixedPriceKm := 0;
                                    FixedRate := 0;
                                    FixedCalc := 0;
                                    VariableCalc := 0;


                                    FixedPricePerKm.Reset();
                                    FixedPricePerKm.SetCurrentKey("Contract No.", "Truck Type");
                                    FixedPricePerKm.SetRange("Contract No.", BillingLineSum."Contract Id");
                                    FixedPricePerKm.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    // FixedPricePerKm.SetRange("Standard Millage Code");
                                    if FixedPricePerKm.FindFirst() then begin
                                        repeat
                                            if (BillingLineSum.Quantity <> 0) then begin
                                                PricePerKm += (FixedPricePerKm.Rate * BillingLineSum.Quantity);
                                                FixedRate := FixedPricePerKm."Fixed Rate";
                                                BillingPricePerKm := FixedPricePerKm.Rate;
                                                TotalDistance += BillingLineSum.Quantity;
                                                BillingFixedRate := FixedPricePerKm."Fixed Rate";
                                                BillingVariableCalc := FixedPricePerKm.Rate * BillingLineSum.Quantity;

                                            end;
                                        Until FixedPricePerKm.Next = 0;
                                        //  FixedRate := FixedPricePerKm.Rate;
                                    end;

                                    FixedPricePeLoca.Reset();
                                    FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                                    FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                                    FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
                                    FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

                                    if FixedPricePeLoca.FindFirst() then begin
                                        repeat

                                            BillingVariableAmt := FixedPricePeLoca."Fixed Price";
                                            BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                                            PricePerLoc := FixedPricePeLoca."Fixed Price";
                                            FixedRate += PricePerLoc;

                                        Until FixedPricePeLoca.Next = 0;

                                    end;



                                    IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin

                                        BillingLineUpdate."Variable Cost" := BillingVariableCalc;
                                        BillingLineUpdate."Fixed Cost" := FixedRate * NodaysAvailable;
                                        BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                        BillingLineUpdate."Sales Document No." := DocumentNo;
                                        BillingLineUpdate."Fixed Rate" := BillingFixedRate;
                                        BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                                        BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                        BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                        BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                        IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                            BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                            BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                            BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                        end;
                                        BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                        BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";

                                        //BillingLineUpdate."Product Type" := ContractLine.Contra
                                        //  BillingLineUpdate."Drivers Name"

                                        // BillingLineUpdate. := BillingShortageTolernce;
                                        BillingLineUpdate.Modify(true);
                                    end;

                                    InitBillingNextEntryNo();
                                    ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                    ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                    ProcessedBillingLine.Insert();


                                until BillingLineSum.Next = 0;


                                FixedCalc4 := FixedRate * NodaysAvailable;
                                FixedCalc2 += FixedCalc4;
                                //  VariableCalc := PricePerKm;
                                //     VariableCalc2 += VariableCalc;
                                VariableCalc2 := PricePerKm;






                            end;

                        end
                        else begin
                            FixedCalc := 0;
                            FixedRate := 0;
                            IF ((BillingTruckCount = 0) And (NodaysAvailable <> 0)) then begin
                                FixedPricePerKm.Reset();
                                FixedPricePerKm.SETCURRENTKEY("Contract No.", "Truck Type");
                                FixedPricePerKm.SetRange("Contract No.", Contractid);
                                FixedPricePerKm.SetRange("Truck Type", ContractLine."Truck Type");
                                //   FixedPricePerKm.SetRange("Standard Millage Code");
                                if FixedPricePerKm.FindFirst() then begin

                                    PricePerKm := FixedPricePerKm.Rate;
                                    FixedRate := FixedPricePerKm."Fixed Rate";
                                    //  TotalTruckAvailValue := CalcAvailabilityAmount(NodaysAvailable, ContractID, ContractLine."Truck Type", ContractAgreement."Target Availability");
                                end;
                                FixedRate := FixedPricePerKm."Fixed Rate";
                                //  FixedRate3 += FixedRate;
                                // FixedCalc := TotalTruckAvailValue;
                                FixedCalc := FixedRate * NodaysAvailable;
                                FixedCalc3 += FixedCalc;
                                VariableCalc := 0;
                                BillingFixedRate := 0;

                                If NodaysAvailable <> 0 then
                                    BillingFixedRate := FixedRate / NodaysAvailable;


                                //  ContractAmunt := FixedRate + VariableCalc;

                                InitBillingNextEntryNo();
                                ProcessedBillingLineFixed."Batch Entry No." := NextEntryNo2;
                                // ProcessedBillingLine.TransferFields(BillingLineU;
                                ProcessedBillingLineFixed."Truck No." := ContractLine."Truck Code";
                                ProcessedBillingLineFixed."Fixed Cost" := FixedCalc3;
                                ProcessedBillingLineFixed."Truck Type" := ContractLine."Truck Type";
                                ProcessedBillingLineFixed."Contract Id" := ContractAgreement."No.";
                                ProcessedBillingLineFixed."AvaialabilityPer Truck No.Days" := NodaysAvailable;
                                ProcessedBillingLineFixed."Sales Document No." := DocumentNo;
                                ProcessedBillingLineFixed."Fixed Rate" := PricePerKm;
                                ProcessedBillingLineFixed."Transaction Date" := EndDate;
                                ProcessedBillingLineFixed."No of Days" := ContractAgreement."Target Availability";
                                // BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                                ProcessedBillingLineFixed."Customer No." := ContractAgreement."Customer Code";
                                ProcessedBillingLineFixed."Customer Name" := ContractAgreement."Customer Name";
                                IF FixedAsset.get(ContractLine."Truck Code") then begin
                                    IF EmployeeRec.GET(FixedAsset."Responsible Employee") THEN
                                        ProcessedBillingLineFixed."Drivers Name" := EmployeeRec.FullName();
                                    ProcessedBillingLineFixed."Truck Id" := FixedAsset."Registration No.";
                                    ProcessedBillingLineFixed."Drivers Code" := FixedAsset."Driver Code";
                                end;
                                ProcessedBillingLineFixed."Product Type" := ContractLine."Product Type";
                                ProcessedBillingLineFixed."Unit Of Measure" := ContractAgreement."Unit Of Measure";
                                ProcessedBillingLineFixed.Insert();

                                //    end;
                                /* ContractTransacHist.SetRange("Contract No.", Contractid);
                                ContractTransacHist.SetRange("Truck No.", ContractLine."Truck Code");
                                if ContractTransacHist.FindLast() then
                                    ContractAmuntTotal := ContractAmunt - ContractTransacHist.Amount;
                                 */// if  ContractTransacHist.FindLast()  then
                                   //ContractAmuntTotal := ContractAmunt-ContractTransacHist.Amount;
                            end;
                        end;
                    end;
                Until ContractLine.Next = 0;
            end;
            // FixedCalc2 += FixedCalc;
            //  VariableCalc2 += VariableCalc;
            // FixedCalc3 += FixedCalc;
            TotalFixedCalc := FixedCalc2 + FixedCalc3;
            // TotalFixedCalc := FixedCalc3;

            TotalVariableCalc := VariableCalc2;
            ContractAmunt := TotalFixedCalc + TotalVariableCalc;
            // ContractAmunt := FixedCalc3 + TotalVariableCalc;

            //Message(format(TotalFixedCalc));
            //Message(format(TotalVariableCalc));
            SalesHeader.SetRange("No.", DocumentNo);
            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
            SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
            if SalesHeader.FindFirst() then begin

                InitNextEntryNo(DocumentNo);
                // LineNo := LineNo + 10000;
                SalesLine.Init();
                SalesLine."Document No." := DocumentNo;
                SalesLine."Line No." := NextEntryNo;
                SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                SalesLine.Type := SalesLine.Type::"G/L Account";
                if Customer.get(SalesHeader."Sell-to Customer No.") then
                    SalesLine."No." := Customer."G/L Account No.";
                SalesLine.Validate("No.");
                SalesLine.Quantity := 1;
                SalesLine.Validate(Quantity);
                SalesLine."Unit Price" := ContractAmunt;
                SalesLine.Validate("Unit Price");
                SalesLine."Varible Amount" := TotalVariableCalc;
                SalesLine."Fixed Amount" := TotalFixedCalc;
                SalesLine."Total Days Available" := NodaysAvailable;
                SalesLine."Half Month  Amt" := TotalTruckAvailValue;
                SalesLine."Truck No." := ContractLine."Truck Code";
                SalesLine."Truck Type" := ContractLine."Truck Type";
                SalesLine.Description := 'The Total contract sum is ' + '' + Format(ContractAmunt) + ' ' + ContractLine."Truck Code";
                SalesLine.Insert(true);

            end

        end else begin

            SalesHeaderType.Reset();
            SalesHeaderType.SetRange("No.", DocumentNo);
            SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
            SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Half Month");
            if SalesHeaderType.FindFirst() then begin
                ContractAgreement.Reset();
                ContractAgreement.SetRange("No.", ContractID);
                if ContractAgreement.FindFirst() then
                    ContractLine.Reset();
                ContractLine.SetCurrentKey("Document No.");
                ContractLine.SetRange("Document No.", ContractAgreement."No.");
                if ContractLine.FindFirst() then begin
                    repeat
                        if ContractLine."Truck Code" <> '' then begin
                            TruckAvaiCount := 0;
                            NodaysAvailable := 0;
                            TotalTruckAvail := 0;
                            TotalTruckAvailValue := 0;
                            BillingTruckCount := 0;
                            ContractAmunt := 0;
                            FixedCalc := 0;
                            VariableCalc := 0;
                            TotalAvailAmount2 := 0;


                            TotalTruckAvail := ContractAgreement."Target Availability";

                            if ContractAgreement."Target Availability" <> 0 then
                                NodaysAvailable := ContractAgreement."Target Availability" / 2;



                            FixedPricePerKm.Reset();
                            FixedPricePerKm.SETCURRENTKEY("Contract No.", "Truck Type");
                            FixedPricePerKm.SetRange("Contract No.", Contractid);
                            FixedPricePerKm.SetRange("Truck Type", ContractLine."Truck Type");
                            // FixedPricePerKm.SetRange("Standard Millage Code");
                            if FixedPricePerKm.FindFirst() then begin
                                //  repeat
                                //  if (FixedPricePerKm.Minimum > DistanceCoveredKm) AND (FixedPricePerKm.Maximum <= DistanceCoveredKm) then begin
                                // PricePerKm += FixedPricePerKm.Rate;
                                FixedRate := FixedPricePerKm."Fixed Rate" / TotalTruckAvail;

                                //  end;
                                // Until FixedPricePerKm.Next = 0;

                            end;

                            TotalAvailAmount2 := (FixedRate * NodaysAvailable);


                            SalesHeader.SetRange("No.", DocumentNo);
                            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                            SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Half Month");
                            if SalesHeader.FindFirst() then begin

                                InitNextEntryNo(DocumentNo);
                                // LineNo := LineNo + 10000;
                                SalesLine.Init();
                                SalesLine."Document No." := DocumentNo;
                                SalesLine."Line No." := NextEntryNo;
                                SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                                SalesLine.Type := SalesLine.Type::"G/L Account";
                                if Customer.get(SalesHeader."Sell-to Customer No.") then
                                    SalesLine."No." := Customer."G/L Account No.";
                                SalesLine.Validate("No.");
                                SalesLine.Quantity := 1;
                                SalesLine.Validate(Quantity);
                                SalesLine."Unit Price" := TotalAvailAmount2;
                                SalesLine.Validate("Unit Price");
                                SalesLine."Varible Amount" := VariableCalc;
                                SalesLine."Fixed Amount" := TotalAvailAmount2;
                                SalesLine."Total Days Available" := NodaysAvailable;
                                SalesLine."Half Month  Amt" := TotalAvailAmount2;
                                SalesLine."Truck No." := ContractLine."Truck Code";
                                SalesLine."Truck Type" := ContractLine."Truck Type";
                                SalesLine.Description := 'The Total contract sum is ' + '' + Format(TotalAvailAmount2) + ' ' + ContractLine."Truck Code";
                                // SalesLine.Amount <> 0 then
                                SalesLine.Insert(true);

                            end




                        end;


                    Until ContractLine.Next = 0;
                end;
            end;
        end;
        MESSAGE('The Sales Line is successfully Updated', DocumentNo);
    end;

    procedure PladisKMPrice(var ContractId: Code[20]; var DocumentNo: Code[20]; Var StartDate: Date; var EndDate: Date)
    var
        ContractAgreement: Record "Contract Agreement";
        ContractLine: Record "Contract Line";
        TruckAvaiCount: Decimal;
        NodaysAvailable: Decimal;
        TotalTruckAvail: Decimal;
        TotalTruckAvailValue: Decimal;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        MillageRange: Record "Millage Range Controls";
        BillingLine: Record "Billing Line";
        BillingLineSum: Record "Billing Line";
        BillingLineUpdate: Record "Billing Line";
        transactionBuffer: Record "Transaction Buffer";
        transactionBuffSum: Record "Transaction Buffer";
        NoDayWork: Record "No. Days Work";
        BillingTruckCount: Integer;
        TruckAvailEntryLines: Record "Truck Avail. Entry Lines";
        FixedPricePeLoca: Record "Fixed Price Per Location";
        FixedPricePerKm: Record "Millage Range Controls";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        FixedRate: Decimal;
        FreightCharge: Decimal;
        FixedCalc: Decimal;
        VariableCalc: Decimal;
        SalesHeaderType: Record "Sales Header";
        TotalAvailAmount2: Decimal;
        ContractTransacHist: Record "Contract Transaction History";
        ContractAmuntTotal: Decimal;
        QuantityLoaded: Decimal;
        BillingPricePerKm: Decimal;
        BillingFixedRate: Decimal;
        BillingVariableCalc: Decimal;
        BillingFixedPriceKm: Decimal;
        TotalDistance: Decimal;
        FixedAsset: Record "Fixed Asset";
        ProcessedBillingLine: Record "Processed Billing Line";
        ProcessedBillingLineFixed: Record "Processed Billing Line";
        EmployeeRec: Record Employee;
        FixedCalc2: decimal;
        VariableCalc2: decimal;
        FixedCalc3: decimal;
        VariableCalc3: decimal;
        TotalFixedCalc: decimal;
        TotalVariableCalc: decimal;
        TruckTypeCalculation: record "Vehicle Make";
        BillingVariableAmt: decimal;
        BillingFXPriceLoc: decimal;
        PricePerLoc: decimal;

    begin
        // calculate for truck availability with no transaction line 

        ///PLADIS (CNG)Components that make up Revenue –	Fixed Amount Variable Amount

        VariableCalc2 := 0;
        FixedCalc2 := 0;
        VariableCalc3 := 0;
        FixedCalc3 := 0;
        TotalFixedCalc := 0;
        TotalVariableCalc := 0;
        SalesHeaderType.Reset();
        SalesHeaderType.SetRange("No.", DocumentNo);
        SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
        SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Full Month");
        if SalesHeaderType.FindFirst() then begin

            ContractAgreement.Reset();
            ContractAgreement.SetRange("No.", ContractID);
            if ContractAgreement.FindFirst() then
                ContractLine.Reset();
            ContractLine.SetCurrentKey("Document No.");
            ContractLine.SetRange("Document No.", ContractAgreement."No.");
            if ContractLine.FindFirst() then begin
                repeat
                    if ContractLine."Truck Code" <> '' then begin
                        TruckAvaiCount := 0;
                        NodaysAvailable := 0;
                        TotalTruckAvail := 0;
                        TotalTruckAvailValue := 0;
                        BillingTruckCount := 0;
                        ContractAmunt := 0;
                        //  FixedCalc := 0;
                        //VariableCalc := 0;
                        ContractAmuntTotal := 0;
                        // FixedCalc2 := 0;




                        if BillingTruckCount = 0 then begin

                            BillingLineSum.Reset();
                            BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                            BillingLineSum.SetRange("Contract Id", ContractLine."Document No.");
                            BillingLineSum.SetRange("Truck Type", ContractLine."Truck Type");
                            BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                            BillingLineSum.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                            if BillingLineSum.FindFirst() then begin
                                repeat

                                    BillingPricePerKm := 0;
                                    BillingFixedRate := 0;
                                    BillingVariableCalc := 0;
                                    BillingFixedPriceKm := 0;
                                    FixedRate := 0;
                                    FixedCalc := 0;
                                    VariableCalc := 0;

                                    //If TruckTypeCalculation.Get(ContractLine."Truck Type") then begin
                                    //if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::Variable then begin
                                    FixedPricePerKm.Reset();
                                    FixedPricePerKm.SetCurrentKey("Contract No.", "Truck Type");
                                    FixedPricePerKm.SetRange("Contract No.", BillingLineSum."Contract Id");
                                    FixedPricePerKm.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    if FixedPricePerKm.FindFirst() then begin
                                        repeat
                                            if (BillingLineSum.Quantity <> 0) then begin
                                                PricePerKm += (FixedPricePerKm.Rate * BillingLineSum.Quantity);
                                                FixedRate := FixedPricePerKm."Fixed Rate";
                                                BillingPricePerKm := FixedPricePerKm.Rate;
                                                TotalDistance += BillingLineSum.Quantity;
                                                BillingFixedRate := FixedPricePerKm."Fixed Rate";
                                                BillingVariableCalc := FixedPricePerKm.Rate * BillingLineSum.Quantity;

                                            end;
                                        Until FixedPricePerKm.Next = 0;

                                    end;
                                    IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin

                                        BillingLineUpdate."Variable Cost" := BillingVariableCalc;
                                        BillingLineUpdate."Fixed Cost" := FixedRate * NodaysAvailable;
                                        BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                        BillingLineUpdate."Sales Document No." := DocumentNo;
                                        BillingLineUpdate."Fixed Rate" := BillingFixedRate;
                                        BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                                        BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                        BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                        BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                        IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                            BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                            BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                            BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                        end;
                                        BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                        BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";


                                        BillingLineUpdate.Modify(true);
                                    end;

                                    InitBillingNextEntryNo();
                                    ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                    ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                    ProcessedBillingLine.Insert();

                                    //  end;

                                    //    if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::"Rate per location" then begin
                                    FixedPricePeLoca.Reset();
                                    FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                                    FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                                    FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
                                    FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

                                    if FixedPricePeLoca.FindFirst() then begin
                                        repeat

                                            BillingVariableAmt := FixedPricePeLoca."Fixed Price";
                                            BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                                            PricePerLoc := FixedPricePeLoca."Fixed Price";
                                            FixedRate += PricePerLoc;

                                        Until FixedPricePeLoca.Next = 0;

                                    end;

                                    IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin

                                        BillingLineUpdate."Variable Cost" := BillingVariableCalc;
                                        BillingLineUpdate."Fixed Cost" := FixedRate * NodaysAvailable;
                                        BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                        BillingLineUpdate."Sales Document No." := DocumentNo;
                                        BillingLineUpdate."Fixed Rate" := BillingFXPriceLoc;
                                        BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                                        BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                        BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                        BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                        IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                            BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                            BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                            BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                        end;
                                        BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                        BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";


                                        BillingLineUpdate.Modify(true);
                                    end;

                                    InitBillingNextEntryNo();
                                    ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                    ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                    ProcessedBillingLine.Insert();
                                //     end;

                                //   end;





                                //  end;
                                until BillingLineSum.Next = 0;


                                FixedCalc := FixedRate;
                                FixedCalc2 += FixedCalc;

                                VariableCalc2 += PricePerKm;






                            end;

                        end

                    end;
                Until ContractLine.Next = 0;
            end;
            // FixedCalc2 += FixedCalc;
            //  VariableCalc2 += VariableCalc;
            // FixedCalc3 += FixedCalc;
            TotalFixedCalc := FixedCalc2 + FixedCalc3;

            TotalVariableCalc := VariableCalc2;
            ContractAmunt := TotalFixedCalc + TotalVariableCalc;
            // Message(format(ContractAmunt));
            SalesHeader.SetRange("No.", DocumentNo);
            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
            SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
            if SalesHeader.FindFirst() then begin

                InitNextEntryNo(DocumentNo);
                // LineNo := LineNo + 10000;
                SalesLine.Init();
                SalesLine."Document No." := DocumentNo;
                SalesLine."Line No." := NextEntryNo;
                SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                SalesLine.Type := SalesLine.Type::"G/L Account";
                if Customer.get(SalesHeader."Sell-to Customer No.") then
                    SalesLine."No." := Customer."G/L Account No.";
                SalesLine.Validate("No.");
                SalesLine.Quantity := 1;
                SalesLine.Validate(Quantity);
                SalesLine."Unit Price" := ContractAmunt;
                SalesLine.Validate("Unit Price");
                SalesLine."Varible Amount" := TotalVariableCalc;
                SalesLine."Fixed Amount" := TotalFixedCalc;
                SalesLine."Total Days Available" := NodaysAvailable;
                SalesLine."Half Month  Amt" := TotalTruckAvailValue;
                SalesLine."Truck No." := ContractLine."Truck Code";
                SalesLine."Truck Type" := ContractLine."Truck Type";
                SalesLine.Description := 'The Total contract sum is ' + '' + Format(ContractAmunt) + ' ' + ContractLine."Truck Code";
                SalesLine.Insert(true);

            end

        end else begin

            SalesHeaderType.Reset();
            SalesHeaderType.SetRange("No.", DocumentNo);
            SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
            SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Half Month");
            if SalesHeaderType.FindFirst() then begin
                ContractAgreement.Reset();
                ContractAgreement.SetRange("No.", ContractID);
                if ContractAgreement.FindFirst() then
                    ContractLine.Reset();
                ContractLine.SetCurrentKey("Document No.");
                ContractLine.SetRange("Document No.", ContractAgreement."No.");
                if ContractLine.FindFirst() then begin
                    repeat
                        if ContractLine."Truck Code" <> '' then begin
                            TruckAvaiCount := 0;
                            NodaysAvailable := 0;
                            TotalTruckAvail := 0;
                            TotalTruckAvailValue := 0;
                            BillingTruckCount := 0;
                            ContractAmunt := 0;
                            FixedCalc := 0;
                            VariableCalc := 0;
                            TotalAvailAmount2 := 0;


                            TotalTruckAvail := ContractAgreement."Target Availability";

                            if ContractAgreement."Target Availability" <> 0 then
                                NodaysAvailable := ContractAgreement."Target Availability" / 2;



                            FixedPricePerKm.Reset();
                            FixedPricePerKm.SetRange("Contract No.", Contractid);
                            FixedPricePerKm.SetRange("Truck Type", ContractLine."Truck Type");
                            // FixedPricePerKm.SetRange("Standard Millage Code");
                            if FixedPricePerKm.FindFirst() then begin
                                //  repeat
                                //  if (FixedPricePerKm.Minimum > DistanceCoveredKm) AND (FixedPricePerKm.Maximum <= DistanceCoveredKm) then begin
                                // PricePerKm += FixedPricePerKm.Rate;
                                FixedRate := FixedPricePerKm."Fixed Rate" / TotalTruckAvail;

                                //  end;
                                // Until FixedPricePerKm.Next = 0;

                            end;

                            BillingLineSum.Reset();
                            BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                            BillingLineSum.SetRange("Contract Id", ContractLine."Document No.");
                            BillingLineSum.SetRange("Truck Type", ContractLine."Truck Type");
                            BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                            BillingLineSum.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                            if BillingLineSum.FindFirst() then begin
                                repeat

                                    BillingPricePerKm := 0;
                                    BillingFixedRate := 0;
                                    BillingVariableCalc := 0;
                                    BillingFixedPriceKm := 0;
                                    FixedRate := 0;
                                    FixedCalc := 0;
                                    VariableCalc := 0;


                                    FixedPricePerKm.Reset();
                                    FixedPricePerKm.SetCurrentKey("Contract No.", "Truck Type");
                                    FixedPricePerKm.SetRange("Contract No.", BillingLineSum."Contract Id");
                                    FixedPricePerKm.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    // FixedPricePerKm.SetRange("Standard Millage Code");
                                    if FixedPricePerKm.FindFirst() then begin
                                        repeat
                                            if (BillingLineSum.Quantity <> 0) then begin
                                                PricePerKm += (FixedPricePerKm.Rate * BillingLineSum.Quantity);
                                                FixedRate := FixedPricePerKm."Fixed Rate";
                                                BillingPricePerKm := FixedPricePerKm.Rate;
                                                TotalDistance += BillingLineSum.Quantity;
                                                BillingFixedRate := FixedPricePerKm."Fixed Rate";
                                                BillingVariableCalc := FixedPricePerKm.Rate * BillingLineSum.Quantity;

                                            end;
                                        Until FixedPricePerKm.Next = 0;
                                        //  FixedRate := FixedPricePerKm.Rate;
                                    end;


                                    IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin

                                        BillingLineUpdate."Variable Cost" := BillingVariableCalc;
                                        BillingLineUpdate."Fixed Cost" := FixedRate * NodaysAvailable;
                                        BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                        BillingLineUpdate."Sales Document No." := DocumentNo;
                                        BillingLineUpdate."Fixed Rate" := BillingFixedRate;
                                        BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                                        BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                        BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                        BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                        IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                            BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                            BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                            BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                        end;
                                        BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                        BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";

                                        //BillingLineUpdate."Product Type" := ContractLine.Contra
                                        //  BillingLineUpdate."Drivers Name"

                                        // BillingLineUpdate. := BillingShortageTolernce;
                                        BillingLineUpdate.Modify(true);
                                    end;

                                    InitBillingNextEntryNo();
                                    ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                    ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                    ProcessedBillingLine.Insert();


                                until BillingLineSum.Next = 0;


                                FixedCalc := FixedRate;
                                FixedCalc2 += FixedCalc;
                                //  VariableCalc := PricePerKm;
                                //     VariableCalc2 += VariableCalc;
                                VariableCalc2 += PricePerKm;






                            end;


                            //     TotalAvailAmount2 := (FixedRate * NodaysAvailable);

                            TotalFixedCalc := FixedCalc2 + FixedCalc3;

                            TotalVariableCalc := VariableCalc2;
                            ContractAmunt := TotalFixedCalc + TotalVariableCalc;




                        end;


                    Until ContractLine.Next = 0;
                end;
                SalesHeader.SetRange("No.", DocumentNo);
                SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
                if SalesHeader.FindFirst() then begin

                    InitNextEntryNo(DocumentNo);
                    // LineNo := LineNo + 10000;
                    SalesLine.Init();
                    SalesLine."Document No." := DocumentNo;
                    SalesLine."Line No." := NextEntryNo;
                    SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                    SalesLine.Type := SalesLine.Type::"G/L Account";
                    if Customer.get(SalesHeader."Sell-to Customer No.") then
                        SalesLine."No." := Customer."G/L Account No.";
                    SalesLine.Validate("No.");
                    SalesLine.Quantity := 1;
                    SalesLine.Validate(Quantity);
                    SalesLine."Unit Price" := ContractAmunt;
                    SalesLine.Validate("Unit Price");
                    SalesLine."Varible Amount" := TotalVariableCalc;
                    SalesLine."Fixed Amount" := TotalFixedCalc;
                    SalesLine."Total Days Available" := NodaysAvailable;
                    SalesLine."Half Month  Amt" := TotalTruckAvailValue;
                    SalesLine."Truck No." := ContractLine."Truck Code";
                    SalesLine."Truck Type" := ContractLine."Truck Type";
                    SalesLine.Description := 'The Total contract sum is ' + '' + Format(ContractAmunt) + ' ' + ContractLine."Truck Code";
                    SalesLine.Insert(true);

                end



            end;
        end;
        MESSAGE('The Sales Line is successfully Updated', DocumentNo);
    end;

    procedure SportHire(var ContractId: Code[20]; var DocumentNo: Code[20]; Var StartDate: Date; var EndDate: Date)
    var
        ContractAgreement: Record "Contract Agreement";
        ContractLine: Record "Contract Line";
        TruckAvaiCount: Decimal;
        NodaysAvailable: Decimal;
        TotalTruckAvail: Decimal;
        TotalTruckAvailValue: Decimal;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        MillageRange: Record "Millage Range Controls";
        BillingLine: Record "Billing Line";
        BillingLineSum: Record "Billing Line";
        BillingLineUpdate: Record "Billing Line";
        transactionBuffer: Record "Transaction Buffer";
        transactionBuffSum: Record "Transaction Buffer";
        NoDayWork: Record "No. Days Work";
        BillingTruckCount: Integer;
        TruckAvailEntryLines: Record "Truck Avail. Entry Lines";
        FixedPricePeLoca: Record "Fixed Price Per Location";
        FixedPricePerKm: Record "Millage Range Controls";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        FixedRate: Decimal;
        FreightCharge: Decimal;
        FixedCalc: Decimal;
        VariableCalc: Decimal;
        SalesHeaderType: Record "Sales Header";
        TotalAvailAmount2: Decimal;
        ContractTransacHist: Record "Contract Transaction History";
        ContractAmuntTotal: Decimal;
        QuantityLoaded: Decimal;
        BillingPricePerKm: Decimal;
        BillingFixedRate: Decimal;
        BillingVariableCalc: Decimal;
        BillingFixedPriceKm: Decimal;
        TotalDistance: Decimal;
        FixedAsset: Record "Fixed Asset";
        ProcessedBillingLine: Record "Processed Billing Line";
        ProcessedBillingLineFixed: Record "Processed Billing Line";
        EmployeeRec: Record Employee;
        FixedCalc2: decimal;
        VariableCalc2: decimal;
        FixedCalc3: decimal;
        VariableCalc3: decimal;
        TotalFixedCalc: decimal;
        TotalVariableCalc: decimal;
        TruckTypeCalculation: record "Vehicle Make";
        BillingVariableAmt: decimal;
        BillingFXPriceLoc: decimal;
        PricePerLoc: decimal;

    begin
        // calculate for truck availability with no transaction line 

        ///PLADIS (CNG)Components that make up Revenue –	Fixed Amount Variable Amount

        VariableCalc2 := 0;
        FixedCalc2 := 0;
        VariableCalc3 := 0;
        FixedCalc3 := 0;
        TotalFixedCalc := 0;
        TotalVariableCalc := 0;
        SalesHeaderType.Reset();
        SalesHeaderType.SetRange("No.", DocumentNo);
        SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
        SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Full Month");
        if SalesHeaderType.FindFirst() then begin

            ContractAgreement.Reset();
            ContractAgreement.SetRange("No.", ContractID);
            if ContractAgreement.FindFirst() then
                ContractLine.Reset();
            ContractLine.SetCurrentKey("Document No.");
            ContractLine.SetRange("Document No.", ContractAgreement."No.");
            if ContractLine.FindFirst() then begin
                repeat
                    if ContractLine."Truck Code" <> '' then begin
                        TruckAvaiCount := 0;
                        NodaysAvailable := 0;
                        TotalTruckAvail := 0;
                        TotalTruckAvailValue := 0;
                        BillingTruckCount := 0;
                        ContractAmunt := 0;
                        //  FixedCalc := 0;
                        //VariableCalc := 0;
                        ContractAmuntTotal := 0;
                        // FixedCalc2 := 0;




                        if BillingTruckCount = 0 then begin

                            BillingLineSum.Reset();
                            BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                            BillingLineSum.SetRange("Contract Id", ContractLine."Document No.");
                            BillingLineSum.SetRange("Truck Type", ContractLine."Truck Type");
                            BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                            BillingLineSum.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                            if BillingLineSum.FindFirst() then begin
                                repeat

                                    BillingPricePerKm := 0;
                                    BillingFixedRate := 0;
                                    BillingVariableCalc := 0;
                                    BillingFixedPriceKm := 0;
                                    FixedRate := 0;
                                    FixedCalc := 0;
                                    VariableCalc := 0;

                                    //If TruckTypeCalculation.Get(ContractLine."Truck Type") then begin
                                    //if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::Variable then begin
                                    FixedPricePerKm.Reset();
                                    FixedPricePerKm.SetCurrentKey("Contract No.", "Truck Type");
                                    FixedPricePerKm.SetRange("Contract No.", BillingLineSum."Contract Id");
                                    FixedPricePerKm.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    if FixedPricePerKm.FindFirst() then begin
                                        repeat
                                            if (BillingLineSum.Quantity <> 0) then begin
                                                PricePerKm += (BillingLineSum."Variable Rate" * BillingLineSum.Quantity);
                                                // FixedRate := FixedPricePerKm."Fixed Rate";
                                                //  BillingPricePerKm := FixedPricePerKm.Rate;
                                                TotalDistance += BillingLineSum.Quantity;
                                                //   BillingFixedRate := FixedPricePerKm."Fixed Rate";
                                                BillingVariableCalc := BillingLineSum."Variable Rate" * BillingLineSum.Quantity;

                                            end;
                                        Until FixedPricePerKm.Next = 0;

                                    end;
                                    IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin

                                        BillingLineUpdate."Variable Cost" := BillingVariableCalc;
                                        BillingLineUpdate."Fixed Cost" := FixedRate * NodaysAvailable;
                                        BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                        BillingLineUpdate."Sales Document No." := DocumentNo;
                                        BillingLineUpdate."Fixed Rate" := BillingFixedRate;
                                        // BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                                        BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                        BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                        BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                        IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                            BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                            BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                            BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                        end;
                                        BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                        BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";


                                        BillingLineUpdate.Modify(true);
                                    end;

                                    InitBillingNextEntryNo();
                                    ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                    ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                    ProcessedBillingLine.Insert();

                                    //  end;

                                    //    if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::"Rate per location" then begin
                                    FixedPricePeLoca.Reset();
                                    FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                                    FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                                    FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
                                    FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

                                    if FixedPricePeLoca.FindFirst() then begin
                                        repeat

                                            BillingVariableAmt := FixedPricePeLoca."Fixed Price";
                                            BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                                            PricePerLoc := FixedPricePeLoca."Fixed Price";
                                            FixedRate += PricePerLoc;

                                        Until FixedPricePeLoca.Next = 0;

                                    end;

                                    IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin

                                        BillingLineUpdate."Variable Cost" := BillingVariableCalc;
                                        BillingLineUpdate."Fixed Cost" := FixedRate * NodaysAvailable;
                                        BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                        BillingLineUpdate."Sales Document No." := DocumentNo;
                                        // BillingLineUpdate."Fixed Rate" := BillingFXPriceLoc;
                                        // BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                                        BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                        BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                        BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                        IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                            BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                            BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                            BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                        end;
                                        BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                        BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";


                                        BillingLineUpdate.Modify(true);
                                    end;

                                    InitBillingNextEntryNo();
                                    ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                    ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                    ProcessedBillingLine.Insert();
                                //     end;

                                //   end;





                                //  end;
                                until BillingLineSum.Next = 0;


                                FixedCalc := FixedRate;
                                FixedCalc2 += FixedCalc;

                                VariableCalc2 += PricePerKm;






                            end;

                        end

                    end;
                Until ContractLine.Next = 0;
            end;
            // FixedCalc2 += FixedCalc;
            //  VariableCalc2 += VariableCalc;
            // FixedCalc3 += FixedCalc;
            TotalFixedCalc := FixedCalc2 + FixedCalc3;

            TotalVariableCalc := VariableCalc2;
            ContractAmunt := TotalFixedCalc + TotalVariableCalc;
            // Message(format(ContractAmunt));
            SalesHeader.SetRange("No.", DocumentNo);
            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
            SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
            if SalesHeader.FindFirst() then begin

                InitNextEntryNo(DocumentNo);
                // LineNo := LineNo + 10000;
                SalesLine.Init();
                SalesLine."Document No." := DocumentNo;
                SalesLine."Line No." := NextEntryNo;
                SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                SalesLine.Type := SalesLine.Type::"G/L Account";
                if Customer.get(SalesHeader."Sell-to Customer No.") then
                    SalesLine."No." := Customer."G/L Account No.";
                SalesLine.Validate("No.");
                SalesLine.Quantity := 1;
                SalesLine.Validate(Quantity);
                SalesLine."Unit Price" := ContractAmunt;
                SalesLine.Validate("Unit Price");
                SalesLine."Varible Amount" := TotalVariableCalc;
                SalesLine."Fixed Amount" := TotalFixedCalc;
                SalesLine."Total Days Available" := NodaysAvailable;
                SalesLine."Half Month  Amt" := TotalTruckAvailValue;
                SalesLine."Truck No." := ContractLine."Truck Code";
                SalesLine."Truck Type" := ContractLine."Truck Type";
                SalesLine.Description := 'The Total contract sum is ' + '' + Format(ContractAmunt) + ' ' + ContractLine."Truck Code";
                SalesLine.Insert(true);

            end

        end else begin

            SalesHeaderType.Reset();
            SalesHeaderType.SetRange("No.", DocumentNo);
            SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
            SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Half Month");
            if SalesHeaderType.FindFirst() then begin
                ContractAgreement.Reset();
                ContractAgreement.SetRange("No.", ContractID);
                if ContractAgreement.FindFirst() then
                    ContractLine.Reset();
                ContractLine.SetCurrentKey("Document No.");
                ContractLine.SetRange("Document No.", ContractAgreement."No.");
                if ContractLine.FindFirst() then begin
                    repeat
                        if ContractLine."Truck Code" <> '' then begin
                            TruckAvaiCount := 0;
                            NodaysAvailable := 0;
                            TotalTruckAvail := 0;
                            TotalTruckAvailValue := 0;
                            BillingTruckCount := 0;
                            ContractAmunt := 0;
                            FixedCalc := 0;
                            VariableCalc := 0;
                            TotalAvailAmount2 := 0;


                            TotalTruckAvail := ContractAgreement."Target Availability";

                            if ContractAgreement."Target Availability" <> 0 then
                                NodaysAvailable := ContractAgreement."Target Availability" / 2;



                            FixedPricePerKm.Reset();
                            FixedPricePerKm.SetRange("Contract No.", Contractid);
                            FixedPricePerKm.SetRange("Truck Type", ContractLine."Truck Type");
                            // FixedPricePerKm.SetRange("Standard Millage Code");
                            if FixedPricePerKm.FindFirst() then begin
                                //  repeat
                                //  if (FixedPricePerKm.Minimum > DistanceCoveredKm) AND (FixedPricePerKm.Maximum <= DistanceCoveredKm) then begin
                                // PricePerKm += FixedPricePerKm.Rate;
                                FixedRate := FixedPricePerKm."Fixed Rate" / TotalTruckAvail;

                                //  end;
                                // Until FixedPricePerKm.Next = 0;

                            end;

                            BillingLineSum.Reset();
                            BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                            BillingLineSum.SetRange("Contract Id", ContractLine."Document No.");
                            BillingLineSum.SetRange("Truck Type", ContractLine."Truck Type");
                            BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                            BillingLineSum.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                            if BillingLineSum.FindFirst() then begin
                                repeat

                                    BillingPricePerKm := 0;
                                    BillingFixedRate := 0;
                                    BillingVariableCalc := 0;
                                    BillingFixedPriceKm := 0;
                                    FixedRate := 0;
                                    FixedCalc := 0;
                                    VariableCalc := 0;


                                    FixedPricePerKm.Reset();
                                    FixedPricePerKm.SetCurrentKey("Contract No.", "Truck Type");
                                    FixedPricePerKm.SetRange("Contract No.", BillingLineSum."Contract Id");
                                    FixedPricePerKm.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    // FixedPricePerKm.SetRange("Standard Millage Code");
                                    if FixedPricePerKm.FindFirst() then begin
                                        repeat
                                            if (BillingLineSum.Quantity <> 0) then begin
                                                PricePerKm += (FixedPricePerKm.Rate * BillingLineSum.Quantity);
                                                FixedRate := FixedPricePerKm."Fixed Rate";
                                                BillingPricePerKm := FixedPricePerKm.Rate;
                                                TotalDistance += BillingLineSum.Quantity;
                                                BillingFixedRate := FixedPricePerKm."Fixed Rate";
                                                BillingVariableCalc := FixedPricePerKm.Rate * BillingLineSum.Quantity;

                                            end;
                                        Until FixedPricePerKm.Next = 0;
                                        //  FixedRate := FixedPricePerKm.Rate;
                                    end;


                                    IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin

                                        BillingLineUpdate."Variable Cost" := BillingVariableCalc;
                                        BillingLineUpdate."Fixed Cost" := FixedRate * NodaysAvailable;
                                        BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                        BillingLineUpdate."Sales Document No." := DocumentNo;
                                        BillingLineUpdate."Fixed Rate" := BillingFixedRate;
                                        BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                                        BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                        BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                        BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                        IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                            BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                            BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                            BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                        end;
                                        BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                        BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";

                                        //BillingLineUpdate."Product Type" := ContractLine.Contra
                                        //  BillingLineUpdate."Drivers Name"

                                        // BillingLineUpdate. := BillingShortageTolernce;
                                        BillingLineUpdate.Modify(true);
                                    end;

                                    InitBillingNextEntryNo();
                                    ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                    ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                    ProcessedBillingLine.Insert();


                                until BillingLineSum.Next = 0;


                                FixedCalc := FixedRate;
                                FixedCalc2 += FixedCalc;
                                //  VariableCalc := PricePerKm;
                                //     VariableCalc2 += VariableCalc;
                                VariableCalc2 += PricePerKm;






                            end;


                            //     TotalAvailAmount2 := (FixedRate * NodaysAvailable);

                            TotalFixedCalc := FixedCalc2 + FixedCalc3;

                            TotalVariableCalc := VariableCalc2;
                            ContractAmunt := TotalFixedCalc + TotalVariableCalc;




                        end;


                    Until ContractLine.Next = 0;
                end;
                SalesHeader.SetRange("No.", DocumentNo);
                SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
                if SalesHeader.FindFirst() then begin

                    InitNextEntryNo(DocumentNo);
                    // LineNo := LineNo + 10000;
                    SalesLine.Init();
                    SalesLine."Document No." := DocumentNo;
                    SalesLine."Line No." := NextEntryNo;
                    SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                    SalesLine.Type := SalesLine.Type::"G/L Account";
                    if Customer.get(SalesHeader."Sell-to Customer No.") then
                        SalesLine."No." := Customer."G/L Account No.";
                    SalesLine.Quantity := 1;
                    SalesLine.Validate(Quantity);
                    SalesLine."Unit Price" := ContractAmunt;
                    SalesLine.Validate("Unit Price");
                    SalesLine."Varible Amount" := TotalVariableCalc;
                    SalesLine."Fixed Amount" := TotalFixedCalc;
                    SalesLine."Total Days Available" := NodaysAvailable;
                    SalesLine."Half Month  Amt" := TotalTruckAvailValue;
                    SalesLine."Truck No." := ContractLine."Truck Code";
                    SalesLine."Truck Type" := ContractLine."Truck Type";
                    SalesLine.Description := 'The Total contract sum is ' + '' + Format(ContractAmunt) + ' ' + ContractLine."Truck Code";
                    SalesLine.Insert(true);

                end



            end;
        end;
        MESSAGE('The Sales Line is successfully Updated', DocumentNo);
    end;

    procedure NodaysKMPriceFMN(var ContractId: Code[20]; var DocumentNo: Code[20]; Var StartDate: Date; var EndDate: Date; var TotalNoDay: integer)
    var
        ContractAgreement: Record "Contract Agreement";
        ContractLine: Record "Contract Line";
        TruckAvaiCount: Decimal;
        NodaysAvailable: Decimal;
        TotalTruckAvail: Decimal;
        TotalTruckAvailValue: Decimal;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        MillageRange: Record "Millage Range Controls";
        BillingLine: Record "Billing Line";
        BillingLineSum: Record "Billing Line";
        BillingLineUpdate: Record "Billing Line";
        transactionBuffer: Record "Transaction Buffer";
        transactionBuffSum: Record "Transaction Buffer";
        NoDayWork: Record "No. Days Work";
        BillingTruckCount: Integer;
        TruckAvailEntryLines: Record "Truck Avail. Entry Lines";
        FixedPricePeLoca: Record "Fixed Price Per Location";
        FixedPricePerKm: Record "Millage Range Controls";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        FixedRate: Decimal;
        FreightCharge: Decimal;
        FixedCalc: Decimal;
        VariableCalc: Decimal;
        SalesHeaderType: Record "Sales Header";
        TotalAvailAmount2: Decimal;
        ContractTransacHist: Record "Contract Transaction History";
        ContractAmuntTotal: Decimal;
        QuantityLoaded: Decimal;
        BillingPricePerKm: Decimal;
        BillingFixedRate: Decimal;
        BillingVariableCalc: Decimal;
        BillingFixedPriceKm: Decimal;
        TotalDistance: Decimal;
        FixedAsset: Record "Fixed Asset";
        ProcessedBillingLine: Record "Processed Billing Line";
        ProcessedBillingLineFixed: Record "Processed Billing Line";
        EmployeeRec: Record Employee;
        FixedCalc2: decimal;
        VariableCalc2: decimal;
        FixedCalc3: decimal;
        FixedCalc4: decimal;
        VariableCalc3: decimal;
        TotalFixedCalc: decimal;
        TotalVariableCalc: decimal;

    begin
        // calculate for truck availability with no transaction line 

        ///LARFARGE (CNG)Components that make up Revenue –	Fixed Amount Variable Amount

        VariableCalc2 := 0;
        FixedCalc2 := 0;
        VariableCalc3 := 0;
        FixedCalc3 := 0;
        FixedCalc4 := 0;
        TotalFixedCalc := 0;
        TotalVariableCalc := 0;
        SalesHeaderType.Reset();
        SalesHeaderType.SetRange("No.", DocumentNo);
        SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
        SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Full Month");
        if SalesHeaderType.FindFirst() then begin

            ContractAgreement.Reset();
            ContractAgreement.SetRange("No.", ContractID);
            if ContractAgreement.FindFirst() then
                ContractLine.Reset();
            ContractLine.SetCurrentKey("Document No.");
            ContractLine.SetRange("Document No.", ContractAgreement."No.");
            if ContractLine.FindFirst() then begin
                repeat
                    if ContractLine."Truck Code" <> '' then begin
                        TruckAvaiCount := 0;
                        NodaysAvailable := 0;
                        TotalTruckAvail := 0;
                        TotalTruckAvailValue := 0;
                        BillingTruckCount := 0;
                        ContractAmunt := 0;
                        //  FixedCalc := 0;
                        //VariableCalc := 0;
                        ContractAmuntTotal := 0;
                        //  FixedCalc2 := 0;


                        //NoDayWork.reset();
                        //NoDayWork.setCurrentKey("Contract ID","Truck No","Truck Type");
                        NoDayWork.Setfilter("Contract ID", ContractID);
                        NoDayWork.Setfilter("Truck No", ContractLine."Truck Code");
                        NoDayWork.SetFilter("Truck Type", ContractLine."Truck Type");
                        BillingTruckCount := NoDayWork.Count;


                        BillingLine.SetFilter("Contract Id", ContractID);
                        BillingLine.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                        BillingLine.SetFilter("Truck No.", ContractLine."Truck Code");
                        BillingLine.SetFilter("Truck Type", ContractLine."Truck Type");
                        //  BillingTruckCount := BillingLine.Count;
                        //BillingLine.CalcSums(BillingLine.Quantity);
                        //  QuantityLoaded := BillingLine.Quantity;

                        // TruckAvailEntryLines.Reset();
                        // TruckAvailEntryLines.SetRange("Leasing Truck No", ContractLine."Truck Code");
                        // TruckAvailEntryLines.Setrange("Vehicle Make", ContractLine."Truck Type");
                        // TruckAvailEntryLines.Setrange("Contract No.", ContractID);
                        // TruckAvailEntryLines.SetRange(Date, StartDate, EndDate);
                        // TruckAvaiCount := TruckAvailEntryLines.Count;

                        TruckAvailEntryLines.Reset();
                        TruckAvailEntryLines.SetRange("Leasing Truck No", ContractLine."Truck Code");
                        TruckAvailEntryLines.Setrange("Vehicle Make", ContractLine."Truck Type");
                        TruckAvailEntryLines.Setrange("Contract No.", ContractID);
                        if TruckAvailEntryLines.FindFirst() then
                            repeat
                                if (TruckAvailEntryLines."Start Date" >= StartDate) and (TruckAvailEntryLines."End Date" <= EndDate) then begin
                                    TruckAvaiCount := TruckAvaiCount + ((TruckAvailEntryLines."End Date" - TruckAvailEntryLines."Start Date") + 1)
                                end;
                            until TruckAvailEntryLines.Next = 0;


                        TotalTruckAvail := ContractAgreement."Target Availability";

                        NodaysAvailable := ContractAgreement."Target Availability" - (BillingTruckCount + TruckAvaiCount);

                        if (BillingTruckCount <> 0) and (NodaysAvailable < ContractAgreement."Target Availability") then begin

                            BillingLineSum.Reset();
                            BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                            BillingLineSum.SetRange("Contract Id", ContractLine."Document No.");
                            BillingLineSum.SetRange("Truck Type", ContractLine."Truck Type");
                            BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                            BillingLineSum.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                            if BillingLineSum.FindFirst() then begin
                                repeat

                                    BillingPricePerKm := 0;
                                    BillingFixedRate := 0;
                                    BillingVariableCalc := 0;
                                    BillingFixedPriceKm := 0;
                                    FixedRate := 0;
                                    FixedCalc := 0;
                                    VariableCalc := 0;


                                    FixedPricePerKm.Reset();
                                    FixedPricePerKm.SetCurrentKey("Contract No.", "Truck Type");
                                    FixedPricePerKm.SetRange("Contract No.", BillingLineSum."Contract Id");
                                    FixedPricePerKm.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    // FixedPricePerKm.SetRange("Standard Millage Code");
                                    if FixedPricePerKm.FindFirst() then begin
                                        repeat
                                            if (BillingLineSum.Quantity <> 0) then begin
                                                PricePerKm += (FixedPricePerKm.Rate * BillingLineSum.Quantity * FixedPricePerKm."Discount Rate");
                                                FixedRate := FixedPricePerKm."Fixed Rate";
                                                BillingPricePerKm := FixedPricePerKm.Rate;
                                                TotalDistance += BillingLineSum.Quantity;
                                                BillingFixedRate := FixedPricePerKm."Fixed Rate";
                                                BillingVariableCalc := FixedPricePerKm.Rate * BillingLineSum.Quantity * FixedPricePerKm."Discount Rate";

                                            end;
                                        Until FixedPricePerKm.Next = 0;
                                        //  FixedRate := FixedPricePerKm.Rate;
                                    end;


                                    IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin

                                        BillingLineUpdate."Variable Cost" := BillingVariableCalc;
                                        BillingLineUpdate."Fixed Cost" := FixedRate * NodaysAvailable;
                                        BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                        BillingLineUpdate."Sales Document No." := DocumentNo;
                                        BillingLineUpdate."Fixed Rate" := BillingFixedRate;
                                        BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                                        BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                        BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                        BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                        IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                            BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                            BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                            BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                        end;
                                        BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                        BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";

                                        //BillingLineUpdate."Product Type" := ContractLine.Contra
                                        //  BillingLineUpdate."Drivers Name"

                                        // BillingLineUpdate. := BillingShortageTolernce;
                                        BillingLineUpdate.Modify(true);
                                    end;

                                    InitBillingNextEntryNo();
                                    ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                    ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                    ProcessedBillingLine.Insert();


                                until BillingLineSum.Next = 0;


                                FixedCalc4 := FixedRate * NodaysAvailable;
                                FixedCalc2 += FixedCalc4;
                                //  VariableCalc := PricePerKm;
                                //     VariableCalc2 += VariableCalc;
                                VariableCalc2 := PricePerKm;






                            end;

                        end
                        else begin
                            FixedCalc := 0;
                            FixedRate := 0;
                            IF ((BillingTruckCount = 0) And (NodaysAvailable <> 0)) then begin
                                FixedPricePerKm.Reset();
                                FixedPricePerKm.SetRange("Contract No.", Contractid);
                                FixedPricePerKm.SetRange("Truck Type", ContractLine."Truck Type");
                                //   FixedPricePerKm.SetRange("Standard Millage Code");
                                if FixedPricePerKm.FindFirst() then begin

                                    PricePerKm := FixedPricePerKm.Rate;
                                    FixedRate := FixedPricePerKm."Fixed Rate";
                                    //  TotalTruckAvailValue := CalcAvailabilityAmount(NodaysAvailable, ContractID, ContractLine."Truck Type", ContractAgreement."Target Availability");
                                end;
                                FixedRate := FixedPricePerKm."Fixed Rate";
                                //  FixedRate3 += FixedRate;
                                // FixedCalc := TotalTruckAvailValue;
                                FixedCalc := FixedRate * NodaysAvailable;
                                FixedCalc3 += FixedCalc;
                                VariableCalc := 0;
                                BillingFixedRate := 0;

                                If NodaysAvailable <> 0 then
                                    BillingFixedRate := FixedRate / NodaysAvailable;


                                //  ContractAmunt := FixedRate + VariableCalc;

                                InitBillingNextEntryNo();
                                ProcessedBillingLineFixed."Batch Entry No." := NextEntryNo2;
                                // ProcessedBillingLine.TransferFields(BillingLineU;
                                ProcessedBillingLineFixed."Truck No." := ContractLine."Truck Code";
                                ProcessedBillingLineFixed."Fixed Cost" := FixedCalc3;
                                ProcessedBillingLineFixed."Truck Type" := ContractLine."Truck Type";
                                ProcessedBillingLineFixed."Contract Id" := ContractAgreement."No.";
                                ProcessedBillingLineFixed."AvaialabilityPer Truck No.Days" := NodaysAvailable;
                                ProcessedBillingLineFixed."Sales Document No." := DocumentNo;
                                ProcessedBillingLineFixed."Fixed Rate" := PricePerKm;
                                ProcessedBillingLineFixed."Transaction Date" := EndDate;
                                ProcessedBillingLineFixed."No of Days" := ContractAgreement."Target Availability";
                                // BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                                ProcessedBillingLineFixed."Customer No." := ContractAgreement."Customer Code";
                                ProcessedBillingLineFixed."Customer Name" := ContractAgreement."Customer Name";
                                IF FixedAsset.get(ContractLine."Truck Code") then begin
                                    IF EmployeeRec.GET(FixedAsset."Responsible Employee") THEN
                                        ProcessedBillingLineFixed."Drivers Name" := EmployeeRec.FullName();
                                    ProcessedBillingLineFixed."Truck Id" := FixedAsset."Registration No.";
                                    ProcessedBillingLineFixed."Drivers Code" := FixedAsset."Driver Code";
                                end;
                                ProcessedBillingLineFixed."Product Type" := ContractLine."Product Type";
                                ProcessedBillingLineFixed."Unit Of Measure" := ContractAgreement."Unit Of Measure";
                                ProcessedBillingLineFixed.Insert();

                                //    end;
                                /* ContractTransacHist.SetRange("Contract No.", Contractid);
                                ContractTransacHist.SetRange("Truck No.", ContractLine."Truck Code");
                                if ContractTransacHist.FindLast() then
                                    ContractAmuntTotal := ContractAmunt - ContractTransacHist.Amount;
                                 */// if  ContractTransacHist.FindLast()  then
                                   //ContractAmuntTotal := ContractAmunt-ContractTransacHist.Amount;
                            end;
                        end;
                    end;
                Until ContractLine.Next = 0;
            end;
            // FixedCalc2 += FixedCalc;
            //  VariableCalc2 += VariableCalc;
            // FixedCalc3 += FixedCalc;
            TotalFixedCalc := FixedCalc2 + FixedCalc3;
            // TotalFixedCalc := FixedCalc3;

            TotalVariableCalc := VariableCalc2;
            ContractAmunt := TotalFixedCalc + TotalVariableCalc;
            // ContractAmunt := FixedCalc3 + TotalVariableCalc;

            // Message(format(TotalFixedCalc));
            //Message(format(TotalVariableCalc));
            SalesHeader.SetRange("No.", DocumentNo);
            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
            SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
            if SalesHeader.FindFirst() then begin

                InitNextEntryNo(DocumentNo);
                // LineNo := LineNo + 10000;
                SalesLine.Init();
                SalesLine."Document No." := DocumentNo;
                SalesLine."Line No." := NextEntryNo;
                SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                SalesLine.Type := SalesLine.Type::"G/L Account";
                if Customer.get(SalesHeader."Sell-to Customer No.") then
                    SalesLine."No." := Customer."G/L Account No.";
                SalesLine.Validate("No.");
                SalesLine.Quantity := 1;
                SalesLine.Validate(Quantity);
                SalesLine."Unit Price" := ContractAmunt;
                SalesLine.Validate("Unit Price");
                SalesLine."Varible Amount" := TotalVariableCalc;
                SalesLine."Fixed Amount" := TotalFixedCalc;
                SalesLine."Total Days Available" := NodaysAvailable;
                SalesLine."Half Month  Amt" := TotalTruckAvailValue;
                SalesLine."Truck No." := ContractLine."Truck Code";
                SalesLine."Truck Type" := ContractLine."Truck Type";
                SalesLine.Description := 'The Total contract sum is ' + '' + Format(ContractAmunt) + ' ' + ContractLine."Truck Code";
                SalesLine.Insert(true);

            end

        end else begin

            SalesHeaderType.Reset();
            SalesHeaderType.SetRange("No.", DocumentNo);
            SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
            SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Half Month");
            if SalesHeaderType.FindFirst() then begin
                ContractAgreement.Reset();
                ContractAgreement.SetRange("No.", ContractID);
                if ContractAgreement.FindFirst() then
                    ContractLine.Reset();
                ContractLine.SetCurrentKey("Document No.");
                ContractLine.SetRange("Document No.", ContractAgreement."No.");
                if ContractLine.FindFirst() then begin
                    repeat
                        if ContractLine."Truck Code" <> '' then begin
                            TruckAvaiCount := 0;
                            NodaysAvailable := 0;
                            TotalTruckAvail := 0;
                            TotalTruckAvailValue := 0;
                            BillingTruckCount := 0;
                            ContractAmunt := 0;
                            FixedCalc := 0;
                            VariableCalc := 0;
                            TotalAvailAmount2 := 0;


                            TotalTruckAvail := ContractAgreement."Target Availability";

                            if ContractAgreement."Target Availability" <> 0 then
                                NodaysAvailable := ContractAgreement."Target Availability" / 2;



                            FixedPricePerKm.Reset();
                            FixedPricePerKm.SetRange("Contract No.", Contractid);
                            FixedPricePerKm.SetRange("Truck Type", ContractLine."Truck Type");
                            // FixedPricePerKm.SetRange("Standard Millage Code");
                            if FixedPricePerKm.FindFirst() then begin
                                //  repeat
                                //  if (FixedPricePerKm.Minimum > DistanceCoveredKm) AND (FixedPricePerKm.Maximum <= DistanceCoveredKm) then begin
                                // PricePerKm += FixedPricePerKm.Rate;
                                FixedRate := FixedPricePerKm."Fixed Rate" / TotalTruckAvail;

                                //  end;
                                // Until FixedPricePerKm.Next = 0;

                            end;

                            TotalAvailAmount2 := (FixedRate * NodaysAvailable);


                            SalesHeader.SetRange("No.", DocumentNo);
                            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                            SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Half Month");
                            if SalesHeader.FindFirst() then begin

                                InitNextEntryNo(DocumentNo);
                                // LineNo := LineNo + 10000;
                                SalesLine.Init();
                                SalesLine."Document No." := DocumentNo;
                                SalesLine."Line No." := NextEntryNo;
                                SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                                SalesLine.Type := SalesLine.Type::"G/L Account";
                                if Customer.get(SalesHeader."Sell-to Customer No.") then
                                    SalesLine."No." := Customer."G/L Account No.";
                                SalesLine.Validate("No.");
                                SalesLine.Quantity := 1;
                                SalesLine.Validate(Quantity);
                                SalesLine."Unit Price" := TotalAvailAmount2;
                                SalesLine.Validate("Unit Price");
                                SalesLine."Varible Amount" := VariableCalc;
                                SalesLine."Fixed Amount" := TotalAvailAmount2;
                                SalesLine."Total Days Available" := NodaysAvailable;
                                SalesLine."Half Month  Amt" := TotalAvailAmount2;
                                SalesLine."Truck No." := ContractLine."Truck Code";
                                SalesLine."Truck Type" := ContractLine."Truck Type";
                                SalesLine.Description := 'The Total contract sum is ' + '' + Format(TotalAvailAmount2) + ' ' + ContractLine."Truck Code";
                                // SalesLine.Amount <> 0 then
                                SalesLine.Insert(true);

                            end




                        end;


                    Until ContractLine.Next = 0;
                end;
            end;
        end;
        MESSAGE('The Sales Line is successfully Updated', DocumentNo);
    end;


    procedure PZCusson2(var ContractId: Code[20]; var DocumentNo: Code[20]; Var StartDate: Date; var EndDate: Date)
    var
        ContractAgreement: Record "Contract Agreement";
        ContractLine: Record "Contract Line";
        TruckAvaiCount: Decimal;
        NodaysAvailable: Decimal;
        TotalTruckAvail: Decimal;
        TotalTruckAvailValue: Decimal;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        MillageRange: Record "Millage Range Controls";
        BillingLine: Record "Billing Line";
        BillingLineSum: Record "Billing Line";
        BillingLineUpdate: Record "Billing Line";
        transactionBuffer: Record "Transaction Buffer";
        transactionBuffSum: Record "Transaction Buffer";
        NoDayWork: Record "No. Days Work";
        BillingTruckCount: Integer;
        TruckAvailEntryLines: Record "Truck Avail. Entry Lines";
        FixedPricePeLoca: Record "Fixed Price Per Location";
        FixedPricePerKm: Record "Millage Range Controls";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        FixedRate: Decimal;
        FreightCharge: Decimal;
        FixedCalc: Decimal;
        VariableCalc: Decimal;
        SalesHeaderType: Record "Sales Header";
        TotalAvailAmount2: Decimal;
        ContractTransacHist: Record "Contract Transaction History";
        ContractAmuntTotal: Decimal;
        QuantityLoaded: Decimal;
        BillingPricePerKm: Decimal;
        BillingFixedRate: Decimal;
        BillingVariableCalc: Decimal;
        BillingFixedPriceKm: Decimal;
        TotalDistance: Decimal;
        FixedAsset: Record "Fixed Asset";
        ProcessedBillingLine: Record "Processed Billing Line";
        ProcessedBillingLineFixed: Record "Processed Billing Line";
        EmployeeRec: Record Employee;
        FixedCalc2: decimal;
        VariableCalc2: decimal;
        FixedCalc3: decimal;
        VariableCalc3: decimal;
        TotalFixedCalc: decimal;
        TotalVariableCalc: decimal;
        TruckTypeCalculation: record "Vehicle Make";
        BillingVariableAmt: decimal;
        BillingFXPriceLoc: decimal;
        PricePerLoc: decimal;

    begin
        // calculate for truck availability with no transaction line 

        ///PZCusson (CNG)Components that make up Revenue –	Fixed Amount Variable Amount

        VariableCalc2 := 0;
        FixedCalc2 := 0;
        VariableCalc3 := 0;
        FixedCalc3 := 0;
        TotalFixedCalc := 0;
        TotalVariableCalc := 0;
        SalesHeaderType.Reset();
        SalesHeaderType.SetRange("No.", DocumentNo);
        SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
        SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Full Month");
        if SalesHeaderType.FindFirst() then begin

            ContractAgreement.Reset();
            ContractAgreement.SetRange("No.", ContractID);
            if ContractAgreement.FindFirst() then
                ContractLine.SetCurrentKey("Document No.");
            ContractLine.Reset();
            ContractLine.SetRange("Document No.", ContractAgreement."No.");
            if ContractLine.FindFirst() then begin
                repeat
                    if ContractLine."Truck Code" <> '' then begin
                        TruckAvaiCount := 0;
                        NodaysAvailable := 0;
                        TotalTruckAvail := 0;
                        TotalTruckAvailValue := 0;
                        BillingTruckCount := 0;
                        ContractAmunt := 0;
                        //  FixedCalc := 0;
                        //VariableCalc := 0;
                        ContractAmuntTotal := 0;
                        // FixedCalc2 := 0;




                        if BillingTruckCount = 0 then begin

                            BillingLineSum.Reset();
                            BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                            BillingLineSum.SetRange("Contract Id", ContractLine."Document No.");
                            BillingLineSum.SetRange("Truck Type", ContractLine."Truck Type");
                            BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                            BillingLineSum.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                            if BillingLineSum.FindFirst() then begin
                                repeat

                                    BillingPricePerKm := 0;
                                    BillingFixedRate := 0;
                                    BillingVariableCalc := 0;
                                    BillingFixedPriceKm := 0;
                                    FixedRate := 0;
                                    FixedCalc := 0;
                                    VariableCalc := 0;

                                    If TruckTypeCalculation.Get(ContractLine."Truck Type") then begin
                                        if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::"trip per location" then begin
                                            FixedPricePeLoca.Reset();
                                            FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                                            FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                                            FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                                            FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
                                            FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

                                            if FixedPricePeLoca.FindFirst() then begin

                                                repeat
                                                    if (BillingLineSum.Quantity <> 0) then begin
                                                        PricePerKm += (FixedPricePeLoca."Fixed Price" * BillingLineSum.Quantity);
                                                        FixedRate := FixedPricePeLoca."Fixed Price";
                                                        BillingPricePerKm := FixedPricePeLoca."Fixed Price";
                                                        TotalDistance += BillingLineSum.Quantity;
                                                        BillingFixedRate := FixedPricePeLoca."Fixed Price";
                                                        BillingVariableCalc := FixedPricePeLoca."Fixed Price" * BillingLineSum.Quantity;

                                                    end;
                                                Until FixedPricePeLoca.Next = 0;

                                            end;
                                            IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin

                                                BillingLineUpdate."Variable Cost" := BillingVariableCalc;
                                                BillingLineUpdate."Fixed Cost" := FixedRate * NodaysAvailable;
                                                BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                                BillingLineUpdate."Sales Document No." := DocumentNo;
                                                BillingLineUpdate."Fixed Rate" := BillingFixedRate;
                                                BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                                                BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                                BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                                BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                                IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                                    BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                                    BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                                    BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                                end;
                                                BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                                BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";


                                                BillingLineUpdate.Modify(true);
                                            end;

                                            InitBillingNextEntryNo();
                                            ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                            ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                            ProcessedBillingLine.Insert();

                                        end;

                                        if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::"Rate per location" then begin
                                            FixedPricePeLoca.Reset();
                                            FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                                            FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                                            FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                                            FixedPricePeLoca.SetFilter(Location, BillingLineSum."Direct Dispatch");
                                            FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Location Destination");

                                            if FixedPricePeLoca.FindFirst() then begin
                                                repeat

                                                    BillingVariableAmt := FixedPricePeLoca."Fixed Price";
                                                    BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                                                    PricePerLoc := FixedPricePeLoca."Fixed Price";
                                                    FixedRate += PricePerLoc;

                                                Until FixedPricePeLoca.Next = 0;

                                            end;

                                            IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin

                                                BillingLineUpdate."Variable Cost" := BillingVariableCalc;
                                                BillingLineUpdate."Fixed Cost" := FixedRate * NodaysAvailable;
                                                BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                                BillingLineUpdate."Sales Document No." := DocumentNo;
                                                BillingLineUpdate."Fixed Rate" := BillingFXPriceLoc;
                                                BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                                                BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                                BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                                BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                                IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                                    BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                                    BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                                    BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                                end;
                                                BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                                BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";


                                                BillingLineUpdate.Modify(true);
                                            end;

                                            InitBillingNextEntryNo();
                                            ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                            ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                            ProcessedBillingLine.Insert();
                                        end;

                                    end;





                                //  end;
                                until BillingLineSum.Next = 0;


                                FixedCalc := FixedRate;
                                FixedCalc2 += FixedCalc;

                                VariableCalc2 += PricePerKm;






                            end;

                        end

                    end;
                Until ContractLine.Next = 0;
            end;
            // FixedCalc2 += FixedCalc;
            //  VariableCalc2 += VariableCalc;
            // FixedCalc3 += FixedCalc;
            TotalFixedCalc := FixedCalc2 + FixedCalc3;

            TotalVariableCalc := VariableCalc2;
            ContractAmunt := TotalFixedCalc + TotalVariableCalc;
            // Message(format(ContractAmunt));
            SalesHeader.SetRange("No.", DocumentNo);
            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
            SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
            if SalesHeader.FindFirst() then begin

                InitNextEntryNo(DocumentNo);
                // LineNo := LineNo + 10000;
                SalesLine.Init();
                SalesLine."Document No." := DocumentNo;
                SalesLine."Line No." := NextEntryNo;
                SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                SalesLine.Type := SalesLine.Type::"G/L Account";
                if Customer.get(SalesHeader."Sell-to Customer No.") then
                    SalesLine."No." := Customer."G/L Account No.";
                SalesLine.Validate("No.");
                SalesLine.Quantity := 1;
                SalesLine.Validate(Quantity);
                SalesLine."Unit Price" := ContractAmunt;
                SalesLine.Validate("Unit Price");
                SalesLine."Varible Amount" := TotalVariableCalc;
                SalesLine."Fixed Amount" := TotalFixedCalc;
                SalesLine."Total Days Available" := NodaysAvailable;
                SalesLine."Half Month  Amt" := TotalTruckAvailValue;
                SalesLine."Truck No." := ContractLine."Truck Code";
                SalesLine."Truck Type" := ContractLine."Truck Type";
                SalesLine.Description := 'The Total contract sum is ' + '' + Format(ContractAmunt) + ' ' + ContractLine."Truck Code";
                SalesLine.Insert(true);

            end

        end else begin

            SalesHeaderType.Reset();
            SalesHeaderType.SetRange("No.", DocumentNo);
            SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
            SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Half Month");
            if SalesHeaderType.FindFirst() then begin
                ContractAgreement.Reset();
                ContractAgreement.SetRange("No.", ContractID);
                if ContractAgreement.FindFirst() then
                    ContractLine.Reset();
                ContractLine.SetCurrentKey("Document No.");
                ContractLine.SetRange("Document No.", ContractAgreement."No.");
                if ContractLine.FindFirst() then begin
                    repeat
                        if ContractLine."Truck Code" <> '' then begin
                            TruckAvaiCount := 0;
                            NodaysAvailable := 0;
                            TotalTruckAvail := 0;
                            TotalTruckAvailValue := 0;
                            BillingTruckCount := 0;
                            ContractAmunt := 0;
                            FixedCalc := 0;
                            VariableCalc := 0;
                            TotalAvailAmount2 := 0;


                            TotalTruckAvail := ContractAgreement."Target Availability";

                            if ContractAgreement."Target Availability" <> 0 then
                                NodaysAvailable := ContractAgreement."Target Availability" / 2;



                            FixedPricePerKm.Reset();
                            FixedPricePerKm.SetRange("Contract No.", Contractid);
                            FixedPricePerKm.SetRange("Truck Type", ContractLine."Truck Type");
                            // FixedPricePerKm.SetRange("Standard Millage Code");
                            if FixedPricePerKm.FindFirst() then begin
                                //  repeat
                                //  if (FixedPricePerKm.Minimum > DistanceCoveredKm) AND (FixedPricePerKm.Maximum <= DistanceCoveredKm) then begin
                                // PricePerKm += FixedPricePerKm.Rate;
                                FixedRate := FixedPricePerKm."Fixed Rate" / TotalTruckAvail;

                                //  end;
                                // Until FixedPricePerKm.Next = 0;

                            end;

                            BillingLineSum.Reset();
                            BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                            BillingLineSum.SetRange("Contract Id", ContractLine."Document No.");
                            BillingLineSum.SetRange("Truck Type", ContractLine."Truck Type");
                            BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                            BillingLineSum.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                            if BillingLineSum.FindFirst() then begin
                                repeat

                                    BillingPricePerKm := 0;
                                    BillingFixedRate := 0;
                                    BillingVariableCalc := 0;
                                    BillingFixedPriceKm := 0;
                                    FixedRate := 0;
                                    FixedCalc := 0;
                                    VariableCalc := 0;


                                    FixedPricePerKm.Reset();
                                    FixedPricePerKm.SetCurrentKey("Contract No.", "Truck Type");
                                    FixedPricePerKm.SetRange("Contract No.", BillingLineSum."Contract Id");
                                    FixedPricePerKm.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    // FixedPricePerKm.SetRange("Standard Millage Code");
                                    if FixedPricePerKm.FindFirst() then begin
                                        repeat
                                            if (BillingLineSum.Quantity <> 0) then begin
                                                PricePerKm += (FixedPricePerKm.Rate * BillingLineSum.Quantity);
                                                FixedRate := FixedPricePerKm."Fixed Rate";
                                                BillingPricePerKm := FixedPricePerKm.Rate;
                                                TotalDistance += BillingLineSum.Quantity;
                                                BillingFixedRate := FixedPricePerKm."Fixed Rate";
                                                BillingVariableCalc := FixedPricePerKm.Rate * BillingLineSum.Quantity;

                                            end;
                                        Until FixedPricePerKm.Next = 0;
                                        //  FixedRate := FixedPricePerKm.Rate;
                                    end;


                                    IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin

                                        BillingLineUpdate."Variable Cost" := BillingVariableCalc;
                                        BillingLineUpdate."Fixed Cost" := FixedRate * NodaysAvailable;
                                        BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                        BillingLineUpdate."Sales Document No." := DocumentNo;
                                        BillingLineUpdate."Fixed Rate" := BillingFixedRate;
                                        BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                                        BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                        BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                        BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                        IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                            BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                            BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                            BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                        end;
                                        BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                        BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";

                                        //BillingLineUpdate."Product Type" := ContractLine.Contra
                                        //  BillingLineUpdate."Drivers Name"

                                        // BillingLineUpdate. := BillingShortageTolernce;
                                        BillingLineUpdate.Modify(true);
                                    end;

                                    InitBillingNextEntryNo();
                                    ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                    ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                    ProcessedBillingLine.Insert();


                                until BillingLineSum.Next = 0;


                                FixedCalc := FixedRate;
                                FixedCalc2 += FixedCalc;
                                //  VariableCalc := PricePerKm;
                                //     VariableCalc2 += VariableCalc;
                                VariableCalc2 += PricePerKm;






                            end;


                            //     TotalAvailAmount2 := (FixedRate * NodaysAvailable);

                            TotalFixedCalc := FixedCalc2 + FixedCalc3;

                            TotalVariableCalc := VariableCalc2;
                            ContractAmunt := TotalFixedCalc + TotalVariableCalc;




                        end;


                    Until ContractLine.Next = 0;
                end;
                SalesHeader.SetRange("No.", DocumentNo);
                SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
                if SalesHeader.FindFirst() then begin

                    InitNextEntryNo(DocumentNo);
                    // LineNo := LineNo + 10000;
                    SalesLine.Init();
                    SalesLine."Document No." := DocumentNo;
                    SalesLine."Line No." := NextEntryNo;
                    SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                    SalesLine.Type := SalesLine.Type::"G/L Account";
                    if Customer.get(SalesHeader."Sell-to Customer No.") then
                        SalesLine."No." := Customer."G/L Account No.";
                    SalesLine.Validate("No.");
                    SalesLine.Quantity := 1;
                    SalesLine.Validate(Quantity);
                    SalesLine."Unit Price" := ContractAmunt;
                    SalesLine.Validate("Unit Price");
                    SalesLine."Varible Amount" := TotalVariableCalc;
                    SalesLine."Fixed Amount" := TotalFixedCalc;
                    SalesLine."Total Days Available" := NodaysAvailable;
                    SalesLine."Half Month  Amt" := TotalTruckAvailValue;
                    SalesLine."Truck No." := ContractLine."Truck Code";
                    SalesLine."Truck Type" := ContractLine."Truck Type";
                    SalesLine.Description := 'The Total contract sum is ' + '' + Format(ContractAmunt) + ' ' + ContractLine."Truck Code";
                    SalesLine.Insert(true);

                end



            end;
        end;
        MESSAGE('The Sales Line is successfully Updated', DocumentNo);
    end;

    procedure PZCusson(var ContractId: Code[20]; var DocumentNo: Code[20]; Var StartDate: Date; var EndDate: Date)
    var
        ContractAgreement: Record "Contract Agreement";
        ContractLine: Record "Contract Line";
        TruckAvaiCount: Decimal;
        NodaysAvailable: Decimal;
        TotalTruckAvail: Decimal;
        TotalTruckAvailValue: Decimal;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        MillageRange: Record "Millage Range Controls";
        BillingLine: Record "Billing Line";
        BillingLineSum: Record "Billing Line";
        BillingLineUpdate: Record "Billing Line";
        transactionBuffer: Record "Transaction Buffer";
        transactionBuffSum: Record "Transaction Buffer";
        NoDayWork: Record "No. Days Work";
        BillingTruckCount: Integer;
        TruckAvailEntryLines: Record "Truck Avail. Entry Lines";
        FixedPricePeLoca: Record "Fixed Price Per Location";
        FixedPricePerKm: Record "Millage Range Controls";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        FixedRate: Decimal;
        FreightCharge: Decimal;
        FixedCalc: Decimal;
        VariableCalc: Decimal;
        SalesHeaderType: Record "Sales Header";
        TotalAvailAmount2: Decimal;
        ContractTransacHist: Record "Contract Transaction History";
        ContractAmuntTotal: Decimal;
        QuantityLoaded: Decimal;
        BillingPricePerKm: Decimal;
        BillingFixedRate: Decimal;
        BillingVariableCalc: Decimal;
        BillingFixedPriceKm: Decimal;
        TotalDistance: Decimal;
        FixedAsset: Record "Fixed Asset";
        ProcessedBillingLine: Record "Processed Billing Line";
        ProcessedBillingLineFixed: Record "Processed Billing Line";
        EmployeeRec: Record Employee;
        FixedCalc2: decimal;
        VariableCalc2: decimal;
        FixedCalc3: decimal;
        VariableCalc3: decimal;
        TotalFixedCalc: decimal;
        TotalVariableCalc: decimal;
        TruckTypeCalculation: record "Vehicle Make";
        BillingVariableAmt: decimal;
        BillingFXPriceLoc: decimal;
        PricePerLoc: decimal;
        ShortageKg: decimal;


    begin
        // calculate for truck availability with no transaction line 

        ///PZCusson (CNG)Components that make up Revenue –	Fixed Amount Variable Amount

        VariableCalc2 := 0;
        FixedCalc2 := 0;
        VariableCalc3 := 0;
        FixedCalc3 := 0;
        TotalFixedCalc := 0;
        TotalVariableCalc := 0;
        SalesHeaderType.Reset();
        SalesHeaderType.SetRange("No.", DocumentNo);
        SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
        SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Full Month");
        if SalesHeaderType.FindFirst() then begin

            ContractAgreement.Reset();
            ContractAgreement.SetRange("No.", ContractID);
            if ContractAgreement.FindFirst() then
                ContractLine.SetCurrentKey("Document No.");
            ContractLine.Reset();
            ContractLine.SetRange("Document No.", ContractAgreement."No.");
            if ContractLine.FindFirst() then begin
                repeat
                    if ContractLine."Truck Code" <> '' then begin
                        TruckAvaiCount := 0;
                        NodaysAvailable := 0;
                        TotalTruckAvail := 0;
                        TotalTruckAvailValue := 0;
                        BillingTruckCount := 0;
                        ContractAmunt := 0;
                        //  FixedCalc := 0;
                        //VariableCalc := 0;
                        ContractAmuntTotal := 0;
                        // FixedCalc2 := 0;




                        if BillingTruckCount = 0 then begin

                            BillingLineSum.Reset();
                            BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                            BillingLineSum.SetRange("Contract Id", ContractLine."Document No.");
                            BillingLineSum.SetRange("Truck Type", ContractLine."Truck Type");
                            BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                            BillingLineSum.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                            if BillingLineSum.FindFirst() then begin
                                repeat

                                    BillingPricePerKm := 0;
                                    BillingFixedRate := 0;
                                    BillingVariableCalc := 0;
                                    BillingFixedPriceKm := 0;
                                    FixedRate := 0;
                                    FixedCalc := 0;
                                    FixedCalc2 := 0;
                                    VariableCalc := 0;
                                    ShortageKg := 0;

                                    If TruckTypeCalculation.Get(ContractLine."Truck Type") then begin
                                        if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::"trip per location" then begin
                                            FixedPricePeLoca.Reset();
                                            FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                                            FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                                            FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                                            FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
                                            FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

                                            if FixedPricePeLoca.FindFirst() then begin

                                                repeat
                                                    if (BillingLineSum.Quantity <> 0) then begin
                                                        PricePerKm += (FixedPricePeLoca."Fixed Price" * BillingLineSum.Quantity);
                                                        FixedRate := FixedPricePeLoca."Fixed Price";
                                                        BillingPricePerKm := FixedPricePeLoca."Fixed Price";
                                                        TotalDistance += BillingLineSum.Quantity;
                                                        BillingFixedRate := FixedPricePeLoca."Fixed Price";
                                                        BillingVariableCalc := FixedPricePeLoca."Fixed Price" * BillingLineSum.Quantity;
                                                        MESSAGE('THAKS2');
                                                    end;
                                                Until FixedPricePeLoca.Next = 0;

                                            end;
                                            IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin

                                                BillingLineUpdate."Variable Cost" := BillingVariableCalc;
                                                BillingLineUpdate."Fixed Cost" := FixedRate * NodaysAvailable;
                                                BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                                BillingLineUpdate."Sales Document No." := DocumentNo;
                                                BillingLineUpdate."Fixed Rate" := BillingFixedRate;
                                                BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                                                BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                                BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                                BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                                IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                                    BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                                    BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                                    BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                                end;
                                                BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                                BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";


                                                BillingLineUpdate.Modify(true);
                                            end;

                                            InitBillingNextEntryNo();
                                            ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                            ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                            ProcessedBillingLine.Insert();

                                        end;

                                        if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::"Rate per location" then begin
                                            FixedPricePeLoca.Reset();
                                            FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                                            FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                                            FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                                            FixedPricePeLoca.SetFilter(Location, BillingLineSum."Direct Dispatch");
                                            FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Location Destination");

                                            if FixedPricePeLoca.FindFirst() then begin
                                                repeat

                                                    BillingVariableAmt := FixedPricePeLoca."Fixed Price";
                                                    BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                                                    PricePerLoc := FixedPricePeLoca."Fixed Price";
                                                    FixedRate += PricePerLoc;
                                                    MESSAGE('THAKS3');
                                                Until FixedPricePeLoca.Next = 0;

                                            end;

                                            IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin

                                                BillingLineUpdate."Variable Cost" := BillingVariableCalc;
                                                BillingLineUpdate."Fixed Cost" := FixedRate * NodaysAvailable;
                                                BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                                BillingLineUpdate."Sales Document No." := DocumentNo;
                                                BillingLineUpdate."Fixed Rate" := BillingFXPriceLoc;
                                                BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                                                BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                                BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                                BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                                IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                                    BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                                    BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                                    BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                                end;
                                                BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                                BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";


                                                BillingLineUpdate.Modify(true);
                                            end;

                                            InitBillingNextEntryNo();
                                            ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                            ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                            ProcessedBillingLine.Insert();
                                        end;


                                        if TruckTypeCalculation."Calculate Type" = TruckTypeCalculation."Calculate Type"::Fixed then begin
                                            FixedPricePerKm.Reset();
                                            FixedPricePerKm.SetCurrentKey("Contract No.", "Truck Type");
                                            FixedPricePerKm.SetRange("Contract No.", BillingLineSum."Contract Id");
                                            FixedPricePerKm.SetRange("Truck Type", BillingLineSum."Truck Type");
                                            // FixedPricePerKm.SetRange("Standard Millage Code");
                                            if FixedPricePerKm.FindFirst() then begin


                                                repeat
                                                    if (BillingLineSum.Quantity <> 0) then begin
                                                        if FixedPricePerKm."Shortage Tolerance" < BillingLineSum.Shortages THEN
                                                            ShortageKg := BillingLineSum.Shortages;

                                                        PricePerKm += ((FixedPricePerKm."Fixed Rate" * BillingLineSum.Quantity) + (ShortageKg * FixedPricePerKm."Shortage Rate"));
                                                        FixedRate := FixedPricePerKm."Fixed Rate";
                                                        BillingPricePerKm := FixedPricePerKm."Fixed Rate";
                                                        TotalDistance += BillingLineSum.Quantity;
                                                        BillingFixedRate := FixedPricePerKm."Fixed Rate";
                                                        BillingVariableCalc := FixedPricePeLoca."Fixed Price" * BillingLineSum.Quantity + (ShortageKg * FixedPricePerKm."Shortage Rate");
                                                        MESSAGE('THAKS4');
                                                    end;
                                                Until FixedPricePerKm.Next = 0;

                                            end;

                                            IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin

                                                BillingLineUpdate."Variable Cost" := BillingVariableCalc;
                                                BillingLineUpdate."Fixed Cost" := FixedRate * NodaysAvailable;
                                                BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                                BillingLineUpdate."Sales Document No." := DocumentNo;
                                                BillingLineUpdate."Fixed Rate" := BillingFXPriceLoc;
                                                BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                                                BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                                BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                                BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                                IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                                    BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                                    BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                                    BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                                end;
                                                BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                                BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";


                                                BillingLineUpdate.Modify(true);
                                            end;

                                            InitBillingNextEntryNo();
                                            ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                            ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                            ProcessedBillingLine.Insert();
                                        end;

                                    end;





                                //  end;
                                until BillingLineSum.Next = 0;


                                FixedCalc := FixedRate;
                                FixedCalc2 += FixedCalc;

                                //  VariableCalc2 += PricePerKm;
                                VariableCalc2 := PricePerKm;






                            end;

                        end

                    end;
                Until ContractLine.Next = 0;
            end;
            // FixedCalc2 += FixedCalc;
            //  VariableCalc2 += VariableCalc;
            // FixedCalc3 += FixedCalc;
            // TotalFixedCalc := FixedCalc2 + FixedCalc3;

            TotalVariableCalc := VariableCalc2;
            ContractAmunt := TotalFixedCalc + TotalVariableCalc;
            // Message(format(ContractAmunt));
            SalesHeader.SetRange("No.", DocumentNo);
            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
            SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
            if SalesHeader.FindFirst() then begin

                InitNextEntryNo(DocumentNo);
                // LineNo := LineNo + 10000;
                SalesLine.Init();
                SalesLine."Document No." := DocumentNo;
                SalesLine."Line No." := NextEntryNo;
                SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                SalesLine.Type := SalesLine.Type::"G/L Account";
                if Customer.get(SalesHeader."Sell-to Customer No.") then
                    SalesLine."No." := Customer."G/L Account No.";
                SalesLine.Validate("No.");
                SalesLine.Quantity := 1;
                SalesLine.Validate(Quantity);
                SalesLine."Unit Price" := ContractAmunt;
                SalesLine.Validate("Unit Price");
                SalesLine."Varible Amount" := TotalVariableCalc;
                SalesLine."Fixed Amount" := TotalFixedCalc;
                SalesLine."Total Days Available" := NodaysAvailable;
                SalesLine."Half Month  Amt" := TotalTruckAvailValue;
                SalesLine."Truck No." := ContractLine."Truck Code";
                SalesLine."Truck Type" := ContractLine."Truck Type";
                SalesLine.Description := 'The Total contract sum is ' + '' + Format(ContractAmunt) + ' ' + ContractLine."Truck Code";
                SalesLine.Insert(true);

            end

        end else begin

            SalesHeaderType.Reset();
            SalesHeaderType.SetRange("No.", DocumentNo);
            SalesHeaderType.SetRange("Document Type", SalesHeaderType."Document Type"::Invoice);
            SalesHeaderType.SetRange("Monthly Status", SalesHeaderType."Monthly Status"::"Half Month");
            if SalesHeaderType.FindFirst() then begin
                ContractAgreement.Reset();
                ContractAgreement.SetRange("No.", ContractID);
                if ContractAgreement.FindFirst() then
                    ContractLine.Reset();
                ContractLine.SetCurrentKey("Document No.");
                ContractLine.SetRange("Document No.", ContractAgreement."No.");
                if ContractLine.FindFirst() then begin
                    repeat
                        if ContractLine."Truck Code" <> '' then begin
                            TruckAvaiCount := 0;
                            NodaysAvailable := 0;
                            TotalTruckAvail := 0;
                            TotalTruckAvailValue := 0;
                            BillingTruckCount := 0;
                            ContractAmunt := 0;
                            FixedCalc := 0;
                            VariableCalc := 0;
                            TotalAvailAmount2 := 0;


                            TotalTruckAvail := ContractAgreement."Target Availability";

                            if ContractAgreement."Target Availability" <> 0 then
                                NodaysAvailable := ContractAgreement."Target Availability" / 2;



                            FixedPricePerKm.Reset();
                            FixedPricePerKm.SetRange("Contract No.", Contractid);
                            FixedPricePerKm.SetRange("Truck Type", ContractLine."Truck Type");
                            // FixedPricePerKm.SetRange("Standard Millage Code");
                            if FixedPricePerKm.FindFirst() then begin
                                //  repeat
                                //  if (FixedPricePerKm.Minimum > DistanceCoveredKm) AND (FixedPricePerKm.Maximum <= DistanceCoveredKm) then begin
                                // PricePerKm += FixedPricePerKm.Rate;
                                FixedRate := FixedPricePerKm."Fixed Rate" / TotalTruckAvail;

                                //  end;
                                // Until FixedPricePerKm.Next = 0;

                            end;

                            BillingLineSum.Reset();
                            BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                            BillingLineSum.SetRange("Contract Id", ContractLine."Document No.");
                            BillingLineSum.SetRange("Truck Type", ContractLine."Truck Type");
                            BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                            BillingLineSum.SetFilter("Transaction Date", '%1..%2', StartDate, EndDate);
                            if BillingLineSum.FindFirst() then begin
                                repeat

                                    BillingPricePerKm := 0;
                                    BillingFixedRate := 0;
                                    BillingVariableCalc := 0;
                                    BillingFixedPriceKm := 0;
                                    FixedRate := 0;
                                    FixedCalc := 0;
                                    VariableCalc := 0;


                                    FixedPricePerKm.Reset();
                                    FixedPricePerKm.SetCurrentKey("Contract No.", "Truck Type");
                                    FixedPricePerKm.SetRange("Contract No.", BillingLineSum."Contract Id");
                                    FixedPricePerKm.SetRange("Truck Type", BillingLineSum."Truck Type");
                                    // FixedPricePerKm.SetRange("Standard Millage Code");
                                    if FixedPricePerKm.FindFirst() then begin
                                        repeat
                                            if (BillingLineSum.Quantity <> 0) then begin
                                                PricePerKm += (FixedPricePerKm.Rate * BillingLineSum.Quantity);
                                                FixedRate := FixedPricePerKm."Fixed Rate";
                                                BillingPricePerKm := FixedPricePerKm.Rate;
                                                TotalDistance += BillingLineSum.Quantity;
                                                BillingFixedRate := FixedPricePerKm."Fixed Rate";
                                                BillingVariableCalc := FixedPricePerKm.Rate * BillingLineSum.Quantity;

                                            end;
                                        Until FixedPricePerKm.Next = 0;
                                        //  FixedRate := FixedPricePerKm.Rate;
                                    end;


                                    IF BillingLineUpdate.GET(BillingLineSum."Entry No.") then begin

                                        BillingLineUpdate."Variable Cost" := BillingVariableCalc;
                                        BillingLineUpdate."Fixed Cost" := FixedRate * NodaysAvailable;
                                        BillingLineUpdate."Avaialability Per TruckNo.Days" := NodaysAvailable;
                                        BillingLineUpdate."Sales Document No." := DocumentNo;
                                        BillingLineUpdate."Fixed Rate" := BillingFixedRate;
                                        BillingLineUpdate."Variable Rate" := BillingPricePerKm;
                                        BillingLineUpdate."No of Days" := ContractAgreement."Target Availability";
                                        BillingLineUpdate."Customer No." := ContractAgreement."Customer Code";
                                        BillingLineUpdate."Customer Name" := ContractAgreement."Customer Name";
                                        IF FixedAsset.get(BillingLineUpdate."Truck No.") then begin
                                            BillingLineUpdate."Drivers Name" := FixedAsset."Responsible Employee";
                                            BillingLineUpdate."Truck Id" := FixedAsset."Registration No.";
                                            BillingLineUpdate."Drivers Code" := FixedAsset."Driver Code";
                                        end;
                                        BillingLineUpdate."Product Type" := ContractLine."Product Type";
                                        BillingLineUpdate."Unit Of Measure" := ContractAgreement."Unit Of Measure";

                                        //BillingLineUpdate."Product Type" := ContractLine.Contra
                                        //  BillingLineUpdate."Drivers Name"

                                        // BillingLineUpdate. := BillingShortageTolernce;
                                        BillingLineUpdate.Modify(true);
                                    end;

                                    InitBillingNextEntryNo();
                                    ProcessedBillingLine."Batch Entry No." := NextEntryNo2;
                                    ProcessedBillingLine.TransferFields(BillingLineUpdate, false);
                                    ProcessedBillingLine.Insert();


                                until BillingLineSum.Next = 0;


                                FixedCalc := FixedRate;
                                FixedCalc2 += FixedCalc;
                                //  VariableCalc := PricePerKm;
                                //     VariableCalc2 += VariableCalc;
                                VariableCalc2 += PricePerKm;






                            end;


                            //     TotalAvailAmount2 := (FixedRate * NodaysAvailable);

                            TotalFixedCalc := FixedCalc2 + FixedCalc3;

                            TotalVariableCalc := VariableCalc2;
                            ContractAmunt := TotalFixedCalc + TotalVariableCalc;




                        end;


                    Until ContractLine.Next = 0;
                end;
                SalesHeader.SetRange("No.", DocumentNo);
                SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
                SalesHeader.SetRange("Monthly Status", SalesHeader."Monthly Status"::"Full Month");
                if SalesHeader.FindFirst() then begin

                    InitNextEntryNo(DocumentNo);
                    // LineNo := LineNo + 10000;
                    SalesLine.Init();
                    SalesLine."Document No." := DocumentNo;
                    SalesLine."Line No." := NextEntryNo;
                    SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                    SalesLine.Type := SalesLine.Type::"G/L Account";
                    if Customer.get(SalesHeader."Sell-to Customer No.") then
                        SalesLine."No." := Customer."G/L Account No.";
                    SalesLine.Validate("No.");
                    SalesLine.Quantity := 1;
                    SalesLine.Validate(Quantity);
                    SalesLine."Unit Price" := ContractAmunt;
                    SalesLine.Validate("Unit Price");
                    SalesLine."Varible Amount" := TotalVariableCalc;
                    SalesLine."Fixed Amount" := TotalFixedCalc;
                    SalesLine."Total Days Available" := NodaysAvailable;
                    SalesLine."Half Month  Amt" := TotalTruckAvailValue;
                    SalesLine."Truck No." := ContractLine."Truck Code";
                    SalesLine."Truck Type" := ContractLine."Truck Type";
                    SalesLine.Description := 'The Total contract sum is ' + '' + Format(ContractAmunt) + ' ' + ContractLine."Truck Code";
                    SalesLine.Insert(true);

                end



            end;
        end;
        MESSAGE('The Sales Line is successfully Updated', DocumentNo);
    end;



    [EventSubscriber(ObjectType::Codeunit, 80, 'OnAfterPostSalesDoc', '', false, false)]
    procedure OnAfterPostSalesDoc(VAR SalesHeader: Record "Sales Header"; VAR GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean)

    var
        // DuploMgmt: Record "Duplo Management Setup";
        ContractTransacHist: Record "Contract Transaction History";
        SalesInvHeader: Record "Sales Invoice Header";
        SalesInvLine: Record "Sales Invoice Line";
        ProcessedBillingLine: Record "Processed Billing Line";



    begin

        SalesInvHeader.SetRange("No.", SalesInvHdrNo);
        IF SalesInvHeader.get(SalesInvHdrNo) then begin
            ProcessedBillingLine.setrange("Sales Document No.", SalesInvHeader."Pre-Assigned No.");
            if ProcessedBillingLine.FindSet() then
                repeat
                    ProcessedBillingLine.Treated := true;
                    ProcessedBillingLine.Modify(true);
                Until ProcessedBillingLine.Next() = 0;
        end;
    end;

    // if SalesInvHeader.FindFirst() then begin
    //if SalesInvHeader.get(SalesInvHdrNo) then begin
    //     SalesInvLine.SetRange("Document No.", SalesInvHdrNo);
    //     if SalesInvLine.findfirst then begin


    //         //     repeat
    //         //InitContractNextEntryNo;
    //         //   repeat
    //         InitContractNextEntryNo;
    //         ContractTransacHist.Init();
    //         ContractTransacHist."Entry No." := NextEntryNo;
    //         ContractTransacHist."Contract No." := SalesHeader."Contract Id";
    //         ContractTransacHist."Invoice No." := SalesInvHeader."No.";
    //         ContractTransacHist."Transaction Date" := SalesInvLine."Transaction Date";
    //         ContractTransacHist."Truck No." := SalesInvLine."Truck No.";
    //         ContractTransacHist."Truck Type" := SalesInvLine."Truck Type";
    //         ContractTransacHist.Amount := SalesInvLine.Amount;
    //         ContractTransacHist."Half Month  Amt" := SalesInvLine."Half Month  Amt";
    //         ContractTransacHist."Full Month Amt" := SalesInvLine."Full Month Amt";
    //         ContractTransacHist."Varible Amount" := SalesInvLine."Varible Amount";
    //         Evaluate(ContractTransacHist."Monthly Status", format(SalesInvHeader."Monthly Status"));
    //         ContractTransacHist.Insert(True);

    //         //  until SalesInvLine.Next = 0; 




    //     end;


    //     //    end;

    // end;



    local procedure InitNextEntryNo(Var DocumentNo: Code[20])
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.LOCKTABLE;
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Invoice);
        SalesLine.SetRange("Document No.", DocumentNo);
        IF SalesLine.FINDLAST THEN BEGIN
            NextEntryNo := SalesLine."Line No." + 100;
            // NextTransactionNo := Retention."Transaction No." + 1;
        END ELSE BEGIN
            NextEntryNo := 100;
            NextTransactionNo := 1;
        END;
    end;

    local procedure InitContractNextEntryNo()
    var
        // SalesLine: Record "Sales Line";
        ContractTransacHist: Record "Contract Transaction History";
        NextEntryNo: Integer;
    begin
        ContractTransacHist.LOCKTABLE;
        IF ContractTransacHist.FINDLAST THEN BEGIN
            NextEntryNo := ContractTransacHist."Entry No." + 100;
            // NextTransactionNo := Retention."Transaction No." + 1;
        END ELSE BEGIN
            NextEntryNo := 100;
            NextTransactionNo := 100;
        END;
    end;

    local procedure InitBillingNextEntryNo()
    var
        // SalesLine: Record "Sales Line";
        BillingProcessedEtry: Record "Processed Billing Line";
    //       NextEntryNo2: Integer;
    begin
        BillingProcessedEtry.LOCKTABLE;
        // BillingProcessedEtry.SetRange(BillingProcessedEtry."Batch Entry No.");
        //  BillingProcessedEtry.reset;
        IF BillingProcessedEtry.FINDLAST THEN BEGIN
            NextEntryNo2 := BillingProcessedEtry."Batch Entry No." + 1;
            // NextTransactionNo := Retention."Transaction No." + 1;
        END ELSE BEGIN
            NextEntryNo2 := 1;
            NextTransactionNo := 1;
        END;
    end;


    var
        NextEntryNo: Integer;
        NextEntryNo2: Integer;
        NextTransactionNo: Integer;
        Customer: Record Customer;
}