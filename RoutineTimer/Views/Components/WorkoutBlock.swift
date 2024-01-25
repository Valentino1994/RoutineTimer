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
                                Text("\(calculateSecondsToMinuite(seconds: workout.restTime)) rest among sets")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            
                            Text(workout.isKilogram ? "\(String(format: "%.2f", workout.weight)) kg" : "\(String(format: "%.2f", workout.weight)) lbs")
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
                        Text(calculateSecondsToMinuite(seconds: workout.restTime))
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

extension WorkoutBlock {
    func calculateSecondsToMinuite(seconds: Int) -> String {
        if seconds <= 60 {
            return "\(seconds) sec"
        } else {
            return "\(Int(seconds / 60)) min \(seconds % 60) sec"
        }
    }
}

#Preview {
    WorkoutBlock(workout: Workout(workoutType: "Back", workoutName: "Pull Up", isRest: false, isKilogram: true, weight: 12.5, set: 3, restTime: 120, rept: 6, createdAt: Date(), updatedAt: Date()))
}
