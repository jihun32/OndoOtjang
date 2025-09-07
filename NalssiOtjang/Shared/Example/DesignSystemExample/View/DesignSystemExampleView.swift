//
//  ContentView.swift
//  DesignSystemExample
//
//  Created by home on 9/7/25.
//

import SwiftUI

struct DesignSystemExampleView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Color System", destination: ColorSystemView())
            }
        }
    }
}

#Preview {
    DesignSystemExampleView()
}
