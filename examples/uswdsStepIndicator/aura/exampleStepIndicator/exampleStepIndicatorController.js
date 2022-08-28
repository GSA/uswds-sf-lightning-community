({
  doInit: function (component, event, helper) {
    const stepIndicatorSegments = [
      {
        label: "Pick Size",
        status: "Completed"
      },
      {
        label: "Pick Crust",
        status: "Completed"
      },
      {
        label: "Select Toppings",
        status: "Completed"
      },
      {
        label: "Review Order",
        status: "Current"
      },
      {
        label: "Ordered",
        status: "Not Complete"
      }
    ];
    //component.set("v.stepIndicatorSegments", stepIndicatorSegments);

    const stepIndicatorSegmentsLong = [
      {
        label: "Step 1",
        status: "Completed"
      },
      {
        label: "Step 2",
        status: "Completed"
      },
      {
        label: "Step 3",
        status: "Current"
      },
      {
        label: "Step 4 with longer description",
        status: "Not Complete"
      },
      {
        label: "Step 5",
        status: "Not Complete"
      },
      {
        label: "Step 6",
        status: "Not Complete"
      },
      {
        label: "Step 7 ",
        status: "Not Complete"
      }
    ];
    //component.set("v.stepIndicatorSegmentsLong", stepIndicatorSegmentsLong);
  }
});
