//
//  SplitCircleButton.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/14/24.
//

import SwiftUI
import SwiftData

struct SplitCircleButton: View {
    var circleId: Int
    @State var hi: Int
    @Binding var selectedSplitId: Int
    @Query(sort: \Routine.createdAt, order: .forward)
    private var routines: [Routine]
    
    var body: some View {
        ZStack() {
            if (routines.last?.splits?.count ?? -1 != circleId && selectedSplitId != circleId) {
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
            routines.last?.splits = []
        }
    }
}

#Preview {
    SplitCircleButton(circleId: 0, hi: 0, selectedSplitId: .constant(0))
}
