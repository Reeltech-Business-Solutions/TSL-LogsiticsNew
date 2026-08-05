codeunit 50032 VendorAttachment
{
    TableNo = Vendor;
    
    trigger OnRun()
    begin
    
    end;

   procedure ImportAttachmentToVendor(inputJson: Text):Text
   var
   VenJsonResponse: JsonObject;
   VenJsonToken: JsonToken;
   Vendor: Record Vendor;
   VendorNo: Code[20];
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
        VenJsonResponse.ReadFrom(inputJson);
        if VenJsonResponse.Get('VendorNo', VenJsonToken ) then 
         if Vendor.Get(VenJsonToken.AsValue().AsText()) then
           if VenJsonResponse.Get('AttachmentBase64', VenJsonToken) then begin
             AttachmentBase64 := VenJsonToken.AsValue().AsText();
             if AttachmentBase64 <> '' then begin
                VenJsonResponse.Get('FileName', VenJsonToken);
                FileName := VenJsonToken.AsValue().AsText();
                VenJsonResponse.Get('FileExtension', VenJsonToken);
                FileExtension := VenJsonToken.AsValue().AsText();

                TempBlob.CreateOutStream(OutStr);
                Base64Convert.FromBase64(AttachmentBase64, OutStr);
                TempBlob.CreateInStream(InStr);
                DocAttach.Init();
                DocAttach.Validate("Table ID", Database::Vendor);
                DocAttach.Validate("No.", Vendor."No.");
                DocAttach.Validate("File Name", FileName);
                DocAttach.Validate("File Extension", FileExtension);
                DocAttach."Document Reference ID".ImportStream(InStr, FileName);
                if DocAttach.Insert(true) then
                    ImportSuccess := true;
             end;
           end;
        if ImportSuccess then
            exit(StrSubstNo('The attachment %1.%2 is successfully imported into Vendor %3', FileName, FileExtension, Vendor."No."))
        else
           exit('Attachment Import Failed');
end;

    
}
