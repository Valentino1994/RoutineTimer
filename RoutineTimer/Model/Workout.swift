//
//  workout.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/14/24.
//

import Foundation
import SwiftData

@Model
final class Workout {
    @Attribute(.unique, originalName: "workout_id") var workoutId: UUID = UUID()
    @Attribute(originalName: "workout_type") var workoutType: String
    @Attribute(originalName: "workout_name") var workoutName: String
    @Attribute(originalName: "is_rest") var isRest: Bool
    @Attribute(originalName: "is_kilogram") var isKilogram: Bool
    var weight: Double
    var set: Int
    @Attribute(originalName: "rest_time") var restTime: Int
    var rept: Int
    @Attribute(originalName: "created_at") var createdAt: Date
    @Attribute(originalName: "updated_at") var updatedAt: Date
    
//    var split: Split?
    
    init(workoutType: String, workoutName: String, isRest: Bool, isKilogram: Bool, weight: Double, set: Int, restTime: Int, rept: Int, createdAt: Date, updatedAt: Date) {
        self.workoutType = workoutType
        self.workoutName = workoutName
        self.isRest = isRest
        self.isKilogram = isKilogram
        self.weight = weight
        self.set = set
        self.restTime = restTime
        self.rept = rept
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
