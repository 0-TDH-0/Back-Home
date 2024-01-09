//
//  settingsScreen.swift
//  Back Home
//
//  Created by Tommy Hale on 1/6/24.
//

import Foundation
import SwiftUI

struct Inbox: View {
    
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.gray, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                Text("We always recommend that you leave objects with a member of the university. Though it may be easier to deliver valueables by hand, while we work on a messaging system, please do not hold onto any lost objects. We appreciate your help!")
                    .lineSpacing(20)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.black)
                    .padding(25)
                Spacer()
            }
        }
    }
    
}
