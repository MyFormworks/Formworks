# Glossary
## UI Component
A UI Component is a representation of one of many types of inputs available in a form. It is composed of a UIViewController and a ViewModel, which communicates with its UIViewController through the Protocol-delegate pattern.
**A UI Component should only be instantiated as part of a root UIViewController through UIViewController containment.**
## RootViewController
A RootViewController is a UIViewController responsible for being the container of all the UI Components of a given form. This object is the one responsible for the instantiation of each UI Component and for receiving and sending data to the "outside world".