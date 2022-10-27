//
//  APIInputBase.swift
//  Base
//
//  Created by BaoHoang on 14/10/2022.
//

import Foundation
import Alamofire

protocol APIInputBase {
    var headers: HTTPHeaders? { get }
    var url: String { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var parameters: [String: Any]? { get }
}
