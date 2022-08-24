# USWDS Breadcrumb Example

The following example fetches Account records and inserts the Account Name into the Breacrumb component.

## Installation

- Install parent uswds-sf-lightning-community package
  `ant deployCode -Dsf.deployRoot /src`

  `sfdx force:mdapi:deploy -d src -w 100 -u {orgname}`

- Install example package

  `ant deployCode -Dsf.deployRoot /examples uswdsBreadcrumb`

  `sfdx force:mdapi:deploy -d examples/uswdsBreadcrumb/ -w 100 -u {orgname}`

- Run Apex code to add Account records

  `sfdx force:apex:execute -f examples/uswdsBreadcrumb/createAccounts.apex -u {orgname}`

  - If SFDX is not available, copy code from apex file and run anonymously in Dev Console. Open Salesforce Developer Console > Execute Anonymous > insert Account records

- Navigate to Salesforce Setup
- Create new community, Setup > Digital Experiences > All Sites > New
- Name it whatever you'd like
- Create new page > type: Object Page > Account
- Create new navigation menu: Community Setup > Navigation > Add Navigation Menu

  - Name: accounts
  - Add new Menu Item:
    - Name: Accounts
    - Type: Salesforce Object
    - Object Type: Account
    - Default List View: Default

- Navigate to Account Detail page. Drag 'example Breadcrumb - USWDS' to page
- Save and publish
