//
//  mainScreen.swift
//  Back Home
//
//  Created by Tommy Hale on 1/6/24.
//

import Foundation
import SwiftUI
import SwiftData

struct MainScreen: View {
    
        var body: some View {
            ZStack{
                ContainerRelativeShape()
                    .fill(.white)
                    .ignoresSafeArea()
                
                VStack{
                    
                    HStack{
                        Button{
                            
                        } label: {
                            Image(systemName: "gear")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.blue)
                                .frame(width: 40, height: 40)
                        }
                        Button{
                            
                        } label: {
                            Text("University PlaceHolder")
                                .frame(width: 200, height: 30)
                                .background(.blue)
                                .foregroundStyle(.black)
                                .font(.system(size: 15, weight: .bold))
                                .cornerRadius(15)
                                .padding()
                        }
                        Button{
                            
                        } label: {
                            Image(systemName: "tray.fill")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.blue)
                                .frame(width: 40, height: 40)
                        }
                    }
                    
                    Text("""
                         Welcome back,
                         what can we help you with?
                         """)
                    .font(.system(size: 25, weight: .bold))
                    .padding(.top, 100)
                    
                    Spacer()
                    
                    Button{
                        
                    } label: {
                        ButtonModel(buttonText: "I Lost a Valueable",
                                    buttonColor: .black,
                                    buttonBack: .blue)
                    }
                    Button{
                        
                    } label: {
                        ButtonModel(buttonText: "I Found a Valueable",
                                    buttonColor: .black,
                                    buttonBack: .blue)
                    }
                }
            }
    }
    
}

#Preview {
    MainScreen()
}
