//
//  foundObject.swift
//  Back Home
//
//  Created by Tommy Hale on 1/8/24.
//

import Foundation
import SwiftUI
import PhotosUI

class FoundObjectEntry: ObservableObject {
    
    @Published var image: Image?
    @Published var imageItem: PhotosPickerItem?
    
    @Published var description: String = ""
    @Published var title: String = ""
    @Published var foundAt: String = ""
    @Published var leftAt: String = ""
    @Published var associatedName: String = ""
    
}
