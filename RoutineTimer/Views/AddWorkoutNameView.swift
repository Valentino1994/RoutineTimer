//
//  AddWorkoutNameView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/16.
//

import SwiftUI

struct AddWorkoutNameView: View {
    @Binding var step: Int
    @State var isAddWorkoutNamePopupVisible: Bool = false
    var workoutNames: [WorkoutName]
    var workoutType: WorkoutType
    var bodyType: String = ""
    
    var body: some View {
        VStack {
            CustomStatusBar(step: $step)
                .padding(.vertical, 20)
            
            HStack {
                Text("Workout Name")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    isAddWorkoutNamePopupVisible.toggle()
                }) {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28, height: 28)
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom, 12)
            .padding(.horizontal, 18)
            
            ScrollView {
                ForEach(workoutNames, id: \.self) { workoutName in
                    NavigationLink(
                        destination: AddWorkoutDetailsView(step: .constant(2)),
                        label: {
                            ExerciseBlock(text: workoutName.workoutName)
                                .frame(width: 360, height: 80)
                                .padding(.bottom, 10)
                        }
                    )
                }
            }
        }
        .navigationBarTitle("Name", displayMode: .inline)
        .sheet(isPresented: $isAddWorkoutNamePopupVisible) {
            AddWorkoutNamePopup(isAddWorkoutNamePopupVisible: $isAddWorkoutNamePopupVisible, workoutType: workoutType)
                .presentationDetents([.height(300)])
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    AddWorkoutNameView(step: .constant(1), workoutNames: [], workoutType: WorkoutType(workoutBodyType: "hi"))
}
