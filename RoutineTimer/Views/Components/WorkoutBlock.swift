//
//  WorkoutBlock.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/15/24.
//

import SwiftUI

struct WorkoutBlock: View {
    var workout: Workout
    
    var body: some View {
        HStack {
            if !workout.isRest {
                HStack {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text(workout.workoutType)
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text(workout.workoutName)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 0.93, green: 1, blue: 0.33))
                        }
                        .padding(.bottom, 0.4)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(workout.rept) repts of \(workout.set) sets")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text(workout.restMinute != 0 ? "\(workout.restMinute)m \(workout.restSecond)s rest among sets" : "\(workout.restSecond)s rest among sets")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            
                            Text(workout.isKilogram ? "\(workout.weightInt).\(workout.weightFloat * 25) kg" : "\(workout.weightInt).\(workout.weightFloat * 25) lbs")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.vertical, 20)
                }
                .frame(width: 326, height: 140)
            } else {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Rest")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.65, green: 0.84, blue: 0.67))
                        Text(workout.restMinute != 0 ? "\(workout.restMinute)m \(workout.restSecond)s rest among sets" : "\(workout.restSecond)s rest among sets")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 20)
                    
                    Spacer()
                }
                .frame(width: 326, height: 90)
            }
        }
        .padding(.horizontal, 15)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 2)
        )
        .preferredColorScheme(.dark)
    }
}
