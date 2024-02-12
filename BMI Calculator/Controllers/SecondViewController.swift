//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Ha Quoc Luong on 03/02/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        let label = UILabel()
        label.text = "Hello"
        label.frame = CGRect(x: 0, y: 20, width: 50, height: 30)
        
        view.addSubview(label)
    }
}
