({
  getContent: function (component, event, helper) {
    var selectedCType = component.get("v.contentType");
    var selectedMCIds = component.get("v.managedContentIds");
    var selectedTopics = component.get("v.topicNames");
    var selectedLanguage = component.get("v.language");
    var contentAction = component.get("c.getMContent");

    if (selectedMCIds) {
      contentAction.setParam("managedContentIds_str", selectedMCIds);
    }
    contentAction.setParam("topicNames_str", selectedTopics);
    contentAction.setParam("language", "en_US");
    if (selectedCType) {
      contentAction.setParam("contentType", selectedCType);
    }
    contentAction.setCallback(this, function (action) {
      var state = action.getState();

      if (state === "SUCCESS") {
        component.set("v.contentList", action.getReturnValue());
        component.set(
          "v.cardData",
          helper.prepCardData(component.get("v.contentList"))
        );
        var contentCard = component.find("contentCard");
        contentCard.processCardData();
      } else {
        console.warn(
          `Error - ex Card CMS. \n Fetching data from the controller resulted in an error. Double check permissions of 'ManagedContentControllerForLex' Apex Class to ensure the Guest User Profile for this community has appropriate access.`
        );
        component.find("notifLib").showToast({
          title: "Error - ex Card CMS",
          message: `Validation error, specifics have been logged to the developer console for your review.`,
          variant: "warning",
          mode: "sticky"
        });
      }
    });
    $A.enqueueAction(contentAction);
  }
});
