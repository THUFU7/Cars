tableextension 50100 CarBrandExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; CarBrand; Code[20])
        {
            Caption = 'CarBrand';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(50104; CarMake; Code[20])
        {
            Caption = 'CarBrand';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(50105; Status; Code[20])
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
    }
}
