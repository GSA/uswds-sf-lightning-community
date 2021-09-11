({
  doInit: function (component, event, helper) {},
  processCardData: function (cmp, event, helper) {
    var cardData = cmp.get("v.cardData");
    var cardDataMap = cmp.get("v.dataMap");
    // no data map, send data
    if (cardDataMap == null) {
      cmp.set("v.processedCardData", cardData);
    } else {
      // user passed a data map, rename keys on their behalf and then pass to v.processedCardData
      for (var i = 0; i < cardData.length; i++) {
        for (const property in cardDataMap) {
          Object.defineProperty(
            cardData[i],
            cardDataMap[property],
            Object.getOwnPropertyDescriptor(cardData[i], property)
          );
          delete cardData[i][property];
        }
      }
      cmp.set("v.processedCardData", cardData);
    }
  }
});
