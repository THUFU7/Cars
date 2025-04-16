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
    actions
    {
        area(Processing)
        {
            group(WorkflowActions)
            {
                Caption = 'Workflow Actions';

                action(SendToWorkflow)
                {
                    ApplicationArea = All;
                    Caption = 'Send to Workflow';
                    Image = SendTo;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction();
                    begin
                        // Code to send the car brand to a workflow process
                        Message('Car Brand %1 sent to workflow.', Rec.BrandNo);
                        Rec.Status := '2'; // Assuming 2 is the status for "In Workflow"
                        Rec.Modify(true);
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction();
                    begin
                        // Code to approve the car brand
                        Message('Car Brand %1 approved.', Rec.BrandNo);
                        Rec.Status := '3'; // Assuming 3 is the status for "Approved"
                        Rec.Modify(true);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction();
                    begin
                        // Code to reject the car brand
                        Message('Car Brand %1 rejected.', Rec.BrandNo);
                        Rec.Status := '1'; // Assuming 4 is the status for "Rejected"
                        Rec.Modify(true);
                    end;
                }
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