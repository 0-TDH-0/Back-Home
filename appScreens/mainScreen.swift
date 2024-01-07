//
//  mainScreen.swift
//  Back Home
//
//  Created by Tommy Hale on 1/6/24.
//

import Foundation
import SwiftUI

struct MainScreen: View {
    
    @Binding var screen: String
    
        var body: some View {
            ZStack{
                LinearGradient(colors: [.gray, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack{
                    
                    HStack{
                        Button{
                            screen = "settings"
                        } label: {
                            Image(systemName: "gear")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.black)
                                .frame(width: 40, height: 40)
                        }
                        Button{
                            
                        } label: {
                            Text("University")
                                .frame(width: 200, height: 30)
                                .background(.black)
                                .foregroundStyle(.white)
                                .font(.system(size: 15, weight: .bold))
                                .cornerRadius(15)
                                .padding()
                        }
                        Button{
                            screen = "inbox"
                        } label: {
                            Image(systemName: "tray.fill")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.black)
                                .frame(width: 40, height: 40)
                        }
                    }
                    
                    Text("""
                         Welcome back,
                         what can we help you with?
                         """)
                    .font(.system(size: 25, weight: .bold))
                    .foregroundStyle(.black)
                    .padding(.top, 100)
                    
                    Spacer()
                    
                    Button{
                        screen = "lost"
                    } label: {
                        ButtonModel(buttonText: "I Lost a Valueable",
                                    buttonColor: .white,
                                    buttonBack: .black)
                    }
                    Button{
                        screen = "found"
                    } label: {
                        ButtonModel(buttonText: "I Found a Valueable",
                                    buttonColor: .white,
                                    buttonBack: .black)
                    }
                    Button{
                        screen = "list"
                    } label: {
                        ButtonModel(buttonText: "View the Lost and Found",
                                    buttonColor: .white,
                                    buttonBack: .black)
                    }
                }
            }
    }
    
}

//#Preview {
//    MainScreen()
//}
