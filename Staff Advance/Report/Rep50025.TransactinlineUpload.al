report 50025 "Transactin line Upload"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Import Employee Infrmation.rdl';

    dataset
    {
        dataitem("Integer"; "Integer")
        {
            trigger OnAfterGetRecord()
            begin
                ImportSheet(Number);
                BillingLine.Reset;
                //BillingLine.SetRange("Entry No.", BillingLine."Entry No.");
                if NOT BillingLine.Get(EVALUATE(BillingLine."Entry No.", ColText[1])) then begin
                    BillingLine.Init;
                    EVALUATE(BillingLine."Entry No.", ColText[1]);
                    BillingLine."Contract Id" := ColText[2];
                    BillingLine."Truck No." := ColText[3];
                    BillingLine."Truck Type" := ColText[4];
                    EVALUATE(BillingLine."Transaction Date", ColText[5]);
                    EVALUATE(BillingLine."Distance Covered Km", ColText[6]);
                    EVALUATE(BillingLine."No of Days", ColText[7]);
                    EVALUATE(BillingLine."Fixed Cost", ColText[8]);
                    EVALUATE(BillingLine."Variable Cost", ColText[9]);
                    EVALUATE(BillingLine.Quantity, ColText[10]);
                    EVALUATE(BillingLine."Quantity Loaded NetWgt Kg", ColText[11]);
                    EVALUATE(BillingLine."Quantity Offloaded Kg", ColText[12]);
                    BillingLine."Customer No." := ColText[13];
                    BillingLine."Direct Dispatch" := ColText[14];
                    EVALUATE(BillingLine."Residency Time at loadingpoint", ColText[15]);
                    EVALUATE(BillingLine."DepartureTimefrom LoadingPoint", ColText[16]);
                    EVALUATE(BillingLine."ResidencyTime at ofloadinpoint", ColText[17]);
                    EVALUATE(BillingLine."DepartureTimefromOfloadinPoint", ColText[18]);
                    BillingLine.Insert;
                end;
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
        BillingLine: Record "Billing Line";
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
