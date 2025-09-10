//
//  LinearGradientLeadingToTrailingViewswift
//  SharedDesignSystem
//
//  Created by home on 9/10/25.
//

import SwiftUI

struct LinearGradientLeadingToTrailingView: View {
    
    let colors: [Color]
    
    var body: some View {
        LinearGradient(
            colors: colors,
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}

#Preview {
    LinearGradientLeadingToTrailingView(
        colors: [
            .customColor(.gradient(.skyblueStart)),
            .customColor(.gradient(.skyblueEnd))
        ]
    )
}
