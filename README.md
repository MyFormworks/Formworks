# Formworks
![Platform](https://img.shields.io/static/v1?label=platform&message=iOS&color=orange)
![SPM](https://img.shields.io/static/v1?label=SwiftPackageManager&message=compatible&color=sucess)

Formworks is a framework built on UIKit for building forms from JSON files on iOS.

1. [Features](#features)
2. [Requirements](#requirements)
3. [Usage](#usage)
    - [Installing using Swift Package Manager](#installing-using-swift-package-manager)
    - [Creating a Form](#creating-a-form)
    - [Getting data from a Form](#getting-data-from-a-form)
4. [Form Input Format](#form-input-format)
    - [Input Example](#input-example)
    - [Parameters](#parameters)
        - [Form](#form)
        - [Components](#components)
        - [Base Component](#base-component)
        - [Text Component](#text-component)
        - [Validators](#validators)
5. [Form Output Format](#form-output-format)
    - [Long Output Example](#long-output-example)
    - [Short Output Example](#short-output-example)
6. [Glossary](Resources/glossary.md)
7. [Contribuiting](#contribuiting)
8. [Authors](#authors)

## Features
- [x] Create form screens directly from json files.
- [x] [Text Components](#supported-components-specifications-parameters) with input validation.
- [x] Form component requirement: Components can be flaged as required, forcing the user to fill them to submit.
- [x] Color style customization from the form file.
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
let formViewController = FWFormViewController(for: dataFromJSON)
// present formViewController
```

### Receiving data from a Form
To get the data from a Form, it is necessary to implement the procotol `FWFormDelegate` in a given class.
The data comes in JSON format.
(For more information, refer to [Form Output Format](#form-output-format))
```swift
extension ExampleClass: FWFormDelegate {
    func result(_ data: Data) {
        // Manipulate data
    }
}
```

## Form Input Format

### JSON Input Example 
```json
    {
    "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
    "responseType": "long",
    "title": "Formworks Title",
    "components": [{
            "text": {
                "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
                "title": "What is your name?",
                "description": "Type your name.",
                "required": true,
                "validator": "max32",
                "placeholder": "Your name",
                "isMultiline": false
            }
        },
        {
            "text": {
                "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
                "title": "What is your e-mail?",
                "description": "Type your e-mail.",
                "required": true,
                "validator": "email",
                "placeholder": "youremail@example.org",
                "isMultiline": false
            }
        },
        {
            "text": {
                "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
                "title": "Tell us a little bit about yourself",
                "description": "We want to know more about you.",
                "validator": "max32",
                "isMultiline": true
            }
        },
        {
            "text": {
                "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
                "title": "What is your mother's name?",
                "description": "Type your name.",
                "required": true,
                "validator": "custom",
                "regex": "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$",
                "placeholder": "Your mother's name",
                "isMultiline": false
            }
        }
    ]
}
```

### Parameters

### Form
Parameter | Type | Description | Required | Default Value
------------ | ------------- | ------------- | ---------- | ---------
title | String | Form title. It will be presented in the top of the form. | Yes | -
components | [Component] | An array that contains all the components that will be presented in the form. | Yes | -

### Components
These keys are the type of component that you want. They need to be given as the component key followed by the parameters of Base Component and the parameters of the respective component.
Key | Type | Description
------------ | ------------- | -------------
text | FWTextModel | A text component.

### Base Component
Parameter | Type | Description | Required | Default Value
------------ | ------------- | ------------- | ------------- | ---------
title | String | Component's title. It should be a definition about how the field could be filled. | Yes | -
description | String | Component's description. It could be an aditional explanation about how the field could be filled. | No | ""
required | Bool | Specifies if the field has to be filled or not.| No | false
validator | Validator | Determines the type of validation.| Yes | -

### Text Component
These parameters are in addition to the parameters in the base components.
Parameter | Type | Description | Required | Default Value
------------ | ------------- | ------------- | ------------- | ---------
placeholder | String | Component's title. It should be a definition about how the field could be filled. | No | ""
isMultiline | Bool | Component's description. It could be an aditional explanation about how the field could be filled. | No | false
regex | String | This parameter is only necessary if the validator is of `custom` type. In this case, if regex value is wrong or missing, the validator will accept anything. | No | ""

### Validators

The default validator is based on regex. There is the protocol `FWValidator` available for you to implement your own validator when needed.

However, in the **current version** of Formworks registration of a custom validator **is not possible**. Nevertheless it is possible to use custom regexes with `FWRegexValidador`, which is the struct responsible to make validations using any viable regex structure.

Formworks **current** default regex validators are stated below:

* email: ``` [0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,64} ```
* phonenumber: ``` \(?\b([0-9]{2,3}|0((x|[0-9]){2,3}[0-9]{2}))\)?\s*[0-9]{4,5}[- ]*[0-9]{4}\b ```
* max32: ``` [A-Za-z0-9 !\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~]{0,32} ```

In case of a `custom` regex the rule will be determinated by the `regex` key.

This regexes can be founded in the `FWRegex` enum.

## Form Output Format

### Long Output Example 
        
```json
{
    "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
    "title": "Your Form Title",
    "responseType": "long",
    "components": [
        {
            "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
            "type": "text",
            "title": "Text Field Title",
            "description": "Text Field Description",
            "validator": "max256",
            "value": "Text Field Response Value"
        },
        {
            "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
            "type": "text",
            "title": "Text Field Title",
            "description": "Text Field Description",
            "validator": "max256",
            "value": "Text Field Response Value"
        }
    ]
}
```

### Short Output Example 
```json
{
    "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
    "title": "Your Form Title",
    "responseType": "short",
    "components": [
        {
            "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
            "type": "text",
            "value": "Text Field Response Value"
        },
        {
            "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
            "type": "text",
            "value": "Text Field Response Value"
        }
    ]
}
```

## [Glossary](Resources/glossary.md)

## Contribuiting
Please see [CONTRIBUTING.md](Resources/CONTRIBUTING.md).

## Authors
This project was started by
Artur Carneiro
Cassia Barbosa
Edgar Sgroi
Rafael Galdino
Victor Falcetta
