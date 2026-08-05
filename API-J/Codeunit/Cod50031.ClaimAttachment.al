codeunit 50031 ClaimAttachment
{
    TableNo = "Staff Claims Header";

    trigger OnRun()
    begin

    end;

    procedure ImportAttachmentToClaim(inputJson: Text): Text
    var
        ClaimJsonResponse: JsonObject;
        ClaimJsonToken: JsonToken;
        StaffClaim: Record "Staff Claims Header";
        ClaimNo: Code[20];
        AttachmentBase64: Text;
        FileName: Text[100];
        FileExtension: Text[10];
        DocAttach: Record "Document Attachment";
        Base64Convert: Codeunit "Base64 Convert";
        InStr: InStream;
        OutStr: OutStream;
        TempBlob: Codeunit "Temp Blob";
        ImportSuccess: Boolean;
    begin
        AttachmentBase64 := '';
        FileName := '';
        FileExtension := '';
        ImportSuccess := false;
        ClaimJsonResponse.ReadFrom(inputJson);
        if ClaimJsonResponse.Get('ClaimNo', ClaimJsonToken) then
            if StaffClaim.Get(ClaimJsonToken.AsValue().AsText()) then
                if ClaimJsonResponse.Get('AttachmentBase64', ClaimJsonToken) then begin
                    AttachmentBase64 := ClaimJsonToken.AsValue().AsText();
                    if AttachmentBase64 <> '' then begin
                        ClaimJsonResponse.Get('FileName', ClaimJsonToken);
                        FileName := ClaimJsonToken.AsValue().AsText();
                        ClaimJsonResponse.Get('FileExtension', ClaimJsonToken);
                        FileExtension := ClaimJsonToken.AsValue().AsText();

                        TempBlob.CreateOutStream(OutStr);
                        Base64Convert.FromBase64(AttachmentBase64, OutStr);
                        TempBlob.CreateInStream(InStr);
                        DocAttach.Init();
                        DocAttach.Validate("Table ID", Database::"Staff Claims Header");
                        DocAttach.Validate("No.", StaffClaim."No.");
                        DocAttach.Validate("File Name", FileName);
                        DocAttach.Validate("File Extension", FileExtension);
                        DocAttach."Document Reference ID".ImportStream(InStr, FileName);
                        if DocAttach.Insert(true) then
                            ImportSuccess := true;
                    end;
                end;
        if ImportSuccess then
            exit(StrSubstNo('The attachment %1.%2 is successfully imported into Staff Claims %3', FileName, FileExtension, StaffClaim."No."))
        else
            exit('Attachment Import Failed');
    end;


}
