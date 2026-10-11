//
//  LoginKitApp.swift
//  LoginKit
//
//  Created by Jonathan Heinzman on 10/10/26.
//

import SwiftUI
import UIKit

@main
struct LoginKitApp: App {
    
    init() {
        if ProcessInfo.processInfo.arguments.contains("-UITesting-Reset") {
            SessionStore().clear()
        }
        
        // TODO (Exercise 3): when launched with "-UITesting-NoAnimations",
        // call UIView.setAnimationsEnabled(false). You'll need `import UIKit`.
        if ProcessInfo.processInfo.arguments.contains("-UITesting-NoAnimations") {
            UIView.setAnimationsEnabled(false)
        }
    }
 
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
