//
//  FWJSONDecoder.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 05/10/20.
//

import Foundation

/// This class is reponsible to get the JSON and transform in data.
class FWJSONDecoder {
    
    let jsonPath: String?
    
    init( _ jsonPath: String?) {
        self.jsonPath = jsonPath
    }
    /// Currently a function that gets a JSON from a local archive and
    /// tranforms into a Data.
    func dataFetcher(_ jsonPath: String? ,completion: (Result<FWForm, Error>) -> Void) {
        guard let path = jsonPath else { return }
        guard let url = URL(string: path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            do {
                let form = try decoder.decode(FWForm.self, from: data)
                completion(.success(form))
            } catch {
                print("Couldn't decode the contents of the JSON file.")
            }
        } catch {
            print("Couldn't find or receive JSON.")
        }
    }
}
