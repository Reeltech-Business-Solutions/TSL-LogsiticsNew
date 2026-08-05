codeunit 50030 AdvanceAttachment
{
    TableNo = "Staff Advance Header";

    trigger OnRun()
    begin

    end;

    procedure ImportAttachmentToAdvance(inputJson: Text): Text
    var
        AdvJsonResponse: JsonObject;
        AdvJsonToken: JsonToken;
        StaffAdv: Record "Staff Advance Header";
        AdvNo: Code[20];
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
        AdvJsonResponse.ReadFrom(inputJson);
        if AdvJsonResponse.Get('AdvNo', AdvJsonToken) then
            if StaffAdv.Get(AdvJsonToken.AsValue().AsText()) then
                if AdvJsonResponse.Get('AttachmentBase64', AdvJsonToken) then begin
                    AttachmentBase64 := AdvJsonToken.AsValue().AsText();
                    if AttachmentBase64 <> '' then begin
                        AdvJsonResponse.Get('FileName', AdvJsonToken);
                        FileName := AdvJsonToken.AsValue().AsText();
                        AdvJsonResponse.Get('FileExtension', AdvJsonToken);
                        FileExtension := AdvJsonToken.AsValue().AsText();

                        TempBlob.CreateOutStream(OutStr);
                        Base64Convert.FromBase64(AttachmentBase64, OutStr);
                        TempBlob.CreateInStream(InStr);
                        DocAttach.Init();
                        DocAttach.Validate("Table ID", Database::"Staff Advance Header");
                        DocAttach.Validate("No.", StaffAdv."No.");
                        DocAttach.Validate("File Name", FileName);
                        DocAttach.Validate("File Extension", FileExtension);
                        DocAttach."Document Reference ID".ImportStream(InStr, FileName);
                        if DocAttach.Insert(true) then
                            ImportSuccess := true;
                    end;
                end;
        if ImportSuccess then
            exit(StrSubstNo('The attachment %1.%2 is successfully imported into Staff Advance %3', FileName, FileExtension, StaffAdv."No."))
        else
            exit('Attachment Import Failed');
    end;

}
