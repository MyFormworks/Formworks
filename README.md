# Formworks
![Platform](https://img.shields.io/static/v1?label=platform&message=iOS&color=orange)
![SPM](https://img.shields.io/static/v1?label=SwiftPackageManager&message=compatible&color=sucess)

![Logo](Resources/logo.png)

Formworks is an Open-Source framework licensed under the MIT license developed with intention of facilitating
the creation of forms on iOS application. Inspired by Server-driven UI, Formworks works by taking in JSONs
describing all the components and characteristics of a form.

**Formworks aims to be the simplest way to build usable forms.**

1. [Requirements](#requirements)
2. [Installation](#installation)
    - [Installing using Xcode](#installing-using-xcode)
    - [Installing using Package.swift](#installing-using-package.swift)
3. [Usage](#usage)
    - [Creating a Form](#creating-a-form)
    - [Receiving data from a Form](#receiving-data-from-a-form)
3. [Form Input Format](#form-input-format)
    - [JSON Input Example](#json-input-example)
    - [Components](#components)
    - [Parameters](#parameters)
    - [Output](#output)
4. [Components](#components)
      - [Parameters](#parameters)
5. [Documentation](#documentation)
6. [Contribuiting](#contribuiting)
7. [Authors](#authors)

## Requirements
- Swift 5.0 or later 
- iOS 13.0 or later
- Xcode 10.0 or later

## Installation
### Importing using Xcode
1. In a Xcode project, click on "File"
2. Click on "Swift Packages" and select "Add Package Dependency"
3. Paste the web url for this repository: https://github.com/Galdineris/Formworks.git
4. Set Rules to Branch on "master"

After this, you can fetch the latest changes to the framework  by selecting "Update to Latest Package Versions" in step 2.

### Importing using Package.swift
If you don't already have a `Package.swift` file, create one and add the following `.package` URL.
```swift
import PackageDescription

let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/myformworks/Formworks.git", .RELEASE VERSION)
    ],
    ...
)
```

## Getting started
### Import Formworks to your Project
```swift
import Formworks
```

### Create a Form
```swift
let dataFromJSON: Data = // Fetch your JSON data.
let formConfiguration = FWConfiguration(json: dataFromJSON, style: .light)

let formViewController = FWFormViewController(configuration: formConfiguration)
// Present as desired
```

### Receive data from a Form
To get the data from a Form, it is necessary to implement the procotol `FWFormViewControllerDelegate`.
A form outputs a `FWFormSnapshot`.

```swift
extension ExampleClass: FWFormViewControllerDelegate {
  func didSubmit(_ answers: FWFormSnapshot) {
    // Handle answers
  }
}
```

## Form Input Format
### JSON Input Example 
```json
{
  "title": "Artur's Wedding RSVP",
  "components": [{
    "text": {
      "title": "What's your name?", 
      "required": true
      }
    },
    {
    "email": {
      "title": "What is your e-mail?"
      }
    },
    {
    "phonenumber": {
      "title": "What's your phone number?",
      "description": "Brazilian phone number formats only."
      }
    },
    {
    "multiline": {
        "title": "Would you like to leave a special message to the groom?"
      }
    }
  ]
}
```

### Components
These keys are the type of component that you want. They need to be given as the component key followed by the parameters of Base Component and the parameters of the respective component.
Key | Description
------------ | -------------
`text` | Single line text inputs. No default validation.
`multiline` | Long text inputs with multiple lines. No default validation.
`email` |  Text component for e-mail.
`numerical` | Text component for numerical.
`phonenumber` | Text component for phone numbers (Brazillian format).

### Parameters
Parameter | Type | Description | Required | Default Value
------------ | ------------- | ------------- | ---------- | ---------
id | String | Unique ID | Yes | -
responseFormat | String | Response format for the form's output. Can either be `long` or `short` | Yes | -
title | String | Form's title. It will be presented in the top of the form. | Yes | -
style | FWStyle | A form's visual style. Style provided in the JSON has priority over in-code selection. | Yes | -
components | [FWComponentModel] | An array that contains all the components that will be presented in the form. | Yes | -

### Output
A form's output is a `FWFormSnapshot`, more information in the [documentation](https://myformworks.github.io/Formworks/Structs/FWFormSnapshot.html).

## Components
A form is composed of a series of components. In the JSON, the component's key determines what kind of component is being created.
When a component has no default validation, a regex can be set in the JSON. If no regex rule is given **and** the componet is not required,
any input is valid, even an empty string. If there is no regex but the component is required, the input is accepted if it is **not** empty.

Key | Description
------------ | -------------
`text` | Single line text inputs. No default validation.
`multiline` | Long text inputs with multiple lines. No default validation.
`email` |  Text component for e-mail.
`numerical` | Text component for numerical.
`phonenumber` | Text component for phone numbers (Brazillian format).

### Parameters
Parameter | Type | Description | Required | Default Value
------------ | ------------- | ------------- | ------------- | ---------
id | String | Unique ID | No | Locally generated UUID as a String
title | String | Component's title. | Yes | -
description | String | Component's description.| No | ""
required | Bool | Specifies if the field has to be filled or not. | No | false
regex | String | A regex validation rule. Exclusive to `text` and `multiline`| No | ""

The default regex for each component can be found in the `FWRegex` enum in our [documentation](https://myformworks.github.io/Formworks/Enums/FWRegex.html).

## Documentation
Our [documentation](https://myformworks.github.io/Formworks/) is hosted on GitHub Pages.

Formworks uses [Jazzy](https://github.com/realm/jazzy) to generate documentation based on our in-code comments/documentation.

Whenever new code is added to the `master` a [GitHub Action](https://github.com/marketplace/actions/swiftpm-jazzy-docs) generates the documentation using Jazzy and
deploys it to GitHub Pages.

A [sample project](https://github.com/myformworks/FormworksExample) is provided as an example on how to use Formworks.

## Contribuiting
Please see [CONTRIBUTING.md](CONTRIBUTING.md).

## Authors
This project was created by

[Artur Carneiro](https://csfar.github.io)

[Cassia Barbosa](https://cassiaabarbosa.github.io)

[Edgar Sgroi](https://edgsgroi.github.io)

[Rafael Galdino](https://galdineris.github.io)

[Victor Falcetta](https://github.com/VicFalcetta)
