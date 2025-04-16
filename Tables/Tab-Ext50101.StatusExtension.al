tableextension 50101 StatusExtension extends CarBrand
{
    fields
    {
        field(50100; Status; Code[20])
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            TableRelation = Status;
        }
    }
    var
        StatusOpenCode: Code[20];

    trigger OnAfterInsert()
    begin
        Rec.Status := '1';
    end;
}