//
//  BaseViewModel.swift
//  Base
//
//  Created by BaoHoang on 14/10/2022.
//

import Foundation

protocol BaseViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
