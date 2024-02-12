//
//  HeightModel.swift
//  BMI Calculator
//
//  Created by Ha Quoc Luong on 03/02/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation


struct Height {
    private let formatter = NumberFormatter()

    var value: Float = 0
    
    mutating func setValue(newValue: Float) {
        value = newValue
    }
    
    func toString() -> String {
        formatter.decimalSeparator = "."
        formatter.maximumFractionDigits = 2
        
        return formatter.string(from: value as NSNumber) ?? ""
    }
}
