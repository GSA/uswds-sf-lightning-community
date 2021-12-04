describe("USWDS Theme", function () {
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });

  describe("Default settings", function () {
    // when reading through this spec.
    it("renders a square logo in header of page", function (done) {
      $T.createComponent("c:uswdsTheme", {}, true)
        .then(function (component) {
          expect(
            document.getElementsByClassName("slds-media__figure")[0]
          ).toBeDefined();
          expect(
            document.getElementsByClassName("slds-avatar slds-avatar_large")[0]
          ).toBeDefined();
          // end this spec successfully
          done();
        })
        .catch(function (e) {
          // end this spec as a failure
          done.fail(e);
        });
    });
  });

  describe("Logo type (wide)", function () {
    // when reading through this spec.
    it("is displayed correctly", function (done) {
      $T.createComponent("c:uswdsTheme", { logoType: "Wide" }, true)
        .then(function (component) {
          expect(
            document
              .getElementsByClassName("slds-media slds-media_center")[0]
              .firstChild.attributes.getNamedItem("class").value
          ).toEqual("");
          expect(
            document
              .getElementsByClassName("slds-media slds-media_center")[0]
              .firstChild.firstChild.attributes.getNamedItem("class").value
          ).toEqual("logoContainer");
          // end this spec successfully
          done();
        })
        .catch(function (e) {
          // end this spec as a failure
          done.fail(e);
        });
    });
  });
});
