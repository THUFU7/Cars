pageextension 50100 CarBrand extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field(CarBrand; Rec."CarBrand")
            {
                ApplicationArea = All;
                Caption = 'CarBrand';
                TableRelation = "No. Series".Code;
            }

            field(CarMake; Rec."CarMake")
            {
                ApplicationArea = All;
                Caption = 'CarMake';
                TableRelation = "No. Series".Code;
            }
        }
    }
}
