//
//  foundObject.swift
//  Back Home
//
//  Created by Tommy Hale on 1/8/24.
//

import Foundation

class LostObject: ObservableObject {
    
    @Published var description: String = ""
    @Published var title: String = ""
    @Published var lostAt: String = ""
    
}
