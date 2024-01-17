//
//  AddWorkoutView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/15/24.
//

import SwiftUI

struct AddWorkoutTypeView: View {
    @Binding var isAddWorkoutVisible: Bool
    @State var step = 0
    var samples: [Int] = [
        1,
        2,
        3,
        4,
        2,
        3,
        4,
        2,
        3,
        4
    ]
    @State var hi: Int? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                CustomStatusBar(step: $step)
                    .padding(.vertical, 20)
                
                HStack {
                    Text("Type")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.bottom, 12)
                .padding(.horizontal, 18)
                
                ScrollView {
                    ForEach(samples, id: \.self) { sample in
                        NavigationLink(
                            destination: AddWorkoutNameView(step: .constant(1)),
                            label: {
                                ExerciseBlock(text: 1)
                                    .frame(width: 360, height: 80)
                                    .padding(.bottom, 10)
                            }
                        )
                    }
                }
            }
            .navigationBarTitle("Type", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancle") {
                isAddWorkoutVisible.toggle()
            })
        }
        .preferredColorScheme(.dark)
        .onAppear() {
            step = 0
        }
    }
}

#Preview {
    AddWorkoutTypeView(isAddWorkoutVisible: .constant(true))
}
