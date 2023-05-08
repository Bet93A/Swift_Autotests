import XCTest

class MainScreen: XCTestCase {
    let app = XCUIApplication(bundleIdentifier: "org.wikimedia.wikipedia")
    
    func tapButtonAllTopRead() {
        let topReadArticle = app.staticTexts["Все самые читаемые статьи"]
        while !(topReadArticle.isHittable) {
            app.swipeUp()
        }
        topReadArticle.tap()
    }
    
    func tapButtonSetting() {
        let settingButton = app.toolbars.buttons["Настройки"]
        settingButton.tap()
    }
}
