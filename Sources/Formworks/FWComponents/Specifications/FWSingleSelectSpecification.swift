//
//  FWSingleSelectSpecification.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 05/10/20.
//

/**
 This struct represents the type "single-select".

 This specification is used to users add just one given options on the form.
 */
struct FWSingleSelectSpecification: FWSpecification {
	var options: [String?]
}
