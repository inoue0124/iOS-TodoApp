//
//  TodoModel.swift
//  Todo
//
//  Created by Yusuke Inoue on 2023/12/16.
//

import UIKit

struct TodoModel: Codable { // 追加
    enum Status: String, Codable { // 追加
        case incomplete
        case inProgress
        case complete
        
        var icon: UIImage {
            switch self {
            case .complete:
                return UIImage(systemName: "checkmark.circle.fill")!
            case .incomplete:
                return UIImage(systemName: "checkmark.circle")!
            case .inProgress:
                return UIImage(systemName: "clock")!
            }
        }
    }
    
    enum Priority: String, Codable { // 追加
        case low
        case medium
        case high
    }

    var id: UUID = UUID() // 変更
    let title: String
    let planDatetime: Date
    var status: Status // 変更
    let note: String
    let description: String
    let priority: Priority
    let label: String
}


