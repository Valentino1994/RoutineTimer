//
//  AddWorkoutNamePopupView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/16.
//

import SwiftUI

struct AddWorkoutNamePopup: View {
    @Binding var isAddWorkoutNamePopupVisible: Bool
    var workoutType: WorkoutType
    @State private var workoutName: String = ""
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        VStack {
            Text("Write Your Own Workout Name")
                .font(.headline)
                .padding()

            TextField("", text: $workoutName)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding()

            Button(action: {
                isAddWorkoutNamePopupVisible.toggle()
                saveWorkoutName(workoutName: workoutName, workoutType: workoutType)
            }) {
                ConfirmTextButton(title: "Confirm")
            }
            .padding()
        }
        .padding()
    }
}

extension AddWorkoutNamePopup {
    func saveWorkoutName(workoutName: String, workoutType: WorkoutType) {
        let newWorkoutName = WorkoutName(workoutName: workoutName, workoutType: workoutType)
        modelContext.insert(newWorkoutName)
        workoutType.workoutNames?.append(newWorkoutName)
    }
}

#Preview {
    AddWorkoutNamePopup(isAddWorkoutNamePopupVisible: .constant(true), workoutType: WorkoutType(workoutBodyType: "hi"))
}
