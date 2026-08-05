
codeunit 50045 postStatus
{
    procedure createPostStatus(vRegNo: code[20]): text;
    var
        Job: Record "Job";
        JsonObjects: jsonObject;
        JsonResponse: Text;

    begin
        Job.Reset();
        Job.SetRange("VehReg. No.", vRegNo);
        if Job.FindFirst() then begin
            JsonObjects.Add('vehicle_Registration_id', Format(Job."VehReg. No."));
            JsonObjects.Add('job_card_no', Format(Job."No."));
            JsonObjects.Add('fleet_no', Format(Job."FLeet No."));
            JsonObjects.Add('Status', Format(Job."Workshop Status"));
        end

        else begin
            JsonObjects.Add('Status', 'failed');
            JsonObjects.Add('Message', 'Status could not be generated');

        end;

        JsonObjects.WriteTo(JsonResponse);
        exit(JsonResponse);

    end;
}