//
//  CustomContainer.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2024/01/24.
//

import Foundation
import SwiftData

actor CustomContainer {
    
    @MainActor
    static func create(shouldCreateDefaults: inout Bool) -> ModelContainer {
        let schema = Schema([
            Routine.self, Split.self, Workout.self, WorkoutType.self, WorkoutName.self
        ])
        let configuration = ModelConfiguration()
        let container = try! ModelContainer(for: schema, configurations: [configuration])
        
        return container
    }
}
