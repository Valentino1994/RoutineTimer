//
//  AddWorkoutDetailView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/16.
//

import SwiftUI

struct AddWorkoutDetailsView: View {
    @Binding var step: Int
    @State private var isWorkout = 0
    @State var isAddWorkoutDetailWeightsPopupVisible: Bool = false
    @State var isAddWorkoutDetailRepeatsPopupVisible: Bool = false
    @State var isAddWorkoutDetailSetsPopupVisible: Bool = false
    @State var isAddWorkoutDetailRestsPopupVisible: Bool = false
    
    @State var isPound:Int = 0
    @State var weights: Int = 0
    @State var weightIntegerIndex: Int = 0
    @State var weightFloatingIndex: Int = 0
    
    @State var repeats: Int = 0
    @State var sets: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    
    var workoutType: WorkoutType
    var workoutName: String
    var split: Split
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack {
            CustomStatusBar(step: $step)
                .padding(.vertical, 20)
            
            HStack {
                Text("Details")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.bottom, 10)
            .padding(.horizontal, 20)
            
            Picker("", selection: self.$isWorkout) {
                Text("Workout")
                    .tag(0)
                Text("Rest")
                    .tag(1)
            }
            .frame(width: 360)
            .padding(.bottom, 18)
            .pickerStyle(SegmentedPickerStyle())
            
            if isWorkout == 0 {
                VStack(alignment: .leading) {
                    Text("Weights")
                        .font(.title3)
                        .fontWeight(.bold)
                    Button(action: {
                        isAddWorkoutDetailWeightsPopupVisible.toggle()
                    }) {
                        ExerciseBlock(text: calculateWeight(isPound: isPound, weightInteger: weightIntegerIndex, weightFloating: weightFloatingIndex))
                            .frame(width: 358, height: 60)
                            .padding(.bottom, 10)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Repeats")
                        .font(.title3)
                        .fontWeight(.bold)
                    Button(action: {
                        isAddWorkoutDetailRepeatsPopupVisible.toggle()
                    }) {
                        ExerciseBlock(text: String(repeats))
                            .frame(width: 358, height: 60)
                            .padding(.bottom, 10)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Sets")
                        .font(.title3)
                        .fontWeight(.bold)
                    Button(action: {
                        isAddWorkoutDetailSetsPopupVisible.toggle()
                    }) {
                        ExerciseBlock(text: String(sets))
                            .frame(width: 358, height: 60)
                            .padding(.bottom, 10)
                    }
                }

            }
            
            VStack(alignment: .leading) {
                Text("Rest Times")
                    .font(.title3)
                    .fontWeight(.bold)
                Button(action: {
                    isAddWorkoutDetailRestsPopupVisible.toggle()
                }) {
                    ExerciseBlock(text: "\(minutes) m  \(seconds) s")
                        .frame(width: 358, height: 60)
                        .padding(.bottom, 10)
                }
            }
            
            
            Button(action: {
                print("Saved")
                saveWorkout()
            }) {
                ConfirmTextButton(title: "Confirm")
                    .padding(.top, 28)
            }
            
            Spacer()
        }
        .navigationBarTitle("Details", displayMode: .inline)
        .sheet(isPresented: $isAddWorkoutDetailWeightsPopupVisible) {
            AddWorkoutDetailWeightsPopup(
                isAddWorkoutDetailWeightsPopupVisible: $isAddWorkoutDetailWeightsPopupVisible,
                isPound: $isPound,
                weightIntegerIndex: $weightIntegerIndex,
                weightFloatingIndex: $weightFloatingIndex
            )
                .presentationDetents([.medium])
        }
        .sheet(isPresented: $isAddWorkoutDetailRepeatsPopupVisible) {
            AddWorkoutDetailRepeatsPopup(
                isAddWorkoutDetailRepeatsPopupVisible: $isAddWorkoutDetailRepeatsPopupVisible,
                repeats: $repeats
            )
                .presentationDetents([.medium])
        }
        .sheet(isPresented: $isAddWorkoutDetailSetsPopupVisible) {
            AddWorkoutDetailSetsPopup(
                isAddWorkoutDetailSetsPopupVisible: $isAddWorkoutDetailSetsPopupVisible,
                sets: $sets
            )
                .presentationDetents([.medium])
        }
        .sheet(isPresented: $isAddWorkoutDetailRestsPopupVisible) {
            AddWorkoutDetailRestsPopup(
                isAddWorkoutDetailRestsPopupVisible: $isAddWorkoutDetailRestsPopupVisible,
                minutes: $minutes,
                seconds: $seconds
            )
                .presentationDetents([.medium])
        }
        .preferredColorScheme(.dark)
        .onAppear() {
            step = 2
        }
    }
}

extension AddWorkoutDetailsView {
    func calculateWeight(isPound: Int, weightInteger: Int, weightFloating: Int) -> String {
        if isPound == 0 {
            return "\(weightInteger) . \(weightFloating * 25) kg"
        } else {
            return "\(weightInteger) . \(weightFloating * 25) lbs"
        }
    }
    
    func saveWorkout() {
        let isKilogram = isPound == 0 ? true : false
        let isRest = isWorkout == 0 ? true : false
        let weightForWorkout = Double("\(weightIntegerIndex).\(weightFloatingIndex * 25)")
        let restTimeForWorkout = (minutes * 60) + seconds
        
        let newWorkout = Workout(workoutType: workoutType.workoutBodyType, workoutName: workoutName, isRest: isRest, isKilogram: isKilogram, weight: weightForWorkout ?? 0, set: sets, restTime: restTimeForWorkout, rept: repeats, createdAt: Date(), updatedAt: Date())
        
        modelContext.insert(newWorkout)
        split.workouts?.append(newWorkout)
    }
}


#Preview {
    AddWorkoutDetailsView(step: .constant(2), workoutType: WorkoutType(workoutBodyType: "hi"), workoutName: "workoutName", split: Split(isDone: true, createdAt: Date(), updatedAt: Date()))
}
