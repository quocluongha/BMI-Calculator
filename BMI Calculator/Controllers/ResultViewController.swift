//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Ha Quoc Luong on 03/02/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxFlow

class ResultViewController: UIViewController, RxFlowViewController, StoryboardSceneInstantiating {
    typealias ViewModelType = ResultViewModel
    
    static var sceneStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    var viewModel: ResultViewModel!
    
    var result: String?
    
    @IBOutlet weak var adviceText: UILabel!
    @IBOutlet weak var scoreText: UILabel!
    @IBOutlet weak var recalculateButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recalculateButton.rx.tap
            .bind(onNext: { [unowned self] in
                viewModel.goToCalculate()
            })
            .disposed(by: disposeBag)
        
        viewModel.resultText
            .drive(scoreText.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.adviceText
            .drive(adviceText.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.backgroundColor
            .drive(backgroundImage.rx.backgroundColor)
            .disposed(by: disposeBag)
    }
}
