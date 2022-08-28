({
  updateStepIndicatorTypeClass: function (component) {
    const stepIndicatorType = component.get("v.stepIndicatorType");
    const typeClassMap = {
      Default: "",
      "No Labels": "usa-step-indicator--no-labels",
      Centered: "usa-step-indicator--center",
      Counters: "usa-step-indicator--counters",
      "Small Counters": "usa-step-indicator--counters-sm"
    };
    if (typeClassMap.hasOwnProperty(stepIndicatorType)) {
      component.set(
        "v.stepIndicatorTypeClass",
        typeClassMap[stepIndicatorType]
      );
    } else {
      component.set("v.stepIndicatorTypeClass", typeClassMap.Default);
    }
  },
  getCounts: function (component) {
    const stepIndicatorSegments = component.get("v.stepIndicatorSegments");
    var totalSteps = stepIndicatorSegments.length;
    var currentStep;
    stepIndicatorSegments.forEach((segment, index) => {
      if (segment.status.toLowerCase() === "current") {
        currentStep = index + 1;
        component.set("v.headingText", segment.label);
      }
    });
    component.set("v.totalSteps", totalSteps);
    component.set("v.currentStep", currentStep);
  }
});
