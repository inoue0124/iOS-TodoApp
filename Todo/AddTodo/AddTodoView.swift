//
//  AddTodoView.swift
//  Todo
//
//  Created by Yusuke Inoue on 2024/01/03.
//

import UIKit

class AddTodoView: UIView {
    @IBOutlet weak var todoTitle: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!

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
