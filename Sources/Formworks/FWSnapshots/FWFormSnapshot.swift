//
//  FWFormSnapshot.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 16/10/20.
//

import Foundation

public struct FWFormSnapshot: Encodable {
	let title: String
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

public struct FWComponentSnapshotWrapper: Encodable {
    var componentSnapshot: FWComponentSnapshot

    init(_ snapshot: FWComponentSnapshot) {
        self.componentSnapshot = snapshot
    }

    public func encode(to encoder: Encoder) throws {
        try componentSnapshot.encode(to: encoder)
    }
}
