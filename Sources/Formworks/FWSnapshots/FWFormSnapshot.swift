//
//  FWFormSnapshot.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 16/10/20.
//

import Foundation

/// Form response data structure.
public struct FWFormSnapshot: Encodable {
    /// Title of the form.
    let title: String
    /// Components of the Form
	var components: [FWComponentSnapshot]
}

extension FWFormSnapshot {

    private enum CodingKeys: String, CodingKey {
        case title, components
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try title.encode(to: encoder)
        try container.encode(components.map(FWComponentSnapshotWrapper.init), forKey: .components)
    }
}


/// Wrapper structure for decoding `FWComponentSnapshot`.
public struct FWComponentSnapshotWrapper: Encodable {
    /// Wrapped component snapshot.
    var componentSnapshot: FWComponentSnapshot

    /// Initializes the wrapper from a snapshot.
    /// - Parameter snapshot: Snapshot being wrapped.
    init(_ snapshot: FWComponentSnapshot) {
        self.componentSnapshot = snapshot
    }

    public func encode(to encoder: Encoder) throws {
        try componentSnapshot.encode(to: encoder)
    }
}
