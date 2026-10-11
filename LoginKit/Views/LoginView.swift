//
//  LoginView.swift
//  LoginKit
//
//  Created by Jonathan Heinzman on 10/10/26.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel
    // TODO (Exercise 8): add a @State to show / hide the password
    @State private var showPassword = false

    init(authService: AuthServiceProtocol = AuthService()) {
        _viewModel = StateObject(wrappedValue: LoginViewModel(authService: authService))
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("LoginKit")
                    .font(.largeTitle.bold())

                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .accessibilityIdentifier("email_field")

                // TODO (Exercise 8): switch between SecureField and TextField,
                // plus an eye button with id "toggle_password_visibility"
                
                HStack {
                    if showPassword {
                        TextField("Password", text: $viewModel.password)
                            .textFieldStyle(.roundedBorder)
                            .accessibilityIdentifier("password_field")
                    } else {
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(.roundedBorder)
                            .accessibilityIdentifier("password_field")
                    }
                    
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                    }
                    .accessibilityIdentifier("toggle_password_visibility")
                }
                
                Toggle("Remember Me", isOn: $viewModel.rememberMe)
                    .accessibilityIdentifier("remember_me_toggle")

                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .accessibilityIdentifier("error_label")
                }

                Button {
                    Task { await viewModel.login() }
                } label: {
                    if viewModel.isLoading {
                        ProgressView()
                            .accessibilityIdentifier("loading_indicator")
                    } else {
                        Text("Log In")
                    }
                }
                .accessibilityIdentifier("login_button")
                // TODO (Exercise 7): also disable while email or password is empty
                // TODO (Exercise 11): also disable when the user is locked out
                .disabled(viewModel.isLoading  || viewModel.email.isEmpty || viewModel.password.isEmpty)
            }
            .padding()
            .navigationDestination(item: $viewModel.loggedInUser) { user in
                DashboardView(user: user, onLogout: { viewModel.logout() })
            }
        }
    }
}
