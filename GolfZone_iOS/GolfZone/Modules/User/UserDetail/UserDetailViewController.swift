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
    @IBOutlet weak var addressLabel: UILabel!
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
    
    @IBAction func sendEmail(_ sender: Any) {
        presenter?.sendEmail()
    }
}

extension UserDetailViewController: PresenterToViewUserDetailProtocol {
    func sendEmail(email: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([email])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)

            present(mail, animated: true)
        } else {
            // show failure alert
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
        addressLabel.text = "\(street) - \(city)"
    }
}

extension UserDetailViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
