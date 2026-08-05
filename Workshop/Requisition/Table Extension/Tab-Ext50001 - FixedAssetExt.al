tableextension 50001 FixedAssetExt extends "Fixed Asset"
{
    fields
    {
        field(50000; "Asset Type"; Text[50])
        {
            Caption = 'Asset Type';
            DataClassification = ToBeClassified;
        }
        field(50001; "Registration No."; Code[20])
        {
            Caption = 'Registration No.';
            DataClassification = ToBeClassified;
        }
        field(50002; "Asset Type No."; Code[20])
        {
            Caption = 'Asset T No.';
            DataClassification = ToBeClassified;
        }
        field(50003; "Chassis Serial No."; Code[40])
        {
            Caption = 'Chassis Serial No.';
            DataClassification = ToBeClassified;
        }
        field(50004; "Engine Serial No."; Code[20])
        {
            Caption = 'Engine Serial No.';
            DataClassification = ToBeClassified;
        }
        field(50005; "Vehicle Make"; Code[20])
        {
            TableRelation = "Vehicle Make";
        }
        field(50006; "Vehicle Model"; Code[20])
        {
            TableRelation = "Vehicle Model" where("Vehicle Make" = field("Vehicle Make"));
        }
        field(50007; "Contract Code"; Code[20])
        {
            TableRelation = "Contract Agreement";
        }
        field(50008; "Driver Code"; Code[20])
        {
            TableRelation = Employee."No.";
            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                Emp.get("Driver Code");
                Emp.SetRange("No.", "Driver Code");
                "Driver Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
            end;
        }
        field(50009; "Driver Name"; code[100])
        {
        }
        field(50010; Truck; Boolean)
        {
        }
        field(50011; ID; Guid)
        {

        }
        field(50012; "Asset Type2"; Enum "Asset Type")
        {

        }
    }
}
