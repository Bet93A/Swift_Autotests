import XCTest

class SettingScreen: XCTestCase {
    let app = XCUIApplication(bundleIdentifier: "org.wikimedia.wikipedia")
    let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
    
    func tapButtonAboutApp() {
        let aboutApp = app.tables.cells.staticTexts["О приложении"]
        while !(aboutApp.isHittable) {
            app.swipeUp()
        }
        aboutApp.tap()
    }
    
    func tapButtonDonate() {
        let donateApp = app.tables.cells.staticTexts["Поддержать Википедию"].firstMatch
        while !(donateApp.isHittable) {
            app.swipeUp()
        }
        donateApp.tap()
    }
    
    func checkOpenBrowser() {
        XCTAssertTrue(safari.exists)
    }    
}
