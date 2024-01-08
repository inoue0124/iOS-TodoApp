//
//  AddTodoViewController.swift
//  Todo
//
//  Created by Yusuke Inoue on 2024/01/03.
//

import UIKit

class AddTodoViewController: UIViewController {
    let addTodoView = AddTodoView()
    let todoListModel = TodoListModel.shared // 修正

    override func viewDidLoad() {
        addTodoView.saveButton.target = self
        addTodoView.saveButton.action = #selector(onTapSaveButton)
    }
    
    override func loadView() {
        view = addTodoView
    }
    
    @objc func onTapSaveButton() {
        todoListModel.add(
            title: addTodoView.todoTitle.text ?? "",
            planDatetime: Date(),
            status: .incomplete,
            note: "Todo1のメモ",
            description: "Todo1の概要",
            priority: .low,
            label: "仕事"
        )
        dismiss(animated: true)
    }
}
