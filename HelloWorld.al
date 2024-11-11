// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.BreakAwayStudio;

using Microsoft.Sales.Customer;

pageextension 50111 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('');
    end;
}