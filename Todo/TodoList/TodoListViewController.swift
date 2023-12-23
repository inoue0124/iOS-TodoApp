//
//  TodoListViewController.swift
//  Todo
//
//  Created by Yusuke Inoue on 2023/12/16.
//

import UIKit

class TodoListViewController: UIViewController {
    let todoListView = TodoListView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = todoListView
    }


}

