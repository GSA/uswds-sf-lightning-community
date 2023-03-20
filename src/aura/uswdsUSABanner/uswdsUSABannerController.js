({
  doInit: function (cmp, event, helper) {
    var bannerType = cmp.get("v.bannerType");
    var content = helper.contentMap(bannerType);
    cmp.set("v.bannerContent", content);
  },
  onRender: function (cmp, event, helper) {
    helper.updateHidden(cmp, helper);
  }
});
