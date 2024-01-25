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
    @Query(sort: \Routine.createdAt, order: .forward) private var routines: [Routine]
    var split: Split
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack() {
                    VStack(alignment: .leading) {
                        Text("My Routines")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Last Time : Perfect")
                            .font(.caption)
                            .fontWeight(.bold)
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
                    Text("Back")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white, lineWidth: 1.5)
                        )
                    Text("Triceps")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white, lineWidth: 1.5)
                        )
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
                    if let workouts = routines.last?.splits?[0].workouts {
                        ForEach(workouts, id: \.self) { workout in
                            NavigationLink(
                                destination: WorkoutDetailView(sample: 1),
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
            TimerView(isTimerPopupVisible: $isTimerPopupVisible)
        }
        .sheet(isPresented: $isAddWorkoutVisible) {
            AddWorkoutTypeView(isAddWorkoutVisible: $isAddWorkoutVisible, split: split)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    RoutineView(split: Split(isDone: true, createdAt: Date(), updatedAt: Date()))
}
