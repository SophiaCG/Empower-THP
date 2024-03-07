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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMddyyyy"
        
        return people.map { person in
            var formattedPerson = person
            if let originalDateString = person.dateOfBirth {
                if let originalDate = dateFormatter.date(from: originalDateString) {
                    let outputDateFormatter = DateFormatter()
                    outputDateFormatter.dateFormat = "MM/dd/yyyy"
                    formattedPerson.dateOfBirth = outputDateFormatter.string(from: originalDate)
                }
            }
            return formattedPerson
        }
    }
}
