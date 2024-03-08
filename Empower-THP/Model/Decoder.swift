//
//  Decoder.swift
//  Empower-THP
//
//  Created by Sophia Gorgonio on 3/7/24.
//

import Foundation

class Decoder {
        
    // Function to fetch data from a JSON file and decode it into an array of Person objects
    func decodeData(from file: URL, completion: @escaping ([Person]) -> Void) {
        // Check if the JSON file exists in the main bundle
        if FileManager.default.fileExists(atPath: file.path),
           let jsonData = try? Data(contentsOf: file) {
            
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
