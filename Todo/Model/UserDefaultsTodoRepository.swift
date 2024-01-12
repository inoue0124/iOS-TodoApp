//
//  UserDefaultsTodoRepository.swift
//  Todo
//
//  Created by Yusuke Inoue on 2024/01/13.
//

import Foundation

struct UserDefaultsTodoRepository: TodoRepositoryProtocol {
    func getAll(completion: ([TodoModel]) -> Void) {
        guard let storedData = UserDefaults.standard.data(forKey: "todoList"),
              let storedData = try? JSONDecoder().decode([TodoModel].self, from: storedData) else {
            return completion([])
        }
        return completion(storedData)
    }
    
    func save(todoList: [TodoModel]) {
        let encodedData = try! JSONEncoder().encode(todoList)
        UserDefaults.standard.set(encodedData, forKey: "todoList")
    }
}

