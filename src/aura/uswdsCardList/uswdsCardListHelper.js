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

    // ensure all cardFields are present in the individual cardData object that is provided
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
          message: `Validation error, cardData did not provide all expected object keys. Specifics have been logged to the developer console for  review.`,
          variant: "warning",
          mode: "sticky"
        });
      }
    }
    // Check to see that the cardType value is valid
    var validCardTypes = [
      "Card",
      "Card with Media",
      "Media and Header First",
      "Inset Media",
      "Exdent Media",
      "Flag Right",
      "Flag Left"
    ];
    if (!validCardTypes.includes(cardData.cardType)) {
      console.warn(
        `Error - USWDS Card List. \n Error on card no ${index}. An invalid cardType value was provided. Value found: ${
          cardData.cardType
        }. Valid values: ${validCardTypes.toString()}.`
      );
      component.find("notifLib").showToast({
        title: "Error - USWDS Card List",
        message: `Validation error, invalid cardData value provided. Specific details are logged to the developer console for your review.`,
        variant: "warning",
        mode: "sticky"
      });
    }
  }
});
