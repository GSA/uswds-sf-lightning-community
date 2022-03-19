describe("USA Banner", function () {
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });

  it("properly renders with default settings", function (done) {
    $T.createComponent("c:uswdsUSABanner", {}, true)
      .then(function (component) {
        expect(
          document.getElementsByClassName("usa-banner__header-text")[0]
            .textContent
        ).toContain("An official website of the United States government");
        expect(
          document.getElementsByClassName("usa-banner__header-action")[0]
            .textContent
        ).toContain("Here’s how you know");
        expect(
          document.getElementsByClassName("usa-media-block__body")[0]
            .textContent
        ).toContain("Official websites use .gov");
        // end this spec successfully
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });

  it("returns default settings (.gov english) if an invalid bannerType attribute is passed", function (done) {
    $T.createComponent("c:uswdsUSABanner", { bannerType: "Foo" }, true)
      .then(function (component) {
        expect(
          document.getElementsByClassName("usa-banner__header-text")[0]
            .textContent
        ).toContain("An official website of the United States government");
        expect(
          document.getElementsByClassName("usa-banner__header-action")[0]
            .textContent
        ).toContain("Here’s how you know");
        expect(
          document
            .getElementsByClassName("usa-banner cUswdsUSABanner")[0]
            .attributes.getNamedItem("aria-label").value
        ).toContain("U.S. Government Website");
        expect(
          document.getElementsByClassName("usa-media-block__body")[0]
            .textContent
        ).toContain("Official websites use .gov");
        // end this spec successfully
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });

  it("sets the siteName attribute when a value is passed", function (done) {
    $T.createComponent("c:uswdsUSABanner", { siteName: "Awesome Site" }, true)
      .then(function (component) {
        expect(
          document
            .getElementsByClassName("usa-banner cUswdsUSABanner")[0]
            .attributes.getNamedItem("aria-label").value
        ).toBe("Awesome Site");
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });

  it("appropriately adjusts banner content when 'Mil English' is passed as the bannerType attribute", function (done) {
    $T.createComponent("c:uswdsUSABanner", { bannerType: "Mil English" }, true)
      .then(function (component) {
        expect(
          document.getElementsByClassName("usa-banner__header-text")[0]
            .textContent
        ).toContain("An official website of the United States government");
        expect(
          document.getElementsByClassName("usa-banner__header-action")[0]
            .textContent
        ).toContain("Here’s how you know");
        expect(
          document.getElementsByClassName("usa-media-block__body")[0]
            .textContent
        ).toContain("Official websites use .mil");
        // end this spec successfully
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });

  it("adjusts banner content when 'Gov Spanish' is passed as the bannerType attribute", function (done) {
    $T.createComponent("c:uswdsUSABanner", { bannerType: "Gov Spanish" }, true)
      .then(function (component) {
        expect(
          document.getElementsByClassName("usa-banner__header-text")[0]
            .textContent
        ).toContain("Un sitio oficial del Gobierno de Estados Unidos");
        expect(
          document.getElementsByClassName("usa-banner__header-action")[0]
            .textContent
        ).toContain("Así es como usted puede verificarlo");
        expect(
          document.getElementsByClassName("usa-media-block__body")[0]
            .textContent
        ).toContain("Los sitios web oficiales usan .gov");
        // end this spec successfully
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });

  it("adjusts banner content when 'Mil Spanish' is passed as the bannerType attribute", function (done) {
    $T.createComponent("c:uswdsUSABanner", { bannerType: "Mil Spanish" }, true)
      .then(function (component) {
        expect(
          document.getElementsByClassName("usa-banner__header-text")[0]
            .textContent
        ).toContain("Un sitio oficial del Gobierno de Estados Unidos");
        expect(
          document.getElementsByClassName("usa-banner__header-action")[0]
            .textContent
        ).toContain("Así es como usted puede verificarlo");
        expect(
          document.getElementsByClassName("usa-media-block__body")[0]
            .textContent
        ).toContain("Los sitios web oficiales usan .mil");
        // end this spec successfully
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
});
