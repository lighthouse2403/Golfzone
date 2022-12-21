//
//  StringExtension.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//

import Foundation
import UIKit

extension String {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    
    func contains(find: String) -> Bool {
        return self.range(of: find) != nil
    }
    
    func removing(charactersOf string: String) -> String {
        let characterSet = CharacterSet(charactersIn: string)
        let components = self.components(separatedBy: characterSet)
        return components.joined(separator: "")
    }

    func escape() -> String {
        let allowedCharacters = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return allowedCharacters
    }
  
    func toDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                return nil
            }
        }
        return nil
    }
    
    // MARK: - Handle URL
    func openUrl() {
        guard let url = URL(string: self) else { return }
        UIApplication.shared.open(url)
    }
    
    func toDate(_ format: String? = nil, timeZone: TimeZone? = nil) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.timeZone = timeZone == nil ? .current : timeZone
        if let format = format, !format.isEmpty {
            dateFormatter.dateFormat = format
        } else {
            dateFormatter.dateFormat = "YYYY-mm-dd"
        }
        let date = dateFormatter.date(from: self)
        return date
    }

    var asTrimmed: String {
        trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    func containsWhitespaceAndNewlines() -> Bool {
        return rangeOfCharacter(from: .whitespacesAndNewlines) != nil
    }
    
    func getSizeText(font: UIFont) -> CGSize {
        return self.size(withAttributes: [NSAttributedString.Key.font: font])
    }
}
