//
//  UserDetailViewController.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//  
//

import UIKit

class UserDetailViewController: BaseViewController {
    
    // MARK: - Properties
    var presenter: ViewToPresenterUserDetailProtocol?

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
    }
}

extension UserDetailViewController: PresenterToViewUserDetailProtocol{
    func setupUserDetail(user: UserDetail) {
        addTitle(title: user.name)
    }
}
