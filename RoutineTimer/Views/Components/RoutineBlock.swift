//
//  RoutineBlock.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/15.
//

import SwiftUI
import Combine

struct RoutineBlock: View {
    var split: Split
    @State private var elapsedTime: TimeInterval = 0
    @State private var timer: AnyCancellable?
    
    var body: some View {
        HStack {
            if true {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            if let workouts = split.workouts {
                                if workouts.count != 0 {
                                    ForEach(makeWorkoutTypeArr(workouts: workouts), id: \.self) { workoutType in
                                        Text(workoutType)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 6)
                                            .foregroundColor(.white)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.white, lineWidth: 1.5)
                                            )
                                    }
                                } else {
                                    Text("No Workout")
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .foregroundColor(.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(.white, lineWidth: 1.5)
                                        )
                                }
        
                            }
                        }
                        Spacer()
                        if let workouts = split.workouts {
                            Text("\(workouts.count) workouts")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }                    }
                    .padding(.vertical, 20)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Spacer()
                        Text("Last Workout")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text(formattedTime)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 20)
                }
                .frame(width: 326, height: 118)
            } else {
                Text("Add Your First Workout !")
                    .frame(width: 326, height: 118)
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal, 15)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 2)
        )
        .preferredColorScheme(.dark)
        .onAppear {
            startCountdown()
        }
    }
}

extension RoutineBlock {
    func makeWorkoutTypeArr(workouts: [Workout]) -> [String] {
        var result: [String] = []
        
        for workout in workouts {
            if !result.contains(workout.workoutType) {
                result.append(workout.workoutType)
            }
        }
        
        return result
    }
    
    var formattedTime: String {
        let timeDifference = Date().timeIntervalSince(split.updatedAt) // 현재 시간과의 차이 계산
        let remainingTime = max(0, timeDifference + elapsedTime)
        let hours = Int(remainingTime) / 3600
        let minutes = Int(remainingTime) % 3600 / 60
        let seconds = Int(remainingTime) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    func startCountdown() {
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                elapsedTime += 0.1

                // 타이머가 종료되면 타이머를 정지
                if elapsedTime >= Date().timeIntervalSince(split.updatedAt) {
                    timer?.cancel()
                }
            }
    }
}
