//
//  MainView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/14/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @State var isSplitPopupVisible = false
    @State var isSettingsPopupVisible = false
    @Query(sort: \Routine.createdAt, order: .forward)
    private var routines: [Routine]
    
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
                    if let splits = routines.last?.splits {
                        ForEach(splits, id: \.self) { split in
                            NavigationLink(
                                destination: RoutineView(sample: "1", split: split),
                                label: {
                                    RoutineBlock()
                                        .frame(width: 360, height: 120)
                                        .padding(.bottom, 10)
                                }
                            )
                        }
                    } else {
                        Text("HI")
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
