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
    @Attribute(.unique) var workoutNameId: UUID
    var workoutName: String
    var workoutType: WorkoutType
    
    init(workoutNameId: UUID, workoutName: String, workoutType: WorkoutType) {
        self.workoutNameId = workoutNameId
        self.workoutName = workoutName
        self.workoutType = workoutType
    }
}
