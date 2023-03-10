# Deprecation Manifests

This directory contains destructiveChanges.xml files that are to be run when upgrading from a legacy version of the theme to the version number of the containing folder. For example, teams on v2.0.0 that look to upgrade to v2.1.0 should execute the destructiveChanges.xml file in the v2.1.0 folder.

## Deprecations

### v2.1.0

Removes the `uswdsNavBar` component per issue #183.

#### Deployment Instructions

- Deploy `src/` to target org.

`sfdx force:mdapi:deploy -d src/ -w 100 -u {username}`

- In each community check for use of the uswdsNavBar component and replace it with uswdsMegaMenu. Set the Main Nav Menu Name to that of the navigationMenu you hope to reference.
- Save and publish the changes
- Deploy the v2.1.0 destructive changes to the org. This will delete the uswdsNavBar component.

  `sfdx force:mdapi:deploy -d deprecationManifests/v2.1.0 -w 100 -u {username}`

- If errors are thrown, one of the communities may still be using the component. Update and redeploy.
