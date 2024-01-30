//
//  SetTimerView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/28/24.
//

import SwiftUI

struct SetTimerView: View {
    @Binding var isTimerPopupVisible: Bool
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    isTimerPopupVisible.toggle()
                }) {
                    Image(systemName: "x.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 30)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.top, 30)
                }
            }
            TimerView(viewModel: TimerProgressViewModel(timerAnimationDuration: 1.0))
            .navigationBarBackButtonHidden(true)
        }
    }
}
