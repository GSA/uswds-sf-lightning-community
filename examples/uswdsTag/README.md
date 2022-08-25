# USWDS Tag Example

## Installation

- Install parent uswds-sf-lightning-community package
  `ant deployCode -Dsf.deployRoot /src`

  `sfdx force:mdapi:deploy -d src -w 100 -u {orgname}`

- Install example package

  `ant deployCode -Dsf.deployRoot /examples uswdsBreadcrumb`

  `sfdx force:mdapi:deploy -d examples/uswdsTag/ -w 100 -u {orgname}`

- Navigate to Salesforce Setup
- Create new community, Setup > Digital Experiences > All Sites > New
- Name it whatever you'd like
- Drag exampleTag component to page, view all variations of tags
- Save and publish
