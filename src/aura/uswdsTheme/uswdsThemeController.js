({
  doInit: function (cmp, event, helper) {
    var footerEmailSignUpToggle = cmp.get("v.footerEmailSignUpToggle");
    if (footerEmailSignUpToggle == "On") {
      var footerSecondary1 = cmp.find("footer_secondary_1");
      var footerSecondary2 = cmp.find("footer_secondary_2");
      $A.util.removeClass(footerSecondary1, "mobile-lg:grid-col-6");
      $A.util.removeClass(footerSecondary2, "mobile-lg:grid-col-6");
      $A.util.addClass(footerSecondary1, "mobile-lg:grid-col-4");
      $A.util.addClass(footerSecondary2, "mobile-lg:grid-col-4");
    }

    var loginToggle = cmp.get("v.displayLogin");
    if (loginToggle == "No") {
      var shoppingCart = cmp.find("shoppingCart");
      $A.util.addClass(shoppingCart, "grid-offset-10");
    }

    /* Container Width */
    var containerWidth = cmp.get("v.containerWidth");
    var mainContent = cmp.find("mainContent");
    var containerToClasses = {
      Full: "",
      Standard: "grid-container",
      Wide: "grid-container-widescreen"
    };
    $A.util.addClass(mainContent, containerToClasses[containerWidth]);
  }
});
