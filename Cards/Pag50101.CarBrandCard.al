page 50101 CarBrandCard
{
    ApplicationArea = All;
    Caption = 'CarBrandCard';
    PageType = Card;
    SourceTable = CarBrand;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(BrandNo; Rec.BrandNo)
                {
                    ApplicationArea = All;
                    Caption = 'Brand No.';
                    Editable = false;
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

            part(CarMakeList; CarMake)
            {
                ApplicationArea = All;
                Caption = 'Car Make';

                SubPageLink = CarBrandCode = field("BrandNo");
            }
        }
    }
}

page 50103 CarMake
{
    ApplicationArea = All;
    Caption = 'CarMakeList';
    PageType = ListPart;
    SourceTable = CarMakes;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    ToolTip = 'The unique code for the car make.';
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                    ToolTip = 'The name of the car make.';
                }
                field(YearOfMake; Rec.YearOfMake)
                {
                    ApplicationArea = All;
                    Caption = 'Year of Make';
                    ToolTip = 'The year the car make was manufactured.';
                }
                field(Type; Rec."Type")
                {
                    ApplicationArea = All;
                    Caption = 'Type';
                    ToolTip = 'The type of the car make.';
                }
                field("Number of Seats"; Rec."Number of Seats")
                {
                    ApplicationArea = All;
                    Caption = 'Number of Seats';
                    ToolTip = 'The number of seats in the car make.';
                }
                field(CarBrandCode; Rec.CarBrandCode)
                {
                    ApplicationArea = All;
                    Caption = 'Car Brand Code';
                    Editable = false;
                }
            }
        }
    }
}