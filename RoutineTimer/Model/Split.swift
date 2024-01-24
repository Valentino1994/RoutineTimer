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
    @Attribute(.unique, originalName: "split_id") var splitId: UUID
    @Attribute(originalName: "routine_id") var routineId: UUID
    @Attribute(originalName: "is_done") var isDone: Bool
    @Attribute(originalName: "split_date") var splitDate: Date?
    @Attribute(originalName: "created_at") var createdAt: Date
    @Attribute(originalName: "updated_at") var updatedAt: Date
    
    var routine: Routine
    
    var exercises: [Workout]? = [Workout]()
    
    init(splitId: UUID, routineId: UUID, isDone: Bool, createdAt: Date, updatedAt: Date, routine: Routine) {
        self.splitId = splitId
        self.routineId = routineId
        self.isDone = isDone
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.routine = routine
    }
}

