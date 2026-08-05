table 50047 "Quality Check Line"
{
    Caption = 'Quality Check Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Description"; Text[200])
        {
            // TableRelation = QualityCheckList;
            DataClassification = ToBeClassified;

            // trigger OnValidate()
            // var
            //     QualityList: Record QualityCheckList;
            // begin
            //     if QualityList.Get(rec.Description) then
            //         rec.Description := QualityList.Description;
            // end;
        }
        field(3; "Status"; Option)
        {
            OptionMembers = " ","Ok";
            OptionCaption = ' ,Ok';
            DataClassification = ToBeClassified;
        }
        field(4; "Comment"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(5; InspectedBy; Text[100])
        {
            Caption = 'Inspected By';
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(6; "DateInspected"; Date)
        {
            Caption = 'Date Inspected';
            DataClassification = ToBeClassified;
        }
        field(7; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
