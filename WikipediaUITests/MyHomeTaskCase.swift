import XCTest

final class MyHomeTaskCase: XCTestCase {
    let app = XCUIApplication(bundleIdentifier: "org.wikimedia.wikipedia")
    let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()

    }

    override func tearDownWithError() throws {
    }

    func testCheckTopRead() throws {
        // let firstButton = app.buttons.firstMatch
        let topReadArticle = app.staticTexts["Все самые читаемые статьи"]
        let topReadHeader = app.otherElements.staticTexts["Самые читаемые"]
        while !(topReadArticle.isHittable) {
            app.swipeUp()
        }
        topReadArticle.tap()
        XCTAssertTrue(topReadHeader.exists)
    }

    func testCheckBlocksAboutApp() throws {
        let settingButton = app.toolbars.buttons["Настройки"].firstMatch
        let aboutApp = app.tables.cells.staticTexts["О приложении"]
        let authors = app.otherElements.staticTexts["Авторы"]
        let translators = app.otherElements.staticTexts["Переводчики"]
        let licence = app.otherElements.staticTexts["Лицензия содержимого"]
        settingButton.tap()
        while !(aboutApp.isHittable) {
            app.swipeUp()
        }
        aboutApp.tap()
        while !(authors.isHittable) {
            app.swipeUp()
        }
        XCTAssertTrue(authors.exists)
        while !(translators.isHittable) {
            app.swipeUp()
        }
        XCTAssertTrue(translators.exists)
        while !(licence.isHittable) {
            app.swipeUp()
        }
        XCTAssertTrue(licence.exists)
                        
    }
    
    func testCheckSwitchToBrowser() throws {
        // let settingButt = app.toolbars.buttons["Настройки"].firstMatch
        let donateApp = app.tables.cells.staticTexts["Поддержать Википедию"].firstMatch
        // settingButt.tap()
        donateApp.tap()
        XCTAssertTrue(safari.exists)
    }
}

extension XCUIElement {
    @discardableResult
    func wait(_ timeout:TimeInterval = 10) -> Self {
        XCTAssertTrue(self.waitForExistence(timeout: timeout), "Element does not exist!")
        return self
    }
}
