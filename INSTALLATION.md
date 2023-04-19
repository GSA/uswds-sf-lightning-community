# Installation

Installation instructions are written for users of the [SFDX CLI](https://developer.salesforce.com/tools/sfdxcli). The use of scratch orgs is assumed but not required. If not using a scratch org, setup a sandbox environment via SFDX and point to that instance.

Deployments via the [Salesforce Ant Migration Tool](https://help.salesforce.com/articleView?id=sf.code_tools_ant_using.htm&type=5) will also work but are not tested regularly.

- [Installation](#installation)
  - [Dependencies](#dependencies)
  - [Demo Implmentation](#demo-implmentation)
    - [Steps](#steps)
  - [First Time Install](#first-time-install)
    - [1.0 Configure Org](#10-configure-org)
      - [Scratch Orgs](#scratch-orgs)
      - [Sandboxes](#sandboxes)
    - [2. Deploy Code](#2-deploy-code)
      - [SFDX](#sfdx)
      - [Ant](#ant)
    - [3. Create Community](#3-create-community)
      - [SFDX](#sfdx-1)
      - [Sandbox](#sandbox)
    - [4. Activate Theme](#4-activate-theme)
    - [5. Additional Steps](#5-additional-steps)
  - [Upgrading Theme](#upgrading-theme)
  - [Additional Community Setup Information](#additional-community-setup-information)

## Dependencies

- [SFDX CLI](https://developer.salesforce.com/tools/sfdxcli)

## Demo Implmentation

A demo site is included within this repository to enable teams to quickly deploy a copy of the theme along with navigable pages. This is a great way to get a feel for the theme without having to do a lot of setup.

For ease of deployment, set an environment variable in terminal before executing additional commands. For example:

`orgname="uswdsThemeDemoOrg"` 

### Steps

1. Create a new scratch org

`sfdx force:org:create -f config/scratch-def.json -a $orgname`

2. Deploy main USWDS Theme source to org

`sfdx force:mdapi:deploy -d src/ -w 100 -u $orgname`

3. Create a new community named "uswdsThemeDemo using the Customer Account Portal template

`sfdx force:community:create --name "uswdsThemeDemo" --templatename "Customer Account Portal" --urlpathprefix uswdsThemeDemo -o $orgname`

4. Deploy example components to org (6 examples)

`sfdx force:mdapi:deploy -d examples/uswdsBreadcrumb -w 100 -u $orgname`

`sfdx force:mdapi:deploy -d examples/uswdsCard -w 100 -u $orgname`

`sfdx force:mdapi:deploy -d examples/uswdsCollection -w 100 -u $orgname`

`sfdx force:mdapi:deploy -d examples/uswdsPagination -w 100 -u $orgname`

`sfdx force:mdapi:deploy -d examples/uswdsStepIndicator -w 100 -u $orgname`

`sfdx force:mdapi:deploy -d examples/uswdsTag -w 100 -u $orgname`

5. ⚠️⚠️ Open newly created org and verify community has been created. If you do not see "uswdsThemeDemo" on this page, continue to refresh until it appears.

`sfdx force:org:open -u $orgname -p lightning/setup/SetupNetworks/home`

6. Once the community appears, proceed to next step.

`sfdx force:mdapi:deploy -d examples/uswdsThemeDemo -w 100 -u $orgname`

## First Time Install

Depending on your development workflow and tools available, varying instructions are required. For each step of the installation process, SFDX and Ant instructions are provided

### 1.0 Configure Org

#### Scratch Orgs

Create a scratch org with communities enabled.
`sfdx force:org:create -f config/scratch-def.json -a {scratchOrgName}`

#### Sandboxes

Enable Communities in your Salesforce org (Setup > Digital Experiences > Settings. Select Enable Digital Experiences.)

### 2. Deploy Code

#### SFDX

`sfdx force:mdapi:deploy -d src/ -w 100 -u {scratchOrgName}`

`sfdx force:org:open -u {scratchOrgName}`

#### Ant

Set local build.properties to point at sandbox.

`ant deployCode`

Example files can also be deployed by entering (always deploy `src/` folder before deploying examples)

`ant deployCode -Dsf.deployRoot="/examples/uswdsTag"`

### 3. Create Community

#### SFDX

`sfdx force:community:create --name {community name} --templatename "Customer Account Portal" --urlpathprefix {path prefix if any} -o {scratchOrgName}`

#### Sandbox

- For new communities
  - Create new community (Setup > Digital Experiences > All Sites > New > Select Customer Account Portal)
  - Provide Name > Builder > Theme
  - Select USWDS Lightning Community
- For existing communities
  - (Setup > Digital Experiences > All Communities > Builder > Theme)
  - Select USWDS Lightning Community
- Enter name of community and a community specific url (if desired)

### 4. Activate Theme

- Setup > Digital Experiences > All Sites > {name of your community} > Builder
- Click brush icon on left-hand menu
- Click Change Theme
- Select USWDS v2.1.0

### 5. Additional Steps

See [Additional Community Setup Information](#additional-community-setup-information)

## Upgrading Theme

Read the [Release Notes](https://github.com/GSA/uswds-sf-lightning-community/releases) for each version between your current and desired version. The notes will highlight any breaking changes or destructive packages that are required for deployment. Deploy each minor version in succession until reaching current.

## Additional Community Setup Information

We have a [wiki](https://github.com/GSA/uswds-sf-lightning-community/wiki/Community-Setup) which contains more information about customizing the theme and getting started.
