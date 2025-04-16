page 50105 StatusCard
{
    ApplicationArea = All;
    Caption = 'StatusCard';
    PageType = Card;
    SourceTable = Status;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    ToolTip = 'The unique identifier for the status.';
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                    ToolTip = 'The name of the status.';
                }

            }
        }
    }
}
