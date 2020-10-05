//
//  File.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 05/10/20.
//

import Foundation

///This struct represents the fild type "email". This fild is used to users add e-mail on the form.
struct FWEmail: FWField {
	var options: [String?]
	let placeholder: String?
}
