({
  doInit: function (component, event, helper) {
    helper.updateStepIndicatorTypeClass(component);
    const summarySegmentData = helper.getSummarySegmentData(component);
    component.set("v.totalSteps", summarySegmentData.totalSteps);
    component.set("v.currentStep", summarySegmentData.currentStep);
    component.set("v.headingText", summarySegmentData.currentStepLabel);

    helper.validate(component, summarySegmentData);
  }
});
