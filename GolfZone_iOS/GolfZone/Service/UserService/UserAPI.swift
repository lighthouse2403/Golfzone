
import Foundation

class UserAPI: BaseAPI<UserServiceConfiguration> {
    static let shared = UserAPI()
    
    func getUserList(completionHandler: @escaping (Result<[UserDetail], ServiceError>) -> Void) {
        fetchData(configuration: .getList,
                  responseType: [UserDetail].self) { result in
            completionHandler(result)
        }
    }
}
