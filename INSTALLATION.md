# Installation

## Dependencies

* Font Awesome
  * **Required For** fontAwesomeIcon and socialMediaNavMenu components.
  * Register with Font Awesome to create icon kits, [https://fontawesome.com/start](https://fontawesome.com/start). You'll receive a JS snippet to include in your site. Hold onto that for later.

## Instructions

* Two methods available to push code to your sandbox
  * Install via [https://test.salesforce.com/packaging/installPackage.apexp?p0=04t350000001lQx](https://test.salesforce.com/packaging/installPackage.apexp?p0=04t350000001lQx)
  * Clone this repository and push
* Enable Communities in your Salesforce org
* Create new community (Setup > Communities > New)
* Select USWDS Lightning Community
* Enter name of community and a community specific url (if desired)
* From Workspaces, navigate to Administration
  * Login & Registration
    * Update Logo to use Agency-specific logo
    * Update Footer text. Note, US Government agencies do not hold copyright, see [Government Works](https://www.usa.gov/government-works). Entering © My Agency is improper. Instead, just enter the agency name.
    * Set Logout Page URL
    * Save
  * Update other settings as needed.

### Experience Builder Setup

Navigate to Experience Builder by clicking Administration in the top left, and clicking Builder

#### Navigation Menu Setup

This theme relies on five navigation menus:

* Main Navigation
* Header Secondary Navigation - below Search
  * Limit this nav to three or fewer entries
* Main Footer Nav
* Footer Secondary Nav
  * Many agencies require standard links on every website such as Privacy Policy, Accessibility, SORN, etc.
* Social Media Nav

#### Change Theme Layout and Settings

* Settings > Theme > Configure
* Change Theme Layout Component for the Default and Login Theme Layouts to USWDS Theme Layout. Accept alert and click OK.
  * Add Theme Images
    * Navigate to Theme (paint brush)
    * Update Images
      * Upload your organization logo under Company Logo. Update Login Page Background Image if desired.
        * A logo with transparent background is best as the header and footer are different colors.
    * Update Theme Settings
      * Work down the list of theme settings. As you tab through, the underlying page will update after each field.
      * If you created a community specific URL ...force.com/blah, update the Path to Home Page section to include beginning of URI path
      * Enter navigation menu names for each Nav Menu Name section
      * If you plan to override a particular section, toggle the section on to reveal an Aura.Component[] drop zone
    * Update Theme Colors
      * This repository ships with base theme colors but can be customized to specific needs. While not comprehensive, the following maps color settings to components in the community.
        * Action Color
          * Tab Component (specifically active tab)
          * Tile Menu
        * Overlay Text Color
          * User Profile Menu
        * Detail Text Color
          * Tabs (inactive)

#### Add Font Awesome JS

Fontawsome needs to be a trusted site for both scripts and other resources.  There are two sites that need to be defined by Salesforce:

1. Under Salesforce Setup (Not in Experience Builder) search for CSP Trusted Sites.
1. Click New Trusted Site.
    1. Trusted Site Name: kitfreefontawsome
    1. Trusted Site URL: [https://kit-free.fontawesome.com](https://kit-free.fontawesome.com)
    1. Context: Communities
    1. Leave all other boxes checked
1. Click Save

Back in Experience Builder > Settings > Security.  

1. Change the Content Secuirty Policy (CSP) to "Allow Inline Scripts and Script Access to Whitelisted Third-party Hosts
1. Click + Add Trusted Site.
    1. Name: fontawesome
    1. URL: [https://kit.fontawesome.com](https://kit.fontawesome.com)

Enter the header script Tag:
From Settings>Advanced.  

1. Click Edit Head Markup.  
1. Paste the script tag.  
1. Click Save

When saved you should not get any CSP errors.  
