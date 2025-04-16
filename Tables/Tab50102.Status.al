table 50102 Status
{
    Caption = 'Status';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[4])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; CreatedDate; DateTime)
        {
            Caption = 'CreatedDate';
        }
        field(4; CreatedBy; Code[20])
        {
            Caption = 'CreatedBy';
            TableRelation = User;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit "No. Series";
    begin
        Rec."Code" := NoSeriesMgt.GetNextNo('STATUS', Today, true);
        Rec."CreatedDate" := CurrentDateTime;
        Rec."CreatedBy" := UserId;
    end;
}
