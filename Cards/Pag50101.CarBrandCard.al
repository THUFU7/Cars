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

                action(SendToApproval)
                {
                    ApplicationArea = All;
                    Caption = 'Send to Approval';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = Rec.Status = Rec.Status::Open;

                    trigger OnAction()
                    var
                        CarWorkflowMgmt: Codeunit "Custom Workflow Mgmt";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        if CarWorkflowMgmt.CheckApprovalsWorkflowEnabled(RecRef) then
                            CarWorkflowMgmt.OnSendWorkflowForApproval(RecRef);
                    end;
                }


                action(Cancel)
                {
                    ApplicationArea = All;
                    Caption = 'Cancel';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    visible = Rec.Status = Rec.Status::"Pending Approval";
                    trigger OnAction();
                    var
                        CarWorkflowMgmt: Codeunit "Custom Workflow Mgmt";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        CarWorkflowMgmt.OnCancelWorkflowForApproval(RecRef);
                    end;
                }
            }
        }

        area(Creation)
        {
            group(Approval)
            {
                action(Approvals)
                {
                   ApplicationArea = All;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'View approval requests.';
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = HasApprovalEntries;
                    trigger OnAction()
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end; 
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        OpenApprovalEntriesExistCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        HasApprovalEntries := ApprovalsMgmt.HasApprovalEntries(Rec.RecordId);
    end;

    var
        OpenApprovalEntriesExistCurrUser, OpenApprovalEntriesExist, CanCancelApprovalForRecord
        , HasApprovalEntries : Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
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