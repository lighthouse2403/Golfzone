//
//  UserDetailViewController.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//  
//

import UIKit
import MessageUI

class UserDetailViewController: BaseViewController {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberButton: UIButton!
    @IBOutlet weak var webSiteButton: UIButton!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var addressButton: UIButton!
    var presenter: ViewToPresenterUserDetailProtocol?

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        presenter?.viewDidLoad()
    }
    
    // MARK: Action
    @IBAction func callPhoneNumber(_ sender: UIButton) {
        presenter?.callPhoneNumber()
    }
    
    @IBAction func showWebSite(_ sender: UIButton) {
        presenter?.showWebSite()
    }
    
    @IBAction func showLocation(_ sender: UIButton) {
        presenter?.displayLocation()
    }
    
    @IBAction func sendEmail(_ sender: Any) {
        presenter?.sendEmail()
    }
}

extension UserDetailViewController: PresenterToViewUserDetailProtocol {
    func sendEmail(email: String) {
        if let url = URL(string: "mailto:\(email)") {
          if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
          } else {
            UIApplication.shared.openURL(url)
          }
        }
    }
    
    func callPhoneNumber(number: String) {
        if let url = NSURL(string: "tel://\(number)") as? URL, UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url as URL)
        }
    }
    
    func setupUserDetail(user: UserDetail) {
        addTitle(title: "User Detail")
        userNameLabel.text = user.username
        nameLabel.text = user.name
        companyNameLabel.text = user.company?.name
        phoneNumberButton.setTitle(user.phone, for: .normal)
        webSiteButton.setTitle(user.website, for: .normal)
        emailButton.setTitle(user.email, for: .normal)

        let street = user.address?.street ?? ""
        let city = user.address?.city ?? ""
        addressButton.setTitle("\(street) - \(city)", for: .normal)
    }
}
