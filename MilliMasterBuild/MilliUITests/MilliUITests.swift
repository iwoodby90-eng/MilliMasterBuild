import XCTest

final class MilliUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testNavigationTabs() {
        app.tabBars["Tab Bar"].buttons["Payouts"].tap()
        XCTAssertTrue(app.navigationBars["PAYOUTS"].exists)
        
        app.tabBars["Tab Bar"].buttons["Wealth"].tap()
        XCTAssertTrue(app.staticTexts["WEALTH & TAX"].exists)
    }
    
    func testCenterMButtonReturnsHome() {
        app.tabBars["Tab Bar"].buttons["Wealth"].tap()
        app.buttons["HOME"].tap() // Assuming accessibility identifier or label
        XCTAssertTrue(app.staticTexts["AVAILABLE TO SPEND"].exists)
    }
}