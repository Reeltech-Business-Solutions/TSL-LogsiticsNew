report 50003 "Millage Transaction Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Import Millage Range Control.rdl';

    dataset
    {
        dataitem("Integer"; "Integer")
        {
            trigger OnAfterGetRecord()
            begin
                ImportSheet(Number);
                // ContractMillage.Reset;
                ContractMillage.SetRange(ContractMillage."Contract No.", ColText[1]);
                ContractMillage.SetRange(ContractMillage."Standard Millage Code",ColText[2]);
                ContractMillage.SetRange(ContractMillage."Truck Type",ColText[3]);
                 if NOT ContractMillage.FindFirst() then begin
                ContractMillage.Init;
                ContractMillage."Contract No." := ColText[1];
                ContractMillage.Validate(ContractMillage."Contract No.");
                ContractMillage."Standard Millage Code" := ColText[2];
                ContractMillage.Validate(ContractMillage."Standard Millage Code");
                ContractMillage."Truck Type" := ColText[3];
                EVALUATE(ContractMillage.Rate, ColText[4]);
                EVALUATE(ContractMillage."Discount Rate", ColText[5]);
                EVALUATE(ContractMillage."Fixed Rate", ColText[6]);
                EVALUATE(ContractMillage."Freight Charge", ColText[7]);
                EVALUATE(ContractMillage."Loading Delay Rate", ColText[8]);
                ContractMillage.Insert;
                //              end;
                //Dennis
             end

            end;

            trigger OnPreDataItem()

            begin
                ExcelBuf.Reset;
                ExcelBuf.DeleteAll;
                ExcelBuf.OpenBookStream(ServerFileName, SheetName);
                ExcelBuf.ReadSheet;
                if ExcelBuf.FindLast then SetRange(Number, 2, ExcelBuf."Row No.");
            end;



            trigger OnPostDataItem()
            begin
                message('Employee Record Successfully Uploaded')
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    group("Import from")
                    {
                        Caption = 'Import from';

                        field(FileName; FileName)
                        {
                            ApplicationArea = All;
                            Caption = 'Workbook File Name';
                            Editable = false;

                            trigger OnAssistEdit()

                            begin
                                RequestFile;
#pragma warning disable AL0296
                                SheetName := ExcelBuf.SelectSheetsNameStream(ServerFileName);
#pragma warning restore AL0296
                            end;

                            trigger OnValidate()
                            begin
                                // FileNameOnAfterValidate;
                            end;
                        }
                        field(SheetName; SheetName)
                        {
                            ApplicationArea = All;
                            Caption = 'Worksheet Name';
                            Editable = false;

                            trigger OnAssistEdit()

                            begin
                                // if ServerFileName = '' then begin
                                RequestFile;
                                // end;
#pragma warning disable AL0296
                                SheetName := ExcelBuf.SelectSheetsNameStream(ServerFileName);
#pragma warning restore AL0296
                            end;
                        }
                    }
                }
            }
        }
        actions
        {
        }
    }
    labels
    {
    }
    var
        ExcelBuf: Record "Excel Buffer" temporary;

        ColText: array[100] of Text[250];
        FileMgt: Codeunit "File Management";
        FileName: Text;
        ServerFileName: Instream;
        SheetName: Text[250];
        Text005: Label 'Imported from Excel ';
        Text006: Label 'Import Excel File';
        GlAccount: Record "G/L Account";
        Item: Record Item;
        ItemCategory: Record "Item Category";
        //ProductGroup: Record "Product Group";
        GenProdPstGrp: Record "Gen. Product Posting Group";
        InvPostingGrp: Record "Inventory Posting Group";
        IUOM: Record "Item Unit of Measure";
        CustRec: Record Customer;
        VendRec: Record Vendor;
        ContractMillage: Record "Millage Range Controls";
        UOM: Record "Unit of Measure";
        ItemJnLine: Record "Item Journal Line";
        GenJnlLine: Record "Gen. Journal Line";
        BankAcc: Record "Bank Account";
        DefDim: Record "Default Dimension";
        DimensionValue: Record "Dimension Value";
    // EmpTrans: Record "prEmployee Transactions";
    // PrVariations: Record "prPayroll Variations";
    // PrPeriod: Record "prPayroll Periods";
    // PrTransCode: Record "prTransaction Codes";

    procedure ImportSheet(RowNumber: Integer)
    begin
        Clear(ColText);
        ExcelBuf.SetRange(ExcelBuf."Row No.", RowNumber);
        if ExcelBuf.FindFirst then begin
            repeat
                ColText[ExcelBuf."Column No."] := ExcelBuf."Cell Value as Text";
            until ExcelBuf.Next = 0;
        end;
    end;

    procedure RequestFile()
    var
        FileMgt: Codeunit "File Management";
        FromFile: Text[100];
        UploadExcelMsg: Label 'Please Choose the Excel file';
        SheetName: Text;
        NoFileFoundMsg: Label 'Excel cannot be found';

    begin
        UploadIntoStream(UploadExcelMsg, '', '', FromFile, ServerFileName);
        if FromFile <> '' then begin
            FileName := FileMgt.GetFileName(FromFile);
            SheetName := ExcelBuf.SelectSheetsNameStream(ServerFileName)
        end else
            Error(NoFileFoundMsg);
    end;

    local procedure ProcessEmployeeTransactions(var EmpCode: Code[15];
    var TransCode: Code[20];
    var PeriodMonth: Integer;
    var PeriodYear: Integer;
    var PayrollPeriod: DateFormula)
    begin
        //Employee Code,Transaction Code,Period Month,Period Year,Payroll Period
    end;

}
