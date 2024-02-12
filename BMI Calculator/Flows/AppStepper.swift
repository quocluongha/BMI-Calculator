//
//  AppStepper.swift
//  BMI Calculator
//
//  Created by Ha Quoc Luong on 05/02/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import RxFlow
import RxCocoa

class AppStepper: Stepper {
    var steps = PublishRelay<Step>()
    var initialStep: Step {
        AppStep.appStart
    }
}
