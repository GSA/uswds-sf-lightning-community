({
  navigate: function (cmp, event, helper) {
    var destination = event.target.id;
    var urlEvent = $A.get("e.force:navigateToURL");
    urlEvent.setParams({
      url: destination
    });
    urlEvent.fire();
  },
  updateCard: function (cmp, event, helper) {
    var cardType = cmp.get("v.cardElement.cardType");
    var cardsPerRow = cmp.get("v.cardElement.cardsPerRow");

    var cardLi = cmp.find("uswdsCard-li");
    var cardMedia = cmp.find("uswdsCard-media");
    var flagLi = cmp.find("uswdsFlag-li");

    /* Cards Per Row */
    if (cardsPerRow != 3) {
      if (cardsPerRow == 2) {
        $A.util.removeClass(cardLi, "tablet:grid-col-4");
        $A.util.addClass(cardLi, "tablet:grid-col-6");
      }
      if (cardsPerRow == 4) {
        $A.util.removeClass(cardLi, "tablet:grid-col-4");
        $A.util.addClass(cardLi, "tablet:grid-col-3");
      }
    }

    /* Inset Media */
    if (cardType == "Inset Media") {
      $A.util.addClass(cardMedia, "usa-card__media--inset");
    }

    /* Adjust display of Header and media*/
    if (cardType == "Card") {
      $A.util.addClass(cardMedia, "nodisplay");
    }
    if (cardType == "Media and Header First") {
      $A.util.addClass(cardLi, "usa-card--header-first");
    }

    /* Flag Right */
    if (cardType == "Flag Right") {
      $A.util.addClass(flagLi, "usa-card--media-right");
    }
  }
});
