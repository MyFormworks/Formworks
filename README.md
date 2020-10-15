# Formworks
![Platform](https://img.shields.io/static/v1?label=platform&message=iOS&color=orange)
![SPM](https://img.shields.io/static/v1?label=SwiftPackageManager&message=compatible&color=sucess)

Formworks is a framework for building forms from JSON files.

1. [Features](#features)
2. [Requirements](#requirements)
3. [Usage](#usage)
    - [Importing Formworks to your project](#importing-formworks-to-your-project)
    - [Supported Components](#supported-components)
    - [Creating a Form](#creating-a-form)
    - [Getting the Results](#getting-the-results)
    - [Validating Components](#validating-components)
4. [Glossary](docs/glossary.md)

## Features
- [x] Support to Single Line Component.
- [x] Every field type has the property to be optional or required.
- [x] Every field has its own type validation.
- [ ] Support to Multiple Line, Single Selection and Multiple Selection components.
- [ ] Networking layer for API requests
- [ ] Design customization.

## Requirements
- Swift 5.0 or later 
- iOS 13.0 or later
- Xcode 10.0 or later

## Usage
### Adding Formworks to your project
1. Create a new Xcode Project
2. In Xcode, click on "File"
3. Click on "Swift Packages"
4. Click on "Add Package Dependency"
5. Paste our url directory: https://github.com/Galdineris/Formworks.git
6. Choose Rules: Branch -> master
7. Finish

### Importing Formworks to your project
```swift
import Formworks
```
### Creating a form

### Getting the results

### Supported Components
Component | JSON key
------------ | -------------
Single Line | "single_line"
Email | "email"
Numerical | "numerical"
Telephone Number | "phone_number"
Cellphone Number | "cellphone_number"

### Validating Components
Our text fields can be validated using regex rules.
To add a validation to your form component, pass a regex rule in the component's specification section in the JSON file.
Components like "Email", "Telephone Number" and "Cellphone Number" already have their own validations, we accentuate that regex rules for Cellphone and Telephone Numbers can be changed according developers' requeriments.
Component | Regex Rule
------------ | -------------
Email | "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
Telephone Number | "+[0-9]{12}"
Cellphone Number | "+[0-9]{13}"


