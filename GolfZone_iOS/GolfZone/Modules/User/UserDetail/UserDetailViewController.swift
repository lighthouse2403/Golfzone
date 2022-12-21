//
//  UserDetailViewController.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//  
//

import UIKit

class UserDetailViewController: BaseViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterUserDetailProtocol?
    
}

extension UserDetailViewController: PresenterToViewUserDetailProtocol{
    // TODO: Implement View Output Methods
}
