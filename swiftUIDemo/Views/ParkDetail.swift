//
//  ParkDetail.swift
//  swiftUIDemo
//
//  Created by bayareahank on 11/29/21.
//

import SwiftUI

struct ParkDetail: View {
    var park: Park
    
    var body: some View {
        GeometryReader { metrics in
            ScrollView {
            // VStack {
                
                Text(park.name)
                    .font(.title)
                    .padding()
                // Image(park.imageName)
                park.image
                    .resizable()
                    .scaledToFill()
                    .frame(height: metrics.size.height * 0.43)
                    .clipped()
                
                // Divider()
                
                Text(park.description)
                    .padding()
            // }
            }
        }
        // wrap with GeometryReader, so components can be proportional to screen size.
    }
}

struct ParkDetail_Previews: PreviewProvider {
    static var previews: some View {
        ParkDetail(park: ModelData().parks[0])
    }
}
