//
//  RoutineTimerApp.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/14/24.
//

import SwiftUI
import SwiftData

@main
struct RoutineTimerApp: App {
    @AppStorage("isFirstTimeLaunch") private var isFirstTimeLaunch: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(CustomContainer.create(shouldCreateDefaults: &isFirstTimeLaunch))
    }
}
