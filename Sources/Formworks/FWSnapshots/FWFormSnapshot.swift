//
//  FWFormSnapshot.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 16/10/20.
//

import Foundation

public struct FWFormSnapshot: Encodable {
	let title: String
	var components: [FWTextComponentSnapshot]
}
