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
    
    @ObservedObject private var viewModel: LoginView = LoginView()
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.white, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack {
                
                Spacer()
                
                VStack {
                        Text("Ready to Bring Items")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundStyle(.black)
                        
                        Text("Back Home?")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundStyle(.black)
                    
                    Spacer()
                    
                    Text("Lets Get You Logged in")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundStyle(.black)
                        .padding(.top, 100)
                    
                    Spacer()
                    
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
                
                Button{
                    withAnimation(.smooth){
                        isLoggedIn = true
                    }
                    //viewModel.login()
                }   label: {
                    ButtonModel(buttonText: "Login",
                                buttonColor: .white,
                                buttonBack: .black)
                }
                
            }
            .padding(30)
        }
    }
}

