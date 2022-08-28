describe("Step Indicator Heading", function () {
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });
  it("Displays content with English as chosen language", function (done) {
    $T.createComponent(
      "c:uswdsStepIndicatorHeading",
      {
        language: "English",
        currentStep: "1",
        totalSteps: "4",
        headingText: "stepindicator heading"
      },
      true
    )
      .then(function (component) {
        expect(
          document.getElementsByClassName("usa-step-indicator__heading-text")[0]
            .textContent
        ).toContain("stepindicator heading");
        expect(
          document.getElementsByClassName("usa-step-indicator__total-steps")[0]
            .textContent
        ).toContain(" of 4");
        expect(
          document.getElementsByClassName("usa-step-indicator__current-step")[0]
            .textContent
        ).toContain("1");
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("Displays content with English as chosen language", function (done) {
    $T.createComponent(
      "c:uswdsStepIndicatorHeading",
      {
        language: "Spanish",
        currentStep: "1",
        totalSteps: "4",
        headingText: "stepindicator heading"
      },
      true
    )
      .then(function (component) {
        expect(
          document.getElementsByClassName("usa-step-indicator__heading-text")[0]
            .textContent
        ).toContain("stepindicator heading");
        expect(
          document.getElementsByClassName("usa-step-indicator__total-steps")[0]
            .textContent
        ).toContain(" de 4");
        expect(
          document.getElementsByClassName("usa-step-indicator__current-step")[0]
            .textContent
        ).toContain("1");
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
});
