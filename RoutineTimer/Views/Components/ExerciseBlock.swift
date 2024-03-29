//
//  ExerciseBlock.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/16.
//

import SwiftUI

struct ExerciseBlock: View {
    var text: String
    
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .inset(by: 1.5)
                    .stroke(.white, lineWidth: 2)
            )
            .overlay(
                Text("\(text)")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 330, height: 40)
                    .padding()
                    .contentShape(Rectangle())
                    .foregroundColor(.white)
            )
    }
}

#Preview {
    ExerciseBlock(text: "1")
}
