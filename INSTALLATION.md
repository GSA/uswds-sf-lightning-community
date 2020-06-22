# Installation

## Dependencies

* Font Awesome
  * **Required For** fontAwesomeIcon and socialMediaNavMenu components. 
  * Register with Font Awesome to create icon kits, [https://fontawesome.com/start](https://fontawesome.com/start). You'll receive a JS snippet to include in your site. Hold onto that for later.

## Instructions

* Two methods available to push code to your sandbox
  * Install via https://test.salesforce.com/packaging/installPackage.apexp?p0=04t350000001l0y
  * Clone this repository and push
* Enable Communities in your Salesforce org
* Create new community (Setup > Communities > New)
* Select Customer Account Portal
* Enter name of community and a community specific url (if desired)
* From Workspaces, navigate to Administration
  * Login & Registration
    * Update Logo to use Agency-specific logo
    * Update Footer text. Note, US Government agencies do not hold copyright, see (https://www.usa.gov/government-works). Entering © My Agency is improper. Instead, just enter the agency name.
    * Set Logout Page URL
    * Save
  * Update other settings as needed.
* Navigate to Experience Builder by clicking Administration in the top left, and clicking Builder
  * Setup Navigation Menus
    * This theme relies on five navigation menus. 
      * Main Navigation
      * Header Secondary Navigation - below Search 
        * Limit this nav to three or fewer entries
        * Main Footer Nav
        * Footer Secondary Nav
          * Many agencies require standard links on every website such as Privacy Policy, Accessibility, SORN, etc. 
        * Social Media Nav
  * Change Theme Layout to USWDS
    * Settings > Theme > Configure
    * Change Theme Layout Component for the Default and Login Theme Layouts to USWDS Theme Layout. Accept alert and click OK.
  * Add Theme Images
    * Navigate to Theme (paint brush) 
    * Update Images
      * Upload your organization logo under Company Logo. Update Login Page Background Image if desired.
        * A logo with transparent background is best.
    * Update Theme Settings
      * Work down the list of theme settings. As you tab through, the underlying page will update after each field.
      * If you created a community specific URL ...force.com/blah, update the Path to Home Page section to include beginning of URI path
      * Enter navigation menu names for each Nav Menu Name section
      * If you plan to override a particular section, toggle the section on to reveal an Aura.Component[] drop zone
  * Add Font Awesome JS
    * From Experience Builder > Advanced > Edit Head Markup. Paste in the JS snippet from Font Awesome.
* BRANDING
