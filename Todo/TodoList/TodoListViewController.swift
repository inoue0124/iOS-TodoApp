//
//  TodoListViewController.swift
//  Todo
//
//  Created by Yusuke Inoue on 2023/12/16.
//

import UIKit

class TodoListViewController: UIViewController {
    let todoListView = TodoListView()
    let todoListModel = TodoListModel.shared // 修正

    override func viewDidLoad() {
        super.viewDidLoad()
        todoListView.todoListTable.dataSource = self
        todoListView.todoListTable.delegate = self
        todoListView.todoListTable.register(
            .init(nibName: "TodoListTableCell", bundle: .main),
            forCellReuseIdentifier: "TodoListTableCell"
        )
        
        todoListModel.notificationCenter.addObserver(forName: .init("todoList"), object: nil, queue: nil, using: { _ in
                self.todoListView.todoListTable.reloadData()
            }
        )
        
        todoListView.addTodoButton.addTarget(self, action: #selector(onTapAddTodoButton), for: .touchUpInside)
    }

    override func loadView() {
        view = todoListView
    }
    
    @objc func onTapAddTodoButton() {
        let addTodoVC = AddTodoViewController()
        present(addTodoVC, animated: true)
    }
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListTableCell") as! TodoListTableCell
        let data = todoListModel.todoList[indexPath.row]
        cell.setUI(title: data.title, label: data.label, iconImage: data.status.icon)
        cell.delegate = self // 追加
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todoListModel.todoList.count
    }
}

extension TodoListViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let data = todoListModel.todoList[indexPath.row]
        print(data)
    }
}

extension TodoListViewController: TodoListTableCellDelegate {
    func onSelectCell(for cell: TodoListTableCell) {
        if let indexPath = todoListView.todoListTable.indexPath(for: cell) {
            let data = todoListModel.todoList[indexPath.row]
            todoListModel.changeStatusById(id: data.id)
        }
    }
}




