//
//  TestView.swift
//  TestView
//
//  Created by Geunil Park on 2024/01/31.
//

import SwiftUI
import Combine

struct TestView: View {
    @StateObject private var timerManager = TimerManager()
    @State private var fruitIndex = 0
    private let fruits = ["Apple", "Banana", "Orange", "Grapes", "Watermelon"]

    var body: some View {
        VStack {
            Text("Current Fruit: \(fruits[fruitIndex])")
                .padding()

            if timerManager.isTimerViewVisible {
                ThisTimerView(timerManager: timerManager, onTimerEnd: {
                    self.showNextFruit()
                }, onTimerAgain: {
                    self.startTimerAgain()
                })
            } else {
                Button("Start Timer") {
                    timerManager.setTimerDuration(seconds: 5)
                    timerManager.isTimerViewVisible.toggle()
                }
                .padding()
            }
        }
        .navigationBarTitle("Fruit Timer Example")
    }

    func showNextFruit() {
        if fruitIndex < fruits.count - 1 {
            fruitIndex += 1
        } else {
            // If it's the last fruit, reset the index to 0
            fruitIndex = 0
        }
        timerManager.isTimerViewVisible = false
    }

    func startTimerAgain() {
        timerManager.setTimerDuration(seconds: 5)
        timerManager.startTimer()
    }
}

struct ThisTimerView: View {
    @ObservedObject var timerManager: TimerManager
    var onTimerEnd: () -> Void
    var onTimerAgain: () -> Void

    var body: some View {
        VStack {
            Text("Timer View")
                .font(.largeTitle)
                .padding()

            Text("Time Remaining: \(timerManager.currentTime)")
                .padding()

            Button("Stop Timer") {
                timerManager.stopTimer()
                onTimerEnd()
            }
            .padding()
            .disabled(timerManager.currentTime > 0) // Disable when timer is running

            Button("Next") {
                onTimerEnd()
            }
            .padding()
            .disabled(timerManager.currentTime > 0) // Disable when timer is running

            Button("Timer Again") {
                onTimerAgain()
            }
            .padding()
            .disabled(timerManager.currentTime > 0) // Disable when timer is running
        }
        .onAppear {
            timerManager.startTimer()
        }
        .onDisappear {
            timerManager.stopTimer()
        }
    }
}

class TimerManager: ObservableObject {
    @Published var currentTime = 0
    @Published var isTimerViewVisible = false
    private var cancellables: Set<AnyCancellable> = []

    func setTimerDuration(seconds: Int) {
        currentTime = seconds
    }

    func startTimer() {
        Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .prefix(while: { _ in self.currentTime > 0 })
            .sink { _ in
                self.currentTime -= 1
                if self.currentTime == 0 {
                    // Timer ended, perform any necessary actions
                    self.stopTimer()
                }
            }
            .store(in: &cancellables)
    }

    func stopTimer() {
        cancellables.forEach { $0.cancel() }
    }
}
