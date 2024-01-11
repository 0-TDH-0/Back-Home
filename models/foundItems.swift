//
//  foundItems.swift
//  Back Home
//
//  Created by Tommy Hale on 1/11/24.
//

import SwiftUI

struct foundItems: View {
    
    @State var image: Image?
    
    @State var description: String
    @State var title: String
    @State var foundAt: String
    @State var leftAt: String
    @State var associatedName: String
    
    init(image: Image? = nil, description: String, title: String, foundAt: String, leftAt: String, associatedName: String) {
        self.image = image
        self.description = description
        self.title = title
        self.foundAt = foundAt
        self.leftAt = leftAt
        self.associatedName = associatedName
    }
    
    init(){
        self.image = nil
        
        self.title = "test"
        self.description = "test desc"
        self.foundAt = "your moms house"
        self.leftAt = "main office"
        self.associatedName = "Thomas Hale"
    }
    
    var body: some View {
        Divider()
        NavigationLink(destination: Inbox()){
            HStack{
                
                if let itemImage = image {
                    itemImage
                        .resizable()
                        .frame(width: 80, height: 80)
                    Spacer()
                    Divider()
                } else {
                    Spacer()
                }
                
                
                
                
                
                VStack{
                    Text("FOUND")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundStyle(.black)
                    
                    
                    
                    Spacer()
                    
                    Text(title)
                        .font(.system(size: 25, weight: .bold))
                        .foregroundStyle(.black)
                    
                    
                }
                .padding(.trailing, 30)
                
                
            }
            .frame(height: 80)
        }
        Divider()
    }
}

#Preview {
    foundItems()
}
