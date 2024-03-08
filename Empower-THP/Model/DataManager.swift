//
//  DataManager.swift
//  Empower-THP
//
//  Created by Sophia Gorgonio on 3/7/24.
//

import Foundation

class DataManager {
    
    // Function to fetch data from a JSON file and decode it into an array of Person objects
    func fetchData(completion: @escaping ([Person]) -> Void) {
        // Check if the JSON file exists in the main bundle
        if let fileURL = Bundle.main.url(forResource: "Beneficiaries", withExtension: "json"),
           let jsonData = try? Data(contentsOf: fileURL) {
            
            // Decode JSON data into an array of Person objects
            do {
                let people = try JSONDecoder().decode([Person].self, from: jsonData)
                
                // Call completion handler with Person array if successful
                completion(people)
            } catch {
                
                // Print error message and call completion handler with empty array
                print("Error decoding JSON: \(error)")
                completion([])
            }
        } else {
            
            // JSON file cannot be loaded and call completion handler with empty array
            print("Error loading JSON file")
            completion([])
        }
    }
}
