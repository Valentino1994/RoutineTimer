//
//  AddWorkoutDetailRepeatsPopup.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/16.
//

import SwiftUI

struct AddWorkoutDetailRepeatsPopup: View {
    @Binding var isAddWorkoutDetailRepeatsPopupVisible: Bool
    @State private var selectedIntegerIndex = 0
    let minValue: Int = 0
    let maxValue: Int = 100
    let step: Int = 1
    
    var body: some View {
        VStack {
            HStack {
                Picker(selection: $selectedIntegerIndex, label: Text("Select Number")) {
                    ForEach(0..<numberOfSteps(minValue: minValue, maxValue: maxValue, step: step), id: \.self) { index in
                        Text("\(self.value(for: index, minValue: minValue, step: step))")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .labelsHidden()
            }
            
            Button(action: {
                isAddWorkoutDetailRepeatsPopupVisible.toggle()
            }) {
                ConfirmTextButton(title: "Confirm")
            }
            .padding()
        }
        .padding()
    }
    
    func numberOfSteps(minValue: Int, maxValue: Int, step: Int) -> Int {
        return Int((maxValue - minValue) / step) + 1
    }

    func value(for index: Int, minValue: Int, step: Int) -> Int {
        return minValue + Int(index) * step
    }
}

#Preview {
    AddWorkoutDetailRepeatsPopup(isAddWorkoutDetailRepeatsPopupVisible: .constant(true))
}
