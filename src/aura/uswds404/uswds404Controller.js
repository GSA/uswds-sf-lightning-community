({
  doInit: function (cmp, event, helper) {
    var language = cmp.get("v.language");
    var content = helper.getContent(language);
    cmp.set("v.pageContent", content);
  },
  gotoHome: function (cmp, event, helper) {
    var urlEvent = $A.get("e.force:navigateToURL");
    var homeUrl = cmp.get("v.urlPattern");
    urlEvent.setParams({
      url: homeUrl
    });
    urlEvent.fire();
  },
  gotoForm: function (cmp, event, helper) {
    var urlEvent = $A.get("e.force:navigateToURL");
    var formUrl = cmp.get("v.formUrl");
    //expecting the formUrl to be a relative URL if within community or fully qualified URL "https://blah.gov"
    urlEvent.setParams({
      url: formUrl
    });
    urlEvent.fire();
  }
});
