//
//  WorkoutBlock.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/15/24.
//

import SwiftUI

struct WorkoutBlock: View {
    var body: some View {
        HStack {
            if true {
                HStack {
                    VStack(alignment: .leading) {
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
                        }
                        Spacer()
                        Text("4 workouts")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 20)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Spacer()
                        Text("Last Workout")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("00:00:00")
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
    }
}

#Preview {
    WorkoutBlock()
}
