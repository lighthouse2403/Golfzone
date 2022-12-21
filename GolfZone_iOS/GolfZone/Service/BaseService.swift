//
//  BaseService.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//

import Foundation

class BaseAPI<T:Configuration> {
    func fetchData<M: Decodable>(configuration: T,
                                 responseType: M.Type,
                                 completionHandler:@escaping (Result<M, ServiceError>)-> Void) {
        let parameters = generateParams(task: configuration.task)
        let url = configuration.baseURL + configuration.path.escape()
        guard var components = URLComponents(string: url) else {
            completionHandler(.failure(ServiceError.init(issueCode: 500, message: "Internet Error")))
            return
        }
        
        if configuration.method == HTTPMethod.get {
            components.queryItems = parameters.map { (key, value) in
                URLQueryItem(name: key, value: "\(value)")
            }
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        }
        
        guard let url = components.url else {
            completionHandler(.failure(ServiceError.init(issueCode: 500, message: "URL invalid")))
            return
        }
        
        // Create request
        let request = self.generateRequest(url: url, method: configuration.method.rawValue)
        
        if configuration.method == HTTPMethod.post {
            let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = jsonData
        }
                
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest,
                                                  completionHandler: { data, response, error in
            DispatchQueue.main.async {
                
                /// Detect error
                guard error == nil else {
                    completionHandler(.failure(ServiceError.server_error))
                    return
                }
                guard let existData = data, let httpResponse = response as? HTTPURLResponse else {
                    completionHandler(.failure(ServiceError.response_invalid))
                    return
                }
                
                guard let json = try? JSONSerialization.jsonObject(with: existData, options: []) else {
                    completionHandler(.failure(ServiceError.json_invalid))
                    return
                }
                print("Response: \(json)")
                
                guard self.isSuccess(httpResponse.statusCode) else {
                    guard let error = self.getFailedServiceError(existData) else {
                        completionHandler(.failure(.response_invalid))
                        return
                    }
                    
                    completionHandler(.failure(error))
                    return
                }
                
                /// Parsing json use Codable
                do {
                    let decoder = JSONDecoder()
                    let responseObj = try decoder.decode(M.self, from: existData)
                    completionHandler(.success(responseObj))
                } catch {
                    print("\n----- Parse Model Error: \n", error)
                    print("\n----- End:")
                    completionHandler(.failure(.json_invalid))
                }
            }
        })
        
        dataTask.resume()
    }
    
    private func generateRequest(url: URL, method: String) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.httpBody = nil
        return request
    }
    
    private func generateParams(task: Task) -> ([String: Any]) {
        switch task {
        case .requestPlain:
            return ([:])
        case .requestParameters(parameters: let parameters):
            return (parameters)
        }
    }
 
    func getFailedServiceError(_ data: Data?) -> ServiceError? {
        guard let data = data,
              let responseObj = try? JSONDecoder().decode(Issue.self, from: data),
              let code = responseObj.errorCode else {
            return nil
        }
        var errorMessage: String = responseObj.error ?? "Something went wrong"
        if let errorFields = responseObj.errorFields {
            errorMessage = errorFields
        }
        if let errorDescription = responseObj.errorDescription {
            errorMessage = errorDescription
        }
        if let message = responseObj.details?["message"] {
            errorMessage = message
        }
        
        return ServiceError(issueCode: code, message: errorMessage)
    }
    
    func isSuccess(_ code: Int) -> Bool {
        switch code {
        case 200...304:
            return true
        default:
            return false
        }
    }
}

