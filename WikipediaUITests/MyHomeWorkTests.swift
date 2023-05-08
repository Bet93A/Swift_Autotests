import XCTest

final class MyHomeTaskCase: XCTestCase {

    override func setUpWithError() throws {
        let app = XCUIApplication(bundleIdentifier: "org.wikimedia.wikipedia")
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    func testCheckTopRead() throws {
        let mainScreen = MainScreen()
        let topReadScreen = TopReadScreen()
        mainScreen.tapButtonAllTopRead()
        topReadScreen.checkHeader()
    }

    func testCheckBlocksAboutApp() throws {
        let mainScreen = MainScreen()
        let settingScreen = SettingScreen()
        let aboutAppScreen = AboutAppScreen()
        mainScreen.tapButtonSetting()
        settingScreen.tapButtonAboutApp()
        aboutAppScreen.checkBlockAuthors()
        aboutAppScreen.checkBlockTranslators()
        aboutAppScreen.checkBlockLicense()
    }
    
    func testCheckSwitchToBrowser() throws {
        let mainScreen = MainScreen()
        let settingScreen = SettingScreen()
        mainScreen.tapButtonSetting()
        settingScreen.tapButtonDonate()
        settingScreen.checkOpenBrowser()
    }
}
