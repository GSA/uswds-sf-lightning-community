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
        component.find("notifLib").showToast({
          title: "Error - USWDS Card List",
          message: `Validation error, the '${cardFields[i]}' property is missing. Error was found at card index number ${index} of the card object. Attributes: \n\n ${cardToString}`,
          variant: "error",
          mode: "sticky"
        });
      }
    }
  }
});
