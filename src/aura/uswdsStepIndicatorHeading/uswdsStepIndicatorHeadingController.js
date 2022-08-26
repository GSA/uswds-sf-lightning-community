({
  doInit: function (component, event, helper) {
    const lang = component.get("v.language");
    const languageContent = helper.getLanguageContent(component, lang);
    component.set("v.languageContent", languageContent);

    helper.validateCounters(component);
  }
});
