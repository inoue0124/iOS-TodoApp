//
//  TodoListModel.swift
//  Todo
//
//  Created by Yusuke Inoue on 2023/12/23.
//

import Foundation

class TodoListModel {
    private(set) var todoList: [TodoModel] = []

    func search() -> [TodoModel] {
        return todoList
    }
    
    func add(
        title: String,
        planDatetime: Date,
        status: TodoModel.Status,
        note: String,
        description: String,
        priority: TodoModel.Priority,
        label: String
    ){
        let todo = TodoModel(title: title, planDatetime: planDatetime, status: status, note: note, description: description, priority: priority, label: label)
        todoList.append(todo)
    }
    
    func findById(id: UUID) -> TodoModel? {
        let todo = todoList.first { todoModel in
            todoModel.id == id
        }
        return todo
    }
    
    func deleteById(id: UUID) {
        todoList.removeAll { todoModel in
            todoModel.id == id
        }
    }

    // 他の関数
    
    func changeStatusById(id: UUID) {
        if let index = todoList.firstIndex(where: { $0.id == id }) {
            switch todoList[index].status {
            case .inProgress:
                todoList[index].status = .complete
            case .incomplete:
                todoList[index].status = .inProgress
            case .complete:
                todoList[index].status = .incomplete
            }
        }
    }
}

