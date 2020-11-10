//
//  FormGenerator.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 03/11/20.
//

import Foundation

/// Responsible for generating a form.
protocol FormGenerator {
	/// Sets up a form to be generated.
	/// - Parameter completion: Whether or not the setup has failed.
    func setUp(completion: @escaping (Error?) -> Void)
	
	/// Generates a form to be displayed.
    func generate(completion: (Result<FWFormViewController, Error>) -> Void)

    /// Receives a form's answers as `FWFormSnapshot`.
    func receive(_ answers: FWFormSnapshot)
	
	/// Initializes a new instance of this type.
	/// - Parameter configuration: The configuration used to create a form.
	init(configuration: FWConfiguration)
}
