//
//  AddWorkoutNamePopupView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/16.
//

import SwiftUI

struct AddWorkoutNamePopup: View {
    @Binding var isAddWorkoutNamePopupVisible: Bool
    @State private var text: String = ""
    var body: some View {
        VStack {
            Text("Write Your Own Workout Name")
                .font(.headline)
                .padding()

            TextField("", text: $text)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding()

            Button(action: {
                isAddWorkoutNamePopupVisible.toggle()
            }) {
                ConfirmTextButton(title: "Confirm")
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    AddWorkoutNamePopup(isAddWorkoutNamePopupVisible: .constant(true))
}
