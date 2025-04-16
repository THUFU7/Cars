pageextension 50102 StatusExt extends "Car Brand List"
{
    layout
    {
        addlast(General)
        {
            field(Status; Rec.Status)
            {
                ApplicationArea = All;
                Caption = 'Status';
                ToolTip = 'The status of the car brand.';
            }
        }
    }
}
