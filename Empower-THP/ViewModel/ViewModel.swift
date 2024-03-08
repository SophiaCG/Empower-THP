//
//  ViewModel.swift
//  Empower-THP
//
//  Created by Sophia Gorgonio on 3/7/24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var people: [Person] = []
    private let dataManager = DataManager()

    func fetchData() {
        dataManager.fetchData { [weak self] people in
            // Format dates before updating the @Published property
            var formattedPeople = self?.formatDates(people) ?? []
            self?.people = formattedPeople
        }
    }

    private func formatDates(_ people: [Person]) -> [Person] {
        // Set original date format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMddyyyy"
        
        // Map over array of people to transform date format
        return people.map { person in
            var formattedPerson = person
            
            // Check if original date string is present
            if let originalDateString = person.dateOfBirth {
                
                // Convert original date string to Date object
                if let originalDate = dateFormatter.date(from: originalDateString) {
                    
                    // Set new date format
                    let newDateFormatter = DateFormatter()
                    newDateFormatter.dateFormat = "MM/dd/yyyy"
                    
                    // Format date and convert it back to a string
                    formattedPerson.dateOfBirth = newDateFormatter.string(from: originalDate)
                }
            }
            
            // Return person with new formatted date
            return formattedPerson
        }
    }
}
