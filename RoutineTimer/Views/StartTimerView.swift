//
//  TimerView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/15/24.
//

import SwiftUI
import Combine

struct StartTimerView: View {
    @State private var isAnimating = false
    @Binding var isTimerPopupVisible: Bool
    @State private var timerHandler: Cancellable?

    @State private var count: Int = 0
    @State private var showRedCircle = false
    @StateObject var viewModel = CircleProgressViewModel()
    
    @State private var showNextView = false
    
    var body: some View {
        NavigationStack {
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
                
                // Green Circle
                Circle()
                    .trim(from: 0, to: viewModel.greenCircleTrimValue)
                    .stroke(
                        Color.green,
                        style: StrokeStyle(
                            lineWidth: 13,
                            lineCap: .round)
                    )
                    .animation(Animation.easeInOut(duration: viewModel.greenCircleAnimationDuration), value: viewModel.greenCircleTrimValue)
                    .frame(width: 278, height: 278)
                    .rotationEffect(Angle(degrees: -90))
                    .onAppear {
                        viewModel.startGreenCircle()
                    }

                // Red Circle
                Circle()
                    .trim(from: 0, to: viewModel.redCircleTrimValue)
                    .stroke(
                        Color.red,
                        style: StrokeStyle(
                            lineWidth: 13,
                            lineCap: .round)
                    )
                    .animation(Animation.easeInOut(duration: viewModel.redCircleAnimationDuration), value: viewModel.redCircleTrimValue)
                    .frame(width: 278, height: 278)
                    .rotationEffect(Angle(degrees: -90))
                    .opacity(viewModel.isRedCircleVisible ? 1 : 0) // 빨간색 원이 나타난 후에 보이도록 처리
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + viewModel.greenCircleAnimationDuration) {
                            viewModel.startRedCircle()
                        }
                    }
                
                Text(!viewModel.isRedCircleVisible ? "Start" :
                        "\(viewModel.countdown)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.green)
            }
            .navigationDestination(
                 isPresented: $showNextView) {
                     SetTimerView(isTimerPopupVisible: $isTimerPopupVisible)
                      Text("")
                          .hidden()
                 }
        }
        .onReceive(viewModel.$countdown) { newValue in
            if newValue == 0 {
                showNextView = true
            }
        }
    }
}

final class CircleProgressViewModel: ObservableObject {
    @Published var greenCircleTrimValue: CGFloat = 1.0
    @Published var greenCircleAnimationDuration: Double = 1.0
    @Published var redCircleTrimValue: CGFloat = 1.0
    @Published var redCircleAnimationDuration: Double = 3.0
    @Published var isRedCircleVisible = false
    @Published var countdown: Int = 3
    
    private var greenCancellable: AnyCancellable?
    private var redCancellable: AnyCancellable?
    private var countdownCancellable: AnyCancellable?
    
    func startGreenCircle() {
        greenCancellable = Timer.publish(every: 0.1, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                self?.countGreenCircleProgress()
            }
    }

    func startRedCircle() {
        redCancellable = Timer.publish(every: 0.1, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                self?.countRedCircleProgress()
            }
        
        startCountdown()
    }

    private func countGreenCircleProgress() {
        greenCircleTrimValue = max(greenCircleTrimValue - 0.1 / greenCircleAnimationDuration, 0)
        if greenCircleTrimValue == 0 {
            greenCancellable?.cancel()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.isRedCircleVisible = true
                self.startRedCircle() // 새로운 Timer를 시작
            }
        }
    }

    private func countRedCircleProgress() {
        // 초록색 원이 사라질 때부터 카운트 시작
        if isRedCircleVisible && redCircleTrimValue == 1.0 {
            startCountdown()
        }

        redCircleTrimValue = max(redCircleTrimValue - 0.1 / redCircleAnimationDuration, 0)
        if redCircleTrimValue == 0 {
            redCancellable?.cancel()
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

#Preview {
    StartTimerView(isTimerPopupVisible: .constant(true))
}
