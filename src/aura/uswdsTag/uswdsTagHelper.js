({
  getColor: function (component, color) {
    const colorLowercase = color.toLowerCase();
    const colorMap = {
      default: "",
      "red cool": "red-cool-vivid",
      "red warm": "red-warm-vivid",
      red: "red-vivid",
      "orange warm": "orange-warm-vivid",
      orange: "orange-vivid",
      gold: "gold-vivid",
      yellow: "yellow-vivid",
      "green warm": "green-warm-vivid",
      green: "green-vivid",
      "green cool": "green-cool-vivid",
      mint: "mint-vivid",
      "mint cool": "mint-cool-vivid",
      cyan: "cyan-vivid",
      "blue cool": "blue-cool-vivid",
      blue: "blue-vivid",
      "blue warm": "blue-warm-vivid",
      "indigo cool": "indigo-cool-vivid",
      indigo: "indigo-vivid",
      "indigo warm": "indigo-warm-vivid",
      violet: "violet-vivid",
      "violet warm": "violet-warm-vivid",
      magenta: "magenta-vivid"
    };
    if (colorMap.hasOwnProperty(colorLowercase)) {
      return colorMap[colorLowercase];
    } else {
      component.find("builderNotification").addNotification({
        title: "Error - USWDS Tag",
        message: `Provided color value "${colorLowercase}" does not exist for this component. The default color will be displayed. A list of valid values are logged to the developer console.`
      });
      //{Object.keys(colorMap).map((x) => x + "\n"
      const validValues = Object.keys(colorMap);
      console.warn(
        `Error - USWDS Tag.`,
        `The provided color value does not exist. Valid color values are:`,
        validValues
      );
      return colorMap.default;
    }
  }
});
