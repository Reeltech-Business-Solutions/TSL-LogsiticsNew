codeunit 80024 "Notification"
{


    procedure ShowNotification()
    var
        ServiceLineNotification: Notification;
        ServiceLineNotificationLbl: Label 'You have a service line records yet to be approved';
        serviceLine: Record "Service Line";
        serviceLineCount: integer;
        serviceLineCountAfterFilter: integer;
        viewDetails: Label 'View Details';
        NotificationGUID: Guid;
    begin
        ServiceLine.Reset();
        serviceLineCount := serviceLine.Count;
        ServiceLine.setRange("Warranty Confirmed", true);
        ServiceLine.SetRange("Has Warranty", true);
        serviceLineCountAfterFilter := ServiceLine.count;
        if serviceLineCount > serviceLineCountAfterFilter then begin
            NotificationGUID := CreateGuid();
            ServiceLineNotification.Id(NotificationGUID);
            ServiceLineNotification.Message(ServiceLineNotificationLbl);
            ServiceLineNotification.Scope := NotificationScope::LocalScope;
            ServiceLineNotification.AddAction(viewDetails, CodeUnit::Notification, 'openServiceLinePage');
            ServiceLineNotification.Send();
        end;






    end;

    procedure openServiceLinePage(ServiceLineNotification: Notification)
    begin
        Page.Run(80181);
    end;


}