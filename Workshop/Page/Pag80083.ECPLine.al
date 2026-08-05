page 80083 "ECP Line"
{

    AutoSplitKey = true;
    Caption = 'Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    //MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "ECP Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Line No."; Rec."Line No.")
                {
                    Caption = 'S/N';
                    ToolTip = 'Specifies the value of the Line No. field.';
                    ApplicationArea = All;
                    Visible = false;


                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Replaceable  Parts"; Rec."Replaceable  Parts")
                {
                    ToolTip = 'Specifies the value of the Replaceable  Parts field.';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Visual Check"; Rec."Visual Check")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Sub Visual CheckList"; Rec."Sub Visual CheckList")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Measurement; Rec.Measurement)
                {
                    ToolTip = 'Specifies the value of the Measurement field.';
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Good; Rec.Good)
                {
                    ToolTip = 'Specifies the value of the Good field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                    begin
                        if rec.Good = true then
                            rec.Fair := false;
                        rec.Poor := false;
                    end;
                }
                field(Fair; Rec.Fair)
                {
                    ToolTip = 'Specifies the value of the Fair field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                    begin
                        if rec.Fair = true then
                            rec.Poor := false;
                        rec.Good := false;
                    end;
                }
                field(Poor; Rec.Poor)
                {
                    ToolTip = 'Specifies the value of the Poor field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                    begin
                        if rec.Poor = true then
                            rec.Fair := false;
                        rec.Good := false;
                    end;
                }
                field(Remarks; Rec.Remarks)
                {
                    ToolTip = 'Specifies the value of the Remarks field.';
                    ApplicationArea = All;
                }
                field("SA/Tech Sign"; Rec."SA/Tech Sign")
                {
                    ApplicationArea = All;
                }
            }
        }
    }


}
