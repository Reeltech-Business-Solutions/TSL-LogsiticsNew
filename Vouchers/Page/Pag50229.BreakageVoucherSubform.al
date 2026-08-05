page 50229 "Issue Voucher Subform"
{
    ApplicationArea = All;
    Caption = 'Issue Voucher Subform';
    PageType = ListPart;
    SourceTable = "Inv. Voucher Line";
    AutoSplitKey = true;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                    Caption = 'Type No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    Caption = 'Issuing Store';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location Code field.';

                    trigger OnValidate()

                    var

                        LineRec: record "Inv. Voucher Line";


                    begin

                        LineRec.SetFilter("Document No.", LineRec."Document No.");
                        LineRec.SetFilter("Location Code", LineRec."Location Code");

                        AddDocumentLines(LineRec);

                    end;


                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field("Bad Part Provided"; Rec."Bad Part Provided")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bad part provided field.';
                }
                field("Reason for Non Prov."; Rec."Reason for Non Prov.")
                {
                    Caption = 'Reason for non provision';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reason for non provision field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ApplicationArea = All;
                }
                field("Cost centre code"; Rec."Cost centre code")
                {
                    ApplicationArea = All;
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));

                }
                field("Revenue centre code"; Rec."Revenue centre code")
                {
                    ApplicationArea = All;
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));

                }
                field(Narration; Rec.Narration)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Narration field.';
                    Visible = false;
                }
                field("Quantity in Location"; Rec."Quantity in Location")
                {
                    Caption = 'Qty in Store';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity in Location field.';
                    Editable = false;


                }
                field("Qty Requested"; Rec."Qty Requested")
                {
                    ApplicationArea = All;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    Caption = 'Line Amount';
                    ApplicationArea = All;
                }
                field("Trucks code"; Rec."Trucks code")
                {
                    ApplicationArea = All;
                    // TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                    //                                       Blocked = CONST(false)); Fola09292023

                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = All;
                }
                field("Contract No."; Rec."Contract No.")
                {
                    ApplicationArea = All;
                    TableRelation = "Contract Agreement";
                }

                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                }
                field("Qty on Sales Location"; Rec."Qty on Sales Location")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Qty on Sales Location field.';
                    Visible = false;

                }
                field("Gen. Business Posting Group"; Rec."Gen. Business Posting Group")
                {
                    ApplicationArea = All;
                    TableRelation = "Gen. Business Posting Group";
                }

            }
        }
    }
    procedure AddDocumentLines(var LineRec: Record "Inv. Voucher Line"): Boolean
    begin
        // ... populate other fields ...

        if PickValidation.IsItemAlreadyPicked(LineRec) then begin
            ERROR('This item has already been picked on the line with the same location.');
            exit(false); // Line not added due to validation failure
        end

    end;



    var

        PickValidation: Codeunit PickValidation;


}
