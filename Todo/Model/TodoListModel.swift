//
//  TodoListModel.swift
//  Todo
//
//  Created by Yusuke Inoue on 2023/12/23.
//

import Foundation

final class TodoListModel {
    static let shared = TodoListModel()
    private init() {
        // 変更
        todoRepository = FirestoreTodoRepository()
        todoRepository.getAll { todoList in
            self.todoList = todoList
        }
    }

    let notificationCenter = NotificationCenter()
    let todoRepository: TodoRepositoryProtocol // 追加
    private(set) var todoList: [TodoModel] = [] {
        didSet {
            notificationCenter.post(name: .init("todoList"), object: nil, userInfo: nil)
            todoRepository.save(todoList: todoList) // 変更
        }
    }

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


