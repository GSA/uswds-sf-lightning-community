# Welcome

We're so glad you're thinking about contributing to a U.S. Government open source project! If you're unsure about anything, just ask -- or submit the issue or pull request anyway. The worst that can happen is you'll be politely asked to change something. We love all friendly contributions.

- [Welcome](#welcome)
  - [How to contribute to this project](#how-to-contribute-to-this-project)
  - [Public domain](#public-domain)
  - [Issue Guidelines](#issue-guidelines)
  - [Code Guidelines](#code-guidelines)
  - [Establishing a Development Environment](#establishing-a-development-environment)
  - [Creating a new Component](#creating-a-new-component)
    - [Handling in-component validation & builder feedback](#handling-in-component-validation--builder-feedback)
  - [Testing](#testing)
    - [Testing Principles](#testing-principles)
    - [Creating New Tests](#creating-new-tests)
    - [Deploying Tests](#deploying-tests)
    - [Running Tests](#running-tests)
      - [CLI](#cli)
      - [Browser](#browser)
  - [Updating package.xml version](#updating-packagexml-version)

## How to contribute to this project

- We want to ensure a welcoming environment for all of our projects. Our staff follows this [Code of Conduct](CODE_OF_CONDUCT.md) and all contributors should do the same.
- Report bugs and request features via Github Issues
- Create a [Github pull request](https://help.github.com/articles/creating-a-pull-request/) with new functionality or fixing a bug.
- Improve or create documentation.
- Help us improve our tests.
- Triage tickets and review patches triaging-tickets created by other users.

## Public domain

As noted in [LICENSE](LICENSE.md), this project is in the worldwide public domain (in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/)).

All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.

## Issue Guidelines

In the interest of making it easier for our contributors to manage site issues, we request that issues follow certain guidelines. Our developers mainly use [issues](/issues) to identify and prioritize their work. If you have questions about the theme or would like start a general discussion, we kindly request that you email us at [gsalabs@gsa.gov](mailto://gsalabs@gsa.gov). Our issue guidelines are a living document and a work in progress, so feel free to offer feedback on it, by emailing us at [gsalabs@gsa.gov](mailto://gsalabs@gsa.gov)

- **Specific**: The issue makes specific requests. An example of a specific request would be `Reduce the Size of Images`. An example of a non-specific request would be `Improve Site Performance`.
- **Measurable**: The issue has specific requirements and can be closed when those requirements are met. This helps us track the progress in addressing problems. For example, tech debt is always something to work on, so we should create separate issues for this, such as `Consolidate Styling of Repo and Task Cards` and `Convert Validator from Monaco Editor to jsoneditor`, rather than `Address Tech Debt`.
- **Actionable**: An issue should request a specific action from a member of the code.gov team or community. An example of something actionable would be `Remove Debugging Text from Loading Screen`. An example of something that isn't actionable by our team or community is `My city should be forking Code.gov`.
- **Realistic**: The issue is something that is achievable by the resources of the project, including contributions from the open source community. An example of a realistic issue is `Include Line Numbers in Validator`.
- **Time-Aware**: The issue is something that can be resolved within 6 months. If you think your issue might take longer, we encourage you to break up your issues into smaller issues (like stepping stones) that we can address. We can still work on big problems, but it is easier for us to track progress and identify what we need to work on, when big problems are broken up into smaller ones.

## Code Guidelines

We use Prettier as the default formatter for our code. This ensures a consistent product across all files an enhances readability. More information about Prettier can be found at [https://prettier.io/](https://prettier.io/).

When creating a new feature, one should think about the broad variety of uses for a given component and design it in such a way that the end user can adjust via Experience Builder as needed. If making changes to the theme itself, `uswdsTheme`, provide the ability to toggle a component on/off or have it collapse down to zero height if not in use.

## Establishing a Development Environment

Using Salesforce [Scratch Orgs](https://help.salesforce.com/s/articleView?id=sf.managing_scratch_orgs.htm&type=5) is the easiest way to get up and running with the repository. See [INSTALLATION](INSTALLATION.md#sfdx-instructions) for specific instructions to deploy this code base to a fresh environment with SFDX.

## Creating a new Component

`sfdx force:lightning:component:create -d src/aura -n {component name}`

Add the new component to the src/package.xml

`sfdx force:source:manifest:create --sourcepath src --manifestname src/package.xml`

### Handling in-component validation & builder feedback

The `builderNotification` component provides a means by which validation messages and feedback for developers or site builders can be shared within Experience Builder. Messages that appear in Experience Builder are meant to serve as bowling lane bumpers to steer the individual back on track. If a site builder publishes a page while a message is displayed, it will be shown to end users.

Implementing `builderNotification` relies on updates to the component and controller or helper. The standard practice is to give the component an `aura:id` of `builderNotification` but that naming convention is not explicitly required.

The `addNotification` method expects an object or array of objects containing a title and message. A simplified example is below. For a more detailed example see the [Step Indicator component](https://github.com/GSA/uswds-sf-lightning-community/blob/develop/src/aura/uswdsStepIndicator/uswdsStepIndicatorHelper.js).

```html
<!-- mycomponent.cmp -->
<aura:attribute name="firstName" type="String" />
<!-- component must be implemented with an aura:id="builderNotification" -->
<c:builderNotification aura:id="builderNotification" />
<h1>Hi {!v.firstName}</h1>
```

```js
/* mycomponentController.js */
validateFirstName: function(component, event, helper) {
  if ({!v.firstName}) {
    const builderNotificationContent = [{
        title: "Error - My Component",
        message: "First name is blank and a value is expected"
      }];
    component.find("builderNotification").addNotification(builderNotificationContent);
  }
}
```

## Testing

Lightning Testing Service is used to run automated Jasmine tests against each component. Tests are captured in the `test/staticresources` directory and named using the following pattern, `uswds_lts_{component name}`.

### Testing Principles

Tests should follow the [Arrange, Act, Assert](https://integralpath.blogs.com/thinkingoutloud/2005/09/principles_of_t.html) principle. Test `describe` and `it` statements should read as sentences so as to be readily consumed by a developer or site manager. Muliple assertions may be present in a given test. For example, the following contains two assertions (`expect()`) within a single test so as to verify all relevant text is present.

```javascript
describe("USA Banner", function () {
  it("Displays default banner text", function (done) {
    $T.createComponent("c:uswdsUSABanner", {}, true).then(function (component) {
      expect(
        document.getElementsByClassName("usa-banner__header-text")[0]
          .textContent
      ).toContain("An official website of the United States government");
      expect(
        document.getElementsByClassName("usa-banner__header-action")[0]
          .textContent
      ).toContain("Here’s how you know");
    });
  });
});
```

### Creating New Tests

1. Tests are stored in staticResources, create a new file,

   `sfdx force:lightning:test:create -d test/staticresources -n uswds_lts_{component name}`

1. The prior command creates a bare test.

   1. If you are using VSCode, tests can be quickly scaffolded using [snippets](https://code.visualstudio.com/docs/editor/userdefinedsnippets). Open the new file and start typing `LtngTest`, pick the describe option.
   2. If not using VSCode, copy in the contents of `test/testTemplate`.

   `cp test/testTemplate test/staticresources/uswds_lts_{component name}.resource`

1. Once the test has been created, it should be referenced in `test/aura/jasmineTests/jasmineTests.app`.

1. Add the new staticresource to package.xml. This command also supports the removal of files.

   `sfdx force:source:manifest:create --sourcepath test --manifestname test/package.xml`

### Deploying Tests

`sfdx force:mdapi:deploy -d test/ -w 50 -u {username}`

### Running Tests

Tests can be run via the CLI or directly within the browser. Per issue [#108](https://github.com/GSA/uswds-sf-lightning-community/issues/108), a fork of Salesforce's Lightning Test Service Plugin was created.

#### CLI

- Install forked version of Salesforces Lightning Test Service plugin
- `sfdx plugins:install @mvogelgesang/plugin-lightning-testing-service`
- Verify installation via `sfdx plugins`
- Deploy source and test to org following steps above
- Run tests `sfdx aura-test:run -a jasmineTests -u {username}`
- A browser window will launch and test results will be printed to the terminal

#### Browser

- Deploy tests and navigate straight to the test suite:
- `sfdx force:org:open -p /c/jasmineTests.app -u {username}`

## Updating package.xml version

- Deploy code from `src/` as is to fresh org
- Update package.xml to desired mdapi version within `src/`
- Pull the code that was just deployed back down to your local machine but using the new mdapi version
- `sfdx force:mdapi:retrieve -r newmdapi/ -k src/package.xml --unzip -u {username}`
- copy contents of `newmdapi/` and paste into `src/`.
- Run prettier against files to resolve whitespace differences caused by mdapi:retrieve.
- `npx prettier --write "src/"`
- Review remaining files that are in a git dirty state. `flexipage` and `communityThemeDefinition` files may change structure since they are xml-based.
- deploy updated metadata back to org `sfdx force:mdapi:deploy -d src/ -w 100 -u {username}`
- deploy tests to org `sfdx force:mdapi:deploy -d test/ -w 100 -u {username}`
- run tests `sfdx aura-test:run -a jasmineTests -u {username}`
- upon successful test run, perform same metadata api update as above but for the `test/` directory
- deploy and run tests again
