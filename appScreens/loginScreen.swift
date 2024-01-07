//
//  loginScreen.swift
//  Back Home
//
//  Created by Tommy Hale on 1/6/24.
//

import Foundation
import SwiftUI
import SwiftData

struct MainLoginScreen: View {
    
    @ObservedObject var viewModel: LoginView = LoginView()
    
    var body: some View {
        VStack {
                    
                    Spacer()
                    
                    VStack {
                        TextField(
                            "Username",
                            text: $viewModel.username
                        )
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding(.top, 20)
                        
                        Divider()
                        
                        SecureField(
                            "Password",
                            text: $viewModel.passkey
                        )
                        .padding(.top, 20)
                        
                        Divider()
                    }
                    
                    Spacer()
                    
                    Button(
                        action: viewModel.login,
                        label: {
                            Text("Login")
                                .font(.system(size: 24, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity, maxHeight: 60)
                                .foregroundColor(Color.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    )
                }
                .padding(30)
    }
}
