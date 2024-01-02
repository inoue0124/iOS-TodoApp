//
//  TodoListViewController.swift
//  Todo
//
//  Created by Yusuke Inoue on 2023/12/16.
//

import UIKit

class TodoListViewController: UIViewController {
    let todoListView = TodoListView()
    let todoListModel = TodoListModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        todoListModel.add(
            title: "Todo1",
            planDatetime: Date(),
            status: .incomplete,
            note: "Todo1のメモ",
            description: "Todo1の概要",
            priority: .low,
            label: "仕事"
        )
        todoListModel.add(
            title: "Todo2",
            planDatetime: Date(),
            status: .incomplete,
            note: "Todo2のメモ",
            description: "Todo2の概要",
            priority: .low,
            label: "プライベート"
        )
        
        todoListView.todoListTable.dataSource = self
        todoListView.todoListTable.delegate = self
        // 追加
        todoListView.todoListTable.register(
            .init(nibName: "TodoListTableCell", bundle: .main),
            forCellReuseIdentifier: "TodoListTableCell"
        )
    }

    override func loadView() {
        view = todoListView
    }
    
    @objc func onTapTodoCellIcon(index: Int) {
        
    }
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todoListModel.todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "TodoListTableCell")
        let data = todoListModel.todoList[indexPath.row]
        cell.textLabel?.text = data.title
        cell.detailTextLabel?.text = data.label
        cell.imageView?.image = data.status.icon
        return cell
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




