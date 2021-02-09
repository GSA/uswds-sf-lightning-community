({
  doInit: function (cmp, event, helper) {
    var identifierType = cmp.get("v.identifierType");
    var agencyName = cmp.get("v.agencyName");
    var agencyURL = cmp.get("v.agencyURL");
    var agencyName2 = cmp.get("v.agencyName2");
    var agencyURL2 = cmp.get("v.agencyURL2");
    var agencyLogo2 = cmp.get("v.agencyLogo2");
    var identityDomain = cmp.get("v.identityDomain");
    var content = helper.contentMap(
      identifierType,
      identityDomain,
      agencyName,
      agencyURL,
      agencyName2,
      agencyURL2
    );
    cmp.set("v.identifierContent", content);

    // dynamically fetch contentAsset using name input into agencyLogo2 attribute
    var agencyLogoReference2 = $A.getReference("$ContentAsset." + agencyLogo2);
    cmp.set("v.agencyLogoReference2", agencyLogoReference2);
  },
  onClick: function (component, event, helper) {
    var id = event.target.dataset.menuItemId;
    if (id) {
      component.getSuper().navigate(id);
    }
  }
});
