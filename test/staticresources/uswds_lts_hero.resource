describe("Hero", function () {
  // declare any variables that need to be available in each test
  var testData;
  beforeEach(function () {
    testData = {
      heading: "This is heading",
      headingAlt: "This is alt",
      headingBody:
        "This is the body of the hero with a quick sentence containing the call to action information.",
      callToAction: "Click the button",
      callToActionLink: "/register",
      heroImgName: "testImage",
      heroImgAltText: "this is test alt text"
    };
  });
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });
  it("component renders with default values", function (done) {
    /**
     * createComponent - generates a component for testing
     * param - string - component reference "c:componentName"
     * param - object - component parameters {attributeA: "", attributeB:""}
     * param - boolean - whether or not the component needs to be rendered)
     */
    $T.createComponent("c:uswdsHero", {}, true)
      .then(function (component) {
        expect(
          document
            .getElementsByClassName("usa-hero")[0]
            .getAttribute("aria-label")
        ).toContain("Introduction");
        // style will contain () by default due to the text interpolation rules with Salesforce
        expect(
          document.querySelectorAll(".usa-hero")[0].getAttribute("style")
        ).toEqual("()");
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("component renders all heading attributes and buttons", function (done) {
    /**
     * createComponent - generates a component for testing
     * param - string - component reference "c:componentName"
     * param - object - component parameters {attributeA: "", attributeB:""}
     * param - boolean - whether or not the component needs to be rendered)
     */
    $T.createComponent(
      "c:uswdsHero",
      {
        heading: testData.heading,
        headingAlt: testData.headingAlt,
        headingBody: testData.headingBody,
        callToAction: testData.callToAction,
        callToActionLink: testData.callToActionLink,
        heroImgName: testData.heroImgName,
        heroImgAltText: testData.heroImgAltText
      },
      true
    )
      .then(function (component) {
        expect(
          document
            .getElementsByClassName("usa-hero")[0]
            .getAttribute("aria-label")
        ).toEqual(testData.heroImgAltText);
        expect(
          document.getElementsByClassName("usa-hero__heading--alt")[0]
            .textContent
        ).toContain(testData.headingAlt);
        expect(
          document.getElementsByClassName("usa-hero__heading")[0].textContent
        ).toContain(testData.heading);
        expect(
          document.querySelectorAll(".usa-hero__callout p")[0].textContent
        ).toEqual(testData.headingBody);
        expect(
          document
            .querySelectorAll(".usa-hero__callout a.usa-button")[0]
            .getAttribute("href")
        ).toEqual(testData.callToActionLink);
        expect(
          document.querySelectorAll(".usa-hero__callout a.usa-button")[0]
            .textContent
        ).toEqual(testData.callToAction);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("component does not render button if callToAction is not set ", function (done) {
    /**
     * createComponent - generates a component for testing
     * param - string - component reference "c:componentName"
     * param - object - component parameters {attributeA: "", attributeB:""}
     * param - boolean - whether or not the component needs to be rendered)
     */
    $T.createComponent("c:uswdsHero", {}, true)
      .then(function (component) {
        expect(
          document.querySelectorAll(".usa-hero__callout a.usa-button").length
        ).toEqual(0);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("component renders with custom imageAsset", function (done) {
    /**
     * createComponent - generates a component for testing
     * param - string - component reference "c:componentName"
     * param - object - component parameters {attributeA: "", attributeB:""}
     * param - boolean - whether or not the component needs to be rendered)
     */
    $T.createComponent(
      "c:uswdsHero",
      {
        heroImgName: testData.heroImgName,
        heroImgAltText: testData.heroImgAltText
      },
      true
    )
      .then(function (component) {
        const regex = new RegExp(
          `background-image: url\(.*?\/file-asset\/${testData.heroImgName}.*?)`
        );
        expect(
          document.querySelectorAll(".usa-hero")[0].getAttribute("style")
        ).toMatch(regex);
        expect(
          document.querySelectorAll(".usa-hero")[0].getAttribute("aria-label")
        ).toEqual(testData.heroImgAltText);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("component throws builderNotification error if alt text not set", function (done) {
    $T.createComponent(
      "c:uswdsHero",
      {
        heroImgName: testData.heroImgName,
        heroImgAltText: ""
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
          "Alt Text is missing for the background image. Here is more info about how to write great alt text, https://www.w3.org/TR/WCAG20-TECHS/H37.html"
        );
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
});
