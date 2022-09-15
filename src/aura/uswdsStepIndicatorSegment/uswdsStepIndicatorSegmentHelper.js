({
  updateStatusClass: function (component) {
    const segment = component.get("v.stepIndicatorSegment");
    var status = "";
    if (segment.status.toLowerCase() === "current") {
      component.set(
        "v.currentStatusClass",
        "usa-step-indicator__segment--current"
      );
    } else if (segment.status.toLowerCase() === "completed") {
      status = "Completed";
      component.set(
        "v.currentStatusClass",
        "usa-step-indicator__segment--complete"
      );
    } else {
      status = "Not Completed";
    }

    component.set("v.status", status);
  },
  validateLabelHasValue: function (component) {
    const label = component.get("v.stepIndicatorSegment.label");
    if (label == "") {
      const builderNotificationContent = {
        title: "Error - USWDS Step Indicator Segment",
        message: `Segment Label should contain a value, regardless of whether or not it is shown on the page.`
      };
      component
        .find("builderNotification")
        .addNotification(builderNotificationContent);
    }
  },
  validateSegmentStatus: function (component) {
    const regex = /(completed|not completed|current)/i;
    const status = component.get("v.stepIndicatorSegment.status");
    // the regex must be wrapped in  parens in order for the not, !, operator to evaluate correctly
    // prettier-ignore
    if (!(regex.test(status))) {
      const builderNotificationContent = {
        title: "Error - USWDS Step Indicator Segment",
        message: `Segment Status should be one of: 'completed', 'not completed', or 'current'.`
      };
      component
        .find("builderNotification")
        .addNotification(builderNotificationContent);
    }
  }
});
