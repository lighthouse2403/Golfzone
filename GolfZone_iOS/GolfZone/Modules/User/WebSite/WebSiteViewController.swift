//
//  WebSiteViewController.swift
//  GolfZone
//
//  Created by Dang Nguyen on 22/12/2022.
//  
//

import UIKit

class WebSiteViewController: BaseViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterWebSiteProtocol?
    
}

extension WebSiteViewController: PresenterToViewWebSiteProtocol{
    // TODO: Implement View Output Methods
}
