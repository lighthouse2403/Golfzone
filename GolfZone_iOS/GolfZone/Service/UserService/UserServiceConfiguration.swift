
import Foundation

enum UserServiceConfiguration {
    case getList
}

extension UserServiceConfiguration: Configuration {
    var baseURL: String {
        switch self {
        default:
            return Constant.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .getList:
            return "users"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        switch self {
            case .getList:
            return .requestParameters(parameters: [:])
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
    var data: Data? {
        return nil
    }
}
