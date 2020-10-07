//
//  FWForm.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 02/10/20.
//

import Foundation

///This struct represents the form itself.
struct FWForm: Decodable  {
	let title: String
	let components: [FWComponentData]
}
