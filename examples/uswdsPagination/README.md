# USWDS Pagination Example

An example component which fetches data from the component controller and utilizes the Pagination component to step through the records.

## Installation

- Install parent uswds-sf-lightning-community package

  `ant deployCode -Dsf.deployRoot /src`

  `sfdx force:mdapi:deploy -d src -w 100 -u {orgname}`

- Install package

  `ant deployCode -Dsf.deployRoot /examples/uswdsPagination`

  `sfdx force:mdapi:deploy -d examples/uswdsCard/ -w 100 -u {orgname}`

- Drag "ex Pagination - USWDS" onto page of community. Publish
- Paginate through list of counties.
