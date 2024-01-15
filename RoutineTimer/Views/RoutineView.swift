//
//  RoutineView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/15.
//

import SwiftUI
import SwiftData

struct RoutineView: View {
    var sample: String
    var samples: [String] = [
        "1",
        "2",
        "3",
        "4"
    ]
    @State var isTimerPopupVisible: Bool = false
    @State var isAddWorkoutVisible: Bool = false
    @Query(sort: \Routine.createdAt, order: .forward)
    private var routines: [Routine]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack() {
                    VStack(alignment: .leading) {
                        Text("My Routines")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Last Time : Perfect")
                            .font(.caption)
                    }
                    Spacer()
                    Button(action: {
                        isTimerPopupVisible.toggle()
                    }) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28, height: 28) // Set the desired width and height
                            .foregroundColor(.white) // Set the color of the image
                    }
                }
                .padding(.vertical)
                
                HStack {
                    Text("Back")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white, lineWidth: 1.5)
                        )
                    Text("Triceps")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white, lineWidth: 1.5)
                        )
                    Spacer()
                    Button(action: {
                        isAddWorkoutVisible.toggle()
                    }) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28, height: 28) // Set the desired width and height
                            .foregroundColor(.white) // Set the color of the image
                    }
                }
                .padding(.bottom, 20)
                
                ScrollView {
//                    if let exercises = routines.last?.splits?[0].exercises {
//                        ForEach(exercises, id: \.self) { sample in
//                            NavigationLink(
//                                destination: WorkoutDetailView(sample: "1"),
//                                label: {
//                                    RoutineBlock()
//                                        .frame(width: 360, height: 120)
//                                        .padding(.bottom, 10)
//                                }
//                            )
//                        }
//                    } else {
//                        Text("HI")
//                    }
                    ForEach(samples, id: \.self) { sample in
                        NavigationLink(
                            destination: WorkoutDetailView(sample: sample),
                            label: {
                                WorkoutBlock()
                                    .frame(width: 360, height: 120)
                                    .padding(.bottom, 10)
                            }
                        )
                    }
                }
            }
            .padding(.horizontal, 18)
        }
        .fullScreenCover(isPresented: $isTimerPopupVisible) {
            TimerView()
        }
        .fullScreenCover(isPresented: $isAddWorkoutVisible) {
            AddWorkoutView()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    RoutineView(sample: "1")
}
