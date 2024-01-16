//
//  ConfirmTextButton.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/14/24.
//

import SwiftUI

struct ConfirmTextButton: View {
    var title: String
    
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 360, height: 70)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .inset(by: 1.5)
                    .stroke(Color(red: 0.93, green: 0.62, blue: 0.33), lineWidth: 3)
            )
            .overlay(
                Text(title)
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 360, height: 55)
                    .contentShape(Rectangle())
            )
    }
}

#Preview {
    ConfirmTextButton(title: "Title")
}
