//
//  settingsScreen.swift
//  Back Home
//
//  Created by Tommy Hale on 1/6/24.
//

import Foundation
import SwiftUI

struct LostList: View {
    
    @Binding var screen: String
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.gray, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            Button{
                screen = "main"
            } label: {
                Image(systemName: "arrow.uturn.left")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.black)
                    .frame(width: 40, height: 40)
            }
        }
    }
    
}
