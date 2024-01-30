//
//  RoutineView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/15.
//

import SwiftUI
import SwiftData

struct RoutineView: View {
    @State var isTimerPopupVisible: Bool = false
    @State var isAddWorkoutVisible: Bool = false
    var split: Split
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack() {
                    VStack(alignment: .leading) {
                        Text("My Routines")
                            .font(.title)
                            .fontWeight(.bold)
                        if let lastTime = split.lastTime {
                            Text("Last Time : \(lastTime)")
                                .font(.caption)
                                .fontWeight(.bold)
                        } else {
                            Text("Let's do your first workout !")
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                        
                    }
                    Spacer()
                    Button(action: {
                        isTimerPopupVisible.toggle()
                    }) {
                        Image("StartButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 38, height: 38)
                    }
                }
                .padding(.vertical)
                
                HStack {
                    if let workouts = split.workouts {
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
                    }
                    Spacer()
                    Button(action: {
                        isAddWorkoutVisible.toggle()
                    }) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32)
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 10)
                
                ScrollView {
                    if let workouts = split.workouts {
                        ForEach(workouts, id: \.self) { workout in
                            NavigationLink(
                                destination: WorkoutDetailView(workout: workout),
                                label: {
                                    WorkoutBlock(workout: workout)
                                        .frame(width: 360, height: 120)
                                        .padding(.bottom, 10)
                                }
                            )
                        }
                    } else {
                        Text("HI")
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .fullScreenCover(isPresented: $isTimerPopupVisible) {
            StartTimerView(isTimerPopupVisible: $isTimerPopupVisible)
        }
        .sheet(isPresented: $isAddWorkoutVisible) {
            AddWorkoutTypeView(isAddWorkoutVisible: $isAddWorkoutVisible, split: split)
        }
        .preferredColorScheme(.dark)
    }
}

extension RoutineView {
    func makeWorkoutTypeArr(workouts: [Workout]) -> [String] {
        var result: [String] = []
        
        for workout in workouts {
            if !result.contains(workout.workoutType) {
                result.append(workout.workoutType)
            }
        }
        
        return result
    }
}
