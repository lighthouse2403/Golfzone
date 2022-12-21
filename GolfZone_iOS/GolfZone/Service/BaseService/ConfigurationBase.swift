//
//  ConfigurationBase.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//

import Foundation

enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}

enum Task {
    case requestPlain
    case requestParameters(parameters: [String: Any])
}

protocol Configuration {
    var baseURL: String {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var task: Task {get}
    var headers: [String: String]? {get}
    var data: Data? { get }
}

struct ServiceError: Error {
    let issueCode: Int
    var message: String
    
    static let server_error     = ServiceError(issueCode: 401, message: "Server Error")
    static let response_invalid = ServiceError(issueCode: 401, message: "Response invalid")
    static let json_invalid     = ServiceError(issueCode: 401, message: "JSON invalid")
}

struct Issue: Codable {
    let error: String?
    let errorFields: String?
    let errorDescription: String?
    let errorCode: Int?
    let details: [String:String]?
    enum CodingKeys: String, CodingKey {
        case error
        case errorFields = "error_fields"
        case errorDescription = "error_description"
        case errorCode
        case details
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        error = try? container.decode(String.self, forKey: .error)
        errorCode = try? container.decode(Int.self, forKey: .errorCode)
        errorDescription = try? container.decode(String?.self, forKey: .errorDescription)
        details = try? container.decode(Dictionary?.self, forKey: .details)
        if let errorFields = try? container.decode(String?.self, forKey: .errorFields) {
            self.errorFields = errorFields
        } else {
            self.errorFields = try? container.decode([String].self, forKey: .errorFields).first
        }
    }
}
