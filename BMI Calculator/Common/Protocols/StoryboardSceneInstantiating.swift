//
//  Storyboard.swift
//  BMI Calculator
//
//  Created by Ha Quoc Luong on 06/02/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

/**
 Instantiate UIViewController from UIStoryboard
 
 Make your UIViewController subclasses conform to this protocol when:
    * Scene in your storyboard has the same `sceneIdentifier` as the name of the ViewController's class.
    * This is typically ideal for multiple scenes in one storyboard
 */

protocol StoryboardSceneInstantiating: AnyObject {
    static var sceneStoryboard: UIStoryboard { get }
    static var sceneIdentifier: String { get }
}

extension StoryboardSceneInstantiating {
  static var sceneIdentifier: String {
    String(describing: self)
  }
}

extension StoryboardSceneInstantiating where Self: UIViewController {
    static func instantiate() -> Self {
        let storyboard = Self.sceneStoryboard
        let viewController = storyboard.instantiateViewController(withIdentifier: Self.sceneIdentifier)
        
        return viewController as! Self
    }
}
