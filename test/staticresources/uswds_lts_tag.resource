describe("USWDS Tag", function () {
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });

  it("Properly renders with default settings", function (done) {
    $T.createComponent("c:uswdsTag", { title: "my tag" }, true)
      .then(function (component) {
        expect(
          document.getElementsByClassName("usa-tag")[0].textContent
        ).toContain("my tag");

        // end this spec successfully
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });

  it("Adds the appropriate class when size = Big.", function (done) {
    $T.createComponent("c:uswdsTag", { title: "my tag", size: "Big" }, true)
      .then(function (component) {
        expect(
          document.getElementsByClassName("usa-tag usa-tag--big").length
        ).toEqual(1);
        // end this spec successfully
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });

  it("Properly displays a valid color option", function (done) {
    $T.createComponent("c:uswdsTag", { title: "my tag", color: "indigo" }, true)
      .then(function (component) {
        expect(
          document.getElementsByClassName("usa-tag indigo-vivid").length
        ).toEqual(1);
        // end this spec successfully
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });

  it("Properly displays color and size variants regardless of case", function (done) {
    $T.createComponent(
      "c:uswdsTag",
      { title: "my tag", color: "Red Cool", size: "big" },
      true
    )
      .then(function (component) {
        expect(
          document.getElementsByClassName("usa-tag usa-tag--big red-cool-vivid")
            .length
        ).toEqual(1);
        // end this spec successfully
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });

  it("Displays error when an invalid color is provided", function (done) {
    $T.createComponent("c:uswdsTag", { title: "my tag", color: "garnet" }, true)
      .then(function (component) {
        expect(document.getElementsByClassName("usa-tag").length).toEqual(1);
        expect(
          document.querySelectorAll(".slds-notify__content", "p")[0].textContent
        ).toContain(
          `Provided color value "garnet" does not exist for this component. The default color will be displayed. A list of valid values are logged to the developer console.`
        );
        // end this spec successfully
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
});
