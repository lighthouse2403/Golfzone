//
//  UITableViewExtension.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//

import UIKit

extension UITableView {
    func register<T>(cellType: T.Type) {
        let nib = UINib(nibName:String(describing: T.self), bundle: Bundle.main)
        register(nib, forCellReuseIdentifier: String(describing: T.self))
    }
    
    func registerHeaderFooter<T>(cellType: T.Type) {
        let nib = UINib(nibName:String(describing: T.self), bundle: Bundle.main)
        register(nib, forHeaderFooterViewReuseIdentifier: String(describing: T.self))
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cellType: T.Type = T.self) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: cellType.className) as? T else {
          fatalError(
            "Failed to dequeue a cell with identifier \(cellType.className) matching type \(cellType.self). "
              + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
              + "and that you registered the cell beforehand"
          )
        }
        return cell
    }
    
       func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type) -> T? {
           return dequeueReusableCell(withIdentifier: type.identifier) as? T
       }
       
       func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type, for indexPath: IndexPath) -> T? {
           return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as? T
       }
    
    func dequeueReusableHeaderFooter<T: UIView>(_ cellType: T.Type = T.self) -> T {
        guard let cell = self.dequeueReusableHeaderFooterView(withIdentifier: cellType.className) as? T else {
            fatalError(
              "Failed to dequeue a cell with identifier \(cellType.className) matching type \(cellType.self). "
                + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                + "and that you registered the cell beforehand"
            )
        }
        return cell
    }
    
    func removeFooter() {
        self.tableFooterView = UIView.init(frame: CGRect.zero)
    }
    
    func tableViewNoData(content: String? = nil) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0,
                                        width: self.bounds.size.width,
                                        height: self.bounds.size.height))
        let label   = UILabel()
        label.text  = content
        label.font  = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.textAlignment  = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ])
        return view
    }
    
    func setNoDataView(content: String?) {
        self.backgroundView = tableViewNoData(content: content)
    }
    
    func removeNoDataView() {
        self.backgroundView = nil
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
