//
//  FWJSONDecoder.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 05/10/20.
//

import Foundation

/// This class is reponsible to get the JSON and transform in data.
struct FWJSON {
    private var data: Data

    init(url: URL) throws {
        self.data = try Data(contentsOf: url)
    }

    init(data: Data) {
        self.data = data
    }

    /// Tries to decode the JSON into a form.
    func decode<T: Decodable>(completion: (Result<T, Error>) -> Void) {
        do {
            let decoder = JSONDecoder()
            let form = try decoder.decode(T.self, from: data)
            completion(.success(form))
        } catch {
            completion(.failure(error))
        }
    }


    /// Tries to decode the JSON into a form.
    func decode(completion: (Result<FWForm, Error>) -> Void) {
        do {
            let decoder = JSONDecoder()
            let form = try decoder.decode(FWForm.self, from: data)
            completion(.success(form))
        } catch {
            completion(.failure(error))
        }
    }

    /// Tries to decode the JSON into a component.
    func decode(completion: (Result<FWComponentData, Error>) -> Void) {
        do {
            let decoder = JSONDecoder()
            let component = try decoder.decode(FWComponentData.self, from: data)
            completion(.success(component))
        } catch {
            completion(.failure(error))
        }
    }
}
