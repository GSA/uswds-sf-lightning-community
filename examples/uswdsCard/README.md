# USWDS Card Examples

A selection of example wrapper components that utilize and pass data to the `uswdsCardList` component.

## Installation

- Install parent uswds-sf-lightning-community package

  `ant deployCode -Dsf.deployRoot /src`

  `sfdx force:mdapi:deploy -d src -w 100 -u {orgname}`

- Install this example package

  `ant deployCode -Dsf.deployRoot /examples/uswdsCard`

  `sfdx force:mdapi:deploy -d examples/uswdsCard/ -w 100 -u {orgname}`

- Assign `ManagedContentControllerForLex` to the guest user profile of the test community

### Create CMS Content

- Before creating content, you may need to assign Salesforce CMS tab access to your user profile.
- Edit profile and update each of the following tabs to "Default On"
  - CMS Channels
  - CMS Experiences
  - CMS Home
  - CMS Workspaces
- Turn on app visibility for Salesforce CMS under Custom App Settings
- SAVE
- Navigate to Salesforce CMS App from App Picker
- Create new CMS Workspace (give it any name you like)
- Associate the new Workspace to your existing community.
- Skip adding Contributors
- Select language and default
- DONE
- Create one or more new CMS articles of the News content type. Enter data and images into all fields and publish. No new fields need to be created.
- Navigate to the Community Workspace (CMS Home > All Experiences > Workspace)
- Click "Content Management"
- Click "Collections" tab
- Create new collection specific to the News content type
- How would you like to curate your collection? >> Conditionally
- Filter By: Publish Date, When: Greater Than, Value: 01/01/2021
- SAVE
- Navigate to Experience Builder
- Drag "ex Cards CMS - USWDS" to the page
- Publish
- Click "Get Content" button, articles should appear as cards with click-through to full article.

## CodeTour

A [CodeTour](https://marketplace.visualstudio.com/items?itemName=vsls-contrib.codetour) is available for this set of examples and walks through the inner workings of the components. In order to run properly, this repo should be opened as its own Workspace in VS Code editor.
