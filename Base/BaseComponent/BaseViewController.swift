//
//  BaseViewController.swift
//  Base
//
//  Created by BaoHoang on 14/10/2022.
//

import Foundation
import UIKit

class BaseViewController<T: BaseViewModel>: UIViewController, BindableType {
    
    var viewModel: T!
    
    func bindViewModel() {
        
    }
    
}
