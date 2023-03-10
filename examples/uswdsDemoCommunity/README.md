# USWDS Demo Community

## Deployment Instructions

Components should be deployed in order so as to avoid errors.

### Ant

### SFDX

```sh
sfdx community create --name issue111 -t 'Customer Account Portal' -p issue111 -d 'example uswds site implementation using Customer Account Portal' -o {username}
sfdx force:mdapi:deploy -d src/ -w 100 -u {username}
sfdx force:mdapi:deploy -d examples/uswdsCard -w 100 -u {username}
sfdx force:mdapi:deploy -d examples/uswdsCollection -w 100 -u {username}
sfdx force:mdapi:deploy -d examples/uswdsPagination -w 100 -u {username}
sfdx force:mdapi:deploy -d examples/uswdsStepIndicator -w 100 -u {username}
sfdx force:mdapi:deploy -d examples/uswdsTag -w 100 -u {username}
sfdx force:mdapi:deploy -d examples/uswdsDemoCommunity -w 100 -u {username}
sfdx force:org:open -u {username}
```

## MDAPI Retrieval Instructions

```sh
sfdx force:mdapi:retrieve -k examples/uswdsDemoCommunity/package.xml -r examples/uswdsDemoCommunity -w 100 -z -u {username}
```

Replace `uswdsDemoCommunity` with unzipped contents. Commit changes.
