({
  processCardData: function (cmp, event, helper) {
    var cardData = cmp.get("v.cardData");
    var cardDataMap = cmp.get("v.dataMap");
    var cardType = cmp.get("v.cardType");
    // loop performs 2 operations. 1) checks for and if needed, maps keys. 2) Adds cardType property to object
    for (var i = 0; i < cardData.length; i++) {
      if (cardDataMap != null) {
        // user passed a data map, rename keys on their behalf and then pass to v.processedCardData
        for (const property in cardDataMap) {
          // only try to replace the property if the object contains it. Otherwise, error gets thrown
          if (cardData[i].hasOwnProperty(property)) {
            Object.defineProperty(
              cardData[i],
              cardDataMap[property],
              Object.getOwnPropertyDescriptor(cardData[i], property)
            );
            // delete the property that was replaced
            delete cardData[i][property];
          }
        }
      }
      // if cardType property does not exist, add it
      if (!cardData[i].hasOwnProperty("cardType")) {
        cardData[i].cardType = cardType;
      }
      helper.validateCardData(cardData[i], i, cmp, event, helper);
    }
    // now that all of the cardData is processed, set the attribute
    cmp.set("v.processedCardData", cardData);
  }
});
