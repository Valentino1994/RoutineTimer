//
//  Exercise.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/14/24.
//

import Foundation
import SwiftData

@Model
final class Exercise {
    @Attribute(.unique, originalName: "exercise_id") var exerciseId: UUID
    @Attribute(originalName: "exercise_type") var exerciseType: ExerciseType
    @Attribute(originalName: "exercise_name") var exerciseName: String
    @Attribute(originalName: "is_rest") var isRest: Bool
    @Attribute(originalName: "is_kilogram") var isKilogram: Bool
    var weight: Int
    var set: Int
    @Attribute(originalName: "rest_time") var restTime: Int
    var rept: Int
    @Attribute(originalName: "created_at") var createdAt: Date
    @Attribute(originalName: "updated_at") var updatedAt: Date
    
    init(exerciseId: UUID, exerciseType: ExerciseType, exerciseName: String, isRest: Bool, isKilogram: Bool, weight: Int, set: Int, restTime: Int, rept: Int, createdAt: Date, updatedAt: Date) {
        self.exerciseId = exerciseId
        self.exerciseType = exerciseType
        self.exerciseName = exerciseName
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
