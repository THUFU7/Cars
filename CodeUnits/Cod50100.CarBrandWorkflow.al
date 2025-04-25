codeunit 50100 CarBrandWorkflow
{
    Subtype = Normal;

    // procedure checkApprovalWorkflowEnabled(var RecRef: RecordRef): Boolean
    // begin
    //     if not WorkflowManagement.CanExecuteWorkflow() then begin
    //         Error('Workflow is not enabled for this record.');
    //     end;

    // end;

    var
        WorkflowManagement: Codeunit "Workflow Management";

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary' , '', false, false)]
    local procedure AddCarBrandEvents()
    var
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        WorkflowEventHandling.AddEventToLibrary(
            'CarBrand.Submitted',
            DATABASE::CarBrand,
            'Car Brand submitted for approval',
            0,
            true
        );

        WorkflowEventHandling.AddEventToLibrary(
            'CarBrand.Approved',
            DATABASE::CarBrand,
            'Car Brand approved',
            0,
            true
        );

        WorkflowEventHandling.AddEventToLibrary(
            'CarBrand.Rejected',
            DATABASE::CarBrand,
            'Car Brand rejected',
            0,
            true
        );
        WorkflowEventHandling.AddEventToLibrary(
            'CarBrand.Cancelled',
            DATABASE::CarBrand,
            'Car Brand cancelled',
            0,
            true
        );
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    local procedure AddCarBrandResponses()
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
    begin
        WorkflowResponseHandling.AddResponseToLibrary(
            'CarBrand.SetPending',
            0,
            'Set Car Brand as Pending Approval',
            'CarBrand.SetPending'
        );
        WorkflowResponseHandling.AddResponseToLibrary(
            'CarBrand.SetApproved',
            0,
            'Set Car Brand as Approved',
            'CarBrand.SetApproved'
        );
        WorkflowResponseHandling.AddResponseToLibrary(
            'CarBrand.SetRejected',
            0,
            'Set Car Brand as Rejected',
            'CarBrand.SetRejected'
        );
        WorkflowResponseHandling.AddResponseToLibrary(
            'CarBrand.SetCancel',
            0,
            'Set Car Brand as Cancelled',
            'CarBrand.SetCancel'
        );
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    local procedure HandleCarBrandResponses()
    var Status: Enum "Car Status";
        CarBrand: Record "CarBrand";
    begin
        if CarBrand.Get('CarBrand.SetApproved') then begin
            CarBrand.Status := Status::Released; 
            CarBrand.Modify(true);
        end;
        if CarBrand.Get('CarBrand.SetRejected') then begin
            CarBrand.Status := Status::Rejected; 
            CarBrand.Modify(true);
        end;
        if CarBrand.Get('CarBrand.SetCancel') then begin
            CarBrand.Status := Status::Open; 
            CarBrand.Modify(true);
        end;
        if CarBrand.Get('CarBrand.SetPending') then begin
            CarBrand.Status := Status::"Pending Approval"; 
            CarBrand.Modify(true);
        end;
    end;
}

    
