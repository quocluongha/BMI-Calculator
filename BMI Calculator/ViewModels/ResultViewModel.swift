//
//  ResultViewModel.swift
//  BMI Calculator
//
//  Created by Ha Quoc Luong on 07/02/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import RxCocoa
import RxFlow

class ResultViewModel: ViewModel {
    var steps = PublishRelay<Step>()
    
    private let result = BehaviorRelay<Float>(value: 0)
    let resultFormatter = NumberFormatter()
    
    // MARK Init
    init(){}
    init(withResult value: Float) {
        result.accept(value)
    }
    
    // MARK Input
    
    // Mark Output
    
    var resultText: Driver<String> {
        result.map({ [unowned self] in
            resultFormatter.maximumFractionDigits = 1
            resultFormatter.decimalSeparator = "."
            
            return resultFormatter.string(from: $0 as NSNumber) ?? ""
        }).asDriver(onErrorJustReturn: "")
    }
    var adviceText: Driver<String> {
        result.map({
            switch $0 {
            case 0..<18.5:
                return "Eat more pies!"
            case 18.5..<24.9:
                return "Fit as a fidle!"
            default:
                return "Eat more pies"
            }
        }).asDriver(onErrorJustReturn: "")
    }
    var backgroundColor: Driver<UIColor> {
        result.map({
            switch $0 {
            case 0..<18.5:
                return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            case 18.5..<24.9:
                return #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            default:
                return #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            }
        }).asDriver(onErrorJustReturn: .green)
    }
    
    // MARK Others
    func goToCalculate() -> Void {
        steps.accept(AppStep.recalculate)
    }
}
