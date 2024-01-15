//
//  SplitBlock.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/15.
//

import SwiftUI

struct SplitBlock: View {
    var body: some View {
        HStack {
            Text("4 Splits")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.65, green: 0.84, blue: 0.67))
            
            Spacer()
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 95, height: 38)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .inset(by: 1.5)
                        .stroke(Color(red: 0.93, green: 0.62, blue: 0.33), lineWidth: 2)
                )
                .overlay(
                    Text("Change")
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .frame(width: 340, height: 40)
                        .padding()
                        .contentShape(Rectangle())
                )
        }
        .padding(.horizontal, 15)
        .frame(width: 360, height: 80)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
            .stroke(.white, lineWidth: 2)
        )
    }
}

#Preview {
    SplitBlock()
}
