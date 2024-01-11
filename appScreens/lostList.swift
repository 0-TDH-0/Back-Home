//
//  settingsScreen.swift
//  Back Home
//
//  Created by Tommy Hale on 1/6/24.
//

import SwiftUI

struct LostList: View {
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.gray, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ScrollView{
                LazyVStack{
                    foundItems()
                    foundItems()
                    foundItems()
                    foundItems()
                    foundItems()
                    foundItems()
                    foundItems()
                    foundItems()
                    foundItems()
                    foundItems()
                    foundItems()
                }
            }
        }
    }
    
}
#Preview {
    LostList()
}
