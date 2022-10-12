({
  renderIcon: function (component) {
    var svgns = "http://www.w3.org/2000/svg";
    var xlinkns = "http://www.w3.org/1999/xlink";
    var classname = component.get("v.class");

    var svgroot = document.createElementNS(svgns, "svg");
    svgroot.setAttribute("aria-hidden", "true");
    svgroot.setAttribute("class", classname);

    // Add an "href" attribute (using the "xlink" namespace)
    var shape = document.createElementNS(svgns, "use");
    shape.setAttributeNS(xlinkns, "href", component.get("v.svgPath"));
    svgroot.appendChild(shape);

    var container = component.find("container").getElement();
    container.insertBefore(svgroot, container.firstChild);
  }
});
