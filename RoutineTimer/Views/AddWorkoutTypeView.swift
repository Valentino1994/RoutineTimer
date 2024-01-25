//
//  AddWorkoutView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/15/24.
//

import SwiftUI
import SwiftData

struct AddWorkoutTypeView: View {
    @Binding var isAddWorkoutVisible: Bool
    @State var step = 0
    var bodyTypes: [String] = [
        "Body",
        "Chest",
        "Back",
        "Legs",
        "Shoulders",
        "Core",
        "Biceps",
        "Triceps"
    ]
    
    @Query var workoutTypes: [WorkoutType]
    
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
                    ForEach(workoutTypes, id: \.self) { workoutType in
                        NavigationLink(
                            destination: AddWorkoutNameView(step: .constant(1), bodyType: workoutType.workoutBodyType),
                            label: {
                                ExerciseBlock(text: workoutType.workoutBodyType)
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
