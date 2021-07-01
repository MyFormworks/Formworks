import Foundation

/// Protocol specifying a component's data structure.
protocol FWComponentModel: Codable {
    ///The UUID of the component.
    var id: String { get }
    ///The title of the component.
    var title: String { get }
    ///A description or subtitle for the component
    var description: String { get }
    ///A Boolean value that determines if the component is required to be filled or not.
    var required: Bool { get }
    /// Component Specific Type
    var type: FWComponentModelWrapper.Types { get set }
}

/// Protocol specifying a component's data structure transfer object.
///
/// Used for decoding the object. We recommend keeping both Model and DTO
/// implementations in the same files, for one is expected to mirror another and
/// DTO is generally used only within the Model `Codable` methods.
protocol FWComponentModelDTO: Codable {
    ///The UUID of the component.
    var id: String? { get set }
    ///The title of the component.
    var title: String? { get set }
    ///A description or subtitle for the component
    var description: String? { get set }
    ///A Boolean value that determines if the component is required to be filled or not.
    var required: Bool? { get set }
}

