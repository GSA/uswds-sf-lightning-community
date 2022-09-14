describe("Card List", function () {
  // declare any variables that need to be available in each test
  var validCardData, invalidCardType, missingCardField;
  beforeEach(function () {
    validCardData = [
      {
        cardType: "Card",
        cardsPerRow: "3",
        header: "Card",
        body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        buttonLinkUrl: "/contactsupport",
        buttonLinkText: "Contact Support",
        mediaUrl: "",
        mediaAltText: "A placeholder image"
      }
    ];
    invalidCardType = validCardData;
    invalidCardType[0].cardType = "blah";

    missingCardField = [
      {
        cardType: "Card",
        cardsPerRow: "3",
        header: "Card",
        buttonLinkUrl: "/contactsupport",
        buttonLinkText: "Contact Support",
        mediaUrl: $A.get("$ContentAsset.test_uswdsCardImage"),
        mediaAltText: "A placeholder image"
      }
    ];
  });
  afterEach(function () {
    // Each spec (test) renders its components into the same div,
    // so we need to clear that div out at the end of each spec.
    $T.clearRenderedTestComponents();
  });
  it("Displays an error message if an invalid cardType is provided", function (done) {
    $T.createComponent("c:uswdsCardList", { cardData: invalidCardType }, true)
      .then(function (component) {
        component.processCardData();

        expect(
          document.querySelectorAll(".slds-notify__content", "p")[0].textContent
        ).toContain(
          `Validation error, invalid cardType value provided. Specific details are logged to the developer console for your review.`
        );
        // end this spec successfully
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
  it("Displays an error message if all cardList object keys are not present", function (done) {
    $T.createComponent("c:uswdsCardList", { cardData: missingCardField }, true)
      .then(function (component) {
        component.processCardData();

        expect(
          document.querySelectorAll(".slds-notify__content", "p")[0].textContent
        ).toContain(
          `Validation error, cardData did not provide all expected object keys. Specifics have been logged to the developer console for  review.`
        );
        // end this spec successfully
        done();
      })
      .catch(function (e) {
        done.fail(e);
      });
  });
});
