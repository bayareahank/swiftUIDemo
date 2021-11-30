//
//  ContentView.swift
//  swiftUIDemo
//
//  Created by bayareahank on 11/24/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    // 3 row/column
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            
            LazyVGrid(columns: columns,  alignment: .center) {
                ForEach(modelData.parks) { item in
                        
                    if #available(iOS 15, *) {
                        NavigationLink {
                            ParkHost(park: item)
                        } label: {
                            ParkSummary(park: item)
                        }
                    } else {
                        NavigationLink(
                            destination: ParkHost(park: item),
                            label: {
                                ParkSummary(park: item)
                        })
                    }
                       
                }
            }
            .navigationTitle("Beautiful Parks")
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
