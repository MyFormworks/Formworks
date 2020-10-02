//
//  FWComponent.swift
//  
//
//  Created by Rafael Galdino on 01/10/20.
//

/**
 A type that represents a form component.
 */
protocol FWComponent: Decodable {
     /**
     Component's Title

     Appears on top of the component.
     */
    var title: String { get set }
     /**
     Component's Type.

     Should match one of Helper.FWComponentTypes cases.
     */
    var componentType: String { get set }
     /**
     Component's Subtitle or Description

     Appears under the title.
     Optional
     */
    var subtitle: String? { get set }
    /**
     Determines if the component will be obligatory in the form.
     */
    var isObligatory: Bool { get set }
    /**
     The component's fields.
     */
    var fields: FWFields { get set }
    init(from decoder: Decoder) throws
    /**
     immediatly returns an memory allocation of the object. Should not be subclassed.
     */
    init()
}

extension FWComponent {
    init(from decoder: Decoder) throws {
        self.init()

        let container = try decoder.container(keyedBy: FWComponentKeys.self)

        title = try container.decode(String.self, forKey: .title)
        subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle)
        isObligatory = try container.decode(Bool.self, forKey: .isObrigatory)

        if let componentType = try container.decodeIfPresent(String.self, forKey: .componentType) {
            let typeIs = Helper.FWComponentTypes.self
            switch componentType {
            case typeIs.plainText:
                break
            case typeIs.email:
                break
            case typeIs.password:
                break
            case typeIs.singleSelect:
                break
            case typeIs.multipleSelect:
                break
            case typeIs.datePicker:
                break
            default:
                throw Helper.ComponentErrors.componentTypeUnavaiable
            }
        } else {
            throw Helper.ComponentErrors.couldNotDecodeType
        }
    }
}
