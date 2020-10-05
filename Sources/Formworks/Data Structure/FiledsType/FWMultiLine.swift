//
//  File.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 05/10/20.
//

import Foundation

///This struct represents the fild type "multi-line". This fild is used to users add  mulitple text lines on the form.
struct FWMultiLine: FWField {
	var options: [String?]
	let placeholder: String?
}
