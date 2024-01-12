//
//  TodoRepository.swift
//  Todo
//
//  Created by Yusuke Inoue on 2024/01/13.
//

import Foundation

protocol TodoRepositoryProtocol {
    func getAll(completion: @escaping ([TodoModel]) -> Void)
    func save(todoList: [TodoModel])
}
