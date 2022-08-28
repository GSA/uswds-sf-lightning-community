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
      const toastContent = {
        title: "Error - USWDS Step Indicator Segment",
        message: `Segment Label should contain a value, regardless of whether or not it is shown on the page.`,
        variant: "warning",
        mode: "sticky"
      };
      this.createToast(component, toastContent);
    }
  },
  createToast: function (component, toastObject) {
    component.find("notifLib").showToast(toastObject);
    const consoleWarningArray = [toastObject.title, toastObject.message];
    console.warn(...consoleWarningArray);
  }
});
