//
//  TodoListViewController.swift
//  Todo
//
//  Created by Yusuke Inoue on 2023/12/16.
//

import UIKit
import SwiftUI

class TodoListViewController: UIViewController {
    var todoListView = TodoListView()
    let todoListModel = TodoListModel.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoListModel.notificationCenter.addObserver(
            forName: .init("todoList"),
            object: nil,
            queue: nil,
            using: { _ in
                self.todoListView.viewState.todoList = self.todoListModel.todoList
            }
        )

        todoListView.onTapAddTodoButton = onTapAddTodoButton
        todoListView.onTapIcon = onTapIcon
        
        let hostingController = UIHostingController(rootView: todoListView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.didMove(toParent: self)
    }

    @objc func onTapAddTodoButton() {
        let addTodoVC = AddTodoViewController()
        present(addTodoVC, animated: true)
    }

    @objc func onTapIcon(id: UUID) {
        todoListModel.changeStatusById(id: id)
    }
}
