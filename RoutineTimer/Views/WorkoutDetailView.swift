//
//  WorkoutDetailView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/15/24.
//

import SwiftUI

struct WorkoutDetailView: View {
    @State var workout: Workout
    @State var isAddWorkoutDetailWeightsPopupVisible: Bool = false
    @State var isAddWorkoutDetailRepeatsPopupVisible: Bool = false
    @State var isAddWorkoutDetailSetsPopupVisible: Bool = false
    @State var isAddWorkoutDetailRestsPopupVisible: Bool = false
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text(workout.workoutType)
                .padding(.horizontal, 18)
                .padding(.vertical, 10)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(red: 0.83, green: 0.9, blue: 0.15), lineWidth: 2)
                )
            
            ExerciseBlock(text: workout.workoutName)
                .frame(width: 340, height: 80)
                .padding(.bottom, 10)
                .padding(.top, 10)
            
            HStack(spacing: 10) {
                Button(action: {
                    isAddWorkoutDetailWeightsPopupVisible.toggle()
                }) {
                    WorkoutDetailBlock(title: "Weights", workout: workout)
                }
                Button(action: {
                    isAddWorkoutDetailRepeatsPopupVisible.toggle()
                }) {
                    WorkoutDetailBlock(title: "Repeats", workout: workout)
                }
            }
            .padding(0)
            
            HStack(spacing: 10) {
                Button(action: {
                    isAddWorkoutDetailSetsPopupVisible.toggle()
                }) {
                    WorkoutDetailBlock(title: "Sets", workout: workout)
                }
                Button(action: {
                    isAddWorkoutDetailRestsPopupVisible.toggle()
                }) {
                    WorkoutDetailBlock(title: "Rest Times", workout: workout)
                }
                
            }
            .padding(0)
            
            Button(action: {
                do {
                    try updateWorkout(workout: workout)
                } catch {
                    print("Error: \(error)")
                }
                presentationMode.wrappedValue.dismiss()
            }) {
                ConfirmTextButton(title: "Confirm")
            }
            .padding(.top, 18)
        }
        .sheet(isPresented: $isAddWorkoutDetailWeightsPopupVisible) {
            AddWorkoutDetailWeightsPopup(
                isAddWorkoutDetailWeightsPopupVisible: $isAddWorkoutDetailWeightsPopupVisible,
                isKilogram: Binding(
                    get: { self.workout.isKilogram ? 0 : 1 },
                    set: { newValue in
                        // 만약 하위 뷰에서 값을 변경할 때 필요한 로직이 있다면 여기에 추가
                        // 예제에서는 값을 업데이트하지 않고 로그만 출력
                        print("New Value in ContentView: \(newValue)")
                    }
                ),
                weightIntegerIndex: $workout.weightInt,
                weightFloatingIndex: $workout.weightFloat // 25
            )
            .presentationDetents([.medium])
        }
        .sheet(isPresented: $isAddWorkoutDetailRepeatsPopupVisible) {
            AddWorkoutDetailRepeatsPopup(
                isAddWorkoutDetailRepeatsPopupVisible: $isAddWorkoutDetailRepeatsPopupVisible,
                repeats: $workout.rept
            )
            .presentationDetents([.medium])
        }
        .sheet(isPresented: $isAddWorkoutDetailSetsPopupVisible) {
            AddWorkoutDetailSetsPopup(
                isAddWorkoutDetailSetsPopupVisible: $isAddWorkoutDetailSetsPopupVisible,
                sets: $workout.set
            )
            .presentationDetents([.medium])
        }
        .sheet(isPresented: $isAddWorkoutDetailRestsPopupVisible) {
            AddWorkoutDetailRestsPopup(
                isAddWorkoutDetailRestsPopupVisible: $isAddWorkoutDetailRestsPopupVisible,
                minutes: $workout.restMinute,
                seconds: $workout.restSecond
            )
            .presentationDetents([.medium])
        }
        .navigationBarTitle("Workout Detail", displayMode: .inline)
    }
}

extension WorkoutDetailView {
    func updateWorkout(workout: Workout) throws {
        workout.weightFloat = workout.weightFloat
        do {
            try modelContext.save()
        } catch {
            throw NSError(domain: "WorkoutDetailView : model context udpate error", code: -1, userInfo: nil)
        }
        
    }
}
