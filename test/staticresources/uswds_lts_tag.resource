describe("USWDS Tag", function () {
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });

  it("properly renders with default settings", function (done) {
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

  it("adds the appropriate class when size = Big.", function (done) {
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

  it("allows for a valid color to be chosen.", function (done) {
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
  /* A test for an invalid color does not result in a decisive test. The lightning:notificationsLibrary component does not properly render in an automated test which results in a callback error*/
});
