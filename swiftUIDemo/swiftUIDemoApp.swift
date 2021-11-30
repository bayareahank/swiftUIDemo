//
//  swiftUIDemoApp.swift
//  swiftUIDemo
//
//  Created by bayareahank on 11/24/21.
//

import SwiftUI

@main
struct swiftUIDemoApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
