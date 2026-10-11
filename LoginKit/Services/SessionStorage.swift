//
//  SessionStorage.swift
//  LoginKit
//
//  Created by Jonathan Heinzman on 10/10/26.
//

import Foundation
 
nonisolated protocol SessionStoring {
    var rememberedEmail: String? { get set }
    func clear()
}
 
final class SessionStore: SessionStoring {
    private let defaults: UserDefaults
    private let key = "rememberedEmail"
 
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
 
    var rememberedEmail: String? {
        get { defaults.string(forKey: key) }
        set {
            defaults.set(newValue, forKey: key)
            defaults.synchronize()
        }
    }
 
    func clear() {
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
}
 
