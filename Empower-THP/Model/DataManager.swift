//
//  DataManager.swift
//  Empower-THP
//
//  Created by Sophia Gorgonio on 3/7/24.
//

import Foundation

class DataManager {
    func fetchData(completion: @escaping ([Person]) -> Void) {
        if let fileURL = Bundle.main.url(forResource: "Beneficiaries", withExtension: "json"),
           let jsonData = try? Data(contentsOf: fileURL) {
            do {
                let people = try JSONDecoder().decode([Person].self, from: jsonData)
                completion(people)
            } catch {
                print("Error decoding JSON: \(error)")
                completion([])
            }
        } else {
            print("Error loading JSON file")
            completion([])
        }
    }
}
