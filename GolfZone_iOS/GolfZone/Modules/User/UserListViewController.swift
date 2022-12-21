//
//  UserListViewController.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//  
//

import UIKit

class UserListViewController: UIViewController {
    // MARK: - Properties
    var presenter: ViewToPresenterUserListProtocol?

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UserListViewController: PresenterToViewUserListProtocol{
    // TODO: Implement View Output Methods
}
