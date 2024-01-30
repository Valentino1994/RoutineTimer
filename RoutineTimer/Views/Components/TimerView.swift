//
//  TimerView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/30.
//

import SwiftUI
import Combine

struct TimerView: View {
    @StateObject var viewModel: TimerProgressViewModel
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.gray,
                    style: StrokeStyle(
                        lineWidth: 1,
                        lineCap: .round)
                )
                .opacity(0.5)
                .frame(width: 258, height: 258)
            
            Circle()
                .stroke(
                    Color.gray,
                    style: StrokeStyle(
                        lineWidth: 1,
                        lineCap: .round)
                )
                .opacity(0.5)
                .frame(width: 298, height: 298)
            
            Circle()
                .trim(from: 0, to: viewModel.timerTrimValue)
                .stroke(
                    Color.green,
                    style: StrokeStyle(
                        lineWidth: 13,
                        lineCap: .round)
                )
                .animation(Animation.easeInOut(duration: viewModel.timerAnimationDuration), value: viewModel.timerTrimValue)
                .frame(width: 278, height: 278)
                .rotationEffect(Angle(degrees: -90))
                .onAppear {
                    viewModel.startTimer()
                }
        }
    }
}

final class TimerProgressViewModel: ObservableObject {
    @Published var timerTrimValue: CGFloat = 1.0
    @Published var timerAnimationDuration: Double
    @Published var countdown: Int = 3
    
    private var greenCancellable: AnyCancellable?
    private var countdownCancellable: AnyCancellable?
    
    init(timerAnimationDuration: CGFloat) {
        self.timerAnimationDuration = timerAnimationDuration
    }
    
    func startTimer() {
        greenCancellable = Timer.publish(every: 0.1, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                self?.countTimerProgress()
            }
    }
    
    private func countTimerProgress() {
        timerTrimValue = max(timerTrimValue - 0.1 / timerAnimationDuration, 0)
        if timerTrimValue == 0 {
            greenCancellable?.cancel()
        }
    }
    
    private func startCountdown() {
        countdownCancellable = Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }

                if self.countdown > 0 {
                    self.countdown -= 1
                } else {
                    self.countdownCancellable?.cancel()
                }
            }
    }
}
