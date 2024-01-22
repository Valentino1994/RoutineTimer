//
//  workoutType.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/14/24.
//

import Foundation
import SwiftData

@Model
class WorkoutType {
    @Attribute(.unique) var workoutTypeId: UUID
    var workoutBodyType: String
    var workoutName: [WorkoutName]?
    
    init(workoutTypeId: UUID, workoutBodyType: String) {
        self.workoutTypeId = workoutTypeId
        self.workoutBodyType = workoutBodyType
    }
}
