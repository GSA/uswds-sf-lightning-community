({
  doInit: function (component, event, helper) {
    component.set("v.defaultData", helper.getDefaultExampleData());
    component.set("v.calendarData", helper.getCalendarExampleData());
    component.set("v.headingData", helper.getHeadingExampleData());
    component.set("v.thumbnailData", helper.getThumbnailExampleData());
  }
});
