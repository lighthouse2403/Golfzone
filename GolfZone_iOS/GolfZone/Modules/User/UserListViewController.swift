//
//  UserListViewController.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//  
//

import UIKit

class UserListViewController: BaseViewController {
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var presenter: ViewToPresenterUserListProtocol?
    private var tableViewDataSource: BaseTableViewDataSource<UserTableViewCell>?

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadData()
    }
    
    override func setupUI() {
        setupTable()
        addTitle(title: "Users")
    }
    
    func setupTable() {
        tableViewDataSource = BaseTableViewDataSource(hasPull: false,
                                                  hasLoadMore: false,
                                                  tableView: self.tableView)
        tableViewDataSource?.setupCell = setupCell(indexPath:dataItem:cell:)
        tableViewDataSource?.didSelectRow = didSelectedCell(_:_:)
        tableViewDataSource?.noDataMessage = "No User"
    }
    
    // MARK: - TableView delegate, datasource
    private func setupCell(indexPath: IndexPath, dataItem: Any, cell: UITableViewCell) {
        // TODO: Setup UI for cell
        guard let userCell = cell as? UserTableViewCell else { return }
        userCell.setupCell(object: dataItem)
    }
    
    private func didSelectedCell(_ dataItem: Any, _ cell: UITableViewCell) {
        guard let indexPath = dataItem as? IndexPath else { return }
        presenter?.showUserDetail(indexPath: indexPath)
    }
}

extension UserListViewController: PresenterToViewUserListProtocol {
    // TODO: Implement View Output Methods
    func reloadData(data: [UserDetail]) {
        tableViewDataSource?.dataArray = [data]
    }
}
