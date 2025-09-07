//
//  ColorSystemView.swift
//  NalssiOtjang
//
//  Created by home on 9/7/25.
//

import SwiftUI
import SharedDesignSystem

private struct ColorInfo {
    let name: String
    let kind: Kind
    
    enum Kind {
        case normal(Color)
        case gradient(Color, Color)
    }
}

struct ColorSystemView: View {
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    private let gradientColors: [ColorInfo] = [
        .init(
            name: "lightSkyblue",
            kind: .gradient(
                .customColor(.gradient(.lightSkyblueStart)),
                .customColor(.gradient(.lightSkyblueEnd)))
        ),
        .init(name: "skyblue",
              kind: .gradient(
                .customColor(.gradient(.skyblueStart)),
                .customColor(.gradient(.skyblueEnd)))
             ),
        .init(name: "purple",
              kind: .gradient(
                .customColor(.gradient(.purpleStart)),
                .customColor(.gradient(.purpleEnd)))
             )
    ]
    
    private let neutralColors: [ColorInfo] = [
        .init(name: "lightGray", kind: .normal(.customColor(.neutral(.lightGray)))),
        .init(name: "yellow",    kind: .normal(.customColor(.neutral(.yellow)))),
        .init(name: "black",     kind: .normal(.customColor(.neutral(.black)))),
        .init(name: "white",     kind: .normal(.customColor(.neutral(.white))))
    ]
    
    private let primaryColors: [ColorInfo] = [
        .init(name: "primary/main", kind: .normal(.customColor(.primary(.main))))
    ]
    
    var body: some View {
        List {
            Section("Gradient") {
                LazyVGrid(columns: columns) {
                    ForEach(gradientColors, id: \.name) { colorInfo in
                        ColorCell(colorInfo: colorInfo)
                    }
                }
                .padding(.vertical, 4)
            }
            
            Section("Neutral") {
                LazyVGrid(columns: columns) {
                    ForEach(neutralColors, id: \.name) { colorInfo in
                        ColorCell(colorInfo: colorInfo)
                    }
                }
                .padding(.vertical, 4)
            }
            
            Section("Primary") {
                LazyVGrid(columns: columns) {
                    ForEach(primaryColors, id: \.name) { colorInfo in
                        ColorCell(colorInfo: colorInfo)
                    }
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("Color System")
    }
}

private struct ColorCell: View {
    let colorInfo: ColorInfo
    
    var body: some View {
        VStack(spacing: 8) {
            RoundedRectangle(cornerRadius: 8)
                .fill(fillStyle)
                .frame(width: 60, height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.black.opacity(0.1))
                )
            
            Text(colorInfo.name)
                .font(.footnote)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        }
    }
    
    private var fillStyle: AnyShapeStyle {
        switch colorInfo.kind {
        case .normal(let color):
            AnyShapeStyle(color)
        case .gradient(let start, let end):
            AnyShapeStyle(
                LinearGradient(
                    colors: [start, end],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }
}

#Preview {
    ColorSystemView()
}
