//  HomeViewController.swift
//  Base
//
//  Created by BaoHoang on 15/10/2022.
//  Copyright (c) baohg. All rights reserved.
//
//  This file was generated by the Educa MVVM-C Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  Template created by baohg - bao15899@gmail.com

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        Service.shared.request(input: HomeRouter.demo, responseType: MediaList.self)
            .subscribe { type in
                switch type {
                case .success(let data):
                    print(data)
                case .failure(let err):
                    print(err)
                }
            }
            .disposed(by: bag)
    }
    
    deinit {
        print("HomeViewController deinit ✅")
    }
    
    private func setupUI() {
        
    }
    
    override func bindViewModel() {
        let input = HomeViewModel.Input()
        let output = viewModel.transform(input: input)
    }
}
