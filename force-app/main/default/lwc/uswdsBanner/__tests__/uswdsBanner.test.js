import { createElement } from "lwc";
import UswdsBanner from "c/uswdsBanner";
import uswdsBanner_officialTop_gov from "@salesforce/label/c.uswdsBanner_officialTop_gov";
import uswdsBanner_officialTop_mil from "@salesforce/label/c.uswdsBanner_officialTop_mil";

jest.mock(
  "@salesforce/label/c.uswdsBanner_officialTop_gov",
  () => {
    return { default: "Official websites use .gov" };
  },
  { virtual: true }
);
jest.mock(
  "@salesforce/label/c.uswdsBanner_officialTop_mil",
  () => {
    return { default: "Official websites use .mil" };
  },
  { virtual: true }
);

describe("c-uswds-banner", () => {
  afterEach(() => {
    // The jsdom instance is shared across test cases in a single file so reset the DOM
    while (document.body.firstChild) {
      document.body.removeChild(document.body.firstChild);
    }
  });

  it("Component renders in a closed state", () => {
    // Arrange
    const element = createElement("c-uswds-banner", {
      is: UswdsBanner
    });

    // Act
    document.body.appendChild(element);

    // AssertshadowRoot.querySelector(".in-the-shadow");
    const button = element.shadowRoot.querySelector(
      "button.usa-accordion__button.usa-banner__button"
    );
    const bannerContent = element.shadowRoot.querySelector(
      "div.usa-banner__content.usa-accordion__content"
    );

    expect(button.getAttribute("aria-expanded")).toBe("false");
    expect(bannerContent.hasAttribute("hidden")).toBe(true);
  });
  it("Opens the accordion when the down-arrow button is clicked", () => {
    // Arrange
    const element = createElement("c-uswds-banner", {
      is: UswdsBanner
    });

    // Act
    document.body.appendChild(element);

    // AssertshadowRoot.querySelector(".in-the-shadow");
    const button = element.shadowRoot.querySelector(
      "button.usa-accordion__button.usa-banner__button"
    );
    const bannerContent = element.shadowRoot.querySelector(
      "div.usa-banner__content.usa-accordion__content"
    );
    button.click();
    expect(button.getAttribute("aria-expanded")).toBe("true");
    expect(bannerContent.hasAttribute("hidden")).toBe(false);
  });
  it("Closes the accordion upon click after opening.", () => {
    // Arrange
    const element = createElement("c-uswds-banner", {
      is: UswdsBanner
    });

    // Act
    document.body.appendChild(element);
    const button = element.shadowRoot.querySelector(
      "button.usa-accordion__button.usa-banner__button"
    );
    const bannerContent = element.shadowRoot.querySelector(
      "div.usa-banner__content.usa-accordion__content"
    );
    button.click();

    // Assert
    expect(button.getAttribute("aria-expanded")).toBe("true");
    expect(bannerContent.hasAttribute("hidden")).toBe(false);

    // Act
    button.click();
    // Assert
    expect(button.getAttribute("aria-expanded")).toBe("false");
    expect(bannerContent.hasAttribute("hidden")).toBe(true);
  });
  it("Component defaults to civilian variant", () => {
    // Arrange
    const element = createElement("c-uswds-banner", {
      is: UswdsBanner
    });

    // Act
    document.body.appendChild(element);

    // Assert
    const div = element.shadowRoot.querySelector("div.usa-media-block__body");
    expect(div.textContent).toContain("Official websites use .gov");
  });
  it("Component displays military variant", () => {
    // Arrange
    const element = createElement("c-uswds-banner", {
      is: UswdsBanner
    });
    element.bannerType = "military";

    // Act
    document.body.appendChild(element);

    // Assert
    const div = element.shadowRoot.querySelector("div.usa-media-block__body");
    expect(div.textContent).toContain("Official websites use .mil");
  });

  it("Is accessible", async () => {
    const element = createElement("c-uswds-banner", {
      is: UswdsBanner
    });
    document.body.appendChild(element);

    // Check accessibility
    await expect(element).toBeAccessible();
  });
});
