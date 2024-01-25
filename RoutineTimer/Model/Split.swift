//
//  Split.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/14/24.
//

import Foundation
import SwiftData

@Model
final class Split {
    @Attribute(.unique, originalName: "split_id") var splitId: UUID = UUID()
    @Attribute(originalName: "is_done") var isDone: Bool
    @Attribute(originalName: "split_date") var splitDate: Date?
    @Attribute(originalName: "created_at") var createdAt: Date
    @Attribute(originalName: "updated_at") var updatedAt: Date
    @Attribute(originalName: "last_time") var lastTime: String?
    var workouts: [Workout]? = []
    
    init(isDone: Bool, createdAt: Date, updatedAt: Date) {
        self.isDone = isDone
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

