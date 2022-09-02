describe("Step Indicator", function () {
  var stepIndicatorSegments,
    stepIndicatorSegmentsLong,
    stepIndicatorSegmentsTwoCurrent,
    stepIndicatorSegmentsNoCurrent;
  beforeEach(function () {
    stepIndicatorSegments = [
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
    stepIndicatorSegmentsLong = [
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
    stepIndicatorSegmentsTwoCurrent = [
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
        status: "Current"
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
    stepIndicatorSegmentsNoCurrent = [
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
        status: "Not Complete"
      },
      {
        label: "Review Order",
        status: "Not Complete"
      },
      {
        label: "Ordered",
        status: "Not Complete"
      }
    ];
  });
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });
  it("Default Type with English, 5 Segments, 4th is Current", function (done) {
    $T.createComponent(
      "c:uswdsStepIndicator",
      {
        language: "English",
        stepIndicatorSegments: stepIndicatorSegments
      },
      true
    )
      .then(function (component) {
        expect(
          document.getElementsByClassName("usa-step-indicator__segment").length
        ).toEqual(5);
        expect(
          document.getElementsByClassName("usa-step-indicator__heading-text")[0]
            .textContent
        ).toContain(stepIndicatorSegments[3].label);
        expect(
          document.getElementsByClassName("usa-step-indicator__total-steps")[0]
            .textContent
        ).toContain(" of 5");
        expect(
          document.getElementsByClassName("usa-step-indicator__current-step")[0]
            .textContent
        ).toContain("4");
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });

  it("No Labels Type with English, 5 Segments, 4th is Current", function (done) {
    $T.createComponent(
      "c:uswdsStepIndicator",
      {
        language: "English",
        stepIndicatorType: "No Labels",
        stepIndicatorSegments: stepIndicatorSegments
      },
      true
    )
      .then(function (component) {
        expect(
          document.getElementsByClassName("usa-step-indicator__segment").length
        ).toEqual(5);
        expect(
          document.getElementsByClassName(
            "usa-step-indicator usa-step-indicator--no-labels"
          ).length
        ).toEqual(1);
        expect(
          document.getElementsByClassName("usa-step-indicator__heading-text")[0]
            .textContent
        ).toContain(stepIndicatorSegments[3].label);
        expect(
          document.getElementsByClassName("usa-step-indicator__total-steps")[0]
            .textContent
        ).toContain(" of 5");
        expect(
          document.getElementsByClassName("usa-step-indicator__current-step")[0]
            .textContent
        ).toContain("4");
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("Centered Type with English, 5 Segments, 4th is Current", function (done) {
    $T.createComponent(
      "c:uswdsStepIndicator",
      {
        language: "English",
        stepIndicatorType: "Centered",
        stepIndicatorSegments: stepIndicatorSegments
      },
      true
    )
      .then(function (component) {
        expect(
          document.getElementsByClassName(
            "usa-step-indicator usa-step-indicator--center"
          ).length
        ).toEqual(1);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("Counters Type with English, 5 Segments, 4th is Current", function (done) {
    $T.createComponent(
      "c:uswdsStepIndicator",
      {
        language: "English",
        stepIndicatorType: "Counters",
        stepIndicatorSegments: stepIndicatorSegments
      },
      true
    )
      .then(function (component) {
        expect(
          document.getElementsByClassName(
            "usa-step-indicator usa-step-indicator--counters"
          ).length
        ).toEqual(1);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("Small Counters Type with English, 5 Segments, 4th is Current", function (done) {
    $T.createComponent(
      "c:uswdsStepIndicator",
      {
        language: "English",
        stepIndicatorType: "Small Counters",
        stepIndicatorSegments: stepIndicatorSegments
      },
      true
    )
      .then(function (component) {
        expect(
          document.getElementsByClassName(
            "usa-step-indicator usa-step-indicator--counters-sm"
          ).length
        ).toEqual(1);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("Default Type with English, 7 Segments, 3rd is Current, displayHeading = no", function (done) {
    $T.createComponent(
      "c:uswdsStepIndicator",
      {
        language: "English",
        stepIndicatorSegments: stepIndicatorSegmentsLong,
        displayHeading: "No"
      },
      true
    )
      .then(function (component) {
        expect(
          document.getElementsByClassName("usa-step-indicator__segment").length
        ).toEqual(7);
        expect(
          document.getElementsByClassName("usa-step-indicator__heading-text")
            .length
        ).toEqual(0);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("Default Type with Spanish, 7 Segments, 3rd is Current", function (done) {
    $T.createComponent(
      "c:uswdsStepIndicator",
      {
        language: "Spanish",
        stepIndicatorSegments: stepIndicatorSegmentsLong
      },
      true
    )
      .then(function (component) {
        expect(
          document.getElementsByClassName("usa-step-indicator__segment").length
        ).toEqual(7);
        expect(
          document.getElementsByClassName("usa-step-indicator__heading-text")[0]
            .textContent
        ).toContain(stepIndicatorSegmentsLong[2].label);
        expect(
          document.getElementsByClassName("usa-step-indicator__total-steps")[0]
            .textContent
        ).toContain(" de 7");
        expect(
          document.getElementsByClassName("usa-step-indicator__current-step")[0]
            .textContent
        ).toContain("3");
        expect(
          document.querySelectorAll(
            ".usa-step-indicator__heading-counter",
            "usa-sr-only"
          )[0].textContent
        ).toContain("paso");
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });

  it("Two segments marked as 'Current' - expect error to be thrown", function (done) {
    $T.createComponent(
      "c:uswdsStepIndicator",
      {
        language: "English",
        stepIndicatorType: "Small Counters",
        stepIndicatorSegments: stepIndicatorSegmentsTwoCurrent
      },
      true
    )
      .then(function (component) {
        expect(
          document.getElementsByClassName("cBuilderNotification").length
        ).toEqual(1);
        expect(
          document.querySelectorAll(".slds-notify__content", "p")[0].textContent
        ).toContain(
          "More than one segment is listed as current. At most one segment should be identified as the current step."
        );
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("No segments marked as 'Current' - expect error to be thrown", function (done) {
    $T.createComponent(
      "c:uswdsStepIndicator",
      {
        language: "English",
        stepIndicatorType: "Counters",
        stepIndicatorSegments: stepIndicatorSegmentsNoCurrent
      },
      true
    )
      .then(function (component) {
        expect(
          document.getElementsByClassName("cBuilderNotification").length
        ).toEqual(1);
        expect(
          document.querySelectorAll(".slds-notify__content", "p")[0].textContent
        ).toContain(
          "One segment must be marked as Current if all segments are not complete."
        );
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
});
