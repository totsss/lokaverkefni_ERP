codeunit 50125 Functions
{
    procedure GetNextDocumentNumber(): Code[20]
    var
        SalesHdr: Record "Sales Header";
        NoMgt: Codeunit NoSeriesManagement;
        NextNo: Code[20];
        CurrNo: code[20];


    begin
        //This function returns the next document number for the sales invoice.
        NextNo := '';
        SalesHdr.SetFilter(SalesHdr."Document Type", 'Invoice');
        If SalesHdr.FindLast() then begin
            NextNo := NoMgt.GetNextNo3(SalesHdr.GetNoSeriesCode(), Today, true, false);
            NoMgt.IncrementNoText(NextNo, 1);
        end;
        exit(NextNo);
    end;

    procedure ConvertStringToDecimal(input: Text[250]): Decimal
    begin

    end;

    procedure DeleteData(): Decimal
    var
        ImportData: Record TjImportData;
        importlines: record "Sales Line";
    begin
        ImportData.DeleteAll();


    end;

    procedure CreateSalesHdr(CustomerNo: code[20]): Text[120]
    var
        SalesHdr: record "Sales header";
        customer: record "Customer";
        testPage: Page "InvoiceCardPage";
        salesLine: Record "Sales Line";
        ImportData: Record TjImportData;

    begin
        if Customer.Get(CustomerNo) then begin
            //Message('The Customer does not exist. Identification fields and values: No.=%1', CustomerNo);
            SalesHdr.Init();
            SalesHdr."Document Type" := SalesHdr."Document Type"::Invoice; //doc type, we only have invoice.
            SalesHdr."Sell-to Customer No." := CustomerNo; //customer number
            SalesHdr."No." := GetNextDocumentNumber();//next doc number from procedure abouve.
            SalesHdr."Posting Date" := WorkDate(); // current work date.
            SalesHdr.Insert(true); // basically saving
            salesLine.init();
            salesLine."Document Type" := salesLine."Document Type"::Order;
            salesLine."Document No." := SalesHdr."No.";
            SalesLine."Line No." := '1';
            salesline."Sell-to Customer No." := CustomerNo;
            //testPage.SetTableView(SalesHdr);//view is based for our sales header table.
            //CreateSalesLine(CustomerNo);
            testPage.Run();
        end;
        if not Customer.Get(CustomerNo) then begin
            Message('The Customer does not exist. Identification fields and values: No.=%1', CustomerNo);

            //exit('Invoice Created with No.: ' + SalesHdr."No.");
        end;
    end;


}