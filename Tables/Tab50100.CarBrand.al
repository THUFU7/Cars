table 50100 CarBrand
{
    Caption = 'CarBrand';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; BrandNo; Code[20])
        {
            Caption = 'BrandNo';
            TableRelation = "No. Series".Code;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; CountryOfOrigin; Code[20])
        {
            Caption = 'CountryOfOrigin';
            TableRelation = "Country/Region".Code;
        }
        field(4; Status; Enum "CarStatus")
        {
            Caption = 'Status';
            InitValue = Open;
        }
        
    }
    keys
    {
        key(PK; BrandNo)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit "No. Series";
    begin
        Rec."BrandNo" := NoSeriesMgt.GetNextNo('CAR-REG', Today, true);
    end;
}
