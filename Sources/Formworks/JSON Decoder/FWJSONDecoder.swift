//
//  FWJSONDecoder.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 05/10/20.
//

import Foundation

/// This class is reponsible to get the JSON and transform in data.
enum FWJSONDecoder {
    /// Currently a function that gets a JSON from a local archive and
    /// tranforms into a Data.
    static func dataFetcher(url: String,completion: (Result<FWForm, Error>) -> Void) {
        let path = url
        guard let url = URL(string: path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let form = try decoder.decode(FWForm.self, from: data)
            completion(.success(form))
        } catch {
            completion(.failure(error))
        }
    }
}
