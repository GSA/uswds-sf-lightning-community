describe("USWDS Theme", function () {
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });

  describe("Logo Type", function () {
    it("is displayed correctly when 'Wide' is selected", function (done) {
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
    it("renders a square logo in header of page when default settings are used", function (done) {
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
  describe("Container Width", function () {
    it("is displayed properly with default settings (standard)", function (done) {
      $T.createComponent("c:uswdsTheme", {}, true)
        .then(function (component) {
          expect(
            document.getElementById("mainContent").getAttribute("class")
          ).toContain("grid-container");
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    it('receives the appropriate CSS class when "Full" is selected', function (done) {
      $T.createComponent("c:uswdsTheme", { containerWidth: "Full" }, true)
        .then(function (component) {
          expect(
            document.getElementById("mainContent").getAttribute("class")
          ).toEqual("cUswdsTheme");
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    it('receives the appropriate CSS class when "Wide" is selected', function (done) {
      $T.createComponent("c:uswdsTheme", { containerWidth: "Wide" }, true)
        .then(function (component) {
          expect(
            document.getElementById("mainContent").getAttribute("class")
          ).toContain("grid-container-widescreen");
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    it('reverts to "standard" when an invalid option is provided', function (done) {
      $T.createComponent("c:uswdsTheme", { containerWidth: "large" }, true)
        .then(function (component) {
          expect(
            document.getElementById("mainContent").getAttribute("class")
          ).toContain("grid-container");
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
  });
  describe("Display Login", function () {
    // declare any variables that need to be available in each test
    var varA;
    beforeEach(function () {
      varA = "";
    });
    afterEach(function () {
      // Each spec (test) renders its components into the same div,
      // so we need to clear that div out at the end of each spec.
      $T.clearRenderedTestComponents();
    });
    it("is displayed when default settings (Yes) are used", function (done) {
      $T.createComponent("c:uswdsTheme", {}, true)
        .then(function (component) {
          expect(
            document.querySelectorAll(
              ".usa-nav__secondary > div > div .grid-col-fill"
            ).length
          ).toEqual(1);
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    it('is not displayed when displayLogin is set to "No"', function (done) {
      $T.createComponent("c:uswdsTheme", { displayLogin: "No" }, true)
        .then(function (component) {
          expect(
            document.querySelectorAll(
              ".usa-nav__secondary > div > div .grid-col-fill"
            ).length
          ).toEqual(0);
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
  });
  describe("Footer Email Signup Toggle", function () {
    afterEach(function () {
      // Each spec (test) renders its components into the same div,
      // so we need to clear that div out at the end of each spec.
      $T.clearRenderedTestComponents();
    });
    it("remains hidden when in default (Off) state", function (done) {
      $T.createComponent("c:uswdsTheme", {}, true)
        .then(function (component) {
          expect(
            document
              .querySelectorAll(
                ".usa-footer__secondary-section > div > div > div"
              )[0]
              .getAttribute("class")
          ).toEqual("usa-footer__contact-links mobile-lg:grid-col-12");
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    it('is displayed when set to "On"', function (done) {
      $T.createComponent(
        "c:uswdsTheme",
        { footerEmailSignUpToggle: "On" },
        true
      )
        .then(function (component) {
          expect(
            document
              .querySelectorAll(
                ".usa-footer__secondary-section > div > div > div"
              )[0]
              .getAttribute("class")
          ).toContain(
            "card:grid-col-12 margin-top-3 mobile-lg:margin-top-0 mobile-lg:grid-col-6"
          );
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
  });
});
