import Foundation

/// Protocol specifying the characteristics of a component snapshot.
protocol FWComponentSnapshot: Encodable {
    /// The input provided in the form.
    var response: String { get }
    /// Which kind of component is this
    var component: FWComponentModelWrapper.Types { get }
}
