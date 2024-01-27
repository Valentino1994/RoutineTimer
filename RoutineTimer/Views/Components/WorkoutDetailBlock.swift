//
//  WorkoutDetailBlock.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/26/24.
//

import SwiftUI

struct WorkoutDetailBlock: View {
    var title: String
    var workout: Workout
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color.clear)
            .frame(width: 150, height: 185)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .inset(by: 0.5)
                    .stroke(Color.white, lineWidth: 2)
            )
            .overlay(
                VStack {
                    Text(title)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.top, 20)
                        .foregroundColor(.white)
                    Spacer()
                    Circle()
                        .stroke(Color(red: 0.83, green: 0.9, blue: 0.15), lineWidth: 3)
                        .frame(width: 96, height: 96)
                        .overlay(
                            Text(findoutText(title: title, workout: workout))
                                .foregroundColor(Color.white)
                                .font(.title2)
                                .fontWeight(.semibold)
                        )
                        .padding()
                    Spacer()
                }
            )
            .padding()
    }
}

extension WorkoutDetailBlock {
    func findoutText(title: String, workout: Workout) -> String{
        var result: String = ""
        
        if title == "Weights" {
            if workout.isKilogram {
                result = "\(workout.weightInt).\(workout.weightFloat * 25) kg"
            } else {
                result = "\(workout.weightInt).\(workout.weightFloat * 25) lbs"
            }
        } else if title == "Repeats" {
            result = "\(workout.rept)"
        } else if title == "Sets" {
            result = "\(workout.set)"
        } else {
            result = workout.restMinute != 0 ? "\(workout.restMinute)m \(workout.restSecond)s" : "\(workout.restSecond)"
        }
        
        return result
    }
}
