({
  doInit: function (component, event, helper) {},
  processCardData: function (cmp, event, helper) {
    var cardData = cmp.get("v.cardData");
    var cardDataMap = cmp.get("v.dataMap");
    var cardType = cmp.get("v.cardType");
    // loop performs 2 operations. 1) checks for and if needed, maps keys. 2) Adds cardType property to object
    for (var i = 0; i < cardData.length; i++) {
      if (cardDataMap != null) {
        // user passed a data map, rename keys on their behalf and then pass to v.processedCardData
        for (const property in cardDataMap) {
          if (cardData[i].hasOwnProperty(property)) {
            Object.defineProperty(
              cardData[i],
              cardDataMap[property],
              Object.getOwnPropertyDescriptor(cardData[i], property)
            );
            delete cardData[i][property];
          }
        }
      }
      if (!cardData[i].hasOwnProperty("cardType")) {
        cardData[i].cardType = cardType;
      }
    }
    cmp.set("v.processedCardData", cardData);
  }
});
