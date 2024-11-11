page 50124 "TjImportDataPage"
{
    Caption = 'Import Invoice Data';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = TjImportData;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(CustomerNo; Rec.CustomerNo)
                {
                    ApplicationArea = All;
                }

                field(Project; Rec.Project)
                {
                    ApplicationArea = All;
                }

                field(ResourceType; Rec.ResourceType)
                {
                    ApplicationArea = All;
                }

                field(ProductNumber; Rec.ProductNumber)
                {
                    ApplicationArea = All;
                }

                field(Qty; Rec.Qty)
                {
                    ApplicationArea = All;
                }

                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                }

                field(Discount; Rec.Discount)
                {
                    ApplicationArea = All;
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportData)
            {
                Caption = 'import data';
                ApplicationArea = All;

                trigger OnAction();
                begin
                    xmlport.run(Xmlport::TjImportXml, false, true);

                end;
            }

            action(DeleteAllData)
            {
                Caption = 'Delete All Invoices.';
                ApplicationArea = All;



                trigger OnAction();
                var
                    cu: Codeunit 50125;
                begin
                    cu.DeleteData()

                end;
            }
        }
    }
}