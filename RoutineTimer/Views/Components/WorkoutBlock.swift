//
//  WorkoutBlock.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/15/24.
//

import SwiftUI

struct WorkoutBlock: View {
    var workoutType: Int
    
    var body: some View {
        HStack {
            if workoutType % 2 == 1 {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Back")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("Workout Name")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.93, green: 1, blue: 0.33))
                        Text("3 repts of 5 sets")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("30 sec rest among sets")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 20)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Spacer()
                        Text("32 kg")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
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
                        Text("5 min")
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

#Preview {
    WorkoutBlock(workoutType: 0)
}
