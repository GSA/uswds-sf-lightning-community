({
  doInit: function (component, event, helper) {
    var heroImgName = component.get("v.heroImgName");
    // a blank heroImgName will render the default picture from USWDS
    if (heroImgName != "") {
      // dynamically fetch contentAsset using name input into heroImg attribute
      var heroImg = $A.getReference("$ContentAsset." + heroImgName);
      component.set("v.style", "background-image: url");
      component.set("v.heroReference", heroImg);
      helper.validate(component);
    } else {
      component.set("v.style", "");
    }
  }
});
