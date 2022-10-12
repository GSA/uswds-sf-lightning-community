describe("Collection Element", function () {
  // declare any variables that need to be available in each test
  var calendarCollectionData,
    defaultCollectionData,
    headingCollectionData,
    invalidDateCollectionData,
    thumbnailCollectionData;
  beforeEach(function () {
    calendarCollectionData = {
      collectionType: "calendar",
      headingContent: "Example heading content",
      headingUrl: "https://example.gov",
      description: "Example description content",
      metaAuthor: "",
      metaPublishingDate: "2020-09-30T12:00:00+01:00",
      tags: [
        { title: "New", new: true },
        { title: "PMA", new: false },
        { title: "OMB", new: false }
      ],
      imgSrc: "",
      imgAltText: "",
      metaTitle: ""
    };
    defaultCollectionData = {
      collectionType: "default",
      headingContent: "Content Heading",
      headingUrl: "https://example.gov",
      description: "example description",
      metaAuthor: "By Elizabeth Blackwell",
      metaPublishingDate: "2020-09-30T12:00:00+01:00",
      tags: [
        { title: "SBA", new: false },
        { title: "New", new: true }
      ],
      imgSrc: "",
      imgAltText: "",
      metaTitle: ""
    };
    headingCollectionData = {
      collectionType: "heading",
      headingContent: "The USWDS maturity model",
      headingUrl: "https://designsystem.digital.gov/maturity-model/",
      description: "",
      metaAuthor: "",
      metaPublishingDate: "",
      tags: [],
      imgSrc: "",
      imgAltText: "",
      metaTitle: "U.S. Web Design System"
    };
    invalidDateCollectionData = {
      collectionType: "default",
      headingContent: "Content Heading",
      headingUrl: "https://example.gov",
      description: "example description",
      metaAuthor: "By Elizabeth Blackwell",
      metaPublishingDate: "2020-14-30T12:00:00+01:00",
      tags: [
        { title: "SBA", new: false },
        { title: "New", new: true }
      ],
      imgSrc: "",
      imgAltText: "",
      metaTitle: ""
    };
    thumbnailCollectionData = {
      collectionType: "thumbnail",
      headingContent: "Thumbnail heading",
      headingUrl: "https://example.gov",
      description: "thumbnail description content",
      metaAuthor: "By Sondra Ainsworth and Constance Lu",
      metaPublishingDate: "2020-09-30T12:00:00+01:00",
      tags: [
        { title: "New", new: true },
        { title: "PMA", new: false },
        { title: "OMB", new: false }
      ],
      imgSrc: $A.get("$ContentAsset.ex_uswdsCollection_GoGlogopng"),
      imgAltText: "Gears of Government Awards - President's Award",
      metaTitle: ""
    };
  });
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });
  describe("Calendar variant", function () {
    it("displays date block with correct values", function (done) {
      /**
       * createComponent - generates a component for testing
       * param - string - component reference "c:componentName"
       * param - object - component parameters {attributeA: "", attributeB:""}
       * param - boolean - whether or not the component needs to be rendered)
       */

      $T.createComponent(
        "c:uswdsCollectionElement",
        { collectionElement: calendarCollectionData },
        true
      )
        .then(function (component) {
          expect(
            document.getElementsByClassName(
              "usa-collection__calendar-date-month"
            )[0].textContent
          ).toEqual("SEP");
          expect(
            document.getElementsByClassName(
              "usa-collection__calendar-date-day"
            )[0].textContent
          ).toEqual("30");

          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
    it("displays other content given inputs", function (done) {
      /**
       * createComponent - generates a component for testing
       * param - string - component reference "c:componentName"
       * param - object - component parameters {attributeA: "", attributeB:""}
       * param - boolean - whether or not the component needs to be rendered)
       */

      $T.createComponent(
        "c:uswdsCollectionElement",
        { collectionElement: calendarCollectionData },
        true
      )
        .then(function (component) {
          expect(
            document.querySelectorAll(".usa-collection__heading > a")[0]
              .textContent
          ).toEqual(calendarCollectionData.headingContent);
          expect(
            document
              .querySelectorAll(".usa-collection__heading > a")[0]
              .getAttribute("href")
          ).toEqual(calendarCollectionData.headingUrl);
          expect(
            document.getElementsByClassName("usa-collection__meta-item").length
          ).toEqual(3);
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
  });
  describe("Default variant", function () {
    it("displays content given inputs", function (done) {
      /**
       * createComponent - generates a component for testing
       * param - string - component reference "c:componentName"
       * param - object - component parameters {attributeA: "", attributeB:""}
       * param - boolean - whether or not the component needs to be rendered)
       */

      $T.createComponent(
        "c:uswdsCollectionElement",
        { collectionElement: defaultCollectionData },
        true
      )
        .then(function (component) {
          expect(
            document.querySelectorAll(".usa-collection__heading > a")[0]
              .textContent
          ).toEqual(defaultCollectionData.headingContent);
          expect(
            document
              .querySelectorAll(".usa-collection__heading > a")[0]
              .getAttribute("href")
          ).toEqual(defaultCollectionData.headingUrl);
          expect(
            document.querySelectorAll(".usa-collection__meta > li")[0]
              .textContent
          ).toEqual(defaultCollectionData.metaAuthor);
          expect(
            document.querySelectorAll(".usa-collection__meta > li")[1]
              .textContent
          ).toEqual("September 30, 2020");
          expect(
            document
              .querySelectorAll(".usa-collection__meta")[1]
              .querySelectorAll("li").length
          ).toEqual(2);
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
  });
  describe("Heading variant", function () {
    it("displays content given inputs", function (done) {
      /**
       * createComponent - generates a component for testing
       * param - string - component reference "c:componentName"
       * param - object - component parameters {attributeA: "", attributeB:""}
       * param - boolean - whether or not the component needs to be rendered)
       */

      $T.createComponent(
        "c:uswdsCollectionElement",
        { collectionElement: headingCollectionData },
        true
      )
        .then(function (component) {
          expect(
            document.querySelectorAll(".usa-collection__heading > a")[0]
              .textContent
          ).toEqual(headingCollectionData.headingContent);
          expect(
            document
              .querySelectorAll(".usa-collection__heading > a")[0]
              .getAttribute("href")
          ).toEqual(headingCollectionData.headingUrl);
          expect(
            document.querySelectorAll(".usa-collection__meta > li")[0]
              .textContent
          ).toContain(headingCollectionData.metaTitle);
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
  });

  describe("Thumbnail variant", function () {
    it("displays content given inputs", function (done) {
      $T.createComponent(
        "c:uswdsCollectionElement",
        { collectionElement: thumbnailCollectionData },
        true
      )
        .then(function (component) {
          expect(
            document.querySelectorAll(".usa-collection__heading > a")[0]
              .textContent
          ).toEqual(thumbnailCollectionData.headingContent);
          expect(
            document
              .querySelectorAll(".usa-collection__heading > a")[0]
              .getAttribute("href")
          ).toEqual(thumbnailCollectionData.headingUrl);
          expect(
            document.querySelectorAll(".usa-collection__meta > li")[0]
              .textContent
          ).toContain(thumbnailCollectionData.metaTitle);
          expect(
            document.querySelectorAll(".usa-collection__meta > li")[1]
              .textContent
          ).toEqual("September 30, 2020");
          expect(
            document
              .querySelectorAll(".usa-collection__meta")[1]
              .querySelectorAll("li").length
          ).toEqual(3);
          expect(
            document
              .querySelectorAll(".usa-collection__item > img")[0]
              .getAttribute("src")
          ).toContain("ex_uswdsCollection_GoGlogopng");
          expect(
            document
              .querySelectorAll(".usa-collection__item > img")[0]
              .getAttribute("alt")
          ).toEqual(thumbnailCollectionData.imgAltText);
          expect(
            document
              .querySelectorAll(".usa-collection__item > img")[0]
              .getAttribute("alt")
          ).toEqual(thumbnailCollectionData.imgAltText);
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
  });
  describe("Date Validation", function () {
    it("returns an error message if an invalid date was provided", function (done) {
      /**
       * createComponent - generates a component for testing
       * param - string - component reference "c:componentName"
       * param - object - component parameters {attributeA: "", attributeB:""}
       * param - boolean - whether or not the component needs to be rendered)
       */

      $T.createComponent(
        "c:uswdsCollectionElement",
        { collectionElement: invalidDateCollectionData },
        true
      )
        .then(function (component) {
          expect(
            document.querySelectorAll(".slds-notify__content", "p")[0]
              .textContent
          ).toContain(
            `Validation error, an invalid date value was provided. Valid JavaScript date formats are supported. Additional details are logged to the console.`
          );
          done();
        })
        .catch(function (e) {
          done.fail(e);
        });
    });
  });
});
