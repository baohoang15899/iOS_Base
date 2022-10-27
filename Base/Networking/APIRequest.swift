//
//  APIRequest.swift
//  Base
//
//  Created by BaoHoang on 14/10/2022.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class Service: APIService {
    
    static let shared : Service = {
        let instance = Service()
        return instance
    }()
    
}

class APIService {

    private let bag = DisposeBag()
    private let networkManager = Session.default
    
    private func cancelRequest() {
        self.networkManager.session.getAllTasks(completionHandler: { tasks in
            tasks.forEach { $0.cancel() }
        })
    }
    
    func requestEmptyBody<T:Codable>(input: APIInputBase, responseType: T.Type? = nil) -> Single<T> {
        return Single.create { single in
            
            self.networkManager.request(
                input.url,
                method: input.method,
                parameters: input.parameters,
                headers: input.headers
            )
            .validate(statusCode: 200..<300)
            .responseData { response in
                if let data = response.data {
                    let json = try? JSONSerialization.jsonObject(with: data, options: [])
                    let jsonDict = json as? [String: Any]
                    //  theo format BE trả về
                    if let code = jsonDict?["status_code"] as? Int, let message = jsonDict?["status_message"] as? String { 
                        if code == ErrorCode.invalidApiKey.rawValue {
                            return single(.failure(APIError.error(code: code, message: message)))
                        } else {
                            // for post, delete, put method
                        }
                    }
                
                    else {
                        do {
                            if let responseType = responseType {
                                let res = try JSONDecoder().decode(responseType.self, from: data)
                                return single(.success(res))
                            }
                            
                            else {
                                return single(.failure(APIError.invalidResponseData(data: data)))
                            }
                        }
                        
                        catch {
                            return single(.failure(APIError.invalidResponseData(data: data)))
                        }
                    }
                    
                } else {
                    return single(.failure(APIError.requestFailed))
                }
                
            }
            
            return Disposables.create {
                self.cancelRequest()
            }
            
        }
    }
    
    func request<T:Codable>(input: APIInputBase, responseType: T.Type? = nil) -> Single<T> {
        return Single.create { single in
            
            self.networkManager.request(
                input.url,
                method: input.method,
                parameters: input.parameters,
                headers: input.headers
            )
            .validate(statusCode: 200..<300)
            .responseData { response in
                if let data = response.data {
                    let json = try? JSONSerialization.jsonObject(with: data, options: [])
                    let jsonDict = json as? [String: Any]
                    
                    if jsonDict?["results"] != nil { //  theo format BE trả về
                        if input.method == .get {
                            do {
                                if let responseType = responseType {
                                    let res = try JSONDecoder().decode(responseType.self, from: data)
                                    return single(.success(res))
                                }
                                
                                else {
                                    return single(.failure(APIError.invalidResponseData(data: data)))
                                }
                            }
                            
                            catch {
                                return single(.failure(APIError.invalidResponseData(data: data)))
                            }
                        }
                        // check nếu có trường status_code là lỗi
                    }
                    
                    else if let code = jsonDict?["status_code"] as? Int, let message = jsonDict?["status_message"] as? String {
                        if code == ErrorCode.invalidApiKey.rawValue {
                            return single(.failure(APIError.error(code: code, message: message)))
                        } else {
                            // for post, delete, put method
                        }
                    }
                    
                    else {
                        return single(.failure(APIError.keyNotExist))
                    }
                } else {
                    return single(.failure(APIError.requestFailed))
                }
                
            }
            
            return Disposables.create {
                self.cancelRequest()
            }
            
        }
        
    }
    
}
