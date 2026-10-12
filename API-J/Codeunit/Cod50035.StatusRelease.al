codeunit 50035 StatusRelease
{
    procedure ModifyStatus(ReqNo: code[20]): text[200]
    begin
        purchhead.Reset;

        purchhead.SetRange("Document Type", purchhead."Document Type"::Quote);
        purchhead.SetRange("Buy-from Vendor No.", 'INT0001');
        purchhead.SetRange("No.", ReqNo);

        if purchhead.FindFirst() then begin
            purchhead.Status := purchhead.Status::Released;
            if purchhead.Modify(true) then
                exit(StrSubstNo('Record %1 modified successfully ', purchhead."No.")) else
                exit(StrSubstNo('Record %1 cannot be found in the related table', purchhead."No."))
        end;
    end;


    var
        purchhead: Record "Purchase Header";
}
