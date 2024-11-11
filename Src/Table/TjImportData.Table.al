table 50120 TjImportData
//Munum byrja faera allt inn sem txt, svo vid missum engin gogn, eftira breytast sum i int.
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CustomerNo; Text[120])
        {
            DataClassification = CustomerContent;

        }

        field(2; Project; Text[120])
        {
            DataClassification = ToBeClassified;

        }

        field(3; ResourceType; Text[120])
        {
            DataClassification = ToBeClassified;

        }

        field(4; ProductNumber; Text[120])
        {
            DataClassification = ToBeClassified;

        }
        field(5; Qty; Text[120])
        {
            DataClassification = ToBeClassified;

        }
        field(6; Price; Text[120])
        {
            DataClassification = ToBeClassified;

        }

        field(7; Discount; Text[120])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; CustomerNo)
        {
            Clustered = true;
        }
    }

}