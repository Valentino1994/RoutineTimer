//
//  ContentView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/14/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var routine: [Routine]
    @State var isFirstPopupVisible = false
    @State var selection = 0

    var body: some View {
        MainView()
            .onAppear {
                if (routine.count == 0) {
                    isFirstPopupVisible.toggle()
                }
            }
            .fullScreenCover(isPresented: $isFirstPopupVisible) {
                FirstView(isFirstPopupVisible: $isFirstPopupVisible)
            }
            .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Routine.self, inMemory: true)
}
