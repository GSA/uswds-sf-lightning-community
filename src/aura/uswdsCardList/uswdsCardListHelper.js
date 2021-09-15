({
  validateCardData: function (cardData, index, component, event, helper) {
    var cardFields = [
      "cardType",
      "cardsPerRow",
      "header",
      "body",
      "buttonLinkUrl",
      "buttonLinkText",
      "mediaUrl",
      "mediaAltText"
    ];
    for (var i = 0; i < cardFields.length; i++) {
      if (!cardData.hasOwnProperty(cardFields[i])) {
        var cardToString = Object.keys(cardData)
          .map((card) => "'" + card + "' : '" + cardData[card] + "'")
          .join("\n");
        console.warn(
          `Error - USWDS Card List. \n Error on card no ${index}. Expecting key '${cardFields[i]}' but it was not found. Instead, the following was presented: \n\n ${cardToString}`
        );
        component.find("notifLib").showToast({
          title: "Error - USWDS Card List",
          message: `Validation error, specifics have been logged to the developer console for your review.`,
          variant: "warning",
          mode: "sticky"
        });
      }
    }
  }
});
