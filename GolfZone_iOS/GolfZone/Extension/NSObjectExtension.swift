//
//  NSObjectExtension.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
