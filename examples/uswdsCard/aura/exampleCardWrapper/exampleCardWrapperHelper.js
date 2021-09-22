({
  generateDataMapped: function () {
    return [
      {
        cardType: "Card",
        cardsPerRow: "3",
        header: "Card",
        body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        buttonLinkUrl: "/contactsupport",
        buttonLinkText: "Contact Support",
        mediaUrl: $A.get("$ContentAsset.ex_uswdsCard"),
        mediaAltText: "A placeholder image"
      },
      {
        cardType: "Card with Media",
        cardsPerRow: "3",
        header: "Card with Media",
        body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
        buttonLinkUrl: "/contactsupport",
        buttonLinkText: "Contact Support",
        mediaUrl: $A.get("$ContentAsset.ex_uswdsCard"),
        mediaAltText: "A placeholder image"
      },
      {
        cardType: "Media and Header First",
        cardsPerRow: "3",
        header: "Media and Header First",
        body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        buttonLinkUrl: "",
        buttonLinkText: "Contact Support",
        mediaUrl: $A.get("$ContentAsset.ex_uswdsCard"),
        mediaAltText: "A placeholder image"
      },
      {
        cardType: "Inset Media",
        cardsPerRow: "2",
        header: "Inset Media",
        body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        buttonLinkUrl: "/topiccatalog",
        buttonLinkText: "Topic Catalog",
        mediaUrl: $A.get("$ContentAsset.ex_uswdsCard"),
        mediaAltText: "A placeholder image"
      },
      {
        cardType: "Exdent Media",
        cardsPerRow: "2",
        header: "Exdent Media",
        body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        buttonLinkUrl: "/topiccatalog",
        buttonLinkText: "Topic Catalog",
        mediaUrl: $A.get("$ContentAsset.ex_uswdsCard"),
        mediaAltText: "A placeholder image"
      },
      {
        cardType: "Flag Left",
        cardsPerRow: "2",
        header: "Flag Left",
        body:
          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
        buttonLinkUrl: "/login",
        buttonLinkText: "Login",
        mediaUrl: $A.get("$ContentAsset.ex_uswdsCard"),
        mediaAltText: "A placeholder image"
      },
      {
        cardType: "Flag Right",
        cardsPerRow: "2",
        header: "Flag Right",
        body:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        buttonLinkUrl: "/login",
        buttonLinkText: "Login",
        mediaUrl: $A.get("$ContentAsset.ex_uswdsCard"),
        mediaAltText: "A placeholder image"
      }
    ];
  },
  generateDataNotMapped: function () {
    return [
      {
        fieldA: "Card with Media",
        fieldB: "4",
        fieldC: "Card with Media",
        fieldD:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
        fieldE: "/files",
        fieldF: "Link to Files",
        fieldG: $A.get("$ContentAsset.ex_uswdsCard"),
        fieldH: "A placeholder image"
      },
      {
        fieldA: "Card with Media",
        fieldB: "4",
        fieldC: "Card with Media",
        fieldD:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
        fieldE: "/files",
        fieldF: "Link to Files",
        fieldG: $A.get("$ContentAsset.ex_uswdsCard"),
        fieldH: "A placeholder image"
      },
      {
        fieldA: "Card with Media",
        fieldB: "4",
        fieldC: "Card with Media",
        fieldD:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
        fieldE: "/files",
        fieldF: "Link to Files",
        fieldG: $A.get("$ContentAsset.ex_uswdsCard"),
        fieldH: "A placeholder image"
      },
      {
        fieldA: "Card with Media",
        fieldB: "4",
        fieldC: "Card with Media",
        fieldD:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
        fieldE: "/files",
        fieldF: "Link to Files",
        fieldG: $A.get("$ContentAsset.ex_uswdsCard"),
        fieldH: "A placeholder image"
      }
    ];
  },
  generateMap: function () {
    // keys should contain the custom field names
    // values should contain the cardElement key values
    return {
      fieldA: "cardType",
      fieldB: "cardsPerRow",
      fieldC: "header",
      fieldD: "body",
      fieldE: "buttonLinkUrl",
      fieldF: "buttonLinkText",
      fieldG: "mediaUrl",
      fieldH: "mediaAltText"
    };
  },
  generateDataNoCardType: function () {
    return [
      {
        cardsPerRow: "2",
        header: "Card",
        body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        buttonLinkUrl: "/contactsupport",
        buttonLinkText: "Contact Support",
        mediaUrl: $A.get("$ContentAsset.ex_uswdsCard"),
        mediaAltText: "A placeholder image"
      },
      {
        cardsPerRow: "2",
        header: "Card with Media",
        body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
        buttonLinkUrl: "/contactsupport",
        buttonLinkText: "Contact Support",
        mediaUrl: $A.get("$ContentAsset.ex_uswdsCard"),
        mediaAltText: "A placeholder image"
      }
    ];
  }
});
