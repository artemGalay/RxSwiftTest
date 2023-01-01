//
//  ViewController.swift
//  RxSwiftTest
//
//  Created by Артем Галай on 1.01.23.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    private var viewModel = ViewModel()
    private var disposeBag = DisposeBag()

    private lazy var userTableView: UITableView = {
        let tableView = UITableView(frame: self.view.frame, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UserTableViewCell.self,
                           forCellReuseIdentifier: UserTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userTableView)
        viewModel.fetchUsers()
        bindUserTableView()
    }

    private func bindUserTableView() {
        userTableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.users.bind(to: userTableView.rx.items(cellIdentifier: UserTableViewCell.identifier,
                                                        cellType: UserTableViewCell.self)) { (row, item, cell) in
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = String(item.id)
        }.disposed(by: disposeBag)
    }
}

extension ViewController: UITableViewDelegate {

}
