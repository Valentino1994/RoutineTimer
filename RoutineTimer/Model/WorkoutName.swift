//
//  WorkoutName.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/22/24.
//

import Foundation
import SwiftData

@Model
class WorkoutName {
    @Attribute(.unique) var workoutNameId: UUID = UUID()
    var workoutName: String
    
    init(workoutName: String, workoutType: WorkoutType) {
        self.workoutName = workoutName
    }
}
