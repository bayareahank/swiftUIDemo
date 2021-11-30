//
//  Park.swift
//  swiftUIDemo
//
//  Created by bayareahank on 11/29/21.
//

import Foundation
import SwiftUI

struct Park: Hashable,  Identifiable {
    var id: Int
    
    var name: String
    var description: String 
    var imageName: String
    
    var image: Image {      // Image thing is swiftUI defined
        Image(imageName)
    }
}
