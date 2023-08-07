//
//  MainViewModel.swift
//  MVVM
//
//  Created by Sergei Semko on 8/7/23.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())? { get set }
    func startFetch()
    func error()
}

final class MainViewModel: MainViewModelProtocol {
    public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    public func error() {
        updateViewData?(.failure(ViewData.Data(icon: "failure",
                                               title: "Error",
                                               description: "Not user",
                                               numberPhone: nil)))
    }
    
    public func startFetch() {
        updateViewData?(.success(ViewData.Data(icon: "success",
                                               title: "Success",
                                               description: "Good",
                                               numberPhone: nil)))
    }
}
