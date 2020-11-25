# Formworks
![Platform](https://img.shields.io/static/v1?label=platform&message=iOS&color=orange)
![SPM](https://img.shields.io/static/v1?label=SwiftPackageManager&message=compatible&color=sucess)

Formworks is a framework built on UIKit for building forms from JSON files on iOS.

1. [Features](#features)
2. [Requirements](#requirements)
3. [Usage](#usage)
    - [Installing using Swift Package Manager](#installing-using-swift-package-manager)
    - [Creating a Form](#creating-a-form)
    - [Receiving data from a Form](#receiving-data-from-a-form)
4. [Form Input Format](#form-input-format)
    - [JSON Input Example](#json-input-example)
    - [Components](#components)
    - [Parameters](#parameters)
      - [Form](#form)
      - [Base Component](#base-component)
      - [Text Component](#text-component)
      - [Validators](#validators)
5. [Form Output Format](#form-output-format)
6. [Documentation](myformworks.github.io/formworks/)
7. [Contribuiting](#contribuiting)
8. [Authors](#authors)

## Features
- [x] Create form screens directly from json files.
- [x] [Text Components](#supported-components-specifications-parameters) with input validation.
- [x] Form component requirement: Components can be flaged as required, forcing the user to fill them to submit.
- [x] Color style customization from the form file.
- [x] [Text Components](#supported-components-specifications-parameters) with input validation.
- [ ] Support to other types of components such as option selection or date picker.
- [ ] Support to networking calls.

## Requirements
- Swift 5.0 or later 
- iOS 13.0 or later
- Xcode 10.0 or later

## Usage
### Installing using Swift Package Manager
1. In a Xcode project, click on "File"
2. Click on "Swift Packages" and select "Add Package Dependency"
3. Paste the web url for this repository: https://github.com/Galdineris/Formworks.git
4. Set Rules to Branch on "master"
5. Done
After this, you can fetch the latest changes to the framework  by selecting "Update to Latest Package Versions" in step 2.

### Importing Formworks to your Project
```swift
import Formworks
```

### Creating a Form
```swift
let dataFromJSON: Data = // Fetch your JSON data.
let formConfiguration = FWConfiguration(json: dataFromJSON, style: .light)

let formViewController = FWFormViewController(configuration: formConfiguration)
// Present as desired.
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

### Form
Parameter | Type | Description | Required | Default Value
------------ | ------------- | ------------- | ---------- | ---------
id | String | Object unique ID | Yes | -
responseFormat | String | Response format for the form. Can either be "long" or "short" | Yes | -
title | String | Form title. It will be presented in the top of the form. | Yes | -
components | [Component] | An array that contains all the components that will be presented in the form. | Yes | -


### Base Component
Parameter | Type | Description | Required | Default Value
------------ | ------------- | ------------- | ------------- | ---------
id | String | Object unique ID | Yes | -
title | String | Component's title. It should be a definition about how the field could be filled. | Yes | -
description | String | Component's description. It could be an aditional explanation about how the field could be filled. | No | ""
required | Bool | Specifies if the field has to be filled or not.| No | false
validator | Validator | Determines the type of validation.| Yes | -

### Text Components
These parameters are in addition to the parameters in the [base components](#base-component).
Parameter | Type | Description | Required | Default Value
------------ | ------------- | ------------- | ------------- | -------------
placeholder | String | Text displayed on the component's field when it's empty. | No | ""
regex | String | Regular expression used for validating the input in `text` components. If the regex is wrong or missing, the component will accept anything. | No | ""

### Validators

The default regex for each component can be found in the `FWRegex` enum in our [Documentation](https://myformworks.github.io/Formworks/Enums/FWRegex.html).

In case of a `custom` regex the rule will be determinated by the `regex` key.

## [Documentation](https://myformworks.github.io/Formworks/)

## Contribuiting
Please see [CONTRIBUTING.md](Resources/CONTRIBUTING.md).

## Authors
This project was started by

[Artur Carneiro](https://csfar.github.io)

[Cassia Barbosa](https://cassiaabarbosa.github.io)

Edgar Sgroi

[Rafael Galdino](https://galdineris.github.io)

Victor Falcetta

