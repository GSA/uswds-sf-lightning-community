describe("Step Indicator Segment", function () {
  var segmentComplete, segmentCurrent, segmentNotComplete;
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
      status: "Not Complete"
    };
  });
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });
  it("Completed Segment", function (done) {
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
  it("Current Segment", function (done) {
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
  it("Not Complete Segment", function (done) {
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
});
