//
//  UserTableViewCell.swift
//  RxSwiftTest
//
//  Created by Артем Галай on 2.01.23.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    static let identifier = "UserTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
