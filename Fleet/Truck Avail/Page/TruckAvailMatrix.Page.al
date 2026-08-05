/*page 50110 "Truck Avail-Matrix"
{
    Caption = 'Truck Availability Matrix';
    Editable = true;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = Table39006174;

    layout
    {
        area(content)
        {
            repeater()
            {
                Editable = false;
                field("No."; "No.")
                {
                }
                field("Vehicle Reg. No."; "Vehicle Reg. No.")
                {
                }
                field("CUSTOMER OPERATION"; "CUSTOMER OPERATION")
                {
                }
                field("LOT NOs."; "LOT NOs.")
                {
                }
                field(Field1; MATRIX_CellData[1])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[1];
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(1)
                    end;
                }
                field(Field2; MATRIX_CellData[2])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[2];
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(2)
                    end;
                }
                field(Field3; MATRIX_CellData[3])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[3];
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(3)
                    end;
                }
                field(Field4; MATRIX_CellData[4])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[4];
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(4)
                    end;
                }
                field(Field5; MATRIX_CellData[5])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[5];
                    DrillDown = true;
                }
                field(Field6; MATRIX_CellData[6])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[6];
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(6)
                    end;
                }
                field(Field7; MATRIX_CellData[7])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[7];
                    DrillDown = true;
                }
                field(Field8; MATRIX_CellData[8])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[8];
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(8)
                    end;
                }
                field(Field9; MATRIX_CellData[9])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[9];
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(9)
                    end;
                }
                field(Field10; MATRIX_CellData[10])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[10];
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(10)
                    end;
                }
                field(Field11; MATRIX_CellData[11])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[11];
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(11)
                    end;
                }
                field(Field12; MATRIX_CellData[12])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_ColumnCaption[12];
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(12)
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Truck")
            {
                Caption = '&Truck';
                Image = Resource;
                action(Card)
                {
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = Page 39006083;
                    ShortCutKey = 'Shift+F7';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        i: Integer;
    begin
   

        FOR i := 1 TO Matrix_ColumnCount DO BEGIN
            MATRIX_OnAfterGetRecord(i);
        END

    end;

    trigger OnOpenPage()
    begin
        Field12Visible := TRUE;
        Field11Visible := TRUE;
        Field10Visible := TRUE;
        Field9Visible := TRUE;
        Field8Visible := TRUE;
        Field7Visible := TRUE;
        Field6Visible := TRUE;
        Field5Visible := TRUE;
        Field4Visible := TRUE;
        Field3Visible := TRUE;
        Field2Visible := TRUE;
        Field1Visible := TRUE;
    end;

    var
        Matrix_Record: array[32] of Record "2000000007";
        Matrix_ColumnCount: Integer;
        PageDateFilter: Text;
        PeriodType: Option Day,Week,Month,Quarter,Year,"Accounting Period";
        QtyType: Option "Net Change","Balance at Date";
        MatrixRecords: array[32] of Record "2000000007";
        MATRIX_NoOfMatrixColumns: Integer;
        MATRIX_CellData: array[32] of Decimal;
        MATRIX_ColumnCaption: array[32] of Text[1024];
        CustomerOperation: Code[50];
        [InDataSet]
        Field1Visible: Boolean;
        [InDataSet]
        Field2Visible: Boolean;
        [InDataSet]
        Field3Visible: Boolean;
        [InDataSet]
        Field4Visible: Boolean;
        [InDataSet]
        Field5Visible: Boolean;
        [InDataSet]
        Field6Visible: Boolean;
        [InDataSet]
        Field7Visible: Boolean;
        [InDataSet]
        Field8Visible: Boolean;
        [InDataSet]
        Field9Visible: Boolean;
        [InDataSet]
        Field10Visible: Boolean;
        [InDataSet]
        Field11Visible: Boolean;
        [InDataSet]
        Field12Visible: Boolean;

    [Scope('Cloud')]
    procedure SetMatrixData(ColumnCaptions: array[32] of Text[1024]; var MatrixRec: array[32] of Record "2000000007"; DateFilter: Text; ColumnSetLength: Integer)
    var
        i: Integer;
    begin
        FOR i := 1 TO ARRAYLEN(MatrixRec) DO BEGIN
            IF ColumnCaptions[i] = '' THEN
                MATRIX_ColumnCaption[i] := ' '
            ELSE
                MATRIX_ColumnCaption[i] := ColumnCaptions[i];
            Matrix_Record[i] := MatrixRec[i];
        END;

        PageDateFilter := DateFilter;
        Matrix_ColumnCount := ColumnSetLength;

        SetVisible;
    end;

    local procedure MATRIX_OnAfterGetRecord(CurrColumnNo: Integer)
    var
        AvailabilityEntries: Record "Truck Avail. Entry Lines";
    begin

        AvailabilityEntries.SETCURRENTKEY("Leasing Truck No", Date);
        AvailabilityEntries.SETRANGE("Leasing Truck No", Rec."No.");
        AvailabilityEntries.SETRANGE(Date, Matrix_Record[CurrColumnNo]."Period Start", Matrix_Record[CurrColumnNo]."Period End");
        AvailabilityEntries.CALCSUMS(AvailabilityEntries.Quantity);
        MATRIX_CellData[CurrColumnNo] := AvailabilityEntries.Quantity;
    end;

    [Scope('Cloud')]
    procedure Load(MatrixColumns1: array[32] of Text[1024]; var MatrixRecords1: array[32] of Record "27"; var MatrixRecord1: Record "27")
    begin
    end;

    [Scope('Cloud')]
    procedure MatrixOnDrillDown(CurrColumnNo: Integer)
    var
        AvailabilityEntries: Record "Truck Avail. Entry Lines";
    begin
        AvailabilityEntries.SETCURRENTKEY("Leasing Truck No", Date);
        AvailabilityEntries.SETRANGE("Leasing Truck No", Rec."No.");
        AvailabilityEntries.SETRANGE(Date, Matrix_Record[CurrColumnNo]."Period Start", Matrix_Record[CurrColumnNo]."Period End");
        PAGE.RUN(0, AvailabilityEntries);
    end;

    [Scope('Cloud')]
    procedure SetVisible()
    begin
        Field1Visible := Matrix_ColumnCount >= 1;
        Field2Visible := Matrix_ColumnCount >= 2;
        Field3Visible := Matrix_ColumnCount >= 3;
        Field4Visible := Matrix_ColumnCount >= 4;
        Field5Visible := Matrix_ColumnCount >= 5;
        Field6Visible := Matrix_ColumnCount >= 6;
        Field7Visible := Matrix_ColumnCount >= 7;
        Field8Visible := Matrix_ColumnCount >= 8;
        Field9Visible := Matrix_ColumnCount >= 9;
        Field10Visible := Matrix_ColumnCount >= 10;
        Field11Visible := Matrix_ColumnCount >= 11;
        Field12Visible := Matrix_ColumnCount >= 12;
    end;

    local procedure MATRIX_OnAfterGetRecord1(ColumnID: Integer)
    begin
    end;
}

*/