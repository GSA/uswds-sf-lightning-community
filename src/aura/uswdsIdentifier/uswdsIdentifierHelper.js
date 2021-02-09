({
  contentMap: function (
    identifierType,
    identityDomain,
    agencyName,
    agencyURL,
    agencyName2,
    agencyURL2,
    agencyLogo2
  ) {
    // if user entered a full url for identityDomain, strip out https:// and anything at the end
    var regex = /(http:\/\/|https:\/\/)/;
    var regex2 = /(\/$|\/\w+$)/;
    identityDomain = identityDomain.replace(regex, "").replace(regex2, "");

    // default english language content
    var content = {
      English: {
        identifierAria: "Agency Identifier",
        identifierLogoAlt: agencyName + " Logo",
        identityAria: "Agency Description",
        identityDomain: identityDomain,
        identityDisclaimer:
          "An official website of the <a href='" +
          agencyURL +
          "' class='usa-link'>" +
          agencyName +
          "</a>",
        requiredLinksAria: "Important Links",
        usaGovAria: "U.S. Government information and services",
        usaGovDescription:
          "Looking for U.S. government information and services?",
        usaGovLinkText: "Visit USA.gov"
      },
      Spanish: {
        identifierAria: "Identificador de la agencia",
        identifierLogoAlt: agencyName + " Logo",
        identityAria: "Descripción de la agencia",
        identityDomain: identityDomain,
        identityDisclaimer:
          "Un sitio web oficial de <a href='" +
          agencyURL +
          "' class='usa-link'>" +
          agencyName +
          "</a>",
        requiredLinksAria: "Enlaces importantes",
        usaGovAria: "Información y servicios del Gobierno de EE. UU.",
        usaGovDescription: "¿Necesita información y servicios del Gobierno?",
        usaGovLinkText: "Visite USAGov en Español"
      },
      "Multi w Logo English": {
        identifierAria: "Agency Identifier",
        identifierLogoAlt: agencyName + " Logo",
        identityAria: "Agency Description",
        identityDomain: identityDomain,
        identifierLogoAlt2: agencyName2 + " Logo",
        identityDisclaimer:
          "An official website of the <a href='" +
          agencyURL +
          "' class='usa-link'>" +
          agencyName +
          "</a> and the <a href='" +
          agencyURL2 +
          "' class='usa-link'>" +
          agencyName2 +
          "</a>",
        requiredLinksAria: "Important Links",
        usaGovAria: "U.S. Government information and services",
        usaGovDescription:
          "Looking for U.S. government information and services?",
        usaGovLinkText: "Visit USA.gov"
      },
      "Multi w Logo Spanish": {
        identifierAria: "Identificador de la agencia",
        identifierLogoAlt: agencyName + " Logo",
        identityAria: "Descripción de la agencia",
        identityDomain: identityDomain,
        identifierLogoAlt2: agencyName2 + " Logo",
        identityDisclaimer:
          "Un sitio web oficial de <a href='" +
          agencyURL +
          "' class='usa-link'>" +
          agencyName +
          "</a> y <a href='" +
          agencyURL2 +
          "' class='usa-link'>" +
          agencyName2 +
          "</a>",
        requiredLinksAria: "Enlaces importantes",
        usaGovAria: "Información y servicios del Gobierno de EE. UU.",
        usaGovDescription: "¿Necesita información y servicios del Gobierno?",
        usaGovLinkText: "Visite USAGov en Español"
      },
      "Taxpayer Disclaimer English": {
        identifierAria: "Agency Identifier",
        identifierLogoAlt: agencyName + " Logo",
        identityAria: "Agency Description",
        identityDomain: identityDomain,
        identityDisclaimer:
          "An official website of the <a href='" +
          agencyURL +
          "' class='usa-link'>" +
          agencyName +
          "</a>. Produced and published at taxpayer expense.",
        requiredLinksAria: "Important Links",
        usaGovAria: "U.S. Government information and services",
        usaGovDescription:
          "Looking for U.S. government information and services?",
        usaGovLinkText: "Visit USA.gov"
      },
      "Taxpayer Disclaimer Spanish": {
        identifierAria: "Identificador de la agencia",
        identifierLogoAlt: agencyName + " Logo",
        identityAria: "Descripción de la agencia",
        identityDomain: identityDomain,
        identityDisclaimer:
          "Un sitio web oficial de <a href='" +
          agencyURL +
          "' class='usa-link'>" +
          agencyName +
          "</a>. Producido y publicado con dinero de los contribuyentes de impuestos.",
        requiredLinksAria: "Enlaces importantes",
        usaGovAria: "Información y servicios del Gobierno de EE. UU.",
        usaGovDescription: "¿Necesita información y servicios del Gobierno?",
        usaGovLinkText: "Visite USAGov en Español"
      }
    };
    // if user selects a "no logo" variety, just pull the text for the base english or spanish variant- logo hiding will occur in the cmp
    if (identifierType == "No Logo English") {
      identifierType = "English";
    } else if (identifierType == "No Logo Spanish") {
      identifierType = "Spanish";
    }
    return content[identifierType];
  }
});
