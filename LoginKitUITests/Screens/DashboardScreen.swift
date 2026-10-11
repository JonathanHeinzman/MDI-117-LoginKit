//
//  DashboardScreen.swift
//  LoginKit
//
//  Created by Jonathan Heinzman on 10/10/26.
//

import XCTest

struct DashboardScreen {
    let app: XCUIApplication
    
    var welcomeLabel: XCUIElement { app.staticTexts["welcome_label"] }
    var logoutButton: XCUIElement { app.buttons["logout_button"] }
    
    @discardableResult
    func logout() -> Self {
        XCTAssertTrue(logoutButton.wait(until: "isEnabled == true"))
        logoutButton.tap()
        return self
    }
}
