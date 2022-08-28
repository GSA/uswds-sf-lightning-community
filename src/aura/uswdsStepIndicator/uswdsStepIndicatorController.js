({
  doInit: function (component, event, helper) {
    helper.updateStepIndicatorTypeClass(component);
    const summarySegmentData = helper.getSummarySegmentData(component);
    helper.setCounts(component, summarySegmentData);
    helper.validate(component, summarySegmentData);
  }
});
