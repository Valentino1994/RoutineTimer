//
//  Routine.swift
//  RoutineTimer
//
//  Created by Geunil Park on 1/14/24.
//

import Foundation
import SwiftData

@Model
final class Routine {
    @Attribute(.unique, originalName: "routine_id") var routineId: UUID
    var split: Int
    @Attribute(originalName: "created_at") var createdAt: Date
    @Attribute(originalName: "updated_at") var updatedAt: Date
    
    var splits: [Split]? = [Split]()
    
    init(routineId: UUID, split: Int, createdAt: Date, updatedAt: Date) {
        self.routineId = routineId
        self.split = split
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
