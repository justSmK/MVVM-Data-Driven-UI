//
//  ModuleBuilder.swift
//  MVVM
//
//  Created by Sergei Semko on 8/7/23.
//

import UIKit.UIViewController


protocol AssemblyModuleBuilderProtocol {
    func createMainModule() -> UIViewController
}

class AssemblyModuleBuilder: AssemblyModuleBuilderProtocol {
    func createMainModule() -> UIViewController {
        let model = Person(firstName: "Wasin", lastName: "Thonkaew")
        let view = GreetingViewController()
        let viewModel = GreetingViewModel(person: model)
        view.viewModel = viewModel
        
        return view
    }
}
