//
//  SplitCircleButton.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/14/24.
//

import SwiftUI

struct SplitCircleButton: View {
    var circleId: Int
    @Binding var selectedSplitId: Int
    
    var body: some View {
        ZStack() {
            if (selectedSplitId != circleId) {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .padding()
                    .overlay(
                        Text(String(circleId))
                            .font(Font.custom(
                                "SF Pro Text",
                                size: (circleId == 0 ? 25 : 30)
                            ).weight(.semibold))
                            .foregroundColor(.white)
                    )
            } else {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 4, dash: [6]))
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color(red: 0.65, green: 0.80, blue: 0.28))
                    .padding()
                    .overlay(
                        Text(String(circleId))
                            .font(Font.custom(
                                "SF Pro Text",
                                size: (circleId == 0 ? 25 : 30)
                            ).weight(.semibold))
                            .foregroundColor(.white)
                    )
            }
        }
        .frame(width: 100, height: 100)
        .onTapGesture {
            selectedSplitId = circleId
        }
    }
}

#Preview {
    SplitCircleButton(circleId: 0, selectedSplitId: .constant(0))
}
