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
4. [JSON Format ](#json-format)
    - [Parameters in a Form](#parameters-in-a-form)
    - [Components Types](#components-types)
    - [Parameters in a Base Component](#parameters-in-a-base-component)
    - [Parameters in a Text Component](#parameters-in-a-text-component)
    - [JSON Input Example ](#json-input-example)
    - [Validators](#validators)
    - [JSON Long Output Example ](#json-long-output-example)
    - [JSON Short Output Example ](#json-short-output-example)
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
### Getting data from a Form
To get the data from a Form, it is necessary to implement the procotol `FWFormDelegate` in a given class.

```swift
class ExampleClass: FWFormDelegate {
    func result(_ data: Data) {
        // Get data from data variable
    }
}
```

## JSON Format 
### Parameters in a Form
Parameter | Type | Description | Required | Default Value
------------ | ------------- | ------------- | ---------- | ---------
title | String | Form title. It will be presented in the top of the form. | Yes | -
components | [Component] | An array that contains all the components that will be presented in the form. | Yes | -

### Components Types
These keys are the type of component that you want. They need to be given as the component key followed by the parameters of Base Component and the parameters of the respective component.
Key | Type | Description
------------ | ------------- | -------------
text | FWTextModel | A text component.

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
regex | String | This parameter is only necessary if the validator is of `custom` type. In this case, if regex value is wrong or missing, the validator will accept anything. | No | ""

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

### Validators

The default validator is based on regex. There is the protocol `FWValidator` available for you to implement your own validator when needed.

However, in the **current version** of Formworks registration of a custom validator **is not possible**. Nevertheless it is possible to use custom regexes with `FWRegexValidador`, which is the struct responsible to make validations using any viable regex structure.

Formworks **current** default regex validators are stated below:

* email: ``` ["[0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,64}"] ```
* phonenumber: ```["(?:^\([0]?[1-9]{2}\)|^[0]?[1-9]{2}[\.-\s]?)[9]?[1-9]\d{3}[\.-\s]?\d{4}"] ```
* max32: ``` ["[A-Za-z0-9 !\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~]{0,32}"] ```

In case of a `custom` regex the rule will be determinated by the `regex` key.

This regexes can be founded in the `FWRegex` enum.

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
