//
//  WorkoutDetailView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/15/24.
//

import SwiftUI

struct WorkoutDetailView: View {
    var workout: Workout
    var body: some View {
        VStack {
            Text(workout.workoutType)
                .padding(.horizontal, 18)
                .padding(.vertical, 10)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(red: 0.83, green: 0.9, blue: 0.15), lineWidth: 2)
                )
            
            ExerciseBlock(text: workout.workoutName)
                .frame(width: 340, height: 80)
                .padding(.bottom, 10)
                .padding(.top, 10)
            
            HStack(spacing: 10) {
                WorkoutDetailBlock(title: "Weights", workout: workout)
                WorkoutDetailBlock(title: "Repeats", workout: workout)
            }
            .padding(0)
            
            HStack(spacing: 10) {
                WorkoutDetailBlock(title: "Sets", workout: workout)
                WorkoutDetailBlock(title: "Rest Times", workout: workout)
            }
            .padding(0)
            
            Button(action: {
                print("Confirmed")
            }) {
                ConfirmTextButton(title: "Confirm")
            }
            .padding(.top, 18)

        }
        .navigationBarTitle("Workout Detail", displayMode: .inline)
    }
}
