page 50104 StatusList
{
    ApplicationArea = All;
    Caption = 'StatusList';
    PageType = List;
    SourceTable = Status;
    UsageCategory = Lists;
    CardPageId = StatusCard;

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
                    ToolTip = 'The unique identifier for the status.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                    ToolTip = 'The name of the status.';
                }
                field(CreatedDate; Rec.CreatedDate)
                {
                    ApplicationArea = All;
                    Caption = 'Created Date';
                    ToolTip = 'The date when the status was created.';
                }
                field(CreatedBy; Rec.CreatedBy)
                {
                    ApplicationArea = All;
                    Caption = 'Created By';
                    ToolTip = 'The user who created the status.';
                }
            }
        }
    }
}
