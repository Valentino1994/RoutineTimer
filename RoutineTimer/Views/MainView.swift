//
//  MainView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/14/24.
//

import SwiftUI

struct MainView: View {
    private let samples: [String] = [
        "1",
        "2",
        "3",
        "4",
        "5",
        "5",
        "5",
    ]
    @State var isSplitPopupVisible = false
    @State var isSettingsPopupVisible = false
    var body: some View {
        NavigationStack {
            VStack {
                HStack() {
                    Text("My Splits")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        isSettingsPopupVisible.toggle()
                    }) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28, height: 28) // Set the desired width and height
                            .foregroundColor(.white) // Set the color of the image
                    }
                }
                .padding(.horizontal, 18)
                .padding(.vertical)
                
                SplitBlock(isSplitPopupVisible: $isSplitPopupVisible)
                    .padding(.horizontal, 15)
                
                HStack() {
                    Text("My Routines")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.top, 25)
                .padding(.bottom, 20)
                .padding(.horizontal, 18)
                
                ScrollView {
                    ForEach(samples, id: \.self) { sample in
                        NavigationLink(
                            destination: RoutineView(sample: sample),
                            label: {
                                RoutineBlock()
                                    .frame(width: 360, height: 120)
                                    .padding(.bottom, 10)
                            }
                        )
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $isSplitPopupVisible) {
            SelectRoutineSplitView(isSplitPopupVisible: $isSplitPopupVisible, isFirstPopupVisible: .constant(false), isEdit: true)
        }
        .fullScreenCover(isPresented: $isSettingsPopupVisible) {
            SettingsView(isSettingsPopupVisible: $isSettingsPopupVisible)
        }
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    MainView()
}
