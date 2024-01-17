//
//  TimerView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/15/24.
//

import SwiftUI

struct TimerView: View {
    @Binding var isTimerPopupVisible: Bool
    var body: some View {
        Button(action: {
            isTimerPopupVisible.toggle()
        }) {
            Text("Timer View")
        }
    }
}

#Preview {
    TimerView(isTimerPopupVisible: .constant(true))
}
