({
  doInit: function (component, event, helper) {
    const segment = component.get("v.stepIndicatorSegment");
    var status = "";
    if (segment.status.toLowerCase() === "current") {
      status = "";
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
  }
});
