//
//  UserDetailViewController.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//  
//

import UIKit

class UserDetailViewController: BaseViewController {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberButton: UIButton!
    @IBOutlet weak var webSiteButton: UIButton!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    var presenter: ViewToPresenterUserDetailProtocol?

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        presenter?.viewDidLoad()
    }
    
    @IBAction func callPhoneNumber(_ sender: UIButton) {
        presenter?.callPhoneNumber()
    }
    
    @IBAction func showWebSite(_ sender: UIButton) {
        presenter?.showWebSite()
    }
}

extension UserDetailViewController: PresenterToViewUserDetailProtocol{
    func callPhoneNumber(number: String) {
        if let url = NSURL(string: "tel://\(number)") as? URL, UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url as URL)
        }
    }
    
    func setupUserDetail(user: UserDetail) {
        addTitle(title: "User Detail")
        userNameLabel.text = user.username
        nameLabel.text = user.name
        emailLabel.text = user.email
        companyNameLabel.text = user.company?.name
        phoneNumberButton.setTitle(user.phone, for: .normal)
        webSiteButton.setTitle(user.website, for: .normal)

        let street = user.address?.street ?? ""
        let city = user.address?.city ?? ""
        addressLabel.text = "\(street) - \(city)"
    }
}
