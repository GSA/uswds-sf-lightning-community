({
  doInit: function (component, event, helper) {
    var heroImgName = component.get("v.heroImgName");
    // dynamically fetch contentAsset using name input into heroImg attribute
    var heroImg = $A.getReference("$ContentAsset." + heroImgName);
    component.set("v.heroReference", heroImg);
  }
});
