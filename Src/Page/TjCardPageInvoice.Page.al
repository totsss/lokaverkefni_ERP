page 50127 InvoiceCardPage
{
    Caption = 'Invoice Card(Sales header)';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Header";

    //Defines the names for promoted categories for actions.
    PromotedActionCategories = 'New,Process,Report,Manage,New Document,Request Approval,Customer';

    layout
    {
        area(Content)
        {
            //Defines a FastTab that has the heading 'General'.
            group(General)
            {
                field("customer Name"; rec."Sell-to Customer Name")
                {
                    ApplicationArea = FastTab;

                }
                field("Contact Name"; rec."Bill-to Name")
                {
                    ApplicationArea = FastTab;

                }

                field("Vat Date"; rec."Due Date")
                {
                    ApplicationArea = FastTab;

                }

                field("Due Date"; rec."Due Date")
                {
                    ApplicationArea = FastTab;

                }

                field("Status"; rec."Status")
                {
                    ApplicationArea = FastTab;

                }

            }

            //Defines a FastTab that has the heading 'Contact'.
            group(Contact)
            {
                field("Subtotal Excl .Vat (MYR)"; rec."Amt. Ship. Not Inv. (LCY)")
                {
                    ApplicationArea = All;

                }
                field("Inv. Discout Amount Excl. VAt"; Rec."Invoice Discount Amount")
                {
                    ApplicationArea = All;

                }

                field("Invoice discount"; Rec."Invoice Discount Amount")
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {

            //Defines action that display under the 'Actions' menu.
            action("New Sales Quote")
            {
                ApplicationArea = All;
                RunObject = page "Sales Quote";
                Promoted = true;
                PromotedCategory = New;
                Image = NewSalesQuote;
                trigger OnAction();
                begin

                end;
            }
            action("Banks Account")
            {
                ApplicationArea = All;
                RunObject = page "Customer Bank Account List";
                Promoted = true;

                //Promotes the action to the category named 'Customer'.
                PromotedCategory = Category7;
                Image = BankAccount;
                trigger OnAction();
                begin

                end;
            }

        }
        area(Reporting)
        {

            //Defines action that display under the 'Report' menu.
            action("Statement")
            {
                ApplicationArea = All;
                RunObject = codeunit "Customer Layout - Statement";
                trigger OnAction();
                begin

                end;
            }
        }
    }
    var
        myInt: Integer;
}