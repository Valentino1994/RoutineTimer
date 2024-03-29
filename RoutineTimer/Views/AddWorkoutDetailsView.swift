//
//  AddWorkoutDetailView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/16.
//

import SwiftUI

struct AddWorkoutDetailsView: View {
    @Binding var step: Int
    @Binding var isAddWorkoutVisible: Bool
    @State private var isRest = 0
    @State var isAddWorkoutDetailWeightsPopupVisible: Bool = false
    @State var isAddWorkoutDetailRepeatsPopupVisible: Bool = false
    @State var isAddWorkoutDetailSetsPopupVisible: Bool = false
    @State var isAddWorkoutDetailRestsPopupVisible: Bool = false
    
    @State var isKilogram:Int = 0
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
            
            Picker("", selection: self.$isRest) {
                Text("Workout")
                    .tag(0)
                Text("Rest")
                    .tag(1)
            }
            .frame(width: 360)
            .padding(.bottom, 18)
            .pickerStyle(SegmentedPickerStyle())
            
            if isRest == 0 {
                VStack(alignment: .leading) {
                    Text("Weights")
                        .font(.title3)
                        .fontWeight(.bold)
                    Button(action: {
                        isAddWorkoutDetailWeightsPopupVisible.toggle()
                    }) {
                        ExerciseBlock(text: calculateWeight(isPound: isKilogram, weightInteger: weightIntegerIndex, weightFloating: weightFloatingIndex))
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
                do {
                    try saveWorkout()
                } catch {
                    print("Error: \(error)")
                }
                isAddWorkoutVisible.toggle()
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
                isKilogram: $isKilogram,
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
        let weightUnit = isPound == 0 ? "kg" : "lbs"
        return "\(weightInteger) . \(weightFloating * 25) \(weightUnit)"
    }
    
    func saveWorkout() throws {
        let isKilogram = isKilogram == 0 ? true : false
        let isRest = isRest == 0 ? false : true
        
        let newWorkout = Workout(workoutType: workoutType.workoutBodyType, workoutName: workoutName, isRest: isRest, isKilogram: isKilogram, weightInt: weightIntegerIndex, weightFloat: weightFloatingIndex, set: sets, restMinute: minutes, restSecond: seconds, rept: repeats, createdAt: Date(), updatedAt: Date())
        
        newWorkout.split = split
        modelContext.insert(newWorkout)
        
        do {
            try modelContext.save()
        } catch {
            throw NSError(domain: "AddWorkoutDetailsView : model context save error", code: -1, userInfo: nil)
        }
    }
}
