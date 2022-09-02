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
  getSummarySegmentData: function (component) {
    const summarySegmentData = {
      totalSteps: 0,
      currentStep: 0,
      currentStepLabel: "",
      countCurrentSteps: 0,
      countCompletedSteps: 0
    };
    const stepIndicatorSegments = component.get("v.stepIndicatorSegments");
    summarySegmentData.totalSteps = stepIndicatorSegments.length;
    stepIndicatorSegments.forEach((segment, index) => {
      if (segment.status.toLowerCase() === "current") {
        summarySegmentData.currentStep = index + 1;
        summarySegmentData.countCurrentSteps++;
        summarySegmentData.currentStepLabel = segment.label;
      }
      if (segment.status.toLowerCase() === "completed") {
        summarySegmentData.countCompletedSteps++;
      }
    });
    return summarySegmentData;
  },
  validate: function (component, summarySegmentData) {
    this.validateMultipleCurrentSegments(component, summarySegmentData);
    this.validateOneCurrentSegmentIfNotComplete(component, summarySegmentData);
  },
  validateOneCurrentSegmentIfNotComplete: function (
    component,
    summarySegmentData
  ) {
    if (
      summarySegmentData.countCurrentSteps == 0 &&
      summarySegmentData.countCompletedSteps != summarySegmentData.totalSteps
    ) {
      const builderNotificationContent = {
        title: "Error - USWDS Step Indicator",
        message: `One segment must be marked as Current if all segments are not complete.`
      };
      component
        .find("builderNotification")
        .addNotification(builderNotificationContent);
    }
  },
  validateMultipleCurrentSegments: function (component, summarySegmentData) {
    if (summarySegmentData.countCurrentSteps > 1) {
      const builderNotificationContent = [
        {
          title: "Error - USWDS Step Indicator",
          message: `More than one segment is listed as current. At most one segment should be identified as the current step.`
        }
      ];
      component
        .find("builderNotification")
        .addNotification(builderNotificationContent);
    }
  }
});
