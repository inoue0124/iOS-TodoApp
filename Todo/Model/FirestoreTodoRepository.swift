//
//  FirestoreTodoRepository.swift
//  Todo
//
//  Created by Yusuke Inoue on 2024/01/13.
//

import Foundation
import FirebaseFirestore

struct FirestoreTodoRepository: TodoRepositoryProtocol {
    func getAll(completion: @escaping ([TodoModel]) -> Void) {
        db.collection("todos").getDocuments() { snapshot, error in
            guard let snapshot = snapshot else {
                completion([])
                return
            }
            let todoList = snapshot.documents
                .map { $0.data() }
                .map { TodoModel.fromFirestoreData($0)}
            return completion(todoList)
        }
    }
    
    func save(todoList: [TodoModel]) {
        todoList.forEach { todo in
            db.collection("todos").document(todo.id.uuidString).setData(todo.toFirestoreData())
        }
    }
}

extension TodoModel {
    func toFirestoreData() -> [String: Any] {
        return [
            "id": id.uuidString,
            "title": title,
            "planDatetime": planDatetime,
            "status": status.rawValue,
            "note": note,
            "description": description,
            "priority": priority.rawValue,
            "label": label
        ]
    }
    
    static func fromFirestoreData(_ data: [String: Any]) -> TodoModel {
        return TodoModel(
            id: UUID(uuidString: data["id"] as? String ?? "") ?? UUID(),
            title: data["title"] as? String ?? "",
            planDatetime: (data["planDatetime"] as? Timestamp ?? Timestamp()).dateValue(),
            status: .init(rawValue: data["status"] as? String ?? "") ?? .incomplete,
            note: data["note"] as? String ?? "",
            description: data["description"] as? String ?? "",
            priority: .init(rawValue: data["priority"] as? String ?? "") ?? .low,
            label: data["label"] as? String ?? ""
        )
    }
}
