//
//  RxFlowViewController.swift
//  BMI Calculator
//
//  Created by Ha Quoc Luong on 05/02/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import RxFlow
import UIKit

protocol RxFlowViewController: AnyObject {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType! { get set }
}

extension RxFlowViewController where Self: UIViewController & StoryboardInstantiating {
    static func instantiate<ViewModelType>(withViewModel viewModel: ViewModelType) -> Self {
        let viewController = Self.instantiate() 
        viewController.viewModel = viewModel as? Self.ViewModelType
        
        return viewController
    }
}

extension RxFlowViewController where Self: UIViewController & StoryboardSceneInstantiating {
    static func instantiate<ViewModelType>(withViewModel viewModel: ViewModelType) -> Self {
        let viewController = Self.instantiate()
        viewController.viewModel = viewModel as? Self.ViewModelType
        
        return viewController
    }
}
