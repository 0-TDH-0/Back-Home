//
//  foundObject.swift
//  Back Home
//
//  Created by Tommy Hale on 1/8/24.
//

import Foundation

class FoundObjectEntry: ObservableObject {
    
    @Published var description: String = ""
    @Published var title: String = ""
    @Published var foundAt: String = ""
    @Published var leftAt: String = ""
    @Published var associatedName: String = ""
    
}
