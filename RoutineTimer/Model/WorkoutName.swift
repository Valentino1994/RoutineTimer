//
//  WorkoutName.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/22/24.
//

import Foundation
import SwiftData

@Model
class WorkoutName: Codable {
    @Attribute(.unique) var workoutNameId: UUID = UUID()
    @Attribute(originalName: "workout_name")var workoutName: String
    var workoutType: WorkoutType?
    
    init(workoutName: String, workoutType: WorkoutType) {
        self.workoutName = workoutName
    }
    
    enum CodingKeys: CodingKey {
        case workoutName
        case workoutType
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.workoutName = try container.decode(String.self, forKey: .workoutName)
        self.workoutType = try container.decodeIfPresent(WorkoutType.self, forKey: .workoutType)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(workoutName, forKey: .workoutName)
        try container.encode(workoutType, forKey: .workoutType)
    }
}
