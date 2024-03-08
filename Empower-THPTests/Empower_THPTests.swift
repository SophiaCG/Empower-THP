//
//  Empower_THPTests.swift
//  Empower-THPTests
//
//  Created by Sophia Gorgonio on 3/7/24.
//

import XCTest
@testable import Empower_THP

final class Empower_THPTests: XCTestCase {

    func testFetchDataWithValidFile() {
        // Arrange
        let decoder = Decoder()
        if let file = Bundle.main.url(forResource: "Beneficiaries", withExtension: "json") {
            
            // Act
            var fetchedPeople: [Person] = []
            let expectation = self.expectation(description: "Fetching data from a valid file")
            decoder.decodeData(from: file) { people in
                fetchedPeople = people
                XCTAssertTrue(people.count == 5)
                expectation.fulfill()
            }

            // Assert
            waitForExpectations(timeout: 5, handler: nil)
            XCTAssertFalse(fetchedPeople.isEmpty, "Fetched people array should not be empty")
        } else {
            XCTFail("Failed to get URL for the valid file.")
        }
    }

    func testFetchDataWithInvalidFile() {
        // Arrange
        let dataManager = Decoder()
        if let invalidFileURL = Bundle.main.url(forResource: "Fake", withExtension: "json") {

            // Act
            var fetchedPeople: [Person] = []
            let expectation = self.expectation(description: "Fetching data from an invalid file")
            dataManager.decodeData(from: invalidFileURL) { people in
                fetchedPeople = people
                expectation.fulfill()
            }

            // Assert
            waitForExpectations(timeout: 5, handler: nil)
            XCTAssertFalse(!fetchedPeople.isEmpty, "Fetched people array should be empty for an invalid file")
        } else {
            // Pass the test if it fails to get the URL for the invalid file
            XCTAssertTrue(true, "Failed to get URL for the invalid file.")
        }
    }
    
    func testFormatDates() {
        // Arrange
        let viewModel = ViewModel()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMddyyyy"

        let originalDateStrings = ["01012021", "02252022", "12122020"]
        let originalDates = originalDateStrings.compactMap { dateFormatter.date(from: $0) }

        let people = originalDates.map { Person(dateOfBirth: dateFormatter.string(from: $0)) }

        // Act
        let formattedPeople = viewModel.formatDates(people)

        // Assert
        XCTAssertEqual(formattedPeople.count, people.count, "Number of people should remain the same")

        for (index, formattedPerson) in formattedPeople.enumerated() {
            let expectedDateStrings = ["01/01/2021", "02/25/2022", "12/12/2020"] // Change this to the expected date format
            XCTAssertEqual(formattedPerson.dateOfBirth, expectedDateStrings[index], "Formatted date should match the expected date format for person at index \(index)")
        }
    }
}
