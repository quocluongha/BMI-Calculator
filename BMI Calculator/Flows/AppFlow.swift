//
//  AppFlow.swift
//  BMI Calculator
//
//  Created by Ha Quoc Luong on 05/02/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import RxFlow
import RxCocoa
import UIKit

class AppFlow: Flow {
    var rootViewController = UINavigationController()
    
    var root: Presentable {
        self.rootViewController
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        
        switch step {
        case .appStart:
            let viewController = CalculateViewController.instantiate(withViewModel: CalculateViewModel())
                        
            rootViewController.pushViewController(viewController, animated: false)
            
            return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: viewController.viewModel))
        case .finishBmiInput(let result):
            let viewController = ResultViewController.instantiate(withViewModel: ResultViewModel(withResult: result))
                        
            rootViewController.present(viewController, animated: true)
            
            return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: viewController.viewModel))
            
        case .recalculate:
            rootViewController.dismiss(animated: true)
            
            return .none
        }
    }
}
