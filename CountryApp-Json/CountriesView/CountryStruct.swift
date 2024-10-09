//
//  CountryStruct.swift
//  CountryApp-Json
//
//  Created by Emil Maharramov on 07.10.24.
//

import Foundation

struct CountryStruct: Codable {
    let name: String
    let flagImageName: String
    let cities: [CityStruct]
}
