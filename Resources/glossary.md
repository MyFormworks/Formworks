# Glossary
* [Terminology](#terminology)
  * [Component](#component)
  * [Form](#form)
  * [JSON](#json)
  * [Response](#response)
  * [Style](#style)
  * [ViewModel](#viewmodel)

* [Nomenclature](#development)
  * [FWConfiguration](#fwconfiguration)
  * [FWFormGenerator](#fwformgenerator)
  * [FWFormGeneratorDelegate](#fwformgeneratordelegate)
  * [FWFormViewController](#fwformviewcontroller)
  * [FWFormViewModel](#fwformviewmodel)
  * [FWCollectionView](#fwcollectionview)
  * [FWComponentCell](#fwcomponentcell)
  * [FWComponentViewModel](#fwcomponentviewmodel)
  * [FWStyle](#fwstyle)
  
## Terminology
### Component
The building block of a form. It usually has a title and a field to be filled and makes up the body of the form, with every form having one or more of these. 
The submit button at the end of a form is also a component.
### Form
A list in which each entry is comprised of a field to be filled, with a submit button at the end.
### JSON
JSON file containing the specifications of a form. For more information, please refer to the usage section of our README.md.
### Response
The data provided by filling out the form.
### Style
The color pallete of the form and it's components.
### ViewModel
One of the parts of a MVVM architecture, which our project follows. Responsible for processing requests from the view controller and manipulating the data from the models.

## Nomenclature
### FWConfiguration
`Struct`
Hold the data necessary for the form such as a Data object containing the JSON and a FWStyle.

### FWFormGenerator
`Final Class`
Responsible for creating and managing the form itself, returning a `UIViewController` of the form at start and calling the delegate to pass on the results when finished. 
It's considered the point of entry of our form and should be used when creating forms with our formwork.
Requires FWConfiguration and a FWFormGeneratorDelegate to be created.

### FWFormGeneratorDelegate
`Protocol`
Object to be called upon when the framework returns the form input data.
Depends onn the developer to be implemented.

### FWFormViewController
`Final Class`
The UIViewController subclass responsible for being the visual representation of the form. 
Crafted based the JSON data contained in FWConfiguration.

### FWFormViewModel
`Final Class`
ViewModel for FWFormViewController. 
Holds and array of FWComponentViewModel objects.

### FWCollectionView
`Final Class`
The UICollectionView subclass containing the components of our form.

### FWComponentCell
`Protocol`
Represents a cell of FWCollectionView. 
Demands classes to be subclassed from UICollenctionViewCell.

### FWComponentViewModel
`Protocol`
Represents the ViewModel of each FWComponentCell.
Demands the implementation of type attribute.

### FWStyle
`Enum`
Contains all the currently supported form styles.

### FWFieldViewModel
`Protocol`
Represents the ViewModel of each FWFieldCellView.
It contains title, description, validator and the required variables.

### FWTextFieldViewModel
`Struct`
Represents the ViewModel of FWTextCellView.
It contains placeholder and isMultiline variables.

### FWSelectFieldViewModel
`Struct`
Represents the ViewModel of FWSelectCellView.
It contains placeholder and options variables.

### FWFieldCellView
`Class`
Represents the base subclass of a UICollectionViewCell for FWCollectionView.
It's responsible for receiving an users' inputs.

### FWSubmitCellView
`Final Class`
It's a subclass of FWFieldCell responsible for sending results. It should only be used at the end of the FWCollectionView. 
It contains a button.

### FWTextCellView
`Final Class`
It's a subclass of FWFieldCell responsible for receiving text inputs from the user.

### FWSelectCellView
`Final Class`
It's a subclass of FWFieldCell responsible for receiving options selected by the user.
