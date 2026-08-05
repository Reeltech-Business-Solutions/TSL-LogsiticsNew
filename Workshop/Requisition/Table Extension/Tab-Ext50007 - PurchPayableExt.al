tableextension 50016 PayableSetup extends "Purchases & Payables Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Foreign Vendor"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }

        field(50001; "Local Vendor"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }

        field(50002; "Cash Vendor"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }

        field(50003; "Import Vendor"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(50004; "Foreign Purchase Order"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }

        field(50005; "Local Purchase Order"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }

        field(50006; "Cash Purchase Order"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }

        field(50007; "Import Purchase Order"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(50008; "Foreign Purch. Quote"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(50009; "Local Purch. Quote"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(50010; "Cash Purchase Quote"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(50011; "Import Purchase Quote"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(50012; "Foreign Purchase Invoice"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(50013; "Local Purchase Invoice"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(50014; "Cash Purchase Invoice"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(50015; "Import Purchase Invoice"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(50016; "Local Purcahse Req"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(50017; "Vendor Requisition No"; Code[20])
        {
            TableRelation = Vendor;
            DataClassification = ToBeClassified;
        }
        field(50018; "Foreign Purchase Req"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(50019; "Quotation Request No"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}