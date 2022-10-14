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
  describe("Footer Navigation Type", function () {
    afterEach(function () {
      // Each spec (test) renders its components into the same div,
      // so we need to clear that div out at the end of each spec.
      $T.clearRenderedTestComponents();
    });
    it("displays Big navigation when footerNavType set to Big", function (done) {
      // we would need to mock a navigationMenu in order to verify the component receives values correctly. Otherwise, we just have to verify that the smallNav doesn't appear
      $T.createComponent("c:uswdsTheme", {}, true)
        .then(function (component) {
          expect(
            document.querySelectorAll("nav.usa-footer__nav > div > div").length
          ).toEqual(0);
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    it("displays small navigation when footerNavType set to small", function (done) {
      $T.createComponent("c:uswdsTheme", { footerNavType: "Small" }, true)
        .then(function (component) {
          expect(
            document
              .querySelectorAll("nav.usa-footer__nav > div > ul")[0]
              .getAttribute("class")
          ).toContain("cUswdsFooterNavMenuSmall");
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
  });
  describe("Contact Us Region", function () {
    // declare any variables that need to be available in each test
    var contactCenterName,
      contactCenterPhone,
      contactCenterEmail,
      contactCenterLink,
      contactCenterText;
    beforeEach(function () {
      contactCenterName = "Contact Center Name";
      contactCenterPhone = "444-999-8888";
      contactCenterEmail = "g.costanza@example.com";
      contactCenterLink = "https://gsa.gov";
      contactCenterText = "Submit a ticket";
    });
    afterEach(function () {
      // Each spec (test) renders its components into the same div,
      // so we need to clear that div out at the end of each spec.
      $T.clearRenderedTestComponents();
    });
    it("does not display Contact Center div when default values are set", function (done) {
      /**
       * createComponent - generates a component for testing
       * param - string - component reference "c:componentName"
       * param - object - component parameters {attributeA: "", 
  attributeB:""}
       * param - boolean - whether or not the component needs to be 
  rendered)
       */
      $T.createComponent("c:uswdsTheme", {}, true)
        .then(function (component) {
          expect(
            document.querySelectorAll("div.usa-footer__contact-links").length
          ).toEqual(1);
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    it("displays the Contact Center name when value is set", function (done) {
      $T.createComponent(
        "c:uswdsTheme",
        { contactCenterName: contactCenterName },
        true
      )
        .then(function (component) {
          expect(
            document.getElementsByClassName("usa-footer__contact-heading")[0]
              .textContent
          ).toContain(contactCenterName);
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    it("displays phone, email, and link when all have values set", function (done) {
      $T.createComponent(
        "c:uswdsTheme",
        {
          contactCenterName: contactCenterName,
          contactEmail: contactCenterEmail,
          contactPhone: contactCenterPhone,
          contactLink: contactCenterLink,
          contactLinkText: contactCenterText
        },
        true
      )
        .then(function (component) {
          // phone number
          expect(
            document
              .querySelectorAll("address.usa-footer__address > div > div")[0]
              .querySelectorAll("a")[0].textContent
          ).toEqual(contactCenterPhone);
          expect(
            document
              .querySelectorAll("address.usa-footer__address > div > div")[0]
              .querySelectorAll("a")[0]
              .getAttribute("href")
          ).toEqual(`tel:${contactCenterPhone}`);
          // email
          expect(
            document
              .querySelectorAll("address.usa-footer__address > div > div")[1]
              .querySelectorAll("a")[0].textContent
          ).toEqual(contactCenterEmail);
          expect(
            document
              .querySelectorAll("address.usa-footer__address > div > div")[1]
              .querySelectorAll("a")[0]
              .getAttribute("href")
          ).toEqual(`mailto:${contactCenterEmail}`);
          // link
          expect(
            document
              .querySelectorAll("address.usa-footer__address > div > div")[2]
              .querySelectorAll("a")[0].textContent
          ).toEqual(contactCenterText);
          expect(
            document
              .querySelectorAll("address.usa-footer__address > div > div")[2]
              .querySelectorAll("a")[0]
              .getAttribute("href")
          ).toEqual(contactCenterLink);
          // full div as presented on the page with | separators
          expect(
            document
              .querySelectorAll("address.usa-footer__address > div")[0]
              .textContent.replace(/\s{2,}/g, "")
          ).toEqual(
            `${contactCenterPhone}|${contactCenterEmail}|${contactCenterText}`
          );
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    describe("Contact Link", function () {
      afterEach(function () {
        // Each spec (test) renders its components into the same div,
        // so we need to clear that div out at the end of each spec.
        $T.clearRenderedTestComponents();
      });
      it("", function (done) {
        /**
         * createComponent - generates a component for testing
         * param - string - component reference "c:componentName"
         * param - object - component parameters {attributeA: "", 
    attributeB:""}
         * param - boolean - whether or not the component needs to be 
    rendered)
         */
        $T.createComponent(
          "c:uswdsTheme",
          {
            contactLinkText: contactCenterText,
            contactLink: contactCenterLink
          },
          true
        )
          .then(function (component) {
            expect(
              document.querySelectorAll(
                "address.usa-footer__address > div > div"
              )[0].textContent
            ).toEqual(contactCenterText);
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("does not display contactLink if link is blank", function (done) {
        $T.createComponent(
          "c:uswdsTheme",
          { contactLinkText: contactCenterText },
          true
        )
          .then(function (component) {
            expect(
              document.querySelectorAll(
                "address.usa-footer__address > div > div"
              ).length
            ).toEqual(0);
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
      it("does not display contactLink if contactLinkText is blank", function (done) {
        $T.createComponent(
          "c:uswdsTheme",
          { contactLink: contactCenterLink },
          true
        )
          .then(function (component) {
            expect(
              document.querySelectorAll(
                "address.usa-footer__address > div > div"
              ).length
            ).toEqual(0);
            done();
          })
          .catch(function (e) {
            done.fail(e);
          });
      });
    });
  });
});
