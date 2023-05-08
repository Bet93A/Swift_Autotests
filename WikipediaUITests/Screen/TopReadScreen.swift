import XCTest

class TopReadScreen: XCTestCase {
    let app = XCUIApplication(bundleIdentifier: "org.wikimedia.wikipedia")
    
    func checkHeader() {
        let topReadHeader = app.otherElements.staticTexts["Самые читаемые"]
        XCTAssertTrue(topReadHeader.exists)
    }
}
