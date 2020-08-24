({
  contentMap: function (val) {
    // set default content to Gov English / Spanish
    var content = {
      headerText: "An official website of the United States government",
      headerAction: "Here’s how you know",
      officialTop: "Official websites use .gov",
      officialContent:
        "A <strong>.gov</strong> website belongs to an official government organization in the United States.",
      secureTop: "Secure .gov websites use HTTPS",
      secureContent:
        "<strong>https://</strong> means you’ve safely connected to the .gov website. Share sensitive information only on official, secure websites."
    };
    if (val == "Gov Spanish") {
      content.headerText = "Un sitio oficial del Gobierno de Estados Unidos";
      content.headerAction = "Así es como usted puede verificarlo";
      content.officialTop = "Los sitios web oficiales usan .gov";
      content.officialContent =
        "Un sitio web <strong>.gov</strong> pertenece a una organización oficial del Gobierno de Estados Unidos.";
      content.secureTop = "Los sitios web seguros .gov usan HTTPS";
      content.secureContent =
        "<strong>https://</strong> significa que usted se conectó de forma segura a un sitio web .gov. Comparta información sensible sólo en sitios web oficiales y seguros.";
    } else if (val == "Mil English") {
      content.headerText =
        "An official website of the United States government";
      content.headerAction = "Here’s how you know";
      content.officialTop = "Official websites use .mil";
      content.officialContent =
        "A <strong>.mil</strong> website belongs to an official U.S. Department of Defense organization.";
      content.secureTop = "Secure .mil websites use HTTPS";
      content.secureContent =
        "<strong>https://</strong> means you’ve safely connected to the .mil website. Share sensitive information only on official, secure websites.";
    } else if (val == "Mil Spanish") {
      content.headerText = "Un sitio oficial del Gobierno de Estados Unidos";
      content.headerAction = "Así es como usted puede verificarlo";
      content.officialTop = "Los sitios web oficiales usan .mil";
      content.officialContent =
        "Un sitio web <strong>.mil</strong> pertenece a una organización oficial del Departamento de Defensa de EE. UU.";
      content.secureTop = "Los sitios web seguros .mil usan HTTPS";
      content.secureContent =
        "<strong>https://</strong> significa que usted se conectó de forma segura a un sitio web .mil. Comparta información sensible sólo en sitios web oficiales y seguros.";
    }
    return content;
  }
});
