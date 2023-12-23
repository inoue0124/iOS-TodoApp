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

    let title: String
    let planDatetime: Date
    let status: Status
}


