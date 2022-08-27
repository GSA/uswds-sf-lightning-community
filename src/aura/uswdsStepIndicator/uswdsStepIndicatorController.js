({
  doInit: function (component, event, helper) {
    helper.updateStepIndicatorTypeClass(component);
  },
  onRender: function (component, event, helper) {
    //stepIndicatorSegments data is not available until onRender
    helper.getCounts(component);
  }
});
