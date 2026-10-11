//
//  AuthServiceProtocol.swift
//  LoginKit
//
//  Created by Jonathan Heinzman on 10/10/26.
//

import Foundation
 
protocol AuthServiceProtocol {
    func login(email: String, password: String) async throws -> User
}
 
enum AuthError: Error, LocalizedError {
    case invalidCredentials
 
    var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            return "Invalid email or password"
        }
    }
}
 
