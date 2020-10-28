# Formworks
![Platform](https://img.shields.io/static/v1?label=platform&message=iOS&color=orange)
![SPM](https://img.shields.io/static/v1?label=SwiftPackageManager&message=compatible&color=sucess)

Formworks is a framework built on UIKit for building forms from JSON files on iOS.

1. [Features](#features)
2. [Requirements](#requirements)
3. [Usage](#usage)
    - [Installing using Swift Package Manager](#installing-using-swift-package-manager)
    - [Creating a Form](#creating-a-form)
4. [JSON Format ](#json-format)
5. [Glossary](docs/glossary.md)

## Features
- [x] Support to [Plain Text Component](#supported-components-specifications-parameters), a one line text field.
- [ ] Support to Text Box Component, a multiple lines text field.
- [ ] Support to Single Selection Component, a field where user can choose just one given option.
- [ ] Support to Multiple Selection Component, a field where user can choose more than one given options.
- [ ] Support to Email Component, a email input field.
- [ ] Support to Numerical Component, a numerical input field.
- [ ] Support to Date Picker Component, a picker where user can select a date
- [x] Every component has the property to be optional or required.
- [x] Every component has its own type validation.
- [ ] Networking layer for API requests
- [ ] Design customization.

## Requirements
- Swift 5.0 or later 
- iOS 13.0 or later
- Xcode 10.0 or later

## Usage
### Installing using Swift Package Manager
1. Create a new Xcode Project
2. In Xcode, click on "File"
3. Click on "Swift Packages"
4. Click on "Add Package Dependency"
5. Paste the web url for this repository: https://github.com/Galdineris/Formworks.git
6. Set Rules to Branch on "master"
7. Finish

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
## JSON Format 
### Parameters in a Form
Parameter | Type | Description | Required | Default Value
------------ | ------------- | ------------- | ---------- | ---------
title | String | Form title. It will be presented in the top of the form. | Yes | -
components | [Component] | An array that contains all the components that will be presented in the form. | Yes | -

### Parameters in a Base Component
Parameter | Type | Description | Required | Default Value
------------ | ------------- | ------------- | ------------- | ---------
title | String | Component's title. It should be a definition about how the field could be filled. | Yes | -
description | String | Component's description. It could be an aditional explanation about how the field could be filled. | No | ""
required | Bool | Specifies if the field has to be filled or not.| No | false
validator | Validator | Determines the type of validation.| Yes | -

### Parameters in a Text Component
These parameters are in addition to the parameters in the base components.
Parameter | Type | Description | Required | Default Value
------------ | ------------- | ------------- | ------------- | ---------
placeholder | String | Component's title. It should be a definition about how the field could be filled. | No | ""
isMultiline | Bool | Component's description. It could be an aditional explanation about how the field could be filled. | No | false

### Parameters in a Select Component
These parameters are in addition to the parameters in the base components.
Parameter | Type | Description | Required | Default Value
------------ | ------------- | ------------- | ------------- | ---------
options | [String] | All the available options. | Yes | -

### JSON Input Example 
```json
    {
        "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
        "responseType": "long",
        "title": "Formworks Title",
        "components": [
            {
                "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
                "type": "text",
                "title": "What is your name?",
                "description": "Type your name.",
                "required": true,
                "validator": "max32",
                "placeholder": "Your name",
                "isMultiline": false
            },
            {
                "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
                "type": "text",
                "title": "What is your e-mail?",
                "description": "Type your e-mail.",
                "required": true,
                "validator": "email",
                "placeholder": "youremail@example.org",
                "isMultiline": false
            },
            {
                "id": "87986E91-247F-4F36-A577-19DF6BD165D0",
                "type": "text",
                "title": "Tell us a little bit about yourself",
                "description": "We want to know more about you.",
                "validator": "max256",
                "isMultiline": true
            }
        ]
    }
```

### Validators

The default validator is based on regex. There is a protocol available for you to implement your own validator when needed.

However, in the **current version** of Formworks registration of a custom validator **is not possible**.

Formworks **current** default regex validators are stated below:

* email: ``` ["[0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,64}"] ```
* phonenumber: ```["[0-9]{2} [0-9]{8}", "[0-9]{2} [0-9]{4}-[0-9]{4}"] ```
* cellphone: ``` ["[0-9]{2} [0-9]{9}", "[0-9]{2} [0-9]{5}-[0-9]{4}"] ```
* max32: ``` ["[A-Za-z0-9 !\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~]{0,32}"] ```


### Supported Components Specifications Parameters
Parameter | Type | Components | Description 
------------ | ------------- | ------------- | ------------- 
placeholder | String? | Plain Text, Text Box, Email, Numerical, Phone Number | The auxiliary message displayed in the field

### JSON Long Output Example 
        
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
### JSON Short Output Example 
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
