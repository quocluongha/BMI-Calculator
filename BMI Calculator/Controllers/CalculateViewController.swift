//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

class CalculateViewController: UIViewController, RxFlowViewController, StoryboardSceneInstantiating {
    typealias ViewModelType = CalculateViewModel
    
    let disposeBag = DisposeBag()

    static var sceneStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    var viewModel: CalculateViewModel!

    // MARK: Outlets
    @IBOutlet weak var heightText: UILabel!
    @IBOutlet weak var weightText: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    // MARK: Lifecycles
    override func viewDidLoad() {        
        super.viewDidLoad()
                
        updateUI()
                        
        viewModel.heightText
            .drive(heightText.rx.text)
            .disposed(by: disposeBag)
                
        heightSlider.rx.value.changed
            .asDriver()
            .drive(onNext: { [unowned self] in
                viewModel.height = $0
            })
            .disposed(by: disposeBag)
        
        viewModel.weightText
            .drive(weightText.rx.text)
            .disposed(by: disposeBag)
        
        weightSlider.rx.value.changed
            .asDriver()
            .drive(onNext: { [unowned self] in
                viewModel.weight = $0
            })
            .disposed(by: disposeBag)
        
        calculateButton.rx.tap
            .subscribe({ [unowned self] _ in
                self.viewModel.goToResult()
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: Others
    func updateUI(){
        heightSlider.value = 0
        weightSlider.value = 0
    }
    
    func configureLabel() {
        
    }
}

