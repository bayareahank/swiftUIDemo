//
//  ParkSummary.swift
//  swiftUIDemo
//
//  Created by bayareahank on 11/29/21.
//

import SwiftUI

struct ParkSummary: View {
    var park: Park
    // Since we simply read it, no write, this is good enough. 
    
    var body: some View {
       
        VStack {
            park.image
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                // So this one saved the day, making image equal size of width/height.
                .clipped()
                .cornerRadius(10)
                .padding()
            Text(park.name)
        }
    }
}

struct ParkSummary_Previews: PreviewProvider {
    static var previews: some View {
        ParkSummary(park: ModelData().parks[0])
    }
}
