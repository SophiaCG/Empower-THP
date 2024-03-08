//
//  Empower_THPUITests.swift
//  Empower-THPUITests
//
//  Created by Sophia Gorgonio on 3/7/24.
//

import XCTest

final class Empower_THPUITests: XCTestCase {

    func testContentAndDetailViews() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let collectionViewsQuery = app.collectionViews
        let firstCell = collectionViewsQuery.children(matching: .cell).element(boundBy: 0)
        let secondCell = collectionViewsQuery.children(matching: .cell).element(boundBy: 1)
        let exitButton = app.buttons["multiply"]

        XCTAssertTrue(firstCell.staticTexts["John Smith"].exists)
        XCTAssertTrue(firstCell.staticTexts["Spouse"].exists)
        XCTAssertTrue(firstCell.staticTexts["Primary"].exists)

        XCTAssertFalse(secondCell.staticTexts["Mary Smith"].exists)
        XCTAssertTrue(secondCell.staticTexts["Jane Smith"].exists)
        XCTAssertTrue(secondCell.staticTexts["Child"].exists)
        XCTAssertTrue(secondCell.staticTexts["Contingent"].exists)

        firstCell.tap()

        XCTAssertTrue(exitButton.exists)
        XCTAssertTrue(app.staticTexts["Social Security Number: XXXXX3333"].exists)
        XCTAssertTrue(app.staticTexts["Date of Birth: 04/20/1979"].exists)
        XCTAssertTrue(app.staticTexts["Phone Number: 3035555555"].exists)

        exitButton.tap()
        secondCell.tap()
        
        XCTAssertTrue(app.staticTexts["Social Security Number: XXXXX4664"].exists)
        XCTAssertTrue(app.staticTexts["Date of Birth: 01/11/2012"].exists)
        XCTAssertTrue(app.staticTexts["Phone Number: 3034455555"].exists)
                
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
