//
//  CountryVM.swift
//  CountryApp-Json
//
//  Created by Emil Maharramov on 07.10.24.
//

import Foundation

class CountryVM {
    
    var listItems = [CountryStruct]()

    func configureList(complete: @escaping () -> Void) {
        JsonParser.shared.parse(type: [CountryStruct].self, resourceName: "countries") { response in
            self.listItems = response
            complete()
        } failure: { errorMessage in
            print("Hata: \(errorMessage)")
        }
    }
}
