# Formworks
![Platform](https://img.shields.io/static/v1?label=platform&message=iOS&color=orange)
![SPM](https://img.shields.io/static/v1?label=SwiftPackageManager&message=compatible&color=sucess)

Formworks is an Open-Source framework licensed under the MIT license developed with intention of facilitating
the creation of forms on iOS application. Inspired by Server-driven UI, Formworks works by taking in JSONs
describing all the components and characteristics of a form. Each componet can have their validation rule set
using Regex in the JSON.

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
    - [Parameters](#parameters)
      - [Form](#form)
      - [Components](#components)
      - [Base Component](#base-component)
      - [Text Component](#text-component)
      - [Validators](#validators)
4. [Form Output Format](#form-output-format)
5. [Documentation](myformworks.github.io/formworks/)
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
5. Done
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

### Importing Formworks to your Project
```swift
import Formworks
```

## Usage
### Creating a Form
```swift
let dataFromJSON: Data = // Fetch your JSON data.
let formConfiguration = FWConfiguration(json: dataFromJSON, style: .light)

let formViewController = FWFormViewController(configuration: formConfiguration)
// Present as desired
```

### Receiving data from a Form
To get the data from a Form, it is necessary to implement the procotol `FWFormViewControllerDelegate` in a given class.
The answers come in JSON format.
(For more information, refer to [Form Output Format](#form-output-format))
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
  "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
  "responseFormat": "long",
  "title": "Formworks Title",
  "style": {
    "accent": "#F0F0F0FF",
    "background": "#CACACAFF",
    "componentBackground": "#F0F0F0FF",
    "componentTitle": "#212121FF",
    "componentDescription": "#212121FF",
    "componentInputText": "#212121FF",
    "componentInputBackground": "#FDFDFDFF",
    "componentRequired": "#FD5C5CFF",
    "componentCorrect": "#78C256FF"
  },
  "components": [{
    "text": {
      "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
      "title": "What is your name?",
      "description": "Type your name.",
      "required": true,
      "placeholder": "Your name"
      }
    },
    {
    "email": {
      "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
      "title": "What is your e-mail?",
      "description": "Type your e-mail.",
      "required": true,
      "placeholder": "youremail@example.org"
      }
    },
    {
    "text": {
      "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
      "title": "Tell us a little bit about yourself",
      "description": "We want to know more about you."
      }
    },
    {
    "text": {
        "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
        "title": "What is your mother's name?",
        "description": "Type your name.",
        "required": true,
        "regex": "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$",
        "placeholder": "Your mother's name"
      }
    }
  ]
}
```

### Parameters
Parameter | Type | Description | Required | Default Value
------------ | ------------- | ------------- | ---------- | ---------
id | String | Object unique ID | Yes | -
responseFormat | String | Response format for the form. Can either be "long" or "short" | Yes | -
title | String | Form title. It will be presented in the top of the form. | Yes | -
style | FWStyle | A form's visual style. Style provided in the JSON has priority over in-code selection. Hex color format. | Yes | -
components | [FWComponentModel] | An array that contains all the components that will be presented in the form. | Yes | -

## Form Output Format

```json
{
  "title": "Your Form Title",
  "components": [
    {
      "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
      "type": "text",
      "title": "Text Field Title",
      "description": "Text Field Description",
      "required": "true",
      "regex": "",
      "placeholder": "Text Field Placeholder",
      "isMultiline": "false",
      "content": "Components Answer"
    },
    {
      "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
      "type": "email",
      "title": "Text Field Title",
      "description": "Text Field Description",
      "required": "false",
      "regex": "[0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,64}",
      "placeholder": "Text Field Placeholder",
      "isMultiline": "false",
      "content": "Components Answer"
    }
  ]
}
```

## Components
A form is composed of a series of components, each with a specific type of validation.

### Base Component
Parameter | Type | Description | Required | Default Value
------------ | ------------- | ------------- | ------------- | ---------
id | String | Object unique ID | Yes | -
title | String | Component's title. It should be a definition about how the field could be filled. | Yes | -
description | String | Component's description. It could be an aditional explanation about how the field could be filled. | No | ""
required | Bool | Specifies if the field has to be filled or not.| No | false
type | FWComponentModelWrapper.Types | Specifies the type of the component| Yes | -

Available components:
* `text`: a `UITextField` component with default keyboard. Can receive regex through JSON.
* `email`: a `UITextField` component with e-mail keyboard and regex.
* `numerical`: a `UITextField` component with numerical keyboard and regex.
* `phonenumber`: a `UITextField` component with phonepad keyboard and brazillian phonenumbers regex.
* `multiline`: a `UITextView` component with default keyboard. Can receive regex through JSON.

## Validators
The default regex for each component can be found in the `FWRegex` enum in our [Documentation](https://myformworks.github.io/Formworks/Enums/FWRegex.html).

In case of a `custom` regex the rule will be determinated by the `regex` key.

## [Documentation](https://myformworks.github.io/Formworks/)

## Contribuiting
Please see [CONTRIBUTING.md](Resources/CONTRIBUTING.md).

## Authors
This project was created by

[Artur Carneiro](https://csfar.github.io)

[Cassia Barbosa](https://cassiaabarbosa.github.io)

[Edgar Sgroi](https://edgsgroi.github.io)

[Rafael Galdino](https://galdineris.github.io)

[Victor Falcetta](https://github.com/VicFalcetta)
