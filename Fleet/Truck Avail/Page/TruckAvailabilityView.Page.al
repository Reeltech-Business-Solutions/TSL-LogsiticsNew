/*page 50114 "Truck Availability View"
{
    Caption = 'Truck Availability View';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SaveValues = true;
    SourceTable = "Fixed Asset";

    layout
    {
        area(content)
        {
            group(Options)
            {
                Caption = 'Options';
                field(PeriodType; PeriodType)
                {
                    Caption = 'View by';
                    OptionCaption = 'Day,Week,Month,Quarter,Year,Accounting Period';

                    trigger OnValidate()
                    begin
                        SetColumns(SetWanted::Initial);
                        UpdateMatrixSubform;
                    end;
                }
                field(QtyType; QtyType)
                {
                    Caption = 'View as';
                    OptionCaption = 'Net Change,Balance at Date';

                    trigger OnValidate()
                    begin
                        UpdateMatrixSubform;
                    end;
                }
                field(DateFilter; DateFilter)
                {
                    Caption = 'Date Filter';

                    trigger OnValidate()
                    begin
                        ApplicationMgt.TextManagement(DateFilter);
                        SetColumns(SetWanted::Initial);
                    end;
                }
            }
            part(MatrixForm; 50110)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Previous Set")
            {
                Caption = 'Previous Set';
                Image = PreviousSet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Previous Set';

                trigger OnAction()
                begin
                    SetColumns(SetWanted::Previous);
                    UpdateMatrixSubform
                end;
            }
            action("Previous Column")
            {
                Caption = 'Previous Column';
                Image = PreviousRecord;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Previous';

                trigger OnAction()
                begin
                    SetColumns(SetWanted::PreviousColumn);
                end;
            }
            action("Next Column")
            {
                Caption = 'Next Column';
                Image = NextRecord;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Next';

                trigger OnAction()
                begin
                    SetColumns(SetWanted::NextColumn);
                end;
            }
            action("Next Set")
            {
                Caption = 'Next Set';
                Image = NextSet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Next Set';

                trigger OnAction()
                begin
                    SetColumns(SetWanted::Next);
                    UpdateMatrixSubform
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        SetColumns(SetWanted::Initial);
        UpdateMatrixSubform;
    end;

    var
        MatrixRecord: array[32] of Record Date;
        PeriodType: Option Day,Week,Month,Quarter,Year,"Accounting Period";
        QtyType: Option "Net Change","Balance at Date";
        MatrixMgt: Codeunit "Matrix Management";
        SetWanted: Option Initial,Previous,Same,Next,PreviousColumn,NextColumn;
        Matrix_ColumnCaptions: array[32] of Text[1024];
        DateFilter: Text;
        ColumnSet: Text[1024];
        PKFirstRecInSet: Text;
        ColumnSetLength: Integer;
        ApplicationMgt: Codeunit 41;

    [Scope('Cloud')]
    procedure SetColumns(SetWanted: Option Initial,Previous,Same,Next,PreviousColumn,NextColumn)
    var
        MatrixMgt: Codeunit "9200";
        CaptionFieldNo: Integer;
        CurrentMatrixRecordOrdinal: Integer;
    begin
        MatrixMgt.GeneratePeriodMatrixData(SetWanted, ARRAYLEN(Matrix_ColumnCaptions), FALSE, PeriodType, DateFilter, PKFirstRecInSet, Matrix_ColumnCaptions,
        ColumnSet, ColumnSetLength, MatrixRecord);

        CurrPage.MatrixForm.PAGE.SetMatrixData(Matrix_ColumnCaptions, MatrixRecord, DateFilter, ColumnSetLength);
        CurrPage.UPDATE(FALSE)
    end;

    local procedure ShowColumnNameOnAfterValidate()
    begin
    end;

    [Scope('Cloud')]
    procedure UpdateThePage()
    begin
    end;

    [Scope('Cloud')]
    procedure UpdateMatrixSubform()
    begin
    end;
}

*/