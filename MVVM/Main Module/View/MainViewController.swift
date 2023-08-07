//
//  MainViewController.swift
//  MVVM
//
//  Created by Sergei Semko on 8/7/23.
//

import UIKit

class MainViewController: UIViewController {
    
    private var viewModel: MainViewModelProtocol?
    
    private var testView: TestView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MainViewModel()
        createView()
        updateView()
    }

    private func createView() {
        testView = TestView()
        testView?.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        testView?.center = view.center
        guard let testView else { return }
        view.addSubview(testView)
    }

    private func updateView() {
        viewModel?.updateViewData = { [weak self] viewData in
            self?.testView?.viewData = viewData
        }
    }
    @IBAction func startAction(_ sender: Any) {
        DispatchQueue.main.async {
            self.viewModel?.startFetch()
        }
    }
    @IBAction func failureAction(_ sender: Any) {
        DispatchQueue.main.async {
            self.viewModel?.error()
        }
    }
}

