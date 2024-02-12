//
//  StoryboardInstantiating.swift
//  BMI Calculator
//
//  Created by Ha Quoc Luong on 07/02/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

/**
 Instantiate UIViewController from UIStoryboard
 
 Make your UIViewController subclasses conform to this protocol when:
    * The `*.storyboard` file has the same name as the ViewController's class
    * this ViewController is the initialViewController of your Storyboard
 */

protocol StoryboardInstantiating: AnyObject {
    static var scenceStoryboard: UIStoryboard { get }
}

extension StoryboardInstantiating {
    static var scenceStoryboard: UIStoryboard {
        UIStoryboard(name: String(describing: self), bundle: Bundle(for: self))
    }
}

extension StoryboardInstantiating where Self: UIViewController {
    static func instantiate() -> Self {
        scenceStoryboard.instantiateViewController(identifier: String(describing: self))
    }
}
