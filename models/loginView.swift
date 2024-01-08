//
//  loginView.swift
//  Back Home
//
//  Created by Tommy Hale on 1/6/24.
//

import Foundation


class LoginView: ObservableObject{
    
    @Published var username: String = ""
    @Published var passkey: String = ""

    func login() {
        LoginAction(
            parameters: LoginRequest(
                username: username,
                passkey: passkey
            )
        ).call { _ in
        // Login successful, navigate to the Home screen
        }
    }
    
}
