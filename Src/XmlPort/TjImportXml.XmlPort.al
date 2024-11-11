xmlport 50123 TjImportXml


{

    schema
    {
        textelement(Flinsley)
        {
            tableelement(Invoice; TjImportData)
            {
                fieldelement(CustomerNo; Invoice.CustomerNo)
                { }
                fieldelement(Project; Invoice.Project)
                { }
                fieldelement(ResourceType; Invoice.ResourceType)
                { }
                fieldelement(ProductNumber; Invoice.ProductNumber)
                { }
                fieldelement(Qty; Invoice.Qty)
                { }
                fieldelement(Price; Invoice.Price)
                { }
                fieldelement(Discount; Invoice.Discount)
                { }

            }
        }
    }
    trigger OnPreXmlPort()
    var
        ImportData: Record TjImportData;

        cu: Codeunit 50125;
        //ImportData: Record TjImportData;
        SHdrCustomerNo: code[20];
        CreateHeader: text[120];
    begin
        ImportData.DeleteAll();
        if ImportData.FindFirst() then begin

        end

    end;

    trigger OnPostXmlPort()
    var
        cu: Codeunit 50125;
        ImportData: Record TjImportData;
        SHdrCustomerNo: code[20];
        CreateHeader: text[120];
    begin
        importdata.CustomerNo := SHdrCustomerNo;
        if ImportData.FindFirst() then begin
            //We extract the customer number from imported data.
            SHdrCustomerNo := ImportData.CustomerNo;
            //create sales header with the imported CustomerNo with the reusable procedure created in Functions.Codeunit
            createHeader := cu.CreateSalesHdr(SHdrCustomerNo);
        end;

    end;

}