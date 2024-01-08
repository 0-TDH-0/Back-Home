//
//  buttonModel.swift
//  Back Home
//
//  Created by Tommy Hale on 1/6/24.
//

import Foundation
import SwiftUI

struct ButtonModel: View{
    
    let buttonText: String
    let buttonColor: Color
    let buttonBack: Color
    
    var body: some View{
        Text(buttonText)
            .frame(width: 280, height: 50)
            .background(buttonBack)
            .foregroundColor(buttonColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(20)
            .padding()
    }
}
