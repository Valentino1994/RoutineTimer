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
    @Attribute(.unique) var workoutTypeId: UUID = UUID()
    var workoutBodyType: String
    
    @Relationship(deleteRule: .cascade, originalName: "workout_names")
    var workoutNames: [WorkoutName]? = []
    
    init(workoutBodyType: String) {
        self.workoutBodyType = workoutBodyType
    }
    
    enum CodingKeys: CodingKey {
        case workoutBodyType
        case workoutNames
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.workoutBodyType = try container.decode(String.self, forKey: .workoutBodyType)
        self.workoutNames = try container.decode([WorkoutName].self, forKey: .workoutNames)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(workoutBodyType, forKey: .workoutBodyType)
        try container.encode(workoutNames, forKey: .workoutNames)
    }
}
