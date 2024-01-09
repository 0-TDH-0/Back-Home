//
//  mainScreen.swift
//  Back Home
//
//  Created by Tommy Hale on 1/6/24.
//

import Foundation
import SwiftUI

struct MainScreen: View {
    
    
        var body: some View {
            NavigationStack(){
                ZStack{
                    LinearGradient(colors: [.gray, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                    
                    VStack{
                        
                        HStack{
                            NavigationLink(destination: Settings()){
                                    Image(systemName: "gear")
                                        .renderingMode(.template)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundStyle(.black)
                                        .frame(width: 40, height: 40)

                            }
                            //TODO: change this to some sort of drop down or other screen. for now, points to inbox
                            NavigationLink(destination: Inbox()){
                                    Text("University")
                                        .frame(width: 200, height: 30)
                                        .background(.black)
                                        .foregroundStyle(.white)
                                        .font(.system(size: 15, weight: .bold))
                                        .cornerRadius(15)
                                        .padding()
                            }
                            NavigationLink(destination: Inbox()){
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
                        
                        NavigationLink(destination: Lost()){
                                ButtonModel(buttonText: "I Lost a Valueable",
                                            buttonColor: .white,
                                            buttonBack: .black)
                        }
                        NavigationLink(destination: Found()){
                                ButtonModel(buttonText: "I Found a Valueable",
                                            buttonColor: .white,
                                            buttonBack: .black)
                        }
                        
                        NavigationLink(destination: LostList()){
                                ButtonModel(buttonText: "View the Lost and Found",
                                            buttonColor: .white,
                                            buttonBack: .black)
                        }
                    }
                }
            }
    }
    
}
