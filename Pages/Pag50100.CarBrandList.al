page 50100 "Car Brand List"
{
    ApplicationArea = All;
    Caption = 'Car Brand List';
    PageType = List;
    SourceTable = CarBrand;
    UsageCategory = Lists;
    CardPageId = CarBrandCard;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(BrandNo; Rec.BrandNo)
                {
                    ApplicationArea = All;
                    Caption = 'Brand No.';
                    ToolTip = 'The unique identifier for the car brand.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                    ToolTip = 'The name of the car brand.';
                }
                field(CountryOfOrigin; Rec.CountryOfOrigin)
                {
                    ApplicationArea = All;
                    Caption = 'Country of Origin';
                    ToolTip = 'The country where the car brand is based.';
                }
            }
        }
    }
}
