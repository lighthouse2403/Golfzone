//
//  ServiceConstant.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//

import Foundation

struct Constant {
    struct Server {
        static let baseAPIURL = Configs.share.env.baseURL
        static let baseURL = Configs.share.env.accountURL
        static let baseStaticURL = Configs.share.env.staticURL
        static let websocketURL = Configs.share.env.socketBaseURL
    }
}

enum Header: String {
    case acceptType = "Accept"
    case contentType = "Content-Type"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

struct GenericResponse: Codable {
    let data: String
}

struct DataDTO<T: Codable>: Codable {
    var data: T
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}
