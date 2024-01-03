//
//  TodoListTableCell.swift
//  Todo
//
//  Created by Yusuke Inoue on 2024/01/02.
//

import UIKit

class TodoListTableCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var todoTitle: UILabel!
    @IBOutlet weak var todoLabel: UILabel!
    
    var delegate: TodoListTableCellDelegate? // 追加

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(title: String, label: String, iconImage: UIImage) {
        icon.image = iconImage
        todoTitle.text = title
        todoLabel.text = label
        icon.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(onTapCell)
            )
        )
        icon.isUserInteractionEnabled = true
    }
    
    @objc func onTapCell() {
        // delegateがnilだと実行されない
        delegate?.onSelectCell(for: self)
    }
}

protocol TodoListTableCellDelegate {
    func onSelectCell(for cell: TodoListTableCell)
}

