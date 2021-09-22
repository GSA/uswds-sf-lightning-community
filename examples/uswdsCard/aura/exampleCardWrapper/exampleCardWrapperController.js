({
  doInit: function (component, event, helper) {
    component.set("v.cardDataMapped", helper.generateDataMapped());
    var cardList = component.find("cardList");
    cardList.processCardData();

    // create data and map
    component.set("v.cardDataNotMapped", helper.generateDataNotMapped());
    component.set("v.dataMap", helper.generateMap());
    var cardListNotMapped = component.find("cardListNotMapped");
    cardListNotMapped.processCardData();

    // create data without Card Type attribute
    component.set("v.cardDataNoCardType", helper.generateDataNoCardType());
    var cardListNoCardType = component.find("cardListNoCardType");
    cardListNoCardType.processCardData();
  }
});
