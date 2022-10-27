//
//  APIError.swift
//  Base
//
//  Created by BaoHoang on 14/10/2022.
//

import Foundation

enum ErrorCode: Int {
    case invalidApiKey = 7
    
}

enum APIError: Error {
    case error(code: Int, message: String)
    case invalidResponseData(data: Any)
    case requestFailed
    case keyNotExist
    
    var displayText: String {
        switch self {
        case .invalidResponseData:
            return "Invalid response"
        case .error(_, let message):
            //switch errorResponseCode
            return message
        case .requestFailed:
            return "Can't make network request"
        case .keyNotExist:
            return "Dictionary key not exist"
        }
    }
    
    var code: Int {
        switch self {
        case .error(let code, _):
            return code
        default :
            return 0
        }
    }
}
