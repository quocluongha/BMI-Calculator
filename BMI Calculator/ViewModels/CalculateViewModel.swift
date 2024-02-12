//
//  BMIViewModel.swift
//  BMI Calculator
//
//  Created by Ha Quoc Luong on 04/02/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxFlow

class CalculateViewModel: ViewModel {
    var steps = PublishRelay<Step>()
    
    let bmiModel = BMIModel(defaultHeight: 0, defaultWeight: 0)
    let formatter = NumberFormatter()
    
    // MARK: Init
    init() {
        formatter.decimalSeparator = "."
        formatter.maximumFractionDigits = 2
    }
    
    // MARK: Input
    var height: Float = 0 {
        didSet {
            bmiModel.emitHeight(height)
        }
    }
    var weight: Float = 0 {
        didSet {
            bmiModel.emitWeight(weight)
        }
    }
    
    // MARK: Output
    var heightText: Driver<String> {
        bmiModel.height
            .map({ [unowned self] in
                formatter.string(from: $0 as NSNumber)! })
            .asDriver(onErrorJustReturn: "")
    }
    var weightText: Driver<String> {
        bmiModel.weight
            .map({ [unowned self] in
                formatter.string(from: $0 as NSNumber)! })
            .asDriver(onErrorJustReturn: "")
    }
    
    // MARK: Others
    func goToResult() -> Void {
        steps.accept(AppStep.finishBmiInput(bmiModel.bmi))
    }
}
