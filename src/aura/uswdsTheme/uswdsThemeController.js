({
	doInit : function(cmp, event, helper) {
    var toggle = cmp.get("v.footerEmailSignUpToggle");
    if (toggle == 'On') {
      var footerSecondary1 = cmp.find('footer_secondary_1');
      var footerSecondary2 = cmp.find('footer_secondary_2');
      $A.util.removeClass(footerSecondary1, 'mobile-lg:grid-col-6');
      $A.util.removeClass(footerSecondary2, 'mobile-lg:grid-col-6');
      $A.util.addClass(footerSecondary1, 'mobile-lg:grid-col-4');
      $A.util.addClass(footerSecondary2, 'mobile-lg:grid-col-4');
    }
	}
})