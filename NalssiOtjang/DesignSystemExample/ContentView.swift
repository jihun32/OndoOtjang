//
//  ContentView.swift
//  DesignSystemExample
//
//  Created by home on 9/7/25.
//

import SwiftUI
import SharedDesignSystem

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
