//
//  AddWorkoutDetailWeightsView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/16.
//

import SwiftUI

struct AddWorkoutDetailWeightsPopup: View {
    @Binding var isAddWorkoutDetailWeightsPopupVisible: Bool
    @Binding var isPound: Int
    
    @State private var selectedIndex = 0
    
    @Binding var weightIntegerIndex: Int
    let minIntegerValue: Int = 0
    let maxIntegerValue: Int = 1000
    let integerStep: Int = 1
    
    @Binding var weightFloatingIndex: Int
    let minFloatingValue: Int = 0
    let maxFloatingValue: Int = 75
    let floatingStep: Int = 25

    var body: some View {
        VStack {
            Picker("", selection: self.$isPound) {
                Text("Kilogram")
                    .tag(0)
                Text("Pound")
                    .tag(1)
            }
            .frame(width: 200)
            .pickerStyle(SegmentedPickerStyle())
            
            HStack {
                Picker(selection: $weightIntegerIndex, label: Text("Select Number")) {
                    ForEach(0..<numberOfSteps(minValue: minIntegerValue, maxValue: maxIntegerValue, step: integerStep), id: \.self) { index in
                        Text("\(self.value(for: index, minValue: minIntegerValue, step: integerStep))")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .labelsHidden()
                Text(".")
                    .font(.title)
                    .fontWeight(.bold)
                Picker(selection: $weightFloatingIndex, label: Text("Select Number")) {
                    ForEach(0..<numberOfSteps(minValue: minFloatingValue, maxValue: maxFloatingValue, step: floatingStep), id: \.self) { index in
                        Text("\(self.value(for: index, minValue: minFloatingValue, step: floatingStep))")
                    }
                }
                .frame(width: 100)
                .pickerStyle(WheelPickerStyle())
                .labelsHidden()
            }
            
            Button(action: {
                isAddWorkoutDetailWeightsPopupVisible.toggle()
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
    AddWorkoutDetailWeightsPopup(isAddWorkoutDetailWeightsPopupVisible: .constant(true), isPound: .constant(0), weightIntegerIndex: .constant(0), weightFloatingIndex: .constant(0))
}
