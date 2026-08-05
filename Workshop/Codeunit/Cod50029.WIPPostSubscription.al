

codeunit 50100 AllSubscriber
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeDeleteAfterPosting', '', True, true)]
    local procedure OnBeforeDeleteAfterPosting(var SalesHeader: Record "Sales Header"; var SalesInvoiceHeader: Record "Sales Invoice Header"; var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; SkipDelete: Boolean)
    var
        JobCard: Record Job;
        Jobcard2: Record Job;
        SalesLine: Record "Sales Line";
        RptJobWipCal: Report 1086;
        RptPostJobWip: Report 1085;

    begin
        SalesLine.reset;
        SalesLine.SetFilter("Document Type", '%1', SalesLine."Document Type"::Invoice);
        SalesLine.SetFilter("Document No.", SalesHeader."No.");
        if SalesLine.FindFirst() then begin
            IF SalesLine."Job No." <> '' THEN begin
                if JobCard.Get(SalesLine."Job No.") then begin
                    JobCard."Ending Date" := SalesHeader."Posting Date";
                    JobCard.Status := JobCard.Status::Completed;
                    JobCard.Modify();
                    Jobcard2.Copy(JobCard);
                    JobCard2.SetRange("No.", JobCard."No.");

                    RptJobWipCal.UseRequestPage(false);
                    RptJobWipCal.SetTableView(Jobcard2);
                    RptJobWipCal.SetPostingDate(SalesHeader."Posting Date");
                    RptJobWipCal.Run();

                    RptPostJobWip.UseRequestPage(false);
                    RptPostJobWip.SetTableView(Jobcard2);
                    RptPostJobWip.SetPostingDate(SalesHeader."Posting Date");
                    RptPostJobWip.Run();


                    //  Report.Run(1086, false, false, JobCard);
                    //  Report.Run(1085, false, false, JobCard);
                    // REPORT.RunModal(REPORT::"Job Calculate WIP", false, false, Jobcard2); // Calculate wip
                    // REPORT.RunModal(REPORT::"Job Post WIP to G/L", false, false, Jobcard2);//Post
                end;
            end;
        end;
    end;
}
reportextension 50100 JobWipCalExt extends "Job Calculate WIP"
{

    procedure SetPostingDate(Var JobPostDate: Date)
    begin
        PostingDate := JobPostDate;
    end;
}

reportextension 50110 JobPostWipExt extends "Job Post WIP to G/L"
{

    procedure SetPostingDate(Var JobPostDate: Date)
    begin
        PostingDate := JobPostDate;
    end;
}

