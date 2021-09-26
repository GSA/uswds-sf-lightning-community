({
  doInit: function (cmp, event, helper) {
    var footerEmailSignUpToggle = cmp.get("v.footerEmailSignUpToggle");
    var footerSecondary1 = cmp.find("footer_secondary_1");
    var footer_socialMediaNav = cmp.find("footer_socialMediaNav");
    var footer_ContactCenter = cmp.find("footer_ContactCenter");
    if (footerEmailSignUpToggle == "On") {
      $A.util.removeClass(footerSecondary1, "mobile-lg:grid-col-12");
      $A.util.addClass(footerSecondary1, "mobile-lg:grid-col-6");
      $A.util.addClass(footer_socialMediaNav, "mobile-lg:grid-col-12");
      $A.util.addClass(footer_ContactCenter, "mobile-lg:grid-col-12");
    } else {
      $A.util.addClass(footer_socialMediaNav, "mobile-lg:grid-col-6");
      $A.util.addClass(footer_socialMediaNav, "margin-auto");
      $A.util.addClass(footer_socialMediaNav, "zero-padding-bottom");
      $A.util.addClass(footer_socialMediaNav, "footer-float-left");
      $A.util.addClass(footer_ContactCenter, "mobile-lg:grid-col-6");
    }

    var loginToggle = cmp.get("v.displayLogin");
    if (loginToggle == "No") {
      var shoppingCart = cmp.find("shoppingCart");
      $A.util.addClass(shoppingCart, "grid-offset-10");
    }

    /* logo Type */
    var logoType = cmp.get("v.logoType");
    if (logoType == "Wide") {
      var logoContainer = cmp.find("logoContainer");
      $A.util.removeClass(logoContainer, "slds-avatar");
      $A.util.removeClass(logoContainer, "slds-avatar_large");
      var mediaFigure = cmp.find("media-figure");
      $A.util.removeClass(mediaFigure, "slds-media__figure");
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
