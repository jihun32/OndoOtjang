//
//  NSBackgroundGradientView.swift
//  SharedDesignSystem
//
//  Created by home on 9/10/25.
//

import SwiftUI

struct NSBackgroundGradientView: View {
    
    let colors: [Color] = [
        .customColor(.gradient(.lightSkyblueStart)),
        .customColor(.gradient(.lightSkyblueEnd))
    ]
    
    var body: some View {
        LinearGradient(
            colors: colors,
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

#Preview {
    NSBackgroundGradientView()
}
