//
//  ParkEdit.swift
//  swiftUIDemo
//
//  Created by bayareahank on 11/29/21.
//

import SwiftUI

struct ParkEdit: View {
    @Binding var park: Park
    
    var body: some View {
        GeometryReader { metrics in
            List {
                // VStack (alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Park Name")
                            .bold()
                        Divider()
                        TextField("ParkName", text: $park.name)
                        // What does this key do here?
                    }
                    
                    Image(park.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: metrics.size.height * 0.43)
                        .clipped()
                    
                    Spacer()
                        .frame(height: 20)
                    // Separator with fixed height
                
                    Text("Description")
                        .font(.headline)
                    TextEditor(text: $park.description)
                    .font(.body)
                        .frame( height: 60)
                }
            // }
        }
    }
}

struct ParkEdit_Previews: PreviewProvider {
    static var previews: some View {
        ParkEdit(park: .constant(ModelData().parks[0]))
        // constant bindings: hard-coded values that don’t change, but can still be used like regular bindings so your code works
    }
}
