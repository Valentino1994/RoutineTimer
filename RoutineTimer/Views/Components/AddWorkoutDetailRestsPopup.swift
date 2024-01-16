//
//  AddWorkoutDetailRestsPopup.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/16.
//

import SwiftUI

struct AddWorkoutDetailRestsPopup: View {
    @Binding var isAddWorkoutDetailRestsPopupVisible: Bool
    @State private var selectedMinuteIndex = 0
    let minMinuteValue: Int = 0
    let maxMinuteValue: Int = 60
    let minuteStep: Int = 1
    
    @State private var selectedSecondIndex = 0
    let minSecondValue: Int = 0
    let maxSecondValue: Int = 60
    let secondStep: Int = 1

    var body: some View {
        VStack {
            HStack {
                Picker(selection: $selectedMinuteIndex, label: Text("Select Number")) {
                    ForEach(0..<numberOfSteps(minValue: minMinuteValue, maxValue: maxMinuteValue, step: minuteStep), id: \.self) { index in
                        Text("\(self.value(for: index, minValue: minMinuteValue, step: minuteStep))")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .labelsHidden()
                
                Text("min")
                    .font(.title3)
                
                Picker(selection: $selectedSecondIndex, label: Text("Select Number")) {
                    ForEach(0..<numberOfSteps(minValue: minSecondValue, maxValue: maxSecondValue, step: secondStep), id: \.self) { index in
                        Text("\(self.value(for: index, minValue: minSecondValue, step: secondStep))")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .labelsHidden()
                
                Text("sec")
                    .font(.title3)
            }
            
            Button(action: {
                isAddWorkoutDetailRestsPopupVisible.toggle()
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
    AddWorkoutDetailRestsPopup(isAddWorkoutDetailRestsPopupVisible: .constant(true))
}
