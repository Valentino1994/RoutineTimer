//
//  AddWorkoutDetailView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/16.
//

import SwiftUI

struct AddWorkoutDetailsView: View {
    @Binding var step: Int
    @State private var selectedIndex = 0
    @State var isAddWorkoutDetailWeightsPopupVisible: Bool = false
    @State var isAddWorkoutDetailRepeatsPopupVisible: Bool = false
    @State var isAddWorkoutDetailSetsPopupVisible: Bool = false
    @State var isAddWorkoutDetailRestsPopupVisible: Bool = false
    
    @State var repeats: Int = 0
    @State var sets: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    
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
            
            Picker("", selection: self.$selectedIndex) {
                Text("Workout")
                    .tag(0)
                Text("Rest")
                    .tag(1)
            }
            .frame(width: 360)
            .padding(.bottom, 18)
            .pickerStyle(SegmentedPickerStyle())
            
            if selectedIndex == 0 {
                VStack(alignment: .leading) {
                    Text("Weights")
                        .font(.title3)
                        .fontWeight(.bold)
                    Button(action: {
                        isAddWorkoutDetailWeightsPopupVisible.toggle()
                    }) {
                        ExerciseBlock(text: "")
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
                    ExerciseBlock(text: String(1))
                        .frame(width: 358, height: 60)
                        .padding(.bottom, 10)
                }
            }
            
            
            Button(action: {
                print("Saved")
            }) {
                ConfirmTextButton(title: "Confirm")
                    .padding(.top, 28)
            }
            
            Spacer()
        }
        .navigationBarTitle("Details", displayMode: .inline)
        .sheet(isPresented: $isAddWorkoutDetailWeightsPopupVisible) {
            AddWorkoutDetailWeightsPopup(isAddWorkoutDetailWeightsPopupVisible: $isAddWorkoutDetailWeightsPopupVisible, selectedSegment: .constant(0))
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
            AddWorkoutDetailRestsPopup(isAddWorkoutDetailRestsPopupVisible: $isAddWorkoutDetailRestsPopupVisible)
                .presentationDetents([.medium])
        }
        .preferredColorScheme(.dark)
        .onAppear() {
            step = 2
        }
    }
}

#Preview {
    AddWorkoutDetailsView(step: .constant(2))
}
