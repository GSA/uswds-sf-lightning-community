# USWDS Card Examples

A selection of example wrapper components that utilize and pass data to the `uswdsCardList` component.

## Installation

- Install parent uswds-sf-lightning-community package `ant deployCode -Dsf.deployRoot /src`
- Install package `ant deployCode -Dsf.deployRoot /examples/uswdsCard`
- Assign `ManagedContentControllerForLex` to the guest user profile of the test community
- Create one or more new CMS articles of the News content type. Enter data and images into all fields and publish. No new fields need to be created.
- Navigate to the Community Workspace (CMS Home > All Experiences > Workspace)
- Click "Content Management"
- Click "Collections" tab
- Create new collection and add article(s) to it of the News content type
- Navigate to Experience Builder
- Drag "ex Cards CMS - USWDS" to the page
- Publish
- Click "Get Content" button, articles should appear as cards with click-through to full article.

## CodeTour

A [CodeTour](https://marketplace.visualstudio.com/items?itemName=vsls-contrib.codetour) is available for this set of examples and walks through the inner workings of the components. In order to run properly, this repo should be opened as its own Workspace in VS Code editor.
