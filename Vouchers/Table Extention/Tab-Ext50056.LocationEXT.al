tableextension 50056 LocationEXT extends Location
{
    fields
    {
        field(50000; "Responsibility Center"; Code[20])
        {
            Caption = 'Responsibility Center';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
    }
}
