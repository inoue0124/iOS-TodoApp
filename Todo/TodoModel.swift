//
//  TodoModel.swift
//  Todo
//
//  Created by Yusuke Inoue on 2023/12/16.
//

import Foundation

struct TodoModel {
    enum Status {
        case incomplete
        case inProgress
        case complete
    }
    
    enum Priority {
        case low
        case medium
        case high
    }

    let id: UUID = UUID()
    let title: String
    let planDatetime: Date
    let status: Status
    let note: String
    let description: String
    let priority: Priority
    let label: String
}


