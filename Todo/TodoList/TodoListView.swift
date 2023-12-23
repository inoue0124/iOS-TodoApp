//
//  TodoListView.swift
//  Todo
//
//  Created by Yusuke Inoue on 2023/12/23.
//

import UIKit

class TodoListView: UIView {
    @IBOutlet weak var todoListTable: UITableView!

    init() {
        super.init(frame: .zero)
        let view = UINib(nibName: String(describing: type(of: self)), bundle: nil).instantiate(withOwner: self).first as! UIView
        view.frame = bounds
        addSubview(view)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
