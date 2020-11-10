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

    /// Initializes the structure's data instance with the passed URL parameter.
    /// - Parameter url: An URL type parameter that will be used to instaciate a Data var.
    public init(url: URL) throws {
        self.data = try Data(contentsOf: url)
    }
    /// Initializes the structure's data instance with the passed data parameter.
    /// - Parameter data: An Data type parameter that will be used for decoding.
    init(data: Data) {
        self.data = data
    }

    /**
     Tries to decode the JSON into a generic type
     and return as success completion case a generic
     type to create our form.
     - Parameters:
     - completionHandler: Returns an generic structure on sucess and a generic error on failure.

     - Parameter result: Enum containing the results of the operation.
     */
    func decode<T: Decodable>(completionHandler: @escaping (_ result: Result<T, Error>) -> Void) {
        do {
            let decoder = JSONDecoder()
            let form = try decoder.decode(T.self, from: data)
            completionHandler(.success(form))
        } catch {
            completionHandler(.failure(error))
        }
    }

    /**
     Tries to decode the JSON into a form structure type
     and return as a success completion case a
     FWFormData to create our form.

     - Parameters:
     - completionHandler: Returns an FWFormData structure on sucess and a generic error on failure.

     - Parameter result: Enum containing the results of the operation.

     */
    func decode(completionHandler: @escaping (_ result: Result<FWFormModel, Error>) -> Void) {
        do {
            let decoder = JSONDecoder()
            let form = try decoder.decode(FWFormModel.self, from: data)
            completionHandler(.success(form))
        } catch {
            completionHandler(.failure(error))
        }
    }
/**
     Tries to decode the JSON into a component and return as a completion case a FWComponent.
     - Parameters:
     - completionHandler: Returns an FWComponentData on sucess and a generic error on failure
     - Parameter result: Enum containing the results of the operation.
     */
    func decode(completionHandler: @escaping (_ result: Result<FWComponentModel, Error>) -> Void) {
        do {
            let decoder = JSONDecoder()
            let component = try decoder.decode(FWDecodedComponentModel.self, from: data)
            completionHandler(.success(component.base))
        } catch {
            completionHandler(.failure(error))
        }
    }
}
