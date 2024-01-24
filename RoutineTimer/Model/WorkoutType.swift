//
//  workoutType.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/14/24.
//

import Foundation
import SwiftData

@Model
class WorkoutType: Codable {
    enum CodingKeys: CodingKey {
        case workoutTypeId
        case workoutBodyType
    }
    
    @Attribute(.unique) var workoutTypeId: UUID
    var workoutBodyType: String
    
    @Relationship(deleteRule: .cascade, originalName: "workout_names")
    var workoutNames: [WorkoutName]? = []
    
    init(workoutTypeId: UUID, workoutBodyType: String) {
        self.workoutTypeId = workoutTypeId
        self.workoutBodyType = workoutBodyType
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.workoutTypeId = try container.decode(UUID.self, forKey: .workoutTypeId)
        self.workoutBodyType = try container.decode(String.self, forKey: .workoutBodyType)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(workoutBodyType, forKey: .workoutBodyType)
    }
}
