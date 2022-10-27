//  HomeAPIRouter.swift
//  Base
//
//  Created by BaoHoang on 15/10/2022.
//  Copyright (c) baohg. All rights reserved.
//
//  This file was generated by the Educa MVVM-C Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  Template created by baohg - bao15899@gmail.com

import UIKit
import Alamofire

enum HomeRouter {
    case demo
}

extension HomeRouter: APIInputBase {
    
    var headers: Alamofire.HTTPHeaders? {
        return nil
    }
    
    var url: String {
        return "https://api.themoviedb.org/3/movie/popular?api_key=7f28273d8aabf80c3f2944279b98c486"
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .demo:
            return .get
        }
    }
    
    var encoding: Alamofire.ParameterEncoding {
        return method == .get ? URLEncoding.default : JSONEncoding.default
    }
    
    
    var parameters: [String : Any]? {
        switch self {
        case .demo:
            return [:]
        }
    }
}