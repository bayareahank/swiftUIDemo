//
//  ParkHost.swift
//  swiftUIDemo
//
//  Created by bayareahank on 11/29/21.
//

// Decides which view to show, Edit or Summary, depending on environment mode.

import SwiftUI

struct ParkHost: View {
    @Environment(\.editMode) var editMode
    
    @EnvironmentObject var modelData: ModelData
    var park: Park
    @State private var draftPark: Park
    // Apparently we need park be passed in from outside, at the same time, we want to keep a @State of intermediate
    
    init(park: Park) {
        self.park = park
        _draftPark = State(initialValue: park)  // Have to say this looks odd.
    }
    
    /**
     It looks we have no way to know directly the index of current park inside ModelData, so have to search manually to update it.
     */
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                if editMode?.wrappedValue == .active {
                    
                    // Button("Cancel", role: .cancel)
                    Button("Cancel") {
                        draftPark = park
                        editMode?.animation().wrappedValue = .inactive
                    }
                }   // So only show Cancel button when in edit mode.
                Spacer()
                EditButton()
            }
            .padding()
            
            if editMode?.wrappedValue == .inactive {
                ParkDetail(park: park)
            } else {
                ParkEdit(park: $draftPark)
                    .onAppear(perform: {
                        draftPark = park
                    })
                    .onDisappear(perform: {
                        // need to update coresponding unit in modelData
                        if let index = modelData.parks.firstIndex(of: park) {
                            modelData.parks[index] = draftPark
                            // If not in environment, then needs to be ObservedObject.
                        }
                    })
            }
            
            // Spacer()
        }
        // .ignoresSafeArea(edges: .top)
    }
}

struct ParkHost_Previews: PreviewProvider {
    static var previews: some View {
        ParkHost(park: ModelData().parks[0])
            .environmentObject(ModelData())
    }
}
