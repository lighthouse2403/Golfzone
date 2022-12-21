//
//  UserTableViewCell.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//

import UIKit

class UserTableViewCell: BaseTableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func setupCell(object: Any) {
        guard let userDetail = object as? UserDetail else { return }
        userNameLabel.text = userDetail.username
        nameLabel.text = userDetail.name
        emailLabel.text = userDetail.email
    }
}
