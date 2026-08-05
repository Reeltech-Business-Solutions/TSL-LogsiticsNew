table 50006 "Millage Range Controls"
{
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Contract No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Contract Agreement";

            trigger OnValidate()
            var
                ContractAgreement: Record "Contract Agreement";
            begin
                ContractAgreement.SetRange(ContractAgreement."No.", Rec."Contract No.");
                if ContractAgreement.FindFirst() then
                    Rec."Contract Name" := ContractAgreement."Contract Type";
            end;
        }
        field(2; "Standard Millage Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Millage".Code;

            trigger Onvalidate()
            var

                StandardMillage: Record "Standard Millage";
            begin

                StandardMillage.SetRange(Code, Rec."Standard Millage Code");
                if StandardMillage.FindFirst() then begin

                    Rec.Minimum := StandardMillage.Minimum;
                    Rec.Maximum := StandardMillage.Maximum;

                end;
            end;

        }
        field(3; Minimum; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Maximum; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Rate; Decimal)
        {
        }
        field(6; "Truck Type"; Text[20])
        {
            TableRelation = "Vehicle Make".Code;
        }

        field(7; "Freight Charge"; Decimal)
        {

        }

        field(9; "Loading Delay Rate"; Decimal)
        {

        }

        field(10; "Fixed Rate"; Decimal)
        {

        }
        field(11; "Discount Rate"; Decimal)
        {

        }

        field(12; "Contract Name"; Text[50])
        {

        }
        field(13; "Shortage Tolerance"; Decimal)
        {

        }

        field(14; "Shortage Rate"; Decimal)
        {

        }
        field(15; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
            
            
        }



    }



    keys
    {
        key(Key1; "Contract No.", "Standard Millage Code", "Truck Type")
        {
            Clustered = true;
        }
         key(Key2; "Contract No.")
        {
          
        }
    }


    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}