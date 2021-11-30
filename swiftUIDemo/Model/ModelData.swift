//
//  ModelData.swift
//  swiftUIDemo
//
//  Created by bayareahank on 11/29/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var parks = [Park(id: 0, name: "Charley Rivers", description: "Say something", imageName: "charleyrivers")]
    
    init() {
        let data = [
            // (name: "Charley Rivers", imageName: "charleyrivers"),
            (name: "Chilktoot Trail", imageName: "chilkoottrail"),
            (name: "Chincoteague", imageName: "chincoteague"),
            (name: "Hidden Lake", imageName: "hiddenlake"),
            (name: "Icy Bay", imageName: "icybay"),
            (name: "Lake McDonald", imageName: "lakemcdonald"),
            (name: "Rainbow Lake", imageName: "rainbowlake"),
            (name: "Silver Creek", imageName: "silversalmoncreek"),
            (name: "St Mary Lake", imageName: "stmarylake"),
            (name: "Twin Lake", imageName: "twinlake"),
            (name: "Umbagog", imageName: "umbagog")
        ]
        
        for i in 1..<data.count {
            let park = Park(id: i, name: data[i].name, description: "Say something foolish", imageName: data[i].imageName)
            parks.append(park)
        }
    }
}
