codeunit 50101 CarsWorkflowMgmt
{
    procedure CheckCarApprovalsWorkflowEnabled(var RecRef: RecordRef): Boolean
    begin
        if not WorkflowManagement.CanExecuteWorkflow(RecRef, GetWorkflowCode(RunWorkflowOnSendCarForApprovalCode, RecRef)) then begin
            Error(NoWorkflowEnabledErr);
        end;
        exit(true);
    end;



    procedure GetWorkflowCode(WorkflowCode: Code[128]; RecRef: RecordRef): Code[128]
    begin
        exit(DelChr(StrSubstNo(WorkflowCode, RecRef.Name), '=', ' '));
    end;

    procedure GetWorkflowEventDesc(WorkflowEventDesc: Text; RecRef: RecordRef): Text
    begin
        exit(StrSubstNo(WorkflowEventDesc, RecRef.Name));
    end;

    [IntegrationEvent(false, false)]
    procedure OnSendCarForApproval(var RecRef: RecordRef)
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnCancelCarForApproval(var RecRef: RecordRef)
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventsToLibrary()
    var
        RecRef: RecordRef;
        WorkflowEventHandling: Codeunit "Workflow Event Handling";

    begin
        RecRef.Open(DATABASE::CarBrand);
        WorkflowEventHandling.AddEventToLibrary(GetWorkflowCode(RunWorkflowOnSendCarForApprovalCode, RecRef), Database::CarBrand,
          GetWorkflowEventDesc(CarSendForApprovalEventDescTxt, RecRef), 0, false);
        WorkflowEventHandling.AddEventToLibrary(GetWorkflowCode(RunWorkflowOnCancelCarForApprovalCode, RecRef), DATABASE::CarBrand,
          GetWorkflowEventDesc(CarCancelForApprovalEventDescTxt, RecRef), 0, false);

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CarsWorkflowMgmt", 'OnSendCarForApproval', '', false, false)]
    local procedure RunWorkflowOnSendCarForApproval(var RecRef: RecordRef)
    begin
        WorkflowManagement.HandleEvent(GetWorkflowCode(RunWorkflowOnSendCarForApprovalCode, RecRef), RecRef);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CarsWorkflowMgmt", 'OnCancelCarForApproval', '', false, false)]
    local procedure RunWorkflowOnCancelCarForApproval(var RecRef: RecordRef)
    begin
        WorkflowManagement.HandleEvent(GetWorkflowCode(RunWorkflowOnCancelCarForApprovalCode, RecRef), RecRef);
    end;

    var
        WorkflowManagement: Codeunit "Workflow Management";

        RunWorkflowOnSendCarForApprovalCode: Label 'SEND%1FORAPPROVAL';

        RunWorkflowOnCancelCarForApprovalCode: Label 'SEND%1FORCANCELLATION';

        NoWorkflowEnabledErr: Label 'No workflow enabled for %1. Please enable a workflow in the Workflow Setup page.';

        CarSendForApprovalEventDescTxt: Label 'Approval of %1 is requested.';

        CarCancelForApprovalEventDescTxt: Label 'Approval of %1 is cancelled.';

}
