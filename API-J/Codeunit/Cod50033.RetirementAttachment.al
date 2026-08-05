codeunit 50033 RetirementAttachment
{
    TableNo = "Staff Advanc Surrender Header";

    trigger OnRun()
    begin

    end;

    procedure ImportAttachmentToRetirement(inputJson: Text): Text
    var
        RetJsonResponse: JsonObject;
        RetJsonToken: JsonToken;
        StaffRet: Record "Staff Advanc Surrender Header";
        RetNo: Code[20];
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
        RetJsonResponse.ReadFrom(inputJson);
        if RetJsonResponse.Get('RetNo', RetJsonToken) then
            if StaffRet.Get(RetJsonToken.AsValue().AsText()) then
                if RetJsonResponse.Get('AttachmentBase64', RetJsonToken) then begin
                    AttachmentBase64 := RetJsonToken.AsValue().AsText();
                    if AttachmentBase64 <> '' then begin
                        RetJsonResponse.Get('FileName', RetJsonToken);
                        FileName := RetJsonToken.AsValue().AsText();
                        RetJsonResponse.Get('FileExtension', RetJsonToken);
                        FileExtension := RetJsonToken.AsValue().AsText();

                        TempBlob.CreateOutStream(OutStr);
                        Base64Convert.FromBase64(AttachmentBase64, OutStr);
                        TempBlob.CreateInStream(InStr);
                        DocAttach.Init();
                        DocAttach.Validate("Table ID", Database::"Staff Advanc Surrender Header");
                        DocAttach.Validate("No.", StaffRet."No.");
                        DocAttach.Validate("File Name", FileName);
                        DocAttach.Validate("File Extension", FileExtension);
                        DocAttach."Document Reference ID".ImportStream(InStr, FileName);
                        if DocAttach.Insert(true) then
                            ImportSuccess := true;
                    end;
                end;
        if ImportSuccess then
            exit(StrSubstNo('The attachment %1.%2 is successfully imported into Staff Advance Retirement %3', FileName, FileExtension, StaffRet."No."))
        else
            exit('Attachment Import Failed');
    end;


}
