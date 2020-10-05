//
//  FWSingleSelect.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 05/10/20.
//

import Foundation

///This struct represents the fild type "single-select". This fild is used to users add just one given options on the form.
struct FWSingleSelect: FWField {
	var options: [String?]
}
