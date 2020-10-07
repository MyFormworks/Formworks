//
//  FWComponent.swift
//  
//
//  Created by Rafael Galdino on 01/10/20.
//

/**
 A type that represents a form component.
 */
protocol FWComponent: Decodable, SpecDecoder {
    
    /// Component's Title. Appears on top of the component.
    var title: String { get set }
    /// Component's Title. Should match one of FWComponentTypes cases.
    var componentType: FWComponentTypes { get set }
    /// Component's Subtitle or description. Appears under the title.
    /// Optional.
    var subtitle: String? { get set }
    /// Error message that will appear when the component is not validated
    /// Optional.
    var errorMessage: String? { get set }
    /// Determines if the component will be obligatory in the form.
    var required: Bool { get set }
    /// Contains the component's implementation specifications
    var specs: FWSpecs? { get set }
    init(from decoder: Decoder) throws
    
    /// Immediatly return an memory allocation of the object. Should not be subclassed
    init()
}

extension FWComponent {
    init(from decoder: Decoder) throws {
        self.init()

        let container = try decoder.container(keyedBy: FWComponentKeys.self)

        title = try container.decode(String.self, forKey: .title)
        subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle)
        errorMessage = try container.decodeIfPresent(String.self, forKey: .errorMessage)
        required = try container.decode(Bool.self, forKey: .required)
        specs = try decodeField(from: container)
        

//        guard let type = try container.decodeIfPresent(FWComponentTypes.self, forKey: .componentType) else {
//            throw FWComponentKeys.Errors.couldNotDecode
//        }

//TODO: Make [String:Any] decodable. 
//        let specsDict: [String:Any] = try container.decode([String:Any].self, forKey: .specs)
//        specfications = type.specsFor(specsDict)
    }
}
