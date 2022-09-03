describe("Step Indicator Segment", function () {
  var segmentComplete,
    segmentCurrent,
    segmentNotComplete,
    segmentLabelBlank,
    segmentBadStatus;
  beforeEach(function () {
    segmentComplete = {
      label: "Pick Size",
      status: "Completed"
    };
    segmentCurrent = {
      label: "Review Order",
      status: "Current"
    };
    segmentNotComplete = {
      label: "Ordered",
      status: "Not Completed"
    };
    segmentLabelBlank = {
      label: "",
      status: "Not Completed"
    };
    segmentBadStatus = {
      label: "Doing Stuff",
      status: "Have we started?"
    };
  });
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });
  it("Completed Segment displays as expected", function (done) {
    $T.createComponent(
      "c:uswdsStepIndicatorSegment",
      {
        stepIndicatorSegment: segmentComplete
      },
      true
    )
      .then(function (component) {
        expect(
          document.getElementsByClassName(
            "usa-step-indicator__segment usa-step-indicator__segment--complete"
          ).length
        ).toEqual(1);
        expect(
          document.getElementsByClassName(
            "usa-step-indicator__segment-label"
          )[0].textContent
        ).toContain(segmentComplete.label);
        expect(
          document.querySelectorAll(
            ".usa-step-indicator__segment-label",
            ".usa-sr-only"
          )[0].textContent
        ).toContain(segmentComplete.status);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("Current Segment displays as expected", function (done) {
    $T.createComponent(
      "c:uswdsStepIndicatorSegment",
      {
        stepIndicatorSegment: segmentCurrent
      },
      true
    )
      .then(function (component) {
        expect(
          document.getElementsByClassName(
            "usa-step-indicator__segment usa-step-indicator__segment--current"
          ).length
        ).toEqual(1);
        expect(
          document.getElementsByClassName(
            "usa-step-indicator__segment-label"
          )[0].textContent
        ).toContain(segmentCurrent.label);
        expect(
          document.querySelectorAll(
            ".usa-step-indicator__segment-label > .usa-sr-only"
          ).length
        ).toEqual(0);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("Not Complete Segment displays as expected", function (done) {
    $T.createComponent(
      "c:uswdsStepIndicatorSegment",
      {
        stepIndicatorSegment: segmentNotComplete
      },
      true
    )
      .then(function (component) {
        expect(
          document.getElementsByClassName("usa-step-indicator__segment").length
        ).toEqual(1);
        expect(
          document.getElementsByClassName(
            "usa-step-indicator__segment-label"
          )[0].textContent
        ).toContain(segmentNotComplete.label);
        expect(
          document.querySelectorAll(
            ".usa-step-indicator__segment-label",
            ".usa-sr-only"
          )[0].textContent
        ).toContain(segmentComplete.status);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("Blank label throws validation error", function (done) {
    $T.createComponent(
      "c:uswdsStepIndicatorSegment",
      {
        stepIndicatorSegment: segmentLabelBlank
      },
      true
    )
      .then(function (component) {
        expect(
          document.querySelectorAll(".slds-notify__content", "p")[0].textContent
        ).toContain(
          "Segment Label should contain a value, regardless of whether or not it is shown on the page."
        );
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("Invalid status option throws validation error", function (done) {
    $T.createComponent(
      "c:uswdsStepIndicatorSegment",
      {
        stepIndicatorSegment: segmentBadStatus
      },
      true
    )
      .then(function (component) {
        expect(
          document.querySelectorAll(".slds-notify__content", "p")[0].textContent
        ).toContain(
          "Segment Status should be one of: 'completed', 'not completed', or 'current'."
        );
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
});
