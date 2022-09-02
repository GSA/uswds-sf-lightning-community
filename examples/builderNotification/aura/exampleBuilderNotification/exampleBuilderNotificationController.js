({
  onClick: function (component, event, helper) {
    component.find("builderNotification").addNotification([
      {
        title: "Developer Warning A",
        message: "Something caused an error."
      },
      {
        title: "Developer Warning B",
        message: "Here is another thing that caused an error."
      }
    ]);
  }
});
