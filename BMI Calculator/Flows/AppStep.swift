//
//  AppStep.swift
//  BMI Calculator
//
//  Created by Ha Quoc Luong on 05/02/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import RxFlow

enum AppStep: Step {
    case appStart
    case finishBmiInput(Float)
    case recalculate
}
