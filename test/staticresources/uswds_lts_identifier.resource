describe("Identifier", function () {
  // declare any variables that need to be available in each test
  var identifierType,
    identityDomain,
    agencyName,
    agencyURL,
    agencyName2,
    agencyURL2,
    agencyLogo2;
  beforeEach(function () {});
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });
  it("renders using default values", function (done) {
    /**
     * createComponent - generates a component for testing
     * param - string - component reference "c:componentName"
     * param - object - component parameters {attributeA: "", 
attributeB:""}
     * param - boolean - whether or not the component needs to be 
rendered)
     */
    $T.createComponent("c:uswdsIdentifier", {}, true)
      .then(function (component) {
        expect(selector).toContain(value);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  describe("identifier types", function () {
    it("displays proper text using Spanish variant", function (done) {
      $T.createComponent(
        "c:uswdsIdentifier",
        { identifierType: "Spanish" },
        true
      )
        .then(function (component) {
          expect(selector).toContain(value);
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    it("displays proper text Multi w Logo English variant", function (done) {
      /**
       * createComponent - generates a component for testing
       * param - string - component reference "c:componentName"
       * param - object - component parameters {attributeA: "", 
  attributeB:""}
       * param - boolean - whether or not the component needs to be 
  rendered)
       */
      $T.createComponent(
        "c:componentName",
        { identifierType: "Multi w Logo English" },
        true
      )
        .then(function (component) {
          expect(selector).toContain(value);
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    it("displays proper text Multi w Logo Spanish variant", function (done) {
      $T.createComponent(
        "c:componentName",
        { identifierType: "Multi w Logo Spanish" },
        true
      )
        .then(function (component) {
          expect(selector).toContain(value);
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    it("displays proper text for No Logo English variant", function (done) {
      $T.createComponent(
        "c:componentName",
        { identifierType: "No Logo English" },
        true
      )
        .then(function (component) {
          expect(selector).toContain(value);
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    it("displays proper text for No Logo Spanish variant", function (done) {
      $T.createComponent(
        "c:componentName",
        { identifierType: "No Logo Spanish" },
        true
      )
        .then(function (component) {
          expect(selector).toContain(value);
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    it("displays proper text for No Logo English variant", function (done) {
      $T.createComponent(
        "c:componentName",
        { identifierType: "No Logo English" },
        true
      )
        .then(function (component) {
          expect(selector).toContain(value);
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    it("displays proper text for Taxpayer Disclaimer English variant", function (done) {
      $T.createComponent(
        "c:componentName",
        { identifierType: "Taxpayer Disclaimer English" },
        true
      )
        .then(function (component) {
          expect(selector).toContain(value);
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    it("displays proper text for Taxpayer Disclaimer Spanish variant", function (done) {
      $T.createComponent(
        "c:componentName",
        { identifierType: "Taxpayer Disclaimer Spanish" },
        true
      )
        .then(function (component) {
          expect(selector).toContain(value);
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
  });

  it("renders identity domain", function (done) {
    /**
       * createComponent - generates a component for testing
       * param - string - component reference "c:componentName"
       * param - object - component parameters {attributeA: "", 
  attributeB:""}
       * param - boolean - whether or not the component needs to be 
  rendered)
       */

    $T.createComponent(
      "c:uswdsIdentifier",
      { identityDomain: "awesomesite.gsa.gov" },
      true
    )
      .then(function (component) {
        expect(selector).toContain(value);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("displays agencyName", function (done) {
    $T.createComponent("c:uswdsIdentifier", { attribute: value }, true)
      .then(function (component) {
        expect(selector).toContain(value);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("inserts an agencyURL", function (done) {
    $T.createComponent("c:uswdsIdentifier", { attribute: value }, true)
      .then(function (component) {
        expect(selector).toContain(value);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("displays agencyName2", function (done) {
    $T.createComponent("c:uswdsIdentifier", { attribute: value }, true)
      .then(function (component) {
        expect(selector).toContain(value);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("inserts agencyURL2", function (done) {
    $T.createComponent("c:uswdsIdentifier", { attribute: value }, true)
      .then(function (component) {
        expect(selector).toContain(value);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
});
