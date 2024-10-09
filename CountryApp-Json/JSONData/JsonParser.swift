//
//  JsonParser.swift
//  CountryApp-Json
//
//  Created by Emil Maharramov on 07.10.24.
//

import Foundation

class JsonParser {
    static let shared = JsonParser()
    
    func parse<T: Codable>(
        type: T.Type,
        resourceName: String,
        complete: @escaping (T) -> (),
        failure: @escaping (String) -> ()
    ) {
        if let url = Bundle.main.url(forResource: resourceName, withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                complete(model)
            } catch {
                failure(error.localizedDescription)
            }
        } else {
            failure("not found")
        }
    }
}
