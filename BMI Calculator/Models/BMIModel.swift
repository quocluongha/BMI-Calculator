//
//  BMIModel.swift
//  BMI Calculator
//
//  Created by Ha Quoc Luong on 05/02/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BMIModel {
    var height: BehaviorRelay<Float> = BehaviorRelay(value: 0)
    var weight: BehaviorRelay<Float> = BehaviorRelay(value: 0)
    
    var bmi: Float {
        weight.value / powf(height.value, height.value)
    }
    
    init(){}
    init(defaultHeight: Float, defaultWeight: Float) {
        height = BehaviorRelay(value: defaultHeight)
        weight = BehaviorRelay(value: defaultWeight)
    }
    
    func emitHeight(_ value: Float) -> Void {
        height.accept(value)
    }
    func emitWeight(_ value: Float) -> Void {
        weight.accept(value)
    }
}
