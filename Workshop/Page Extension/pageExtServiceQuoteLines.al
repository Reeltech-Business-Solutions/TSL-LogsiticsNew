pageextension 50065 "Serv. Quote Lines Ext" extends "Service Quote Lines"
{
    layout
    {

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        ServiceItemLine: Record "Service Item Line";

    trigger OnOpenPage()
    begin
        if ServiceItemLine."Service Item No." <> '' then
            Rec."Service Item No." := ServiceItemLine."Service Item No.";
    end;
}