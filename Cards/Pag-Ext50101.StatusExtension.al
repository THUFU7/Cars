pageextension 50101 StatusExtension extends CarBrandCard
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
                Editable = false;
            }
        }
    }
}
