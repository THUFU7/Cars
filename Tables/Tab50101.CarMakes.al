table 50101 CarMakes
{
    Caption = 'CarMakes';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; YearOfMake; Integer)
        {
            Caption = 'YearOfMake';
        }
        field(4; "Type"; Enum "CarTypes")
        {
            Caption = 'Type';
        }
        field(5; "Number of Seats"; Integer)
        {
            Caption = 'Number of Seats';
        }
        field(6; CarBrandCode; Code[20])
        {
            Caption = 'CarBrandCode';
        }
    }
    keys
    {
        key(PK; CarBrandCode, Code)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit "No. Series";
    begin
        Rec."Code" := NoSeriesMgt.GetNextNo('CAR-MAKE', Today, true);
    end;
}
