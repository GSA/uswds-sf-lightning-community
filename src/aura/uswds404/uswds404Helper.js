({
  getContent: function (value) {
    var content = {
      English: {
        heading: "Page Note Found",
        intro:
          "We’re sorry, we can’t find the page you're looking for. It might have been removed, changed its name, or is otherwise unavailable.",
        instructions:
          "If you typed the URL directly, check your spelling and capitalization. Our URLs look like this:",
        additionalInstructions:
          "Visit our homepage for helpful tools and resources, or contact us and we’ll point you in the right direction.",
        homePageText: "Visit homepage",
        immediateAssistance: "For immediate assistance:",
        errorCodeText: "Error code:"
      },
      Spanish: {
        heading: "No se encontró esta página",
        intro:
          "Lo sentimos, pero no podemos encontrar la página que busca. Es posible que haya sido eliminada, cambiado de nombre o no esté disponible por ahora.",
        instructions:
          "Si escribió el URL a mano, verifique su ortografía y el uso de mayúsculas. Nuestros URLs aparecen así:",
        additionalInstructions:
          "Visite nuestra página principal para encontrar herramientas y recursos útiles o contáctenos y lo ayudaremos a encontrar lo que busca.",
        homePageText: "Visite la página principal ",
        immediateAssistance: "Para ayuda inmediata:",
        errorCodeText: "Código de error:"
      }
    };
    return content[value];
  }
});
