page 50102 CarMakeList
{
    ApplicationArea = All;
    Caption = 'CarMakeList';
    PageType = List;
    SourceTable = CarMakes;
    UsageCategory = Lists;

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
            }
        }
    }
}
