// table 50061 "Job Material FactBox"
// {
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "No."; code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Material Request Header";


//         }

//         field(2; "No. of Purch. req created"; Integer)
//         {
//             FieldClass = FlowField;
//             CalcFormula = count("Purchase Header" where("Material Req. No." = field("No.")));

//         }
//     }

//     keys
//     {
//         key(Key1; "No.")
//         {
//             Clustered = true;
//         }
//     }

//     fieldgroups
//     {
//         // Add changes to field groups here
//     }

//     var
//         myInt: Integer;

//     trigger OnInsert()
//     begin

//     end;

//     trigger OnModify()
//     begin

//     end;

//     trigger OnDelete()
//     begin

//     end;

//     trigger OnRename()
//     begin

//     end;

// }