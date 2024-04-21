//
//  HSearchApp.swift
//  HSearch
//
//  Created by Roopesh Tripathi on 20/04/24.
//
//

import SwiftUI

@main
struct HSearchApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                ContentView()
                CopyWrite()
            }
        }
    }
}


struct CopyWrite: View {
    var body: some View {
        HStack {
            Text("©ScripturesInTech")
                .underline()
                .font(.callout)
                .foregroundStyle(.blue)
                .shadow(color: .gray, radius: 1, x: 1, y: 1)
        }
    }
}

