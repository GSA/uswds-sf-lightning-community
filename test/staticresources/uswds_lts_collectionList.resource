describe("Collection List", function () {
  // declare any variables that need to be available in each test
  var defaultCollectionArray;
  beforeEach(function () {
    defaultCollectionArray = [
      {
        collectionType: "default",
        headingContent: "Gears of Government President’s Award winners",
        headingUrl:
          "https://trumpadministration.archives.performance.gov/presidents-winners-press-release/",
        description:
          "Today, the Administration announces the winners of the Gears of Government President’s Award. This program recognizes the contributions of individuals and teams across the federal workforce who make a profound difference in the lives of the American people.",
        metaAuthor: "By Sondra Ainsworth and Constance Lu",
        metaPublishingDate: "2020-09-30T12:00:00+01:00",
        tags: [
          { title: "New", new: true },
          { title: "PMA", new: false },
          { title: "OMB", new: false }
        ],
        imgSrc: "",
        imgAltText: "",
        metaTitle: ""
      },
      {
        collectionType: "default",
        headingContent: "Women-owned small business dashboard",
        headingUrl:
          "https://trumpadministration.archives.performance.gov/sba-wosb-dashboard/",
        description:
          "In honor of National Women’s Small Business Month, we’ve partnered with SBA’s Office of Government Contracting and Business Development and Office of Program Performance, Analysis, and Evaluation to highlight the Women-Owned Small Businesses (WOSBs) data dashboard!",
        metaAuthor: "By Constance Lu",
        metaPublishingDate: "2020-09-30T12:00:00+01:00",
        tags: [{ title: "SBA", new: false }],
        imgSrc: "",
        imgAltText: "",
        metaTitle: ""
      },
      {
        collectionType: "default",
        headingContent:
          "September 2020 updates show progress on cross-agency and agency priority goals",
        headingUrl:
          "https://trumpadministration.archives.performance.gov/September-2020-Updates-Show-Progress/",
        description:
          "Today, we published progress updates for both Cross-Agency Priority (CAP) Goals and Agency Priority Goals (APGs) for the third quarter of FY2020. These updates highlight recent milestones and accomplishments as well as related initiatives that support progress towards a more modern and effective government.",
        metaAuthor: "By Eric L. Miller",
        metaPublishingDate: "2020-09-17T12:00:00+01:00",
        tags: [
          { title: "Quarterly update", new: false },
          { title: "CAP goal", new: false },
          { title: "APG", new: false },
          { title: "PMA", new: false },
          { title: "Success story", new: false }
        ],
        imgSrc: "",
        imgAltText: "",
        metaTitle: ""
      }
    ];
  });
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });
  it("Renders the correct number of compoments", function (done) {
    /**
     * createComponent - generates a component for testing
     * param - string - component reference "c:componentName"
     * param - object - component parameters {attributeA: "", attributeB:""}
     * param - boolean - whether or not the component needs to be rendered)
     */

    $T.createComponent(
      "c:uswdsCollectionList",
      { collectionData: defaultCollectionArray },
      true
    )
      .then(function (component) {
        expect(
          document.querySelectorAll(".usa-collection > li").length
        ).toEqual(3);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("Does not render any components when an empty array is passed", function (done) {
    /**
     * createComponent - generates a component for testing
     * param - string - component reference "c:componentName"
     * param - object - component parameters {attributeA: "", attributeB:""}
     * param - boolean - whether or not the component needs to be rendered)
     */

    $T.createComponent("c:uswdsCollectionList", { collectionData: [] }, true)
      .then(function (component) {
        expect(
          document.querySelectorAll(".usa-collection > li").length
        ).toEqual(0);
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
});
