import { LightningElement, api } from "lwc";
import { loadStyle } from "lightning/platformResourceLoader";
import uswdsBanner_headerText from "@salesforce/label/c.uswdsBanner_headerText";
import uswdsBanner_headerAction from "@salesforce/label/c.uswdsBanner_headerAction";
import uswdsBanner_lock from "@salesforce/label/c.uswdsBanner_lock";
import uswdsBanner_lockedPadlockIcon from "@salesforce/label/c.uswdsBanner_lockedPadlockIcon";
import uswdsBanner_officialTop_gov from "@salesforce/label/c.uswdsBanner_officialTop_gov";
import uswdsBanner_officialTop_mil from "@salesforce/label/c.uswdsBanner_officialTop_mil";
import uswdsBanner_officialContent_gov from "@salesforce/label/c.uswdsBanner_officialContent_gov";
import uswdsBanner_officialContent_mil from "@salesforce/label/c.uswdsBanner_officialContent_mil";
import uswdsBanner_secureTop_gov from "@salesforce/label/c.uswdsBanner_secureTop_gov";
import uswdsBanner_secureTop_mil from "@salesforce/label/c.uswdsBanner_secureTop_mil";
import uswdsBanner_secureContentStart from "@salesforce/label/c.uswdsBanner_secureContentStart";
import uswdsBanner_secureContentEnd_gov from "@salesforce/label/c.uswdsBanner_secureContentEnd_gov";
import uswdsBanner_secureContentEnd_mil from "@salesforce/label/c.uswdsBanner_secureContentEnd_mil";
import uswds from "@salesforce/resourceUrl/uswds_3_x";

export default class UswdsBanner extends LightningElement {
  @api bannerType = "Civilian";
  imgDotGov = "";
  imgHttps = "";
  imgUsFlagSmall = "";

  label = {
    uswdsBanner_headerText,
    uswdsBanner_headerAction,
    uswdsBanner_lock,
    uswdsBanner_lockedPadlockIcon,
    uswdsBanner_officialTop_gov,
    uswdsBanner_officialTop_mil,
    uswdsBanner_officialContent_gov,
    uswdsBanner_officialContent_mil,
    uswdsBanner_secureTop_gov,
    uswdsBanner_secureTop_mil,
    uswdsBanner_secureContentStart,
    uswdsBanner_secureContentEnd_gov,
    uswdsBanner_secureContentEnd_mil
  };
  connectedCallback() {
    Promise.all([loadStyle(this, uswds + "/dist/css/uswds.min.css")]).then(
      () => {
        this.imgDotGov = uswds + "/dist/img/icon-dot-gov.svg";
        this.imgHttps = uswds + "/dist/img/icon-https.svg";
        this.imgUsFlagSmall = uswds + "/dist/img/us_flag_small.png";
      }
    );
    if (this.bannerType.toLowerCase() === "military") {
      this.label.uswdsBanner_officialTop = uswdsBanner_officialTop_mil;
      this.label.uswdsBanner_officialContent = uswdsBanner_officialContent_mil;
      this.label.uswdsBanner_secureTop = uswdsBanner_secureTop_mil;
      this.label.uswdsBanner_secureContentEnd =
        uswdsBanner_secureContentEnd_mil;
    } else {
      // default to civilian
      this.label.uswdsBanner_officialTop = uswdsBanner_officialTop_gov;
      this.label.uswdsBanner_officialContent = uswdsBanner_officialContent_gov;
      this.label.uswdsBanner_secureTop = uswdsBanner_secureTop_gov;
      this.label.uswdsBanner_secureContentEnd =
        uswdsBanner_secureContentEnd_gov;
    }
  }

  toggleBanner(event) {
    if (this.refs.bannerContent.hasAttribute("hidden")) {
      this.refs.bannerContent.removeAttribute("hidden");
      this.refs.bannerButton.setAttribute("aria-expanded", true);
    } else {
      this.refs.bannerContent.setAttribute("hidden", "hidden");
      this.refs.bannerButton.setAttribute("aria-expanded", false);
    }
  }
}
