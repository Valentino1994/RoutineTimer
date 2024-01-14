//
//  AddRoutineSplitView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/14/24.
//

import SwiftUI
import SwiftData

struct SelectRoutineSplitView: View {
    @State var step = 0
    @Binding var isPopupVisible: Bool
    var isEdit: Bool
    @State var selectedSplitId = -1;
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Routine.createdAt, order: .forward)
    private var routines: [Routine]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("How many")
                            .font(.system(size: 32, weight: .semibold, design: .default))
                        Text("split workouts")
                            .font(.system(size: 32, weight: .semibold, design: .default))
                    }
                    .padding(.leading, 28)
                    Spacer()
                }
                .padding(.top, 50)
                .padding(.bottom, 40)
                
                VStack {
                    HStack {
                        SplitCircleButton(circleId: 0, selectedSplitId: $selectedSplitId)
                        Spacer()
                        SplitCircleButton(circleId: 2, selectedSplitId: $selectedSplitId)
                        Spacer()
                        SplitCircleButton(circleId: 3, selectedSplitId: $selectedSplitId)
                    }
                    
                    HStack {
                        SplitCircleButton(circleId: 4, selectedSplitId: $selectedSplitId)
                        Spacer()
                        SplitCircleButton(circleId: 5, selectedSplitId: $selectedSplitId)
                        Spacer()
                        SplitCircleButton(circleId: 6, selectedSplitId: $selectedSplitId)
                    }
                    .padding(.top, 18)
                }
                .padding(.horizontal, 25)
                
                Button(action: {
                    if isEdit {
                        EditRoutine(routine: routines.last!, selectedSplitId: selectedSplitId)
                    } else {
                        SaveRoutine(selectedSplitId: selectedSplitId)
                    }
                    isPopupVisible = false
                }) {
                    ConfirmTextButton(title: "Confirm")
                }
                .padding(.top, 60)
            }
            .padding(.bottom, 50)
        }
        .navigationBarBackButtonHidden(true)
    }
}

extension SelectRoutineSplitView {
    func SaveRoutine(selectedSplitId: Int) {
        // Generate Routine
        let routineId = UUID()
        let routine = Routine(routineId: routineId, split: selectedSplitId, createdAt: Date(), updatedAt: Date())
        
        // Generate Splits
        var splits: [Split] = []
        if (selectedSplitId == 0) {
            let split = Split(splitId: UUID(), routineId: routineId, isDone: false, createdAt: Date(), updatedAt: Date())
            splits.append(split)
        } else {
            for _ in 0..<selectedSplitId {
                let split = Split(splitId: UUID(), routineId: routineId, isDone: false, createdAt: Date(), updatedAt: Date())
                splits.append(split)
            }
        }
        
        // Save splits
        for split in splits {
            modelContext.insert(split)
        }
        
        // Insert splits to routine
        routine.splits = splits
        modelContext.insert(routine)
    }
    
    func EditRoutine(routine: Routine, selectedSplitId: Int) {
        routine.split = selectedSplitId
        routine.updatedAt = Date()
        
        if let splits = routine.splits {
            for split in splits {
                split.exercises = []
                split.updatedAt = Date()
            }
        }
    }
}

#Preview {
    SelectRoutineSplitView(isPopupVisible: .constant(true), isEdit: false)
}
