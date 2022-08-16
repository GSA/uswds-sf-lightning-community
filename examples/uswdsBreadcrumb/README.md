# USWDS Breadcrumb Example

A selection of example wrapper components that utilize and pass data to the `uswdsBreadcrumb` component.

## Installation

- Install parent uswds-sf-lightning-community package
  `ant deployCode -Dsf.deployRoot /src`

  `sfdx force:mdapi:deploy -d src -w 100 -u {orgname}`

- Install example package

  `ant deployCode -Dsf.deployRoot /examples uswdsBreadcrumb`

  `sfdx force:mdapi:deploy -d examples/uswdsBreadcrumb -w 100 -u {orgname}`

- Create new community
- Create new page > type: Object Page > Account

- Open Salesforce Developer Console > Execute Anonymous > insert Account records

```apex
Account[] accts = new List<Account>();
for(Integer i=0;i<3;i++) {
    Account a = new Account(Name='Acme' + i,
                            BillingCity='San Francisco');
    accts.add(a);
}
insert accts;
```
