import XCTest

class AboutAppScreen: XCTestCase {
    let app = XCUIApplication(bundleIdentifier: "org.wikimedia.wikipedia")
    
    func checkBlockAuthors() {
        let authors = app.otherElements.staticTexts["Авторы"]
        while !(authors.isHittable) {
            app.swipeUp()
        }
        XCTAssertTrue(authors.exists)
    }
    
    func checkBlockTranslators() {
        let translators = app.otherElements.staticTexts["Переводчики"]
        while !(translators.isHittable) {
            app.swipeUp()
        }
        XCTAssertTrue(translators.exists)
    }
    
    func checkBlockLicense() {
        let license = app.otherElements.staticTexts["Лицензия содержимого"]
        while !(license.isHittable) {
            app.swipeUp()
        }
        XCTAssertTrue(license.exists)
    }
    
}
